import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
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

  Future<Either<Failure, bool>> checkEmailAvailability({
    required String email,
  });

  Future<Either<Failure, List<String>>> getUserPermissions();

  Future<bool> isBiometricAvailable();

  Future<Either<Failure, bool>> authenticateWithBiometrics();

  Future<Either<Failure, bool>> setBiometricAuth({
    required bool enabled,
  });

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

  Future<Either<Failure, bool>> requestPasswordReset({
    required String email,
  });

  Future<Either<Failure, bool>> resetPassword({
    required String token,
    required String newPassword,
  });

  /// Account management
  Future<Either<Failure, bool>> deleteAccount({
    required String password,
  });

  /// Email verification
  Future<Either<Failure, bool>> verifyEmail({
    required String token,
  });

  Future<Either<Failure, bool>> resendEmailVerification();

  /// Social account management
  Future<Either<Failure, bool>> linkSocialAccount({
    required String provider,
    required String token,
  });

  Future<Either<Failure, bool>> unlinkSocialAccount({
    required String provider,
  });

  Future<Either<Failure, List<SocialAccount>>> getLinkedAccounts();

  /// Session management
  Future<Either<Failure, List<AuthSession>>> getSessionHistory();

  Future<Either<Failure, bool>> revokeSession({
    required String sessionId,
  });

  Future<Either<Failure, List<AuthSession>>> getActiveSessions();
}

