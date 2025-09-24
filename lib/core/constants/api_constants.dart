import '../config/environment_config.dart';

class ApiConstants {
  // Base URLs (now using environment configuration)
  static String get baseUrl => EnvironmentConfig.apiBaseUrl;
  static String get graphqlUrl => EnvironmentConfig.graphqlEndpoint;

  // GraphQL endpoints
  static const String graphqlEndpoint = '/graphql';
  static const String graphqlWsEndpoint = '/graphql';

  // Authentication endpoints
  static String get hankoBaseUrl => EnvironmentConfig.hankoBaseUrl;
  static const String authEndpoint = '/auth';
  static const String loginEndpoint = '/auth/login';
  static const String refreshEndpoint = '/auth/refresh';
  static const String logoutEndpoint = '/auth/logout';

  // API timeouts (now using environment configuration)
  static Duration get connectTimeout => Duration(milliseconds: EnvironmentConfig.connectTimeout);
  static Duration get receiveTimeout => Duration(milliseconds: EnvironmentConfig.receiveTimeout);
  static Duration get sendTimeout => Duration(milliseconds: EnvironmentConfig.sendTimeout);

  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;

  // Rate limiting
  static const int maxRetries = 3;
  static const Duration retryDelay = Duration(seconds: 1);

  // File upload
  static const int maxFileSize = 10 * 1024 * 1024; // 10MB
  static const List<String> allowedImageTypes = ['jpg', 'jpeg', 'png', 'webp'];

  // Cache
  static const Duration defaultCacheMaxAge = Duration(hours: 1);
  static const Duration shortCacheMaxAge = Duration(minutes: 5);
  static const Duration longCacheMaxAge = Duration(days: 1);

  // WebSocket
  static const Duration wsReconnectDelay = Duration(seconds: 5);
  static const int wsMaxReconnectAttempts = 5;
  static const Duration wsHeartbeatInterval = Duration(seconds: 30);
}
