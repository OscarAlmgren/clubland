import '../config/environment_config.dart';

/// API configuration constants and endpoints for the application
class ApiConstants {
  // Base URLs (now using environment configuration)
  /// Base URL for API requests
  static String get baseUrl => EnvironmentConfig.apiBaseUrl;
  /// GraphQL endpoint URL
  static String get graphqlUrl => EnvironmentConfig.graphqlEndpoint;

  // GraphQL endpoints
  /// GraphQL endpoint path
  static const String graphqlEndpoint = '/graphql';
  /// GraphQL WebSocket endpoint path
  static const String graphqlWsEndpoint = '/graphql';

  // Authentication endpoints
  /// Hanko authentication service base URL
  static String get hankoBaseUrl => EnvironmentConfig.hankoBaseUrl;
  /// Authentication endpoint path
  static const String authEndpoint = '/auth';
  /// Login endpoint path
  static const String loginEndpoint = '/auth/login';
  /// Token refresh endpoint path
  static const String refreshEndpoint = '/auth/refresh';
  /// Logout endpoint path
  static const String logoutEndpoint = '/auth/logout';

  // API timeouts (now using environment configuration)
  /// Connection timeout duration
  static Duration get connectTimeout => Duration(milliseconds: EnvironmentConfig.connectTimeout);
  /// Receive timeout duration
  static Duration get receiveTimeout => Duration(milliseconds: EnvironmentConfig.receiveTimeout);
  /// Send timeout duration
  static Duration get sendTimeout => Duration(milliseconds: EnvironmentConfig.sendTimeout);

  // Pagination
  /// Default number of items per page for pagination
  static const int defaultPageSize = 20;
  /// Maximum allowed page size for pagination
  static const int maxPageSize = 100;

  // Rate limiting
  /// Maximum number of retry attempts for failed requests
  static const int maxRetries = 3;
  /// Delay between retry attempts
  static const Duration retryDelay = Duration(seconds: 1);

  // File upload
  /// Maximum file size for uploads (10MB)
  static const int maxFileSize = 10 * 1024 * 1024;
  /// Allowed image file types for uploads
  static const List<String> allowedImageTypes = ['jpg', 'jpeg', 'png', 'webp'];

  // Cache
  /// Default cache expiration time
  static const Duration defaultCacheMaxAge = Duration(hours: 1);
  /// Short-lived cache expiration time
  static const Duration shortCacheMaxAge = Duration(minutes: 5);
  /// Long-lived cache expiration time
  static const Duration longCacheMaxAge = Duration(days: 1);

  // WebSocket
  /// WebSocket reconnection delay
  static const Duration wsReconnectDelay = Duration(seconds: 5);
  /// Maximum WebSocket reconnection attempts
  static const int wsMaxReconnectAttempts = 5;
  /// WebSocket heartbeat interval
  static const Duration wsHeartbeatInterval = Duration(seconds: 30);
}
