import 'package:equatable/equatable.dart';

/// User entity representing authenticated user
class UserEntity extends Equatable {
  /// Constructs a [UserEntity]
  const UserEntity({
    required this.id,
    required this.email,
    required this.createdAt,
    this.username,
    this.firstName,
    this.lastName,
    this.clubId,
    this.status = UserStatus.active,
    this.roles = const [],
    this.permissions = const [],
    this.profile,
    this.updatedAt,
  });

  /// The unique identifier for the user.
  final String id;

  /// The user's primary email address.
  final String email;

  /// An optional display name chosen by the user.
  final String? username;

  /// The user's given first name.
  final String? firstName;

  /// The user's given last name.
  final String? lastName;

  /// The ID of the user's primary associated club, if any.
  final String? clubId;

  /// The current verification status of the user account.
  final UserStatus status;

  /// A list of roles assigned to the user (e.g., 'admin', 'member').
  final List<String> roles;

  /// A list of specific permissions granted to the user.
  final List<String> permissions;

  /// Optional detailed profile information for the user.
  final UserProfile? profile;

  /// The timestamp indicating when the user account was created.
  final DateTime createdAt;

  /// The timestamp of the last time the user's data was updated.
  final DateTime? updatedAt;

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

  /// Creates a copy of this [UserEntity] but with the given fields replaced with the new values.
  UserEntity copyWith({
    /// The unique identifier for the user.
    String? id,

    /// The user's primary email address.
    String? email,

    /// An optional display name chosen by the user.
    String? username,

    /// The user's given first name.
    String? firstName,

    /// The user's given last name.
    String? lastName,

    /// The ID of the user's primary associated club, if any.
    String? clubId,

    /// The current verification status of the user account.
    UserStatus? status,

    /// A list of roles assigned to the user.
    List<String>? roles,

    /// A list of specific permissions granted to the user.
    List<String>? permissions,

    /// Optional detailed profile information for the user.
    UserProfile? profile,

    /// The timestamp indicating when the user account was created.
    DateTime? createdAt,

    /// The timestamp of the last time the user's data was updated.
    DateTime? updatedAt,
  }) => UserEntity(
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

/// User status enumeration
enum UserStatus {
  /// The user account is fully active and operational.
  active,

  /// The user account is temporarily disabled or not currently in use.
  inactive,

  /// The user account has been blocked due to policy violations.
  suspended,

  /// The user account is created but requires further action (e.g., email verification).
  pending,

  /// The user account's primary details (e.g., email) have been verified.
  verified,
}

/// User profile information
class UserProfile extends Equatable {
  /// Creates a new user profile instance.
  const UserProfile({
    required this.fullName,
    this.avatar,
    this.phoneNumber,
    this.dateOfBirth,
    this.address,
    this.preferences = const UserPreferences(),
    this.interests = const [],
    this.dietaryRestrictions = const [],
    this.accessibilityNeeds = const [],
  });

  /// The URL or path to the user's profile picture or avatar.
  final String? avatar;

  /// The user's primary contact phone number.
  final String? phoneNumber;

  /// The user's full name as displayed publicly.
  final String fullName;

  /// The user's date of birth.
  final DateTime? dateOfBirth;

  /// The user's primary home address.
  final UserAddress? address;

  /// The user's application-wide preference settings.
  final UserPreferences preferences;

  /// A list of topics or activities the user is interested in.
  final List<String> interests;

  /// A list of the user's dietary limitations or requirements.
  final List<String> dietaryRestrictions;

  /// A list of physical or cognitive accessibility requirements.
  final List<String> accessibilityNeeds;

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

  /// Creates a copy of this [UserProfile] but with the given fields
  /// replaced with the new values.
  UserProfile copyWith({
    /// The URL or path to the user's profile picture or avatar.
    String? avatar,

    /// The user's primary contact phone number.
    String? phoneNumber,

    /// The user's full name as displayed publicly.
    String? fullName,

    /// The user's date of birth.
    DateTime? dateOfBirth,

    /// The user's primary home address.
    UserAddress? address,

    /// The user's application-wide preference settings.
    UserPreferences? preferences,

    /// A list of topics or activities the user is interested in.
    List<String>? interests,

    /// A list of the user's dietary limitations or requirements.
    List<String>? dietaryRestrictions,

    /// A list of physical or cognitive accessibility requirements.
    List<String>? accessibilityNeeds,
  }) => UserProfile(
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

/// User address information
class UserAddress extends Equatable {
  /// Creates a new user address instance.
  const UserAddress({
    required this.street,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
  });

  /// The street name and house/apartment number.
  final String street;

  /// The city or locality name.
  final String city;

  /// The state, province, or region.
  final String state;

  /// The postal or zip code.
  final String postalCode;

  /// The country name.
  final String country;

  /// Get formatted address as a single string (e.g., "123 Main St, Anytown, CA 90210, USA").
  String get formatted => '$street, $city, $state $postalCode, $country';

  @override
  List<Object> get props => [street, city, state, postalCode, country];

  /// Creates a copy of this [UserAddress] but with the given fields
  /// replaced with the new values.
  UserAddress copyWith({
    /// The street name and house/apartment number.
    String? street,

    /// The city or locality name.
    String? city,

    /// The state, province, or region.
    String? state,

    /// The postal or zip code.
    String? postalCode,

    /// The country name.
    String? country,
  }) => UserAddress(
    street: street ?? this.street,
    city: city ?? this.city,
    state: state ?? this.state,
    postalCode: postalCode ?? this.postalCode,
    country: country ?? this.country,
  );
}

/// User preferences
class UserPreferences extends Equatable {
  /// Creates a new set of user preferences with default values.
  const UserPreferences({
    this.language = 'en',
    this.currency = 'USD',
    this.distanceUnit = 'miles',
    this.notifications = const NotificationPreferences(),
    this.privacy = const PrivacyPreferences(),
  });

  /// The user's preferred language code (e.g., 'en', 'es').
  final String language;

  /// The user's preferred currency code (e.g., 'USD', 'EUR').
  final String currency;

  /// The user's preferred unit of distance ('miles' or 'km').
  final String distanceUnit;

  /// The user's notification settings.
  final NotificationPreferences notifications;

  /// The user's privacy settings.
  final PrivacyPreferences privacy;

  @override
  List<Object> get props => [
    language,
    currency,
    distanceUnit,
    notifications,
    privacy,
  ];

  /// Creates a copy of this [UserPreferences] but with the given fields
  /// replaced with the new values.
  UserPreferences copyWith({
    /// The user's preferred language code.
    String? language,

    /// The user's preferred currency code.
    String? currency,

    /// The user's preferred unit of distance.
    String? distanceUnit,

    /// The user's notification settings.
    NotificationPreferences? notifications,

    /// The user's privacy settings.
    PrivacyPreferences? privacy,
  }) => UserPreferences(
    language: language ?? this.language,
    currency: currency ?? this.currency,
    distanceUnit: distanceUnit ?? this.distanceUnit,
    notifications: notifications ?? this.notifications,
    privacy: privacy ?? this.privacy,
  );
}

/// Notification preferences
class NotificationPreferences extends Equatable {
  /// Creates a new set of notification preferences.
  const NotificationPreferences({
    this.push = true,
    this.email = true,
    this.sms = false,
    this.quietHours,
  });

  /// Flag to enable/disable push notifications.
  final bool push;

  /// Flag to enable/disable email notifications.
  final bool email;

  /// Flag to enable/disable SMS notifications.
  final bool sms;

  /// Optional time frame when notifications should be silenced.
  final QuietHours? quietHours;

  @override
  List<Object?> get props => [push, email, sms, quietHours];

  /// Creates a copy of this [NotificationPreferences] but with the given fields
  /// replaced with the new values.
  NotificationPreferences copyWith({
    /// Flag to enable/disable push notifications.
    bool? push,

    /// Flag to enable/disable email notifications.
    bool? email,

    /// Flag to enable/disable SMS notifications.
    bool? sms,

    /// Optional time frame when notifications should be silenced.
    QuietHours? quietHours,
  }) => NotificationPreferences(
    push: push ?? this.push,
    email: email ?? this.email,
    sms: sms ?? this.sms,
    quietHours: quietHours ?? this.quietHours,
  );
}

/// Quiet hours for notifications
class QuietHours extends Equatable {
  /// Creates a quiet hours range.
  const QuietHours({
    required this.start,
    required this.end,
    required this.timezone,
  });

  /// The start time of the quiet hours in HH:mm format.
  final String start; // HH:mm format

  /// The end time of the quiet hours in HH:mm format.
  final String end; // HH:mm format

  /// The IANA timezone identifier for the quiet hours (e.g., 'America/New_York').
  final String timezone;

  @override
  List<Object> get props => [start, end, timezone];
}

/// Privacy preferences
class PrivacyPreferences extends Equatable {
  /// Creates a new set of user privacy preferences with optional defaults.
  const PrivacyPreferences({
    this.profileVisibility = ProfileVisibility.membersOnly,
    this.activitySharing = ActivitySharing.friendsOnly,
    this.locationSharing = LocationSharing.whileUsingApp,
  });

  /// The user's setting for who can view their profile.
  final ProfileVisibility profileVisibility;

  /// The user's setting for who can view their in-app activity.
  final ActivitySharing activitySharing;

  /// The user's setting for when their location data is shared.
  final LocationSharing locationSharing;

  @override
  List<Object> get props => [
    profileVisibility,
    activitySharing,
    locationSharing,
  ];

  /// Creates a copy of this [PrivacyPreferences] but with the given fields
  /// replaced with the new values.
  PrivacyPreferences copyWith({
    /// The user's setting for who can view their profile.
    ProfileVisibility? profileVisibility,

    /// The user's setting for who can view their in-app activity.
    ActivitySharing? activitySharing,

    /// The user's setting for when their location data is shared.
    LocationSharing? locationSharing,
  }) => PrivacyPreferences(
    profileVisibility: profileVisibility ?? this.profileVisibility,
    activitySharing: activitySharing ?? this.activitySharing,
    locationSharing: locationSharing ?? this.locationSharing,
  );
}

/// Profile visibility options
enum ProfileVisibility {
  /// The profile is visible to all users, including non-members.
  public,

  /// The profile is visible only to authenticated members of the platform.
  membersOnly,

  /// The profile is visible only to users who have been explicitly added as friends.
  friendsOnly,

  /// The profile is completely hidden from all other users.
  private,
}

/// Activity sharing options
enum ActivitySharing {
  /// Activity is visible to all users.
  public,

  /// Activity is visible only to users who have been explicitly added as friends.
  friendsOnly,

  /// Activity is hidden from all other users.
  private,
}

/// Location sharing options
enum LocationSharing {
  /// Location is shared continuously, even when the app is in the background.
  always,

  /// Location is shared only while the user is actively using the application.
  whileUsingApp,

  /// Location is never shared with the application or other users.
  never,
}

/// Social account entity for linked accounts
class SocialAccount extends Equatable {
  /// Creates a new social account record.
  const SocialAccount({
    required this.id,
    required this.provider,
    required this.providerUserId,
    required this.email,
    required this.linkedAt,
    this.isVerified = true,
  });

  /// The unique identifier for the social account record.
  final String id;

  /// The name of the third-party provider (e.g., 'google', 'apple').
  final String provider; // 'google', 'apple', 'facebook', etc.

  /// The unique ID assigned to the user by the external provider.
  final String providerUserId;

  /// The email address associated with the social account.
  final String email;

  /// The timestamp indicating when the account was linked.
  final DateTime linkedAt;

  /// Flag indicating if the email associated with the social account has been verified.
  final bool isVerified;

  @override
  List<Object> get props => [
    id,
    provider,
    providerUserId,
    email,
    linkedAt,
    isVerified,
  ];

  /// Creates a copy of this [SocialAccount] but with the given fields
  /// replaced with the new values.
  SocialAccount copyWith({
    /// The unique identifier for the social account record.
    String? id,

    /// The name of the third-party provider.
    String? provider,

    /// The unique ID assigned to the user by the external provider.
    String? providerUserId,

    /// The email address associated with the social account.
    String? email,

    /// The timestamp indicating when the account was linked.
    DateTime? linkedAt,

    /// Flag indicating if the social account is verified.
    bool? isVerified,
  }) => SocialAccount(
    id: id ?? this.id,
    provider: provider ?? this.provider,
    providerUserId: providerUserId ?? this.providerUserId,
    email: email ?? this.email,
    linkedAt: linkedAt ?? this.linkedAt,
    isVerified: isVerified ?? this.isVerified,
  );
}

/// Authentication session for session management
class AuthSession extends Equatable {
  /// Creates a new authentication session record.
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

  /// The unique identifier for the session.
  final String id;

  /// The name or type of device used for the session.
  final String deviceName;

  /// The approximate geographical location of the session.
  final String location;

  /// The IP address associated with the session.
  final String ipAddress;

  /// The timestamp when the session was created.
  final DateTime createdAt;

  /// The timestamp of the last recorded activity for the session.
  final DateTime lastActiveAt;

  /// A flag indicating if the session is currently active.
  final bool isActive;

  /// The optional User-Agent string from the device.
  final String? userAgent;

  /// Check if session is current session (active within 5 minutes)
  bool get isCurrent =>
      isActive && DateTime.now().difference(lastActiveAt).inMinutes <= 5;

  /// Get time since last activity.
  Duration get timeSinceLastActive => DateTime.now().difference(lastActiveAt);

  /// Get session duration from creation to last activity.
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

  /// Creates a copy of this [AuthSession] but with the given fields
  /// replaced with the new values.
  AuthSession copyWith({
    /// The unique identifier for the session.
    String? id,

    /// The name or type of device used for the session.
    String? deviceName,

    /// The approximate geographical location of the session.
    String? location,

    /// The IP address associated with the session.
    String? ipAddress,

    /// The timestamp when the session was created.
    DateTime? createdAt,

    /// The timestamp of the last recorded activity for the session.
    DateTime? lastActiveAt,

    /// A flag indicating if the session is currently active.
    bool? isActive,

    /// The optional User-Agent string from the device.
    String? userAgent,
  }) => AuthSession(
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

/// Two-factor authentication setup response
class TwoFactorSetupResponse extends Equatable {
  /// Creates a new TwoFactorSetupResponse.
  const TwoFactorSetupResponse({
    required this.qrCode,
    required this.backupCodes,
    required this.secret,
  });

  /// The QR code image data (often a base64 string) for the authenticator app.
  final String qrCode;

  /// A list of one-time recovery codes to be used if the authenticator app is lost.
  final List<String> backupCodes;

  /// The raw secret key used to generate the TOTP (Time-based One-Time Password).
  final String secret;

  @override
  List<Object> get props => [qrCode, backupCodes, secret];

  /// Creates a copy of this [TwoFactorSetupResponse] but with the given fields
  /// replaced with the new values.
  TwoFactorSetupResponse copyWith({
    /// The QR code image data.
    String? qrCode,

    /// A list of one-time recovery codes.
    List<String>? backupCodes,

    /// The raw secret key.
    String? secret,
  }) => TwoFactorSetupResponse(
    qrCode: qrCode ?? this.qrCode,
    backupCodes: backupCodes ?? this.backupCodes,
    secret: secret ?? this.secret,
  );
}
