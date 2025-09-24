import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/storage/secure_storage.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_datasource.dart';
import '../datasources/auth_remote_datasource.dart';
import '../datasources/hanko_datasource.dart';

/// Implementation of AuthRepository
class AuthRepositoryImpl implements AuthRepository {
  /// Constructs a [AuthRepositoryImpl]
  AuthRepositoryImpl({
    required SecureStorageService secureStorage,
    required Logger logger,
    AuthRemoteDataSource? remoteDataSource,
    AuthLocalDataSource? localDataSource,
    HankoDataSource? hankoDataSource,
  }) : _remoteDataSource = remoteDataSource ?? AuthRemoteDataSourceImpl(),
       _localDataSource = localDataSource ?? AuthLocalDataSourceImpl(),
       _hankoDataSource =
           hankoDataSource ??
           HankoDataSourceImpl(dio: _createConfiguredDio(), logger: logger),
       _secureStorage = secureStorage,
       _logger = logger,
       _authStateController = StreamController<AuthSessionEntity?>.broadcast();
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;
  final HankoDataSource _hankoDataSource;
  final SecureStorageService _secureStorage;
  final Logger _logger;
  final StreamController<AuthSessionEntity?> _authStateController;

  @override
  Stream<AuthSessionEntity?> get authStateChanges =>
      _authStateController.stream;

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