/// Implementation of AuthRemoteDataSource
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  // TODO: Inject GraphQL client or HTTP client

  @override
  Future<Either<Failure, AuthSessionEntity>> login({
    required String email,
    required String password,
  }) async {
    // TODO: Implement actual API call
    await Future<void>.delayed(const Duration(seconds: 1)); // Simulate network delay

    // Mock successful login
    if (email == 'test@example.com' && password == 'password123') {
      final user = UserEntity(
        id: 'user-123',
        email: email,
        firstName: 'Test',
        lastName: 'User',
        status: UserStatus.active,
        createdAt: DateTime.now(),
      );

      final session = AuthSessionEntity(
        accessToken: 'mock-access-token',
        refreshToken: 'mock-refresh-token',
        expiresAt: DateTime.now().add(const Duration(hours: 1)),
        user: user,
      );

      return Right(session);
    }

    return Left(AuthFailure.invalidCredentials());
  }

  @override
  Future<Either<Failure, AuthSessionEntity>> loginWithHanko({
    required String email,
  }) async {
    // TODO: Implement Hanko login
    await Future<void>.delayed(const Duration(seconds: 1));

    final user = UserEntity(
      id: 'user-hanko-123',
      email: email,
      firstName: 'Hanko',
      lastName: 'User',
      status: UserStatus.active,
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
    // TODO: Implement Hanko auth completion
    await Future<void>.delayed(const Duration(seconds: 1));

    final user = UserEntity(
      id: 'user-hanko-complete-123',
      email: 'hanko@example.com',
      firstName: 'Hanko',
      lastName: 'Complete',
      status: UserStatus.active,
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
    // TODO: Implement actual registration
    await Future<void>.delayed(const Duration(seconds: 2));

    final user = UserEntity(
      id: 'user-new-123',
      email: email,
      firstName: firstName,
      lastName: lastName,
      clubId: clubId,
      status: UserStatus.active,
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
    // TODO: Implement actual logout
    await Future<void>.delayed(const Duration(milliseconds: 500));
    return const Right(true);
  }

  @override
  Future<Either<Failure, AuthSessionEntity>> refreshToken({
    required String refreshToken,
  }) async {
    // TODO: Implement actual token refresh
    await Future<void>.delayed(const Duration(seconds: 1));

    if (refreshToken.isEmpty) {
      return Left(AuthFailure.invalidCredentials());
    }

    final user = UserEntity(
      id: 'user-refresh-123',
      email: 'refreshed@example.com',
      firstName: 'Refreshed',
      lastName: 'User',
      status: UserStatus.active,
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
    );

    final session = AuthSessionEntity(
      accessToken: 'mock-refreshed-access-token',
      refreshToken: 'mock-refreshed-refresh-token',
      expiresAt: DateTime.now().add(const Duration(hours: 1)),
      user: user,
    );

    return Right(session);
  }

  @override
  Future<Either<Failure, bool>> checkEmailAvailability({
    required String email,
  }) async {
    // TODO: Implement actual email availability check
    await Future<void>.delayed(const Duration(milliseconds: 500));

    // Mock: test@example.com is taken
    if (email == 'test@example.com') {
      return const Right(false);
    }

    return const Right(true);
  }

  @override
  Future<Either<Failure, List<String>>> getUserPermissions() async {
    // TODO: Implement actual permissions fetch
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
    // TODO: Implement actual biometric availability check
    await Future<void>.delayed(const Duration(milliseconds: 200));
    return true; // Mock: always available
  }

  @override
  Future<Either<Failure, bool>> authenticateWithBiometrics() async {
    // TODO: Implement actual biometric authentication
    await Future<void>.delayed(const Duration(seconds: 2));
    return const Right(true); // Mock: always successful
  }

  @override
  Future<Either<Failure, bool>> setBiometricAuth({
    required bool enabled,
  }) async {
    // TODO: Implement actual biometric setting
    await Future<void>.delayed(const Duration(milliseconds: 500));
    return const Right(true);
  }

  @override
  Future<Either<Failure, UserEntity>> updateProfile({
    required String userId,
    required UserProfile profile,
  }) async {
    // TODO: Implement actual profile update
    await Future<void>.delayed(const Duration(seconds: 1));

    final updatedUser = UserEntity(
      id: userId,
      email: 'updated@example.com',
      firstName: profile.fullName.split(' ').first,
      lastName: profile.fullName.split(' ').length > 1 ? profile.fullName.split(' ').last : '',
      status: UserStatus.active,
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
    // TODO: Implement actual password change
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
    // TODO: Implement actual password reset request
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
    // TODO: Implement actual password reset
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
    // TODO: Implement actual account deletion
    await Future<void>.delayed(const Duration(seconds: 2));

    if (password.isEmpty) {
      return Left(AuthFailure.invalidCredentials());
    }

    return const Right(true);
  }

  @override
  Future<Either<Failure, bool>> verifyEmail({
    required String token,
  }) async {
    // TODO: Implement actual email verification
    await Future<void>.delayed(const Duration(seconds: 1));

    if (token.isEmpty) {
      return Left(AuthFailure.invalidCredentials());
    }

    return const Right(true);
  }

  @override
  Future<Either<Failure, bool>> resendEmailVerification() async {
    // TODO: Implement actual email verification resend
    await Future<void>.delayed(const Duration(seconds: 1));
    return const Right(true);
  }

  @override
  Future<Either<Failure, bool>> linkSocialAccount({
    required String provider,
    required String token,
  }) async {
    // TODO: Implement actual social account linking
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
    // TODO: Implement actual social account unlinking
    await Future<void>.delayed(const Duration(seconds: 1));

    if (provider.isEmpty) {
      return Left(AuthFailure.invalidCredentials());
    }

    return const Right(true);
  }

  @override
  Future<Either<Failure, List<SocialAccount>>> getLinkedAccounts() async {
    // TODO: Implement actual linked accounts fetch
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
    // TODO: Implement actual session history fetch
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
    // TODO: Implement actual session revocation
    await Future<void>.delayed(const Duration(seconds: 1));

    if (sessionId.isEmpty) {
      return Left(AuthFailure.invalidCredentials());
    }

    return const Right(true);
  }

  @override
  Future<Either<Failure, List<AuthSession>>> getActiveSessions() async {
    // TODO: Implement actual active sessions fetch
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
}
