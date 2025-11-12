import 'package:dartz/dartz.dart';
import 'package:graphql_flutter/graphql_flutter.dart' hide NetworkException;
import 'package:local_auth/local_auth.dart';
import 'package:logger/logger.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/auth_session_entity.dart';
import '../../domain/entities/user_entity.dart';

/// Remote data source for authentication
abstract class AuthRemoteDataSource {
  Future<Either<Failure, AuthSessionEntity>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, AuthSessionEntity>> loginWithHanko({
    required String email,
  });

  Future<Either<Failure, AuthSessionEntity>> completeHankoAuth({
    required String sessionId,
    required String credential,
  });

  Future<Either<Failure, AuthSessionEntity>> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    String? clubId,
  });

  Future<Either<Failure, bool>> logout();

  Future<Either<Failure, AuthSessionEntity>> refreshToken({
    required String refreshToken,
  });

  Future<Either<Failure, bool>> checkEmailAvailability({required String email});

  Future<Either<Failure, List<String>>> getUserPermissions();

  Future<bool> isBiometricAvailable();

  Future<Either<Failure, bool>> authenticateWithBiometrics();

  Future<Either<Failure, bool>> setBiometricAuth({required bool enabled});

  /// Profile management
  Future<Either<Failure, UserEntity>> updateProfile({
    required String userId,
    required UserProfile profile,
  });

  /// Password management
  Future<Either<Failure, bool>> changePassword({
    required String currentPassword,
    required String newPassword,
  });

  Future<Either<Failure, bool>> requestPasswordReset({required String email});

  Future<Either<Failure, bool>> resetPassword({
    required String token,
    required String newPassword,
  });

  /// Account management
  Future<Either<Failure, bool>> deleteAccount({required String password});

  /// Email verification
  Future<Either<Failure, bool>> verifyEmail({required String token});

  Future<Either<Failure, bool>> resendEmailVerification();

  /// Social account management
  Future<Either<Failure, bool>> linkSocialAccount({
    required String provider,
    required String token,
  });

  Future<Either<Failure, bool>> unlinkSocialAccount({required String provider});

  Future<Either<Failure, List<SocialAccount>>> getLinkedAccounts();

  /// Session management
  Future<Either<Failure, List<AuthSession>>> getSessionHistory();

  Future<Either<Failure, bool>> revokeSession({required String sessionId});

  Future<Either<Failure, List<AuthSession>>> getActiveSessions();
}

