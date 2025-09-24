import 'package:equatable/equatable.dart';

/// User entity representing authenticated user
class UserEntity extends Equatable {
  final String id;
  final String email;
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? clubId;
  final UserStatus status;
  final List<String> roles;
  final List<String> permissions;
  final UserProfile? profile;
  final DateTime createdAt;
  final DateTime? updatedAt;

  const UserEntity({
    required this.id,
    required this.email,
    this.username,
    this.firstName,
    this.lastName,
    this.clubId,
    this.status = UserStatus.active,
    this.roles = const [],
    this.permissions = const [],
    this.profile,
    required this.createdAt,
    this.updatedAt,
  });

  /// Get full name
  String get fullName {
    if (firstName != null && lastName != null) {
      return '$firstName $lastName';
    }
    return firstName ?? lastName ?? username ?? email;
  }

  /// Get display name
  String get displayName => username ?? fullName;

  /// Check if user has a specific role
  bool hasRole(String role) => roles.contains(role);

  /// Check if user has a specific permission
  bool hasPermission(String permission) => permissions.contains(permission);

  /// Check if user is active
  bool get isActive => status == UserStatus.active;

  /// Check if user has club membership
  bool get hasClubMembership => clubId != null && clubId!.isNotEmpty;

  @override
  List<Object?> get props => [
        id,
        email,
        username,
        firstName,
        lastName,
        clubId,
        status,
        roles,
        permissions,
        profile,
        createdAt,
        updatedAt,
      ];

