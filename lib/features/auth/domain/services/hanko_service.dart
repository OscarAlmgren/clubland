import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/user_entity.dart';

/// Hanko authentication service interface
abstract class HankoService {
  /// Start passwordless login flow
  Future<Either<Failure, HankoAuthSession>> startLogin(String email);

  /// Complete passwordless login flow
  Future<Either<Failure, AuthSessionEntity>> completeLogin({
    required String sessionId,
    required String credential,
  });

  /// Start passwordless registration flow
  Future<Either<Failure, HankoAuthSession>> startRegistration({
    required String email,
    required String firstName,
    required String lastName,
  });

  /// Complete passwordless registration flow
  Future<Either<Failure, AuthSessionEntity>> completeRegistration({
    required String sessionId,
    required String credential,
  });

  /// Check if email is already registered
  Future<Either<Failure, bool>> isEmailRegistered(String email);

  /// Verify Hanko session is valid
  Future<Either<Failure, bool>> verifySession(String sessionId);

  /// Cancel active Hanko session
  Future<Either<Failure, bool>> cancelSession(String sessionId);
}

/// Hanko authentication session
class HankoAuthSession {
  final String sessionId;
  final String status;
  final DateTime expiresAt;
  final String? message;
  final HankoAuthMethod method;
  final Map<String, dynamic>? metadata;

  const HankoAuthSession({
    required this.sessionId,
    required this.status,
    required this.expiresAt,
    this.message,
    this.method = HankoAuthMethod.passkey,
    this.metadata,
  });

  /// Check if session is expired
  bool get isExpired => DateTime.now().isAfter(expiresAt);

  /// Check if session is valid and active
  bool get isValid => !isExpired && status == 'active';

  /// Time until session expires
  Duration get timeUntilExpiration => expiresAt.difference(DateTime.now());
}

/// Hanko authentication methods
enum HankoAuthMethod {
  passkey,
  webauthn,
  magicLink,
  sms,
  email,
}

/// Hanko authentication states
enum HankoAuthStatus {
  pending,
  active,
  completed,
  expired,
  cancelled,
  failed,
}

/// Implementation of Hanko service
class HankoServiceImpl implements HankoService {
  // This would inject the actual Hanko repository
  // For now, we'll implement mock behavior

  @override
  Future<Either<Failure, HankoAuthSession>> startLogin(String email) async {
    try {
      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 500));

      // Mock successful session creation
      final session = HankoAuthSession(
        sessionId: 'hanko_session_${DateTime.now().millisecondsSinceEpoch}',
        status: 'active',
        expiresAt: DateTime.now().add(const Duration(minutes: 5)),
        message: 'Please complete authentication using your preferred method',
        method: HankoAuthMethod.passkey,
        metadata: {
          'email': email,
          'allowedMethods': ['passkey', 'webauthn'],
        },
      );

      return Right(session);
    } catch (e) {
      return Left(AuthFailure.hankoError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthSessionEntity>> completeLogin({
    required String sessionId,
    required String credential,
  }) async {
    try {
      // Simulate network delay
      await Future.delayed(const Duration(seconds: 1));

      // Mock successful authentication
      final user = UserEntity(
        id: 'hanko_user_${DateTime.now().millisecondsSinceEpoch}',
        email: 'user@example.com', // Would come from session
        firstName: 'Hanko',
        lastName: 'User',
        status: UserStatus.active,
        createdAt: DateTime.now(),
      );

      final authSession = AuthSessionEntity(
        accessToken: 'hanko_access_token_${DateTime.now().millisecondsSinceEpoch}',
        refreshToken: 'hanko_refresh_token_${DateTime.now().millisecondsSinceEpoch}',
        expiresAt: DateTime.now().add(const Duration(hours: 1)),
        user: user,
        hankoSessionId: sessionId,
      );

      return Right(authSession);
    } catch (e) {
      return Left(AuthFailure.hankoError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, HankoAuthSession>> startRegistration({
    required String email,
    required String firstName,
    required String lastName,
  }) async {
    try {
      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 500));

      // Mock successful registration session creation
      final session = HankoAuthSession(
        sessionId: 'hanko_reg_session_${DateTime.now().millisecondsSinceEpoch}',
        status: 'active',
        expiresAt: DateTime.now().add(const Duration(minutes: 10)),
        message: 'Please create your passkey to complete registration',
        method: HankoAuthMethod.passkey,
        metadata: {
          'email': email,
          'firstName': firstName,
          'lastName': lastName,
          'registrationFlow': true,
        },
      );

      return Right(session);
    } catch (e) {
      return Left(AuthFailure.hankoError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthSessionEntity>> completeRegistration({
    required String sessionId,
    required String credential,
  }) async {
    try {
      // Simulate network delay
      await Future.delayed(const Duration(seconds: 2));

      // Mock successful registration completion
      final user = UserEntity(
        id: 'hanko_new_user_${DateTime.now().millisecondsSinceEpoch}',
        email: 'newuser@example.com', // Would come from session
        firstName: 'New',
        lastName: 'User',
        status: UserStatus.active,
        createdAt: DateTime.now(),
      );

      final authSession = AuthSessionEntity(
        accessToken: 'hanko_new_access_token_${DateTime.now().millisecondsSinceEpoch}',
        refreshToken: 'hanko_new_refresh_token_${DateTime.now().millisecondsSinceEpoch}',
        expiresAt: DateTime.now().add(const Duration(hours: 1)),
        user: user,
        hankoSessionId: sessionId,
      );

      return Right(authSession);
    } catch (e) {
      return Left(AuthFailure.hankoError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> isEmailRegistered(String email) async {
    try {
      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 300));

      // Mock email check (test@example.com is registered)
      final isRegistered = email == 'test@example.com' ||
                          email == 'user@example.com' ||
                          email.endsWith('@clubland.app');

      return Right(isRegistered);
    } catch (e) {
      return Left(AuthFailure.hankoError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> verifySession(String sessionId) async {
    try {
      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 200));

      // Mock session verification (always valid for demo)
      return const Right(true);
    } catch (e) {
      return Left(AuthFailure.hankoError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> cancelSession(String sessionId) async {
    try {
      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 100));

      // Mock session cancellation (always successful for demo)
      return const Right(true);
    } catch (e) {
      return Left(AuthFailure.hankoError(e.toString()));
    }
  }
}