/// Implementation of AuthRemoteDataSource
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl({
    required GraphQLClient graphqlClient,
    required Logger logger,
    LocalAuthentication? localAuth,
  })  : _graphqlClient = graphqlClient,
        _logger = logger,
        _localAuth = localAuth ?? LocalAuthentication();

  final GraphQLClient _graphqlClient;
  final Logger _logger;
  final LocalAuthentication _localAuth;

  @override
  Future<Either<Failure, AuthSessionEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      _logger.d('Attempting login for email: $email');

      const loginMutation = r'''
        mutation Login($email: String!, $password: String!) {
          login(input: { email: $email, password: $password }) {
            token
            refreshToken
            expiresAt
            user {
              id
              clubId
              email
              username
              firstName
              lastName
              status
              roles
              permissions
              createdAt
              updatedAt
            }
          }
        }
      ''';

      final MutationOptions options = MutationOptions(
        document: gql(loginMutation),
        variables: {'email': email, 'password': password},
      );

      // Execute mutation with timeout
      final QueryResult result = await _graphqlClient.mutate(options).timeout(
        const Duration(seconds: 20),
        onTimeout: () {
          _logger.w('Login mutation timeout');
          throw NetworkException.timeout();
        },
      );

      if (result.hasException) {
        _logger.e('Login failed: ${result.exception}');
        return Left(_handleGraphQLException(result.exception!));
      }

      if (result.data == null || result.data!['login'] == null) {
        _logger.e('Login failed: No data received');
        return Left(AuthFailure.invalidCredentials());
      }

      final loginData = result.data!['login'];
      final session = _parseAuthSession(loginData as Map<String, dynamic>);

      _logger.d('Login successful for user: ${session.user.email}');
      return Right(session);
    } catch (e, stackTrace) {
      _logger.e('Login error: $e', error: e, stackTrace: stackTrace);
      return Left(NetworkFailure.serverError(500, e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthSessionEntity>> loginWithHanko({
    required String email,
  }) async {
    // TODO(oscaralmgren): Implement Hanko login
    await Future<void>.delayed(const Duration(seconds: 1));

    final user = UserEntity(
      id: 'user-hanko-123',
      email: email,
      firstName: 'Hanko',
      lastName: 'User',
      createdAt: DateTime.now(),
    );

    final session = AuthSessionEntity(
      accessToken: 'mock-hanko-access-token',
      refreshToken: 'mock-hanko-refresh-token',
      expiresAt: DateTime.now().add(const Duration(hours: 1)),
      user: user,
      hankoSessionId: 'hanko-session-123',
    );

    return Right(session);
  }

  @override
  Future<Either<Failure, AuthSessionEntity>> completeHankoAuth({
    required String sessionId,
    required String credential,
  }) async {
    // TODO(oscaralmgren): Implement Hanko auth completion
    await Future<void>.delayed(const Duration(seconds: 1));

    final user = UserEntity(
      id: 'user-hanko-complete-123',
      email: 'hanko@example.com',
      firstName: 'Hanko',
      lastName: 'Complete',
      createdAt: DateTime.now(),
    );

    final session = AuthSessionEntity(
      accessToken: 'mock-hanko-complete-access-token',
      refreshToken: 'mock-hanko-complete-refresh-token',
      expiresAt: DateTime.now().add(const Duration(hours: 1)),
      user: user,
      hankoSessionId: sessionId,
    );

    return Right(session);
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

      const registerMutation = r'''
        mutation Register(
          $email: String!
          $password: String!
          $username: String!
          $clubId: ID!
          $firstName: String!
          $lastName: String!
        ) {
          register(
            input: {
              email: $email
              password: $password
              username: $username
              clubId: $clubId
              firstName: $firstName
              lastName: $lastName
            }
          ) {
            token
            refreshToken
            expiresAt
            user {
              id
              clubId
              email
              username
              firstName
              lastName
              status
              roles
              permissions
              createdAt
              updatedAt
            }
          }
        }
      ''';

      final MutationOptions options = MutationOptions(
        document: gql(registerMutation),
        variables: {
          'email': email,
          'password': password,
          'username': email, // Use email as username by default
          'clubId': clubId ?? 'default-club-id', // Required field
          'firstName': firstName,
          'lastName': lastName,
        },
      );

      // Execute mutation with timeout
      final QueryResult result = await _graphqlClient.mutate(options).timeout(
        const Duration(seconds: 20),
        onTimeout: () {
          _logger.w('Register mutation timeout');
          throw NetworkException.timeout();
        },
      );

      if (result.hasException) {
        _logger.e('Registration failed: ${result.exception}');
        return Left(_handleGraphQLException(result.exception!));
      }

      if (result.data == null || result.data!['register'] == null) {
        _logger.e('Registration failed: No data received');
        return Left(AuthFailure.unexpected('Registration failed'));
      }

      final registerData = result.data!['register'];
      final session = _parseAuthSession(registerData as Map<String, dynamic>);

      _logger.d('Registration successful for user: ${session.user.email}');
      return Right(session);
    } catch (e, stackTrace) {
      _logger.e('Registration error: $e', error: e, stackTrace: stackTrace);
      return Left(NetworkFailure.serverError(500, e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> logout() async {
    try {
      _logger.d('Attempting logout');

      const logoutMutation = r'''
        mutation Logout {
          logout {
            success
          }
        }
      ''';

      final MutationOptions options = MutationOptions(
        document: gql(logoutMutation),
      );

      // Execute mutation with timeout
      final QueryResult result = await _graphqlClient.mutate(options).timeout(
        const Duration(seconds: 20),
        onTimeout: () {
          _logger.w('Logout mutation timeout');
          throw NetworkException.timeout();
        },
      );

      if (result.hasException) {
        _logger.e('Logout failed: ${result.exception}');
        return Left(_handleGraphQLException(result.exception!));
      }

      if (result.data == null || result.data!['logout'] == null) {
        _logger.e('Logout failed: No data received');
        return Left(AuthFailure.unexpected('Logout failed'));
      }

      final success = result.data!['logout']['success'] as bool? ?? false;

      if (success) {
        _logger.d('Logout successful');
        return const Right(true);
      } else {
        _logger.e('Logout failed: Server returned false');
        return Left(AuthFailure.unexpected('Logout failed'));
      }
    } catch (e, stackTrace) {
      _logger.e('Logout error: $e', error: e, stackTrace: stackTrace);
      return Left(NetworkFailure.serverError(500, e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthSessionEntity>> refreshToken({
    required String refreshToken,
  }) async {
    try {
      _logger.d('Attempting token refresh');

      const refreshMutation = r'''
        mutation RefreshToken($refreshToken: String!) {
          refreshToken(refreshToken: $refreshToken) {
            token
            refreshToken
            expiresAt
            user {
              id
              clubId
              email
              username
              firstName
              lastName
              status
              roles
              permissions
              createdAt
              updatedAt
            }
          }
        }
      ''';

      final MutationOptions options = MutationOptions(
        document: gql(refreshMutation),
        variables: {'refreshToken': refreshToken},
      );

      // Execute mutation with timeout
      final QueryResult result = await _graphqlClient.mutate(options).timeout(
        const Duration(seconds: 20),
        onTimeout: () {
          _logger.w('RefreshToken mutation timeout');
          throw NetworkException.timeout();
        },
      );

      if (result.hasException) {
        _logger.e('Token refresh failed: ${result.exception}');
        return Left(_handleGraphQLException(result.exception!));
      }

      if (result.data == null || result.data!['refreshToken'] == null) {
        _logger.e('Token refresh failed: No data received');
        return Left(AuthFailure.tokenRefreshFailed());
      }

      final refreshData = result.data!['refreshToken'];
      final session = _parseAuthSession(refreshData as Map<String, dynamic>);

      _logger.d('Token refresh successful for user: ${session.user.email}');
      return Right(session);
    } catch (e, stackTrace) {
      _logger.e('Token refresh error: $e', error: e, stackTrace: stackTrace);
      return Left(NetworkFailure.serverError(500, e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> checkEmailAvailability({
    required String email,
  }) async {
    // TODO(oscaralmgren): Implement actual email availability check
    await Future<void>.delayed(const Duration(milliseconds: 500));

    // Mock: test@example.com is taken
    if (email == 'test@example.com') {
      return const Right(false);
    }

    return const Right(true);
  }

  @override
  Future<Either<Failure, List<String>>> getUserPermissions() async {
    // TODO(oscaralmgren): Implement actual permissions fetch
    await Future<void>.delayed(const Duration(milliseconds: 300));

    return const Right([
      'read:profile',
      'write:profile',
      'read:bookings',
      'write:bookings',
    ]);
  }

  @override
  Future<bool> isBiometricAvailable() async {
    try {
      // Check if device supports biometric authentication
      final canCheckBiometrics = await _localAuth.canCheckBiometrics;
      final isDeviceSupported = await _localAuth.isDeviceSupported();

      if (!canCheckBiometrics || !isDeviceSupported) {
        return false;
      }

      // Check if any biometric types are enrolled
      final availableBiometrics = await _localAuth.getAvailableBiometrics();
      return availableBiometrics.isNotEmpty;
    } on Exception catch (e) {
      _logger.e('Error checking biometric availability: $e');
      return false;
    }
  }

  @override
  Future<Either<Failure, bool>> authenticateWithBiometrics() async {
    try {
      // Check if biometric is available first
      final isAvailable = await isBiometricAvailable();
      if (!isAvailable) {
        return Left(AuthFailure.biometricNotAvailable());
      }

      // Perform biometric authentication
      final didAuthenticate = await _localAuth.authenticate(
        localizedReason: 'Please authenticate to access your account',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );

      if (didAuthenticate) {
        _logger.d('Biometric authentication successful');
        return const Right(true);
      } else {
        _logger.w('Biometric authentication failed or cancelled');
        return Left(AuthFailure.unexpected('Biometric authentication failed'));
      }
    } on Exception catch (e) {
      _logger.e('Biometric authentication error: $e');
      return Left(AuthFailure.unexpected('Biometric error: $e'));
    }
  }

  @override
  Future<Either<Failure, bool>> setBiometricAuth({
    required bool enabled,
  }) async {
    try {
      if (enabled) {
        // If enabling, check if biometric is available
        final isAvailable = await isBiometricAvailable();
        if (!isAvailable) {
          return Left(AuthFailure.biometricNotAvailable());
        }
      }

      // Note: Biometric setting is typically stored locally in secure storage
      // by the repository layer. This method just validates the capability.
      _logger.d('Biometric auth ${enabled ? 'enabled' : 'disabled'}');
      return const Right(true);
    } on Exception catch (e) {
      _logger.e('Error setting biometric auth: $e');
      return Left(AuthFailure.unexpected('Error setting biometric auth: $e'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> updateProfile({
    required String userId,
    required UserProfile profile,
  }) async {
    // TODO(oscaralmgren): Implement actual profile update
    await Future<void>.delayed(const Duration(seconds: 1));

    final updatedUser = UserEntity(
      id: userId,
      email: 'updated@example.com',
      firstName: profile.fullName.split(' ').first,
      lastName: profile.fullName.split(' ').length > 1
          ? profile.fullName.split(' ').last
          : '',
      profile: profile,
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
    );

    return Right(updatedUser);
  }

  @override
  Future<Either<Failure, bool>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    // TODO(oscaralmgren): Implement actual password change
    await Future<void>.delayed(const Duration(seconds: 1));

    // Mock validation
    if (currentPassword.isEmpty || newPassword.isEmpty) {
      return Left(AuthFailure.invalidCredentials());
    }

    return const Right(true);
  }

  @override
  Future<Either<Failure, bool>> requestPasswordReset({
    required String email,
  }) async {
    // TODO(oscaralmgren): Implement actual password reset request
    await Future<void>.delayed(const Duration(seconds: 1));

    if (email.isEmpty) {
      return Left(AuthFailure.invalidCredentials());
    }

    return const Right(true);
  }

  @override
  Future<Either<Failure, bool>> resetPassword({
    required String token,
    required String newPassword,
  }) async {
    // TODO(oscaralmgren): Implement actual password reset
    await Future<void>.delayed(const Duration(seconds: 1));

    if (token.isEmpty || newPassword.isEmpty) {
      return Left(AuthFailure.invalidCredentials());
    }

    return const Right(true);
  }

  @override
  Future<Either<Failure, bool>> deleteAccount({
    required String password,
  }) async {
    // TODO(oscaralmgren): Implement actual account deletion
    await Future<void>.delayed(const Duration(seconds: 2));

    if (password.isEmpty) {
      return Left(AuthFailure.invalidCredentials());
    }

    return const Right(true);
  }

  @override
  Future<Either<Failure, bool>> verifyEmail({required String token}) async {
    // TODO(oscaralmgren): Implement actual email verification
    await Future<void>.delayed(const Duration(seconds: 1));

    if (token.isEmpty) {
      return Left(AuthFailure.invalidCredentials());
    }

    return const Right(true);
  }

  @override
  Future<Either<Failure, bool>> resendEmailVerification() async {
    // TODO(oscaralmgren): Implement actual email verification resend
    await Future<void>.delayed(const Duration(seconds: 1));
    return const Right(true);
  }

  @override
  Future<Either<Failure, bool>> linkSocialAccount({
    required String provider,
    required String token,
  }) async {
    // TODO(oscaralmgren): Implement actual social account linking
    await Future<void>.delayed(const Duration(seconds: 1));

    if (provider.isEmpty || token.isEmpty) {
      return Left(AuthFailure.invalidCredentials());
    }

    return const Right(true);
  }

  @override
  Future<Either<Failure, bool>> unlinkSocialAccount({
    required String provider,
  }) async {
    // TODO(oscaralmgren): Implement actual social account unlinking
    await Future<void>.delayed(const Duration(seconds: 1));

    if (provider.isEmpty) {
      return Left(AuthFailure.invalidCredentials());
    }

    return const Right(true);
  }

  @override
  Future<Either<Failure, List<SocialAccount>>> getLinkedAccounts() async {
    // TODO(oscaralmgren): Implement actual linked accounts fetch
    await Future<void>.delayed(const Duration(seconds: 1));

    final accounts = [
      SocialAccount(
        id: '1',
        provider: 'google',
        providerUserId: 'google-123',
        email: 'user@gmail.com',
        linkedAt: DateTime.now().subtract(const Duration(days: 30)),
      ),
      SocialAccount(
        id: '2',
        provider: 'apple',
        providerUserId: 'apple-456',
        email: 'user@icloud.com',
        linkedAt: DateTime.now().subtract(const Duration(days: 15)),
      ),
    ];

    return Right(accounts);
  }

  @override
  Future<Either<Failure, List<AuthSession>>> getSessionHistory() async {
    // TODO(oscaralmgren): Implement actual session history fetch
    await Future<void>.delayed(const Duration(seconds: 1));

    final sessions = [
      AuthSession(
        id: 'session-1',
        deviceName: 'iPhone 14 Pro',
        location: 'San Francisco, CA',
        ipAddress: '192.168.1.1',
        createdAt: DateTime.now().subtract(const Duration(days: 7)),
        lastActiveAt: DateTime.now().subtract(const Duration(hours: 2)),
        isActive: true,
      ),
      AuthSession(
        id: 'session-2',
        deviceName: 'MacBook Pro',
        location: 'San Francisco, CA',
        ipAddress: '192.168.1.2',
        createdAt: DateTime.now().subtract(const Duration(days: 30)),
        lastActiveAt: DateTime.now().subtract(const Duration(days: 1)),
        isActive: false,
      ),
    ];

    return Right(sessions);
  }

  @override
  Future<Either<Failure, bool>> revokeSession({
    required String sessionId,
  }) async {
    // TODO(oscaralmgren): Implement actual session revocation
    await Future<void>.delayed(const Duration(seconds: 1));

    if (sessionId.isEmpty) {
      return Left(AuthFailure.invalidCredentials());
    }

    return const Right(true);
  }

  @override
  Future<Either<Failure, List<AuthSession>>> getActiveSessions() async {
    // TODO(oscaralmgren): Implement actual active sessions fetch
    await Future<void>.delayed(const Duration(seconds: 1));

    final sessions = [
      AuthSession(
        id: 'session-1',
        deviceName: 'iPhone 14 Pro',
        location: 'San Francisco, CA',
        ipAddress: '192.168.1.1',
        createdAt: DateTime.now().subtract(const Duration(days: 7)),
        lastActiveAt: DateTime.now().subtract(const Duration(hours: 2)),
        isActive: true,
      ),
      AuthSession(
        id: 'session-3',
        deviceName: 'iPad Pro',
        location: 'San Francisco, CA',
        ipAddress: '192.168.1.3',
        createdAt: DateTime.now().subtract(const Duration(hours: 6)),
        lastActiveAt: DateTime.now().subtract(const Duration(minutes: 30)),
        isActive: true,
      ),
    ];

    return Right(sessions);
  }

  /// Helper method to parse AuthSession from GraphQL response
  AuthSessionEntity _parseAuthSession(Map<String, dynamic> data) {
    final userData = data['user'] as Map<String, dynamic>;

    final user = UserEntity(
      id: userData['id'] as String,
      email: userData['email'] as String,
      firstName: userData['firstName'] as String?,
      lastName: userData['lastName'] as String?,
      username: userData['username'] as String?,
      clubId: userData['clubId'] as String?,
      createdAt: DateTime.parse(userData['createdAt'] as String),
      updatedAt: userData['updatedAt'] != null
          ? DateTime.parse(userData['updatedAt'] as String)
          : null,
      roles:
          (userData['roles'] as List<dynamic>?)
              ?.map((role) => role as String)
              .toList() ??
          [],
      permissions:
          (userData['permissions'] as List<dynamic>?)
              ?.map((permission) => permission as String)
              .toList() ??
          [],
    );

    return AuthSessionEntity(
      user: user,
      accessToken: data['token'] as String,
      refreshToken: data['refreshToken'] as String,
      expiresAt: DateTime.parse(data['expiresAt'] as String),
    );
  }

  /// Helper method to handle GraphQL exceptions and convert to domain failures
  Failure _handleGraphQLException(OperationException exception) {
    if (exception.graphqlErrors.isNotEmpty) {
      final graphqlError = exception.graphqlErrors.first;
      final extensions = graphqlError.extensions;

      if (extensions != null && extensions['code'] != null) {
        switch (extensions['code'] as String) {
          case 'INVALID_CREDENTIALS':
            return AuthFailure.invalidCredentials();
          case 'EMAIL_NOT_VERIFIED':
            return AuthFailure.unexpected('Email not verified');
          case 'ACCOUNT_LOCKED':
            return AuthFailure.unauthorized();
          case 'PASSWORD_EXPIRED':
            return AuthFailure.unexpected('Password expired');
          case 'HANKO_INIT_FAILED':
            return AuthFailure.hankoError('Initialization failed');
          case 'HANKO_COMPLETION_FAILED':
            return AuthFailure.hankoError('Completion failed');
          case 'BIOMETRIC_NOT_AVAILABLE':
            return AuthFailure.biometricNotAvailable();
          case 'BIOMETRIC_AUTH_FAILED':
            return AuthFailure.unexpected('Biometric authentication failed');
          default:
            return NetworkFailure.serverError(500, graphqlError.message);
        }
      }

      return NetworkFailure.serverError(500, graphqlError.message);
    }

    if (exception.linkException != null) {
      if (exception.linkException is NetworkException) {
        return NetworkFailure.noConnection();
      }

      return NetworkFailure.serverError(
        500,
        exception.linkException.toString(),
      );
    }

    return NetworkFailure.serverError(500, 'Unknown GraphQL error');
  }
}
