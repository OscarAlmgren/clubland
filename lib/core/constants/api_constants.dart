class ApiConstants {
  // Base URLs per environment
  static const String devBaseUrl = 'http://localhost:8080';
  static const String stagingBaseUrl = 'https://staging-api.reciprocal-clubs.com';
  static const String prodBaseUrl = 'https://api.reciprocal-clubs.com';

  // GraphQL endpoints
  static const String graphqlEndpoint = '/graphql';
  static const String graphqlWsEndpoint = '/graphql';

  // Authentication endpoints
  static const String hankoBaseUrl = 'http://localhost:8000';
  static const String authEndpoint = '/auth';
  static const String loginEndpoint = '/auth/login';
  static const String refreshEndpoint = '/auth/refresh';
  static const String logoutEndpoint = '/auth/logout';

  // API timeouts
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const Duration sendTimeout = Duration(seconds: 30);

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