  UserEntity copyWith({
    String? id,
    String? email,
    String? username,
    String? firstName,
    String? lastName,
    String? clubId,
    UserStatus? status,
    List<String>? roles,
    List<String>? permissions,
    UserProfile? profile,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserEntity(
      id: id ?? this.id,
      email: email ?? this.email,
      username: username ?? this.username,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      clubId: clubId ?? this.clubId,
      status: status ?? this.status,
      roles: roles ?? this.roles,
      permissions: permissions ?? this.permissions,
      profile: profile ?? this.profile,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

/// User status enumeration
enum UserStatus {
  active,
  inactive,
  suspended,
  pending,
  verified,
}

/// User profile information
class UserProfile extends Equatable {
  final String? avatar;
  final String? phoneNumber;
  final String fullName;
  final DateTime? dateOfBirth;
  final UserAddress? address;
  final UserPreferences preferences;
  final List<String> interests;
  final List<String> dietaryRestrictions;
  final List<String> accessibilityNeeds;

  const UserProfile({
    this.avatar,
    this.phoneNumber,
    required this.fullName,
    this.dateOfBirth,
    this.address,
    this.preferences = const UserPreferences(),
    this.interests = const [],
    this.dietaryRestrictions = const [],
    this.accessibilityNeeds = const [],
  });

  @override
  List<Object?> get props => [
        avatar,
        phoneNumber,
        fullName,
        dateOfBirth,
        address,
        preferences,
        interests,
        dietaryRestrictions,
        accessibilityNeeds,
      ];

  UserProfile copyWith({
    String? avatar,
    String? phoneNumber,
    String? fullName,
    DateTime? dateOfBirth,
    UserAddress? address,
    UserPreferences? preferences,
    List<String>? interests,
    List<String>? dietaryRestrictions,
    List<String>? accessibilityNeeds,
  }) {
    return UserProfile(
      avatar: avatar ?? this.avatar,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      fullName: fullName ?? this.fullName,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      address: address ?? this.address,
      preferences: preferences ?? this.preferences,
      interests: interests ?? this.interests,
      dietaryRestrictions: dietaryRestrictions ?? this.dietaryRestrictions,
      accessibilityNeeds: accessibilityNeeds ?? this.accessibilityNeeds,
    );
  }
}

/// User address information
class UserAddress extends Equatable {
  final String street;
  final String city;
  final String state;
  final String postalCode;
  final String country;

  const UserAddress({
    required this.street,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
  });

  /// Get formatted address
  String get formatted => '$street, $city, $state $postalCode, $country';

  @override
  List<Object> get props => [street, city, state, postalCode, country];

  UserAddress copyWith({
    String? street,
    String? city,
    String? state,
    String? postalCode,
    String? country,
  }) {
    return UserAddress(
      street: street ?? this.street,
      city: city ?? this.city,
      state: state ?? this.state,
      postalCode: postalCode ?? this.postalCode,
      country: country ?? this.country,
    );
  }
}

/// User preferences
class UserPreferences extends Equatable {
  final String language;
  final String currency;
  final String distanceUnit;
  final NotificationPreferences notifications;
  final PrivacyPreferences privacy;

  const UserPreferences({
    this.language = 'en',
    this.currency = 'USD',
    this.distanceUnit = 'miles',
    this.notifications = const NotificationPreferences(),
    this.privacy = const PrivacyPreferences(),
  });

  @override
  List<Object> get props => [
        language,
        currency,
        distanceUnit,
        notifications,
        privacy,
      ];

  UserPreferences copyWith({
    String? language,
    String? currency,
    String? distanceUnit,
    NotificationPreferences? notifications,
    PrivacyPreferences? privacy,
  }) {
    return UserPreferences(
      language: language ?? this.language,
      currency: currency ?? this.currency,
      distanceUnit: distanceUnit ?? this.distanceUnit,
      notifications: notifications ?? this.notifications,
      privacy: privacy ?? this.privacy,
    );
  }
}

/// Notification preferences
class NotificationPreferences extends Equatable {
  final bool push;
  final bool email;
  final bool sms;
  final QuietHours? quietHours;

  const NotificationPreferences({
    this.push = true,
    this.email = true,
    this.sms = false,
    this.quietHours,
  });

  @override
  List<Object?> get props => [push, email, sms, quietHours];

  NotificationPreferences copyWith({
    bool? push,
    bool? email,
    bool? sms,
    QuietHours? quietHours,
  }) {
    return NotificationPreferences(
      push: push ?? this.push,
      email: email ?? this.email,
      sms: sms ?? this.sms,
      quietHours: quietHours ?? this.quietHours,
    );
  }
}

/// Quiet hours for notifications
class QuietHours extends Equatable {
  final String start; // HH:mm format
  final String end; // HH:mm format
  final String timezone;

  const QuietHours({
    required this.start,
    required this.end,
    required this.timezone,
  });

  @override
  List<Object> get props => [start, end, timezone];
}

/// Privacy preferences
class PrivacyPreferences extends Equatable {
  final ProfileVisibility profileVisibility;
  final ActivitySharing activitySharing;
  final LocationSharing locationSharing;

  const PrivacyPreferences({
    this.profileVisibility = ProfileVisibility.membersOnly,
    this.activitySharing = ActivitySharing.friendsOnly,
    this.locationSharing = LocationSharing.whileUsingApp,
  });

  @override
  List<Object> get props => [profileVisibility, activitySharing, locationSharing];

  PrivacyPreferences copyWith({
    ProfileVisibility? profileVisibility,
    ActivitySharing? activitySharing,
    LocationSharing? locationSharing,
  }) {
    return PrivacyPreferences(
      profileVisibility: profileVisibility ?? this.profileVisibility,
      activitySharing: activitySharing ?? this.activitySharing,
      locationSharing: locationSharing ?? this.locationSharing,
    );
  }
}

/// Profile visibility options
enum ProfileVisibility {
  public,
  membersOnly,
  friendsOnly,
  private,
}

/// Activity sharing options
enum ActivitySharing {
  public,
  friendsOnly,
  private,
}

/// Location sharing options
enum LocationSharing {
  always,
  whileUsingApp,
  never,
}

/// Authentication session entity
class AuthSessionEntity extends Equatable {
  final String accessToken;
  final String refreshToken;
  final DateTime expiresAt;
  final UserEntity user;
  final String? hankoSessionId;

  const AuthSessionEntity({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresAt,
    required this.user,
    this.hankoSessionId,
  });

  /// Check if session is expired
  bool get isExpired => DateTime.now().isAfter(expiresAt);

  /// Check if session is valid
  bool get isValid => !isExpired && accessToken.isNotEmpty;

  /// Time until expiration
  Duration get timeUntilExpiration => expiresAt.difference(DateTime.now());

  /// Check if session needs refresh (expires in less than 5 minutes)
  bool get needsRefresh => timeUntilExpiration.inMinutes < 5;

  @override
  List<Object?> get props => [
        accessToken,
        refreshToken,
        expiresAt,
        user,
        hankoSessionId,
      ];

  AuthSessionEntity copyWith({
    String? accessToken,
    String? refreshToken,
    DateTime? expiresAt,
    UserEntity? user,
    String? hankoSessionId,
  }) {
    return AuthSessionEntity(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      expiresAt: expiresAt ?? this.expiresAt,
      user: user ?? this.user,
      hankoSessionId: hankoSessionId ?? this.hankoSessionId,
    );
  }
}

/// Social account entity for linked accounts
class SocialAccount extends Equatable {
  final String id;
  final String provider; // 'google', 'apple', 'facebook', etc.
  final String providerUserId;
  final String email;
  final DateTime linkedAt;
  final bool isVerified;

  const SocialAccount({
    required this.id,
    required this.provider,
    required this.providerUserId,
    required this.email,
    required this.linkedAt,
    this.isVerified = true,
  });

  @override
  List<Object> get props => [
        id,
        provider,
        providerUserId,
        email,
        linkedAt,
        isVerified,
      ];

  SocialAccount copyWith({
    String? id,
    String? provider,
    String? providerUserId,
    String? email,
    DateTime? linkedAt,
    bool? isVerified,
  }) {
    return SocialAccount(
      id: id ?? this.id,
      provider: provider ?? this.provider,
      providerUserId: providerUserId ?? this.providerUserId,
      email: email ?? this.email,
      linkedAt: linkedAt ?? this.linkedAt,
      isVerified: isVerified ?? this.isVerified,
    );
  }
}

/// Authentication session for session management
class AuthSession extends Equatable {
  final String id;
  final String deviceName;
  final String location;
  final String ipAddress;
  final DateTime createdAt;
  final DateTime lastActiveAt;
  final bool isActive;
  final String? userAgent;

  const AuthSession({
    required this.id,
    required this.deviceName,
    required this.location,
    required this.ipAddress,
    required this.createdAt,
    required this.lastActiveAt,
    required this.isActive,
    this.userAgent,
  });

  /// Check if session is current session (active within 5 minutes)
  bool get isCurrent => isActive &&
      DateTime.now().difference(lastActiveAt).inMinutes <= 5;

  /// Get time since last activity
  Duration get timeSinceLastActive => DateTime.now().difference(lastActiveAt);

  /// Get session duration
  Duration get sessionDuration => lastActiveAt.difference(createdAt);

  @override
  List<Object?> get props => [
        id,
        deviceName,
        location,
        ipAddress,
        createdAt,
        lastActiveAt,
        isActive,
        userAgent,
      ];

  AuthSession copyWith({
    String? id,
    String? deviceName,
    String? location,
    String? ipAddress,
    DateTime? createdAt,
    DateTime? lastActiveAt,
    bool? isActive,
    String? userAgent,
  }) {
    return AuthSession(
      id: id ?? this.id,
      deviceName: deviceName ?? this.deviceName,
      location: location ?? this.location,
      ipAddress: ipAddress ?? this.ipAddress,
      createdAt: createdAt ?? this.createdAt,
      lastActiveAt: lastActiveAt ?? this.lastActiveAt,
      isActive: isActive ?? this.isActive,
      userAgent: userAgent ?? this.userAgent,
    );
  }
}
