import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';

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
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay

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
    await Future.delayed(const Duration(seconds: 1));

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
    await Future.delayed(const Duration(seconds: 1));

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
    await Future.delayed(const Duration(seconds: 2));

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
    await Future.delayed(const Duration(milliseconds: 500));
    return const Right(true);
  }

  @override
  Future<Either<Failure, AuthSessionEntity>> refreshToken({
    required String refreshToken,
  }) async {
    // TODO: Implement actual token refresh
    await Future.delayed(const Duration(seconds: 1));

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
    await Future.delayed(const Duration(milliseconds: 500));

    // Mock: test@example.com is taken
    if (email == 'test@example.com') {
      return const Right(false);
    }

    return const Right(true);
  }

  @override
  Future<Either<Failure, List<String>>> getUserPermissions() async {
    // TODO: Implement actual permissions fetch
    await Future.delayed(const Duration(milliseconds: 300));

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
    await Future.delayed(const Duration(milliseconds: 200));
    return true; // Mock: always available
  }

  @override
  Future<Either<Failure, bool>> authenticateWithBiometrics() async {
    // TODO: Implement actual biometric authentication
    await Future.delayed(const Duration(seconds: 2));
    return const Right(true); // Mock: always successful
  }

  @override
  Future<Either<Failure, bool>> setBiometricAuth({
    required bool enabled,
  }) async {
    // TODO: Implement actual biometric setting
    await Future.delayed(const Duration(milliseconds: 500));
    return const Right(true);
  }
}