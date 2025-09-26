import 'package:dartz/dartz.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:logger/logger.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/network/graphql_client.dart';
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
  }) : _graphqlClient = graphqlClient,
       _logger = logger;

  final GraphQLClient _graphqlClient;
  final Logger _logger;

  @override
  Future<Either<Failure, AuthSessionEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      _logger.d('Attempting login for email: $email');

      const loginMutation = r'''
        mutation Login($email: String!, $password: String!) {
          login(email: $email, password: $password) {
            user {
              id
              email
              firstName
              lastName
              profileImageUrl
              isEmailVerified
              createdAt
              lastLoginAt
            }
            accessToken
            refreshToken
            expiresAt
          }
        }
      ''';

      final MutationOptions options = MutationOptions(
        document: gql(loginMutation),
        variables: {
          'email': email,
          'password': password,
        },
      );

      final QueryResult result = await _graphqlClient.mutate(options);

      if (result.hasException) {
        _logger.e('Login failed: ${result.exception}');
        return Left(_handleGraphQLException(result.exception!));
      }

      if (result.data == null || result.data!['login'] == null) {
        _logger.e('Login failed: No data received');
        return Left(const AuthFailure.invalidCredentials());
      }

      final loginData = result.data!['login'];
      final session = _parseAuthSession(loginData);

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
          $firstName: String!
          $lastName: String!
          $clubId: String
        ) {
          register(
            email: $email
            password: $password
            firstName: $firstName
            lastName: $lastName
            clubId: $clubId
          ) {
            user {
              id
              email
              firstName
              lastName
              profileImageUrl
              isEmailVerified
              createdAt
              lastLoginAt
            }
            accessToken
            refreshToken
            expiresAt
          }
        }
      ''';

      final MutationOptions options = MutationOptions(
        document: gql(registerMutation),
        variables: {
          'email': email,
          'password': password,
          'firstName': firstName,
          'lastName': lastName,
          if (clubId != null) 'clubId': clubId,
        },
      );

      final QueryResult result = await _graphqlClient.mutate(options);

      if (result.hasException) {
        _logger.e('Registration failed: ${result.exception}');
        return Left(_handleGraphQLException(result.exception!));
      }

      if (result.data == null || result.data!['register'] == null) {
        _logger.e('Registration failed: No data received');
        return Left(const AuthFailure.registrationFailed());
      }

      final registerData = result.data!['register'];
      final session = _parseAuthSession(registerData);

      _logger.d('Registration successful for user: ${session.user.email}');
      return Right(session);
    } catch (e, stackTrace) {
      _logger.e('Registration error: $e', error: e, stackTrace: stackTrace);
      return Left(NetworkFailure.serverError(500, e.toString()));
    }
      email: email,
      firstName: firstName,
      lastName: lastName,
      clubId: clubId,
      createdAt: DateTime.now(),
    );

    final session = AuthSessionEntity(
      accessToken: 'mock-new-user-access-token',
      refreshToken: 'mock-new-user-refresh-token',
      expiresAt: DateTime.now().add(const Duration(hours: 1)),
      user: user,
    );

    return Right(session);
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

      final QueryResult result = await _graphqlClient.mutate(options);

      if (result.hasException) {
        _logger.e('Logout failed: ${result.exception}');
        return Left(_handleGraphQLException(result.exception!));
      }

      if (result.data == null || result.data!['logout'] == null) {
        _logger.e('Logout failed: No data received');
        return Left(const AuthFailure.logoutFailed());
      }

      final success = result.data!['logout']['success'] as bool? ?? false;

      if (success) {
        _logger.d('Logout successful');
        return const Right(true);
      } else {
        _logger.e('Logout failed: Server returned false');
        return Left(const AuthFailure.logoutFailed());
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
            user {
              id
              email
              firstName
              lastName
              profileImageUrl
              isEmailVerified
              createdAt
              lastLoginAt
            }
            accessToken
            refreshToken
            expiresAt
          }
        }
      ''';

      final MutationOptions options = MutationOptions(
        document: gql(refreshMutation),
        variables: {
          'refreshToken': refreshToken,
        },
      );

      final QueryResult result = await _graphqlClient.mutate(options);

      if (result.hasException) {
        _logger.e('Token refresh failed: ${result.exception}');
        return Left(_handleGraphQLException(result.exception!));
      }

      if (result.data == null || result.data!['refreshToken'] == null) {
        _logger.e('Token refresh failed: No data received');
        return Left(const AuthFailure.tokenRefreshFailed());
      }

      final refreshData = result.data!['refreshToken'];
      final session = _parseAuthSession(refreshData);

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
    // TODO(oscaralmgren): Implement actual biometric availability check
    await Future<void>.delayed(const Duration(milliseconds: 200));
    return true; // Mock: always available
  }

  @override
  Future<Either<Failure, bool>> authenticateWithBiometrics() async {
    // TODO(oscaralmgren): Implement actual biometric authentication
    await Future<void>.delayed(const Duration(seconds: 2));
    return const Right(true); // Mock: always successful
  }

  @override
  Future<Either<Failure, bool>> setBiometricAuth({
    required bool enabled,
  }) async {
    // TODO(oscaralmgren): Implement actual biometric setting
    await Future<void>.delayed(const Duration(milliseconds: 500));
    return const Right(true);
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
      firstName: userData['firstName'] as String,
      lastName: userData['lastName'] as String,
      profileImageUrl: userData['profileImageUrl'] as String?,
      isEmailVerified: userData['isEmailVerified'] as bool? ?? false,
      createdAt: DateTime.parse(userData['createdAt'] as String),
      lastLoginAt: userData['lastLoginAt'] != null
          ? DateTime.parse(userData['lastLoginAt'] as String)
          : null,
    );

    return AuthSessionEntity(
      user: user,
      accessToken: data['accessToken'] as String,
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
            return const AuthFailure.invalidCredentials();
          case 'EMAIL_NOT_VERIFIED':
            return const AuthFailure.emailNotVerified();
          case 'ACCOUNT_LOCKED':
            return const AuthFailure.accountLocked();
          case 'PASSWORD_EXPIRED':
            return const AuthFailure.passwordExpired();
          case 'HANKO_INIT_FAILED':
            return const AuthFailure.hankoInitFailed();
          case 'HANKO_COMPLETION_FAILED':
            return const AuthFailure.hankoCompletionFailed();
          case 'BIOMETRIC_NOT_AVAILABLE':
            return const AuthFailure.biometricNotAvailable();
          case 'BIOMETRIC_AUTH_FAILED':
            return const AuthFailure.biometricAuthFailed();
          default:
            return NetworkFailure.serverError(
              500,
              graphqlError.message,
            );
        }
      }

      return NetworkFailure.serverError(500, graphqlError.message);
    }

    if (exception.linkException != null) {
      if (exception.linkException is NetworkException) {
        return const NetworkFailure.noConnection();
      }

      return NetworkFailure.serverError(
        500,
        exception.linkException.toString(),
      );
    }

    return NetworkFailure.serverError(500, 'Unknown GraphQL error');
  }
}
