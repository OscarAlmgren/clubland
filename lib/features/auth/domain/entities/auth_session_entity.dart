import 'package:equatable/equatable.dart';

import 'user_entity.dart';

/// Authentication session entity containing user and token information
class AuthSessionEntity extends Equatable {
  /// Constructs an [AuthSessionEntity]
  const AuthSessionEntity({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
    required this.expiresAt,
    this.id,
    this.hankoSessionId,
    this.createdAt,
  });

  /// Session ID
  final String? id;

  /// Authenticated user
  final UserEntity user;

  /// Access token for API requests
  final String accessToken;

  /// Refresh token for token renewal
  final String refreshToken;

  /// Token expiration timestamp
  final DateTime expiresAt;

  /// Hanko session ID (for passwordless auth)
  final String? hankoSessionId;

  /// Session creation timestamp
  final DateTime? createdAt;

  /// Check if the session is expired
  bool get isExpired => DateTime.now().isAfter(expiresAt);

  /// Check if the session will expire soon (within 5 minutes)
  bool get willExpireSoon =>
      DateTime.now().add(const Duration(minutes: 5)).isAfter(expiresAt);

  /// Check if the session is valid (not expired)
  bool get isValid => !isExpired;

  @override
  List<Object?> get props => [
    id,
    user,
    accessToken,
    refreshToken,
    expiresAt,
    hankoSessionId,
    createdAt,
  ];

  @override
  String toString() => 'AuthSessionEntity('
      'id: $id, '
      'user: ${user.email}, '
      'expiresAt: $expiresAt, '
      'hankoSessionId: $hankoSessionId, '
      'isExpired: $isExpired'
      ')';

  /// Create a copy of this session with updated values
  AuthSessionEntity copyWith({
    String? id,
    UserEntity? user,
    String? accessToken,
    String? refreshToken,
    DateTime? expiresAt,
    String? hankoSessionId,
    DateTime? createdAt,
  }) {
    return AuthSessionEntity(
      id: id ?? this.id,
      user: user ?? this.user,
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      expiresAt: expiresAt ?? this.expiresAt,
      hankoSessionId: hankoSessionId ?? this.hankoSessionId,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}