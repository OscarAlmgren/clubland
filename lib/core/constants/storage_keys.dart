/// Secure storage keys class
class StorageKeys {
  // Secure storage keys
  /// The key for the user's JWT access token.
  static const String accessToken = 'access_token';

  /// The key for the user's JWT refresh token.
  static const String refreshToken = 'refresh_token';

  /// The key for the active Hanko authentication session ID.
  static const String hankoSessionId = 'hanko_session_id';

  /// The key for securely storing user login credentials.
  static const String userCredentials = 'user_credentials';

  /// The key for application-wide data encryption.
  static const String encryptionKey = 'encryption_key';

  /// Flag indicating if biometric authentication is enabled.
  static const String biometricEnabled = 'biometric_enabled';

  // User preferences
  /// The key for the currently logged-in user's ID.
  static const String userId = 'user_id';

  /// The key for the user's email address.
  static const String userEmail = 'user_email';

  /// The key for the user's display name.
  static const String userName = 'user_name';

  /// The key for the URL of the user's avatar image.
  static const String userAvatar = 'user_avatar';

  /// The key for the ID of the user's designated home club.
  static const String homeClubId = 'home_club_id';

  // App settings
  /// The key for the user's currently selected language.
  static const String selectedLanguage = 'selected_language';

  /// The key for the user's selected app theme (e.g., 'light', 'dark').
  static const String selectedTheme = 'selected_theme';

  /// Flag indicating if the app is being launched for the very first time.
  static const String isFirstLaunch = 'is_first_launch';

  /// The key for the timestamp of the last successful data synchronization.
  static const String lastSyncTime = 'last_sync_time';

  /// The key for the application's currently running version string.
  static const String appVersion = 'app_version';

  // Notification settings
  /// Flag for enabling/disabling all push notifications.
  static const String pushNotificationsEnabled = 'push_notifications_enabled';

  /// Flag for enabling/disabling email notifications.
  static const String emailNotificationsEnabled = 'email_notifications_enabled';

  /// Flag for enabling/disabling SMS text notifications.
  static const String smsNotificationsEnabled = 'sms_notifications_enabled';

  /// The key for the selected notification alert sound.
  static const String notificationSound = 'notification_sound';

  /// Flag for enabling/disabling notification vibration.
  static const String notificationVibration = 'notification_vibration';

  /// Flag indicating if quiet hours are enabled.
  static const String quietHoursEnabled = 'quiet_hours_enabled';

  /// The key for the start time of the quiet hours period.
  static const String quietHoursStart = 'quiet_hours_start';

  /// The key for the end time of the quiet hours period.
  static const String quietHoursEnd = 'quiet_hours_end';

  // Privacy settings
  /// The key for the user's public profile visibility status.
  static const String profileVisibility = 'profile_visibility';

  /// Flag for enabling/disabling sharing of user activity data.
  static const String activitySharing = 'activity_sharing';

  /// Flag for enabling/disabling real-time location sharing.
  static const String locationSharing = 'location_sharing';

  /// Flag for enabling/disabling analytics tracking.
  static const String analyticsEnabled = 'analytics_enabled';

  /// Flag for enabling/disabling crash reporting submission.
  static const String crashReportingEnabled = 'crash_reporting_enabled';

  // Location settings
  /// The key for the last recorded geographical latitude.
  static const String lastKnownLatitude = 'last_known_latitude';

  /// The key for the last recorded geographical longitude.
  static const String lastKnownLongitude = 'last_known_longitude';

  /// The key for the user's preferred search radius for nearby clubs.
  static const String defaultSearchRadius = 'default_search_radius';

  /// Flag indicating if the system has asked for location permission.
  static const String locationPermissionAsked = 'location_permission_asked';

  // Search & filters
  /// The key for the list of recent search queries.
  static const String searchHistory = 'search_history';

  /// Alias for the search history key (list of recent searches).
  static const String recentSearches = 'recent_searches';

  /// The key for the user's saved filter presets.
  static const String savedFilters = 'saved_filters';

  /// The key for the list of clubs marked as favorites.
  static const String favoriteClubs = 'favorite_clubs';

  // Booking preferences
  /// The key for the user's default party size when making reservations.
  static const String defaultPartySize = 'default_party_size';

  /// The key for the user's preferred dining time.
  static const String preferredDiningTime = 'preferred_dining_time';

  /// The key for the user's list of dietary restrictions.
  static const String dietaryRestrictions = 'dietary_restrictions';

  /// The key for the user's required accessibility needs.
  static const String accessibilityNeeds = 'accessibility_needs';

  // Cache settings
  /// The key for the maximum allowed cache size (in bytes).
  static const String cacheSize = 'cache_size';

  /// Flag for enabling/disabling automatic data synchronization.
  static const String autoSyncEnabled = 'auto_sync_enabled';

  /// Flag to restrict synchronization to Wi-Fi only.
  static const String wifiOnlySync = 'wifi_only_sync';

  /// Flag for enabling/disabling background data synchronization.
  static const String backgroundSyncEnabled = 'background_sync_enabled';

  // Performance settings
  /// The key for the user's preferred image download quality setting.
  static const String imageQuality = 'image_quality';

  /// Flag for enabling/disabling automatic video playback.
  static const String videoAutoplay = 'video_autoplay';

  /// Flag for enabling/disabling reduced motion accessibility mode.
  static const String reducedMotion = 'reduced_motion';

  /// The key for the current data usage mode (e.g., 'low', 'high').
  static const String dataUsageMode = 'data_usage_mode';

  // Debug settings
  /// Flag for enabling/disabling the internal debug mode.
  static const String debugMode = 'debug_mode';

  /// Flag for showing the Flutter performance overlay.
  static const String showPerformanceOverlay = 'show_performance_overlay';

  /// The key for the application's logging verbosity level.
  static const String logLevel = 'log_level';

  // Onboarding
  /// Flag indicating if the entire onboarding process is finished.
  static const String onboardingCompleted = 'onboarding_completed';

  /// Flag indicating if the user's profile setup phase is complete.
  static const String profileSetupCompleted = 'profile_setup_completed';

  /// Flag indicating if all initial system permissions have been requested.
  static const String permissionsRequested = 'permissions_requested';

  /// Flag indicating if the introductory application tour is complete.
  static const String tourCompleted = 'tour_completed';

  // Feature flags (local overrides)
  /// The key for storing locally overridden feature flag settings.
  static const String localFeatureFlags = 'local_feature_flags';

  /// Flag for enabling beta features for the current user.
  static const String betaFeaturesEnabled = 'beta_features_enabled';

  // SharedPreferences storage prefixes
  /// The prefix for SharedPreferences keys dedicated to user data.
  static const String userDataPrefix = 'user_data';

  /// The prefix for SharedPreferences keys dedicated to club data.
  static const String clubsDataPrefix = 'clubs_data';

  /// The prefix for SharedPreferences keys dedicated to booking and reservation data.
  static const String bookingsDataPrefix = 'bookings_data';

  /// The prefix for SharedPreferences keys dedicated to visit history.
  static const String visitsDataPrefix = 'visits_data';

  /// The prefix for SharedPreferences keys dedicated to social features and contacts.
  static const String socialDataPrefix = 'social_data';

  /// The prefix for SharedPreferences keys dedicated to general application cache.
  static const String cacheDataPrefix = 'cache_data';

  /// The prefix for SharedPreferences keys dedicated to application settings.
  static const String settingsDataPrefix = 'settings_data';

  /// The prefix for SharedPreferences keys dedicated to offline data storage.
  static const String offlineDataPrefix = 'offline_data';
}
