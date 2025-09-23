import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/storage/secure_storage.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';
import '../datasources/auth_local_datasource.dart';
import '../datasources/hanko_datasource.dart';

/// Implementation of AuthRepository
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;
  final HankoDataSource _hankoDataSource;
  final SecureStorageService _secureStorage;
  final Logger _logger;
  final StreamController<AuthSessionEntity?> _authStateController;

  AuthRepositoryImpl({
    AuthRemoteDataSource? remoteDataSource,
    AuthLocalDataSource? localDataSource,
    HankoDataSource? hankoDataSource,
    required SecureStorageService secureStorage,
    required Logger logger,
  })  : _remoteDataSource = remoteDataSource ?? AuthRemoteDataSourceImpl(),
        _localDataSource = localDataSource ?? AuthLocalDataSourceImpl(),
        _hankoDataSource = hankoDataSource ?? HankoDataSourceImpl(
          dio: Dio(), // TODO: Inject configured Dio instance
          logger: logger,
        ),
        _secureStorage = secureStorage,
        _logger = logger,
        _authStateController = StreamController<AuthSessionEntity?>.broadcast();

  @override
  Stream<AuthSessionEntity?> get authStateChanges => _authStateController.stream;

  @override
  Future<Either<Failure, AuthSessionEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      _logger.d('Attempting login for email: $email');

      // Call remote data source
      final result = await _remoteDataSource.login(
        email: email,
        password: password,
      );

      return result.fold(
        (failure) => Left(failure),
        (session) async {
          // Store session locally
          await _storeSession(session);

          // Notify auth state change
          _authStateController.add(session);

          _logger.i('Login successful for user: ${session.user.email}');
          return Right(session);
        },
      );
    } catch (e, stackTrace) {
      _logger.e('Login failed', error: e, stackTrace: stackTrace);
      return Left(AuthFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthSessionEntity>> loginWithHanko({
    required String email,
  }) async {
    try {
      _logger.d('Attempting Hanko login for email: $email');

      // First check if email is registered with Hanko
      final isRegisteredResult = await _hankoDataSource.isEmailRegistered(email);

      return isRegisteredResult.fold(
        (failure) => Left(failure),
        (isRegistered) async {
          if (!isRegistered) {
            return Left(AuthFailure.invalidCredentials());
          }

          // Initiate Hanko login
          final initResult = await _hankoDataSource.initiateLogin(email);

          return initResult.fold(
            (failure) => Left(failure),
            (hankoResponse) async {
              // Store Hanko session ID for completion
              await _secureStorage.saveHankoSessionId(hankoResponse.sessionId);

              // For now, return a mock session with Hanko session ID
              // In a real implementation, this would wait for user to complete authentication
              final user = UserEntity(
                id: 'hanko-pending-${hankoResponse.sessionId}',
                email: email,
                status: UserStatus.pending,
                createdAt: DateTime.now(),
              );

              final session = AuthSessionEntity(
                accessToken: 'pending-hanko-auth',
                refreshToken: 'pending-hanko-refresh',
                expiresAt: DateTime.now().add(const Duration(minutes: 10)),
                user: user,
                hankoSessionId: hankoResponse.sessionId,
              );

              _logger.i('Hanko login initiated for user: $email');
              return Right(session);
            },
          );
        },
      );
    } catch (e, stackTrace) {
      _logger.e('Hanko login failed', error: e, stackTrace: stackTrace);
      return Left(AuthFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthSessionEntity>> completeHankoAuth({
    required String sessionId,
    required String credential,
  }) async {
    try {
      _logger.d('Completing Hanko authentication');

      final result = await _hankoDataSource.completeLogin(
        sessionId: sessionId,
        credential: credential,
      );

      return result.fold(
        (failure) => Left(failure),
        (session) async {
          await _storeSession(session);
          _authStateController.add(session);

          // Clear the stored Hanko session ID as authentication is complete
          await _secureStorage.deleteHankoSessionId();

          _logger.i('Hanko authentication completed successfully');
          return Right(session);
        },
      );
    } catch (e, stackTrace) {
      _logger.e('Hanko auth completion failed', error: e, stackTrace: stackTrace);
      return Left(AuthFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthSessionEntity>> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    String? clubId,
  }) async {
    try {
      _logger.d('Attempting registration for email: $email');

      final result = await _remoteDataSource.register(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
        clubId: clubId,
      );

      return result.fold(
        (failure) => Left(failure),
        (session) async {
          await _storeSession(session);
          _authStateController.add(session);

          _logger.i('Registration successful for user: ${session.user.email}');
          return Right(session);
        },
      );
    } catch (e, stackTrace) {
      _logger.e('Registration failed', error: e, stackTrace: stackTrace);
      return Left(AuthFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> logout() async {
    try {
      _logger.d('Attempting logout');

      // Call remote logout
      final result = await _remoteDataSource.logout();

      return result.fold(
        (failure) => Left(failure),
        (success) async {
          if (success) {
            // Clear local session
            await _clearSession();

            // Notify auth state change
            _authStateController.add(null);

            _logger.i('Logout successful');
          }
          return Right(success);
        },
      );
    } catch (e, stackTrace) {
      _logger.e('Logout failed', error: e, stackTrace: stackTrace);
      return Left(AuthFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthSessionEntity>> refreshToken({
    required String refreshToken,
  }) async {
    try {
      _logger.d('Attempting token refresh');

      final result = await _remoteDataSource.refreshToken(
        refreshToken: refreshToken,
      );

      return result.fold(
        (failure) => Left(failure),
        (session) async {
          await _storeSession(session);
          _authStateController.add(session);

          _logger.d('Token refresh successful');
          return Right(session);
        },
      );
    } catch (e, stackTrace) {
      _logger.e('Token refresh failed', error: e, stackTrace: stackTrace);
      return Left(AuthFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity?>> getCurrentUser() async {
    try {
      // Try to get from local storage first
      final localResult = await _localDataSource.getCurrentUser();

      return localResult.fold(
        (failure) => Left(failure),
        (user) => Right(user),
      );
    } catch (e, stackTrace) {
      _logger.e('Get current user failed', error: e, stackTrace: stackTrace);
      return Left(AuthFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthSessionEntity?>> getCurrentSession() async {
    try {
      final result = await _localDataSource.getCurrentSession();
      return result.fold(
        (failure) => Left(failure),
        (session) => Right(session),
      );
    } catch (e, stackTrace) {
      _logger.e('Get current session failed', error: e, stackTrace: stackTrace);
      return Left(AuthFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<bool> isAuthenticated() async {
    try {
      final sessionResult = await getCurrentSession();
      return sessionResult.fold(
        (failure) => false,
        (session) => session?.isValid ?? false,
      );
    } catch (e) {
      _logger.e('Authentication check failed', error: e);
      return false;
    }
  }

  @override
  Future<Either<Failure, bool>> checkEmailAvailability({
    required String email,
  }) async {
    try {
      return await _remoteDataSource.checkEmailAvailability(email: email);
    } catch (e, stackTrace) {
      _logger.e('Email availability check failed', error: e, stackTrace: stackTrace);
      return Left(AuthFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getUserPermissions() async {
    try {
      return await _remoteDataSource.getUserPermissions();
    } catch (e, stackTrace) {
      _logger.e('Get user permissions failed', error: e, stackTrace: stackTrace);
      return Left(AuthFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<bool> isBiometricAvailable() async {
    try {
      return await _remoteDataSource.isBiometricAvailable();
    } catch (e) {
      _logger.e('Biometric availability check failed', error: e);
      return false;
    }
  }

  @override
  Future<Either<Failure, bool>> authenticateWithBiometrics() async {
    try {
      return await _remoteDataSource.authenticateWithBiometrics();
    } catch (e, stackTrace) {
      _logger.e('Biometric authentication failed', error: e, stackTrace: stackTrace);
      return Left(AuthFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> setBiometricAuth({
    required bool enabled,
  }) async {
    try {
      return await _remoteDataSource.setBiometricAuth(enabled: enabled);
    } catch (e, stackTrace) {
      _logger.e('Set biometric auth failed', error: e, stackTrace: stackTrace);
      return Left(AuthFailure.unexpected(e.toString()));
    }
  }

  // TODO: Implement remaining methods
  @override
  Future<Either<Failure, UserEntity>> updateProfile({
    required String userId,
    required UserProfile profile,
  }) async {
    return Left(AuthFailure.notImplemented());
  }

  @override
  Future<Either<Failure, bool>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    return Left(AuthFailure.notImplemented());
  }

  @override
  Future<Either<Failure, bool>> requestPasswordReset({
    required String email,
  }) async {
    return Left(AuthFailure.notImplemented());
  }

  @override
  Future<Either<Failure, bool>> resetPassword({
    required String token,
    required String newPassword,
  }) async {
    return Left(AuthFailure.notImplemented());
  }

  @override
  Future<Either<Failure, bool>> deleteAccount({
    required String password,
  }) async {
    return Left(AuthFailure.notImplemented());
  }

  @override
  Future<Either<Failure, bool>> verifyEmail({
    required String token,
  }) async {
    return Left(AuthFailure.notImplemented());
  }

  @override
  Future<Either<Failure, bool>> resendEmailVerification() async {
    return Left(AuthFailure.notImplemented());
  }

  @override
  Future<Either<Failure, bool>> linkSocialAccount({
    required String provider,
    required String token,
  }) async {
    return Left(AuthFailure.notImplemented());
  }

  @override
  Future<Either<Failure, bool>> unlinkSocialAccount({
    required String provider,
  }) async {
    return Left(AuthFailure.notImplemented());
  }

  @override
  Future<Either<Failure, List<SocialAccount>>> getLinkedAccounts() async {
    return Left(AuthFailure.notImplemented());
  }

  @override
  Future<Either<Failure, List<AuthSession>>> getSessionHistory() async {
    return Left(AuthFailure.notImplemented());
  }

  @override
  Future<Either<Failure, bool>> revokeSession({
    required String sessionId,
  }) async {
    return Left(AuthFailure.notImplemented());
  }

  @override
  Future<Either<Failure, List<AuthSession>>> getActiveSessions() async {
    return Left(AuthFailure.notImplemented());
  }

  /// Store session locally
  Future<void> _storeSession(AuthSessionEntity session) async {
    await _localDataSource.storeSession(session);
    await _secureStorage.storeAccessToken(session.accessToken);
    await _secureStorage.storeRefreshToken(session.refreshToken);
  }

  /// Clear local session
  Future<void> _clearSession() async {
    await _localDataSource.clearSession();
    await _secureStorage.deleteAccessToken();
    await _secureStorage.deleteRefreshToken();
  }

  /// Dispose resources
  void dispose() {
    _authStateController.close();
  }
}