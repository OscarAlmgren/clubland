class AppConstants {
  // App information
  static const String appName = 'Clubland';
  static const String appSlogan = 'Reciprocal Clubs of the World';
  static const String appVersion = '1.0.0';

  // Environment
  static const String environment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: 'development',
  );

  // Animation durations
  static const Duration shortAnimationDuration = Duration(milliseconds: 200);
  static const Duration mediumAnimationDuration = Duration(milliseconds: 400);
  static const Duration longAnimationDuration = Duration(milliseconds: 600);

  // UI constants
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;
  static const double defaultBorderRadius = 12.0;
  static const double smallBorderRadius = 8.0;
  static const double largeBorderRadius = 16.0;

  // Screen breakpoints
  static const double mobileBreakpoint = 768;
  static const double tabletBreakpoint = 1024;
  static const double desktopBreakpoint = 1280;

  // Map constants
  static const double defaultMapZoom = 15.0;
  static const double clusterMapZoom = 10.0;
  static const double searchRadius = 50.0; // kilometers

  // Location settings
  static const Duration locationTimeout = Duration(seconds: 30);
  static const double locationAccuracyThreshold = 100.0; // meters

  // Offline settings
  static const int maxOfflineItems = 1000;
  static const Duration offlineSyncInterval = Duration(minutes: 5);
  static const Duration offlineDataRetention = Duration(days: 7);

  // Performance settings
  static const int imageMemoryCacheSize = 100 * 1024 * 1024; // 100MB
  static const int imageDiskCacheSize = 500 * 1024 * 1024; // 500MB
  static const Duration imagesCacheMaxAge = Duration(days: 7);

  // Social features
  static const int maxReviewLength = 500;
  static const int maxPhotosPerReview = 5;
  static const int feedPageSize = 10;

  // Booking settings
  static const Duration bookingReminderTime = Duration(hours: 2);
  static const Duration bookingCancellationTime = Duration(hours: 24);
  static const int maxGuestsPerBooking = 6;

  // Search settings
  static const Duration searchDebounceTime = Duration(milliseconds: 500);
  static const int maxSearchHistory = 10;
  static const int maxRecentSearches = 5;

  // Security settings
  static const Duration biometricAuthTimeout = Duration(seconds: 30);
  static const int maxFailedAuthAttempts = 3;
  static const Duration authLockoutDuration = Duration(minutes: 15);

  // Notification settings
  static const String fcmVapidKey = String.fromEnvironment(
    'FCM_VAPID_KEY',
    defaultValue: '',
  );

  // Feature flags
  static const bool enableSocialFeatures = bool.fromEnvironment(
    'ENABLE_SOCIAL_FEATURES',
    defaultValue: true,
  );

  static const bool enableLocationFeatures = bool.fromEnvironment(
    'ENABLE_LOCATION_FEATURES',
    defaultValue: true,
  );

  static const bool enablePushNotifications = bool.fromEnvironment(
    'ENABLE_PUSH_NOTIFICATIONS',
    defaultValue: true,
  );

  static const bool enableAnalytics = bool.fromEnvironment(
    'ENABLE_ANALYTICS',
    defaultValue: true,
  );

  static const bool enableCrashReporting = bool.fromEnvironment(
    'ENABLE_CRASH_REPORTING',
    defaultValue: true,
  );

  // Debug settings
  static const bool isDebugMode = bool.fromEnvironment(
    'DEBUG_MODE',
    defaultValue: false,
  );

  static const bool enableNetworkLogging = bool.fromEnvironment(
    'ENABLE_NETWORK_LOGGING',
    defaultValue: false,
  );

  static const bool enablePerformanceLogging = bool.fromEnvironment(
    'ENABLE_PERFORMANCE_LOGGING',
    defaultValue: false,
  );
}
