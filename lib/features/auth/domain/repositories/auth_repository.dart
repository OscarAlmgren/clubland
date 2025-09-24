import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/user_entity.dart';

/// Authentication repository interface
abstract class AuthRepository {
  /// Login with email and password
  Future<Either<Failure, AuthSessionEntity>> login({
    required String email,
    required String password,
  });

  /// Login with Hanko (passwordless)
  Future<Either<Failure, AuthSessionEntity>> loginWithHanko({
    required String email,
  });

  /// Complete Hanko authentication
  Future<Either<Failure, AuthSessionEntity>> completeHankoAuth({
    required String sessionId,
    required String credential,
  });

  /// Refresh authentication token
  Future<Either<Failure, AuthSessionEntity>> refreshToken({
    required String refreshToken,
  });

  /// Logout user
  Future<Either<Failure, bool>> logout();

  /// Get current user from local storage
  Future<Either<Failure, UserEntity?>> getCurrentUser();

  /// Get current auth session
  Future<Either<Failure, AuthSessionEntity?>> getCurrentSession();

  /// Check if user is authenticated
  Future<bool> isAuthenticated();

  /// Update user profile
  Future<Either<Failure, UserEntity>> updateProfile({
    required String userId,
    required UserProfile profile,
  });

  /// Change password
  Future<Either<Failure, bool>> changePassword({
    required String currentPassword,
    required String newPassword,
  });

  /// Request password reset
  Future<Either<Failure, bool>> requestPasswordReset({
    required String email,
  });

  /// Reset password with token
  Future<Either<Failure, bool>> resetPassword({
    required String token,
    required String newPassword,
  });

  /// Enable/disable biometric authentication
  Future<Either<Failure, bool>> setBiometricAuth({
    required bool enabled,
  });

  /// Check if biometric authentication is available
  Future<bool> isBiometricAvailable();

  /// Authenticate with biometrics
  Future<Either<Failure, bool>> authenticateWithBiometrics();

  /// Delete user account
  Future<Either<Failure, bool>> deleteAccount({
    required String password,
  });

  /// Get user permissions
  Future<Either<Failure, List<String>>> getUserPermissions();

  /// Verify email address
  Future<Either<Failure, bool>> verifyEmail({
    required String token,
  });

  /// Resend email verification
  Future<Either<Failure, bool>> resendEmailVerification();

  /// Link social account
  Future<Either<Failure, bool>> linkSocialAccount({
    required String provider,
    required String token,
  });

  /// Unlink social account
  Future<Either<Failure, bool>> unlinkSocialAccount({
    required String provider,
  });

  /// Get linked social accounts
  Future<Either<Failure, List<SocialAccount>>> getLinkedAccounts();

  /// Register new user
  Future<Either<Failure, AuthSessionEntity>> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    String? clubId,
  });

  /// Check if email is available
  Future<Either<Failure, bool>> checkEmailAvailability({
    required String email,
  });

  /// Get session history
  Future<Either<Failure, List<AuthSession>>> getSessionHistory();

  /// Revoke session
  Future<Either<Failure, bool>> revokeSession({
    required String sessionId,
  });

  /// Get active sessions
  Future<Either<Failure, List<AuthSession>>> getActiveSessions();

  /// Subscribe to auth state changes
  Stream<AuthSessionEntity?> get authStateChanges;
}

/// Social account entity
class SocialAccount {
  final String id;
  final String provider;
  final String providerUserId;
  final String? email;
  final String? displayName;
  final String? avatar;
  final DateTime linkedAt;

  const SocialAccount({
    required this.id,
    required this.provider,
    required this.providerUserId,
    this.email,
    this.displayName,
    this.avatar,
    required this.linkedAt,
  });
}

/// Auth session entity
class AuthSession {
  final String id;
  final String deviceId;
  final String deviceName;
  final String platform;
  final String ipAddress;
  final String? userAgent;
  final DateTime createdAt;
  final DateTime lastActiveAt;
  final bool isCurrentSession;

  const AuthSession({
    required this.id,
    required this.deviceId,
    required this.deviceName,
    required this.platform,
    required this.ipAddress,
    this.userAgent,
    required this.createdAt,
    required this.lastActiveAt,
    required this.isCurrentSession,
  });
}
