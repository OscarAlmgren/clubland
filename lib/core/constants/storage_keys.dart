class StorageKeys {
  // Secure storage keys
  static const String accessToken = 'access_token';
  static const String refreshToken = 'refresh_token';
  static const String hankoSessionId = 'hanko_session_id';
  static const String userCredentials = 'user_credentials';
  static const String encryptionKey = 'encryption_key';
  static const String biometricEnabled = 'biometric_enabled';

  // User preferences
  static const String userId = 'user_id';
  static const String userEmail = 'user_email';
  static const String userName = 'user_name';
  static const String userAvatar = 'user_avatar';
  static const String homeClubId = 'home_club_id';

  // App settings
  static const String selectedLanguage = 'selected_language';
  static const String selectedTheme = 'selected_theme';
  static const String isFirstLaunch = 'is_first_launch';
  static const String lastSyncTime = 'last_sync_time';
  static const String appVersion = 'app_version';

  // Notification settings
  static const String pushNotificationsEnabled = 'push_notifications_enabled';
  static const String emailNotificationsEnabled = 'email_notifications_enabled';
  static const String smsNotificationsEnabled = 'sms_notifications_enabled';
  static const String notificationSound = 'notification_sound';
  static const String notificationVibration = 'notification_vibration';
  static const String quietHoursEnabled = 'quiet_hours_enabled';
  static const String quietHoursStart = 'quiet_hours_start';
  static const String quietHoursEnd = 'quiet_hours_end';

  // Privacy settings
  static const String profileVisibility = 'profile_visibility';
  static const String activitySharing = 'activity_sharing';
  static const String locationSharing = 'location_sharing';
  static const String analyticsEnabled = 'analytics_enabled';
  static const String crashReportingEnabled = 'crash_reporting_enabled';

  // Location settings
  static const String lastKnownLatitude = 'last_known_latitude';
  static const String lastKnownLongitude = 'last_known_longitude';
  static const String defaultSearchRadius = 'default_search_radius';
  static const String locationPermissionAsked = 'location_permission_asked';

  // Search & filters
  static const String searchHistory = 'search_history';
  static const String recentSearches = 'recent_searches';
  static const String savedFilters = 'saved_filters';
  static const String favoriteClubs = 'favorite_clubs';

  // Booking preferences
  static const String defaultPartySize = 'default_party_size';
  static const String preferredDiningTime = 'preferred_dining_time';
  static const String dietaryRestrictions = 'dietary_restrictions';
  static const String accessibilityNeeds = 'accessibility_needs';

  // Cache settings
  static const String cacheSize = 'cache_size';
  static const String autoSyncEnabled = 'auto_sync_enabled';
  static const String wifiOnlySync = 'wifi_only_sync';
  static const String backgroundSyncEnabled = 'background_sync_enabled';

  // Performance settings
  static const String imageQuality = 'image_quality';
  static const String videoAutoplay = 'video_autoplay';
  static const String reducedMotion = 'reduced_motion';
  static const String dataUsageMode = 'data_usage_mode';

  // Debug settings
  static const String debugMode = 'debug_mode';
  static const String showPerformanceOverlay = 'show_performance_overlay';
  static const String logLevel = 'log_level';

  // Onboarding
  static const String onboardingCompleted = 'onboarding_completed';
  static const String profileSetupCompleted = 'profile_setup_completed';
  static const String permissionsRequested = 'permissions_requested';
  static const String tourCompleted = 'tour_completed';

  // Feature flags (local overrides)
  static const String localFeatureFlags = 'local_feature_flags';
  static const String betaFeaturesEnabled = 'beta_features_enabled';

  // Hive box names
  static const String userBox = 'user_box';
  static const String clubsBox = 'clubs_box';
  static const String bookingsBox = 'bookings_box';
  static const String visitsBox = 'visits_box';
  static const String socialBox = 'social_box';
  static const String cacheBox = 'cache_box';
  static const String settingsBox = 'settings_box';
  static const String offlineBox = 'offline_box';
}