      return result.fold(Left.new, (session) async {
        // Store session locally
        await _storeSession(session);

        // Notify auth state change
        _authStateController.add(session);

        _logger.i('Login successful for user: ${session.user.email}');
        return Right(session);
      });
    } on Exception catch (e, stackTrace) {
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
      final isRegisteredResult = await _hankoDataSource.isEmailRegistered(
        email,
      );

      return isRegisteredResult.fold(Left.new, (isRegistered) async {
        if (!isRegistered) {
          return Left(AuthFailure.invalidCredentials());
        }

        // Initiate Hanko login
        final initResult = await _hankoDataSource.initiateLogin(email);

        return initResult.fold(Left.new, (hankoResponse) async {
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
        });
      });
    } on Exception catch (e, stackTrace) {
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

      return result.fold(Left.new, (session) async {
        await _storeSession(session);
        _authStateController.add(session);

        // Clear the stored Hanko session ID as authentication is complete
        await _secureStorage.deleteHankoSessionId();

        _logger.i('Hanko authentication completed successfully');
        return Right(session);
      });
    } on Exception catch (e, stackTrace) {
      _logger.e(
        'Hanko auth completion failed',
        error: e,
        stackTrace: stackTrace,
      );
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

      return result.fold(Left.new, (session) async {
        await _storeSession(session);
        _authStateController.add(session);

        _logger.i('Registration successful for user: ${session.user.email}');
        return Right(session);
      });
    } on Exception catch (e, stackTrace) {
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

      return result.fold(Left.new, (success) async {
        if (success) {
          // Clear local session
          await _clearSession();

          // Notify auth state change
          _authStateController.add(null);

          _logger.i('Logout successful');
        }
        return Right(success);
      });
    } on Exception catch (e, stackTrace) {
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

      return result.fold(Left.new, (session) async {
        await _storeSession(session);
        _authStateController.add(session);

        _logger.d('Token refresh successful');
        return Right(session);
      });
    } on Exception catch (e, stackTrace) {
      _logger.e('Token refresh failed', error: e, stackTrace: stackTrace);
      return Left(AuthFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity?>> getCurrentUser() async {
    try {
      // Try to get from local storage first
      final localResult = await _localDataSource.getCurrentUser();

      return localResult.fold(Left.new, Right.new);
    } on Exception catch (e, stackTrace) {
      _logger.e('Get current user failed', error: e, stackTrace: stackTrace);
      return Left(AuthFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthSessionEntity?>> getCurrentSession() async {
    try {
      final result = await _localDataSource.getCurrentSession();
      return result.fold(Left.new, Right.new);
    } on Exception catch (e, stackTrace) {
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
    } on Exception catch (e) {
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
    } on Exception catch (e, stackTrace) {
      _logger.e(
        'Email availability check failed',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(AuthFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getUserPermissions() async {
    try {
      return await _remoteDataSource.getUserPermissions();
    } on Exception catch (e, stackTrace) {
      _logger.e(
        'Get user permissions failed',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(AuthFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<bool> isBiometricAvailable() async {
    try {
      return await _remoteDataSource.isBiometricAvailable();
    } on Exception catch (e) {
      _logger.e('Biometric availability check failed', error: e);
      return false;
    }
  }

  @override
  Future<Either<Failure, bool>> authenticateWithBiometrics() async {
    try {
      return await _remoteDataSource.authenticateWithBiometrics();
    } on Exception catch (e, stackTrace) {
      _logger.e(
        'Biometric authentication failed',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(AuthFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> setBiometricAuth({
    required bool enabled,
  }) async {
    try {
      return await _remoteDataSource.setBiometricAuth(enabled: enabled);
    } on Exception catch (e, stackTrace) {
      _logger.e('Set biometric auth failed', error: e, stackTrace: stackTrace);
      return Left(AuthFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> updateProfile({
    required String userId,
    required UserProfile profile,
  }) async {
    try {
      _logger.d('Updating profile for user: $userId');

      final result = await _remoteDataSource.updateProfile(
        userId: userId,
        profile: profile,
      );

      return result.fold(Left.new, (user) async {
        // Update local user data
        await _localDataSource.storeUser(user);

        // Update the current session with new user data if it's the current user
        final sessionResult = await getCurrentSession();
        if (sessionResult.isRight()) {
          final session = sessionResult.getOrElse(() => null);
          if (session != null && session.user.id == userId) {
            final updatedSession = session.copyWith(user: user);
            await _storeSession(updatedSession);
            _authStateController.add(updatedSession);
          }
        }

        _logger.i('Profile updated successfully for user: $userId');
        return Right(user);
      });
    } on Exception catch (e, stackTrace) {
      _logger.e('Profile update failed', error: e, stackTrace: stackTrace);
      return Left(AuthFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      _logger.d('Attempting password change');

      final result = await _remoteDataSource.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );

      return result.fold(Left.new, (success) {
        if (success) {
          _logger.i('Password changed successfully');
        }
        return Right(success);
      });
    } on Exception catch (e, stackTrace) {
      _logger.e('Password change failed', error: e, stackTrace: stackTrace);
      return Left(AuthFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> requestPasswordReset({
    required String email,
  }) async {
    try {
      _logger.d('Requesting password reset for email: $email');

      final result = await _remoteDataSource.requestPasswordReset(email: email);

      return result.fold(Left.new, (success) {
        if (success) {
          _logger.i('Password reset requested for: $email');
        }
        return Right(success);
      });
    } on Exception catch (e, stackTrace) {
      _logger.e(
        'Password reset request failed',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(AuthFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> resetPassword({
    required String token,
    required String newPassword,
  }) async {
    try {
      _logger.d('Attempting password reset with token');

      final result = await _remoteDataSource.resetPassword(
        token: token,
        newPassword: newPassword,
      );

      return result.fold(Left.new, (success) {
        if (success) {
          _logger.i('Password reset completed successfully');
        }
        return Right(success);
      });
    } on Exception catch (e, stackTrace) {
      _logger.e('Password reset failed', error: e, stackTrace: stackTrace);
      return Left(AuthFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteAccount({
    required String password,
  }) async {
    try {
      _logger.d('Attempting account deletion');

      final result = await _remoteDataSource.deleteAccount(password: password);

      return result.fold(Left.new, (success) async {
        if (success) {
          // Clear all local data on successful account deletion
          await _clearSession();
          await _localDataSource.clearUser();
          _authStateController.add(null);

          _logger.i('Account deleted successfully');
        }
        return Right(success);
      });
    } on Exception catch (e, stackTrace) {
      _logger.e('Account deletion failed', error: e, stackTrace: stackTrace);
      return Left(AuthFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> verifyEmail({required String token}) async {
    try {
      _logger.d('Verifying email with token');

      final result = await _remoteDataSource.verifyEmail(token: token);

      return result.fold(Left.new, (success) async {
        if (success) {
          // Refresh user data to get updated verification status
          final userResult = await getCurrentUser();
          if (userResult.isRight()) {
            final user = userResult.getOrElse(() => null);
            if (user != null) {
              final updatedUser = user.copyWith(status: UserStatus.verified);
              await _localDataSource.storeUser(updatedUser);

              // Update session with verified user
              final sessionResult = await getCurrentSession();
              if (sessionResult.isRight()) {
                final session = sessionResult.getOrElse(() => null);
                if (session != null) {
                  final updatedSession = session.copyWith(user: updatedUser);
                  await _storeSession(updatedSession);
                  _authStateController.add(updatedSession);
                }
              }
            }
          }

          _logger.i('Email verified successfully');
        }
        return Right(success);
      });
    } on Exception catch (e, stackTrace) {
      _logger.e('Email verification failed', error: e, stackTrace: stackTrace);
      return Left(AuthFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> resendEmailVerification() async {
    try {
      _logger.d('Resending email verification');

      final result = await _remoteDataSource.resendEmailVerification();

      return result.fold(Left.new, (success) {
        if (success) {
          _logger.i('Email verification resent successfully');
        }
        return Right(success);
      });
    } on Exception catch (e, stackTrace) {
      _logger.e(
        'Resend email verification failed',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(AuthFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> linkSocialAccount({
    required String provider,
    required String token,
  }) async {
    try {
      _logger.d('Linking social account: $provider');

      final result = await _remoteDataSource.linkSocialAccount(
        provider: provider,
        token: token,
      );

      return result.fold(Left.new, (success) {
        if (success) {
          _logger.i('Social account linked successfully: $provider');
        }
        return Right(success);
      });
    } on Exception catch (e, stackTrace) {
      _logger.e('Link social account failed', error: e, stackTrace: stackTrace);
      return Left(AuthFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> unlinkSocialAccount({
    required String provider,
  }) async {
    try {
      _logger.d('Unlinking social account: $provider');

      final result = await _remoteDataSource.unlinkSocialAccount(
        provider: provider,
      );

      return result.fold(Left.new, (success) {
        if (success) {
          _logger.i('Social account unlinked successfully: $provider');
        }
        return Right(success);
      });
    } on Exception catch (e, stackTrace) {
      _logger.e(
        'Unlink social account failed',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(AuthFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<SocialAccount>>> getLinkedAccounts() async {
    try {
      _logger.d('Getting linked social accounts');

      final result = await _remoteDataSource.getLinkedAccounts();

      return result.fold(Left.new, (accounts) {
        _logger.d('Retrieved ${accounts.length} linked accounts');
        return Right(accounts);
      });
    } on Exception catch (e, stackTrace) {
      _logger.e('Get linked accounts failed', error: e, stackTrace: stackTrace);
      return Left(AuthFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<AuthSession>>> getSessionHistory() async {
    try {
      _logger.d('Getting session history');

      final result = await _remoteDataSource.getSessionHistory();

      return result.fold(Left.new, (sessions) {
        _logger.d('Retrieved ${sessions.length} session history entries');
        return Right(sessions);
      });
    } on Exception catch (e, stackTrace) {
      _logger.e('Get session history failed', error: e, stackTrace: stackTrace);
      return Left(AuthFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> revokeSession({
    required String sessionId,
  }) async {
    try {
      _logger.d('Revoking session: $sessionId');

      final result = await _remoteDataSource.revokeSession(
        sessionId: sessionId,
      );

      return result.fold(Left.new, (success) {
        if (success) {
          _logger.i('Session revoked successfully: $sessionId');
        }
        return Right(success);
      });
    } on Exception catch (e, stackTrace) {
      _logger.e('Revoke session failed', error: e, stackTrace: stackTrace);
      return Left(AuthFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<AuthSession>>> getActiveSessions() async {
    try {
      _logger.d('Getting active sessions');

      final result = await _remoteDataSource.getActiveSessions();

      return result.fold(Left.new, (sessions) {
        _logger.d('Retrieved ${sessions.length} active sessions');
        return Right(sessions);
      });
    } on Exception catch (e, stackTrace) {
      _logger.e('Get active sessions failed', error: e, stackTrace: stackTrace);
      return Left(AuthFailure.unexpected(e.toString()));
    }
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

  /// Create configured Dio instance for Hanko
  static Dio _createConfiguredDio() {
    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
      ),
    );

    // Add interceptors for logging and error handling
    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (object) {
          // Only log in debug mode for security
          // ignore: avoid_print
          if (kDebugMode) print(object);
        },
      ),
    );

    return dio;
  }

  /// Dispose resources
  void dispose() {
    _authStateController.close();
  }
}
