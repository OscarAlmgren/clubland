/// Application-wide constants and configuration values
class AppConstants {
  // App information
  /// Application name
  static const String appName = 'Clubland';
  /// Application slogan
  static const String appSlogan = 'Reciprocal Clubs of the World';
  /// Current application version
  static const String appVersion = '1.0.0';

  // Environment
  /// Current environment (development, staging, production)
  static const String environment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: 'development',
  );

  // Animation durations
  /// Short animation duration (200ms)
  static const Duration shortAnimationDuration = Duration(milliseconds: 200);
  /// Medium animation duration (400ms)
  static const Duration mediumAnimationDuration = Duration(milliseconds: 400);
  /// Long animation duration (600ms)
  static const Duration longAnimationDuration = Duration(milliseconds: 600);

  // UI constants
  /// Default padding value in logical pixels
  static const double defaultPadding = 16.0;
  /// Small padding value in logical pixels
  static const double smallPadding = 8.0;
  /// Large padding value in logical pixels
  static const double largePadding = 24.0;
  /// Default border radius in logical pixels
  static const double defaultBorderRadius = 12.0;
  /// Small border radius in logical pixels
  static const double smallBorderRadius = 8.0;
  /// Large border radius in logical pixels
  static const double largeBorderRadius = 16.0;

  // Screen breakpoints
  /// Mobile screen breakpoint in logical pixels
  static const double mobileBreakpoint = 768;
  /// Tablet screen breakpoint in logical pixels
  static const double tabletBreakpoint = 1024;
  /// Desktop screen breakpoint in logical pixels
  static const double desktopBreakpoint = 1280;

  // Map constants
  /// Default map zoom level
  static const double defaultMapZoom = 15.0;
  /// Map zoom level for cluster view
  static const double clusterMapZoom = 10.0;
  /// Search radius in kilometers
  static const double searchRadius = 50.0;

  // Location settings
  /// Timeout duration for location requests
  static const Duration locationTimeout = Duration(seconds: 30);
  /// Location accuracy threshold in meters
  static const double locationAccuracyThreshold = 100.0;

  // Offline settings
  /// Maximum number of items to store offline
  static const int maxOfflineItems = 1000;
  /// Interval between offline sync attempts
  static const Duration offlineSyncInterval = Duration(minutes: 5);
  /// How long to retain offline data
  static const Duration offlineDataRetention = Duration(days: 7);

  // Performance settings
  /// Image memory cache size in bytes (100MB)
  static const int imageMemoryCacheSize = 100 * 1024 * 1024;
  /// Image disk cache size in bytes (500MB)
  static const int imageDiskCacheSize = 500 * 1024 * 1024;
  /// Maximum age for cached images
  static const Duration imagesCacheMaxAge = Duration(days: 7);

  // Social features
  /// Maximum length for review text
  static const int maxReviewLength = 500;
  /// Maximum number of photos per review
  static const int maxPhotosPerReview = 5;
  /// Number of items per page in social feeds
  static const int feedPageSize = 10;

  // Booking settings
  /// How long before a booking to send reminder
  static const Duration bookingReminderTime = Duration(hours: 2);
  /// Minimum notice required for booking cancellation
  static const Duration bookingCancellationTime = Duration(hours: 24);
  /// Maximum number of guests allowed per booking
  static const int maxGuestsPerBooking = 6;

  // Search settings
  /// Debounce time for search input
  static const Duration searchDebounceTime = Duration(milliseconds: 500);
  /// Maximum number of search history items to store
  static const int maxSearchHistory = 10;
  /// Maximum number of recent searches to display
  static const int maxRecentSearches = 5;

  // Security settings
  /// Timeout for biometric authentication
  static const Duration biometricAuthTimeout = Duration(seconds: 30);
  /// Maximum failed authentication attempts before lockout
  static const int maxFailedAuthAttempts = 3;
  /// Duration of authentication lockout after max failed attempts
  static const Duration authLockoutDuration = Duration(minutes: 15);

  // Notification settings
  /// FCM VAPID key for push notifications
  static const String fcmVapidKey = String.fromEnvironment('FCM_VAPID_KEY');

  // Feature flags
  /// Whether social features are enabled
  static const bool enableSocialFeatures = bool.fromEnvironment(
    'ENABLE_SOCIAL_FEATURES',
    defaultValue: true,
  );

  /// Whether location-based features are enabled
  static const bool enableLocationFeatures = bool.fromEnvironment(
    'ENABLE_LOCATION_FEATURES',
    defaultValue: true,
  );

  /// Whether push notifications are enabled
  static const bool enablePushNotifications = bool.fromEnvironment(
    'ENABLE_PUSH_NOTIFICATIONS',
    defaultValue: true,
  );

  /// Whether analytics tracking is enabled
  static const bool enableAnalytics = bool.fromEnvironment(
    'ENABLE_ANALYTICS',
    defaultValue: true,
  );

  /// Whether crash reporting is enabled
  static const bool enableCrashReporting = bool.fromEnvironment(
    'ENABLE_CRASH_REPORTING',
    defaultValue: true,
  );

  // Debug settings
  /// Whether the app is in debug mode
  static const bool isDebugMode = bool.fromEnvironment('DEBUG_MODE');

  /// Whether network request/response logging is enabled
  static const bool enableNetworkLogging = bool.fromEnvironment(
    'ENABLE_NETWORK_LOGGING',
  );

  /// Whether performance logging is enabled
  static const bool enablePerformanceLogging = bool.fromEnvironment(
    'ENABLE_PERFORMANCE_LOGGING',
  );
}
