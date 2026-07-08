/// Environment types
/// Environment types for different deployment stages
enum Environment {
  /// Development environment for local development
  development,
  /// Staging environment for testing
  staging,
  /// Production environment for live deployment
  production
}

/// Comprehensive environment configuration for the Clubland app
class EnvironmentConfig {
  static Environment _currentEnvironment = Environment.development;

  /// Initialize environment based on compile-time constants
  static void initialize() {
    const envString = String.fromEnvironment(
      'ENVIRONMENT',
      defaultValue: 'development',
    );

    switch (envString.toLowerCase()) {
      case 'staging':
        _currentEnvironment = Environment.staging;
        break;
      case 'production':
      case 'prod':
        _currentEnvironment = Environment.production;
        break;
      case 'development':
      case 'dev':
      default:
        _currentEnvironment = Environment.development;
        break;
    }
  }

  /// Current environment
  static Environment get currentEnvironment => _currentEnvironment;

  /// Check if in development
  static bool get isDevelopment =>
      _currentEnvironment == Environment.development;

  /// Check if in staging
  static bool get isStaging => _currentEnvironment == Environment.staging;

  /// Check if in production
  static bool get isProduction => _currentEnvironment == Environment.production;

  /// API Configuration
  /// Backend server base URL. Defaults only exist for development builds;
  /// staging/production must pass --dart-define=API_BASE_URL=https://...
  /// (for LAN device testing use e.g. --dart-define=API_BASE_URL=http://192.168.x.x:30080)
  static String get apiBaseUrl {
    const url = String.fromEnvironment('API_BASE_URL');
    if (url.isNotEmpty) return url;
    if (isDevelopment) return 'http://localhost:8080';
    throw StateError(
      'API_BASE_URL must be provided via --dart-define for '
      '${currentEnvironment.name} builds',
    );
  }

  /// GraphQL endpoint URL (derived from apiBaseUrl unless overridden)
  static String get graphqlEndpoint {
    const url = String.fromEnvironment('GRAPHQL_ENDPOINT');
    if (url.isNotEmpty) return url;
    return '$apiBaseUrl/graphql';
  }

  /// Authentication Configuration
  static String get hankoBaseUrl {
    const url = String.fromEnvironment('HANKO_BASE_URL');
    if (url.isNotEmpty) return url;
    if (isDevelopment) return 'http://localhost:8000';
    throw StateError(
      'HANKO_BASE_URL must be provided via --dart-define for '
      '${currentEnvironment.name} builds',
    );
  }

  /// Hanko authentication API key
  static String get hankoApiKey =>
      const String.fromEnvironment('HANKO_API_KEY');

  /// Monitoring Configuration
  /// Sentry DSN for error reporting
  static String get sentryDsn =>
      const String.fromEnvironment('SENTRY_DSN');

  /// Amplitude API key for analytics
  static String get amplitudeApiKey =>
      const String.fromEnvironment('AMPLITUDE_API_KEY');

  /// Feature Flags
  static bool get enableLogging {
    const enabled = String.fromEnvironment(
      'ENABLE_LOGGING',
      defaultValue: 'true',
    );
    return enabled.toLowerCase() == 'true' || isDevelopment;
  }

  /// Whether analytics tracking is enabled
  static bool get enableAnalytics {
    const enabled = String.fromEnvironment(
      'ENABLE_ANALYTICS',
      defaultValue: 'false',
    );
    return enabled.toLowerCase() == 'true';
  }

  /// Whether crash reporting is enabled
  static bool get enableCrashReporting {
    const enabled = String.fromEnvironment(
      'ENABLE_CRASH_REPORTING',
      defaultValue: 'false',
    );
    return enabled.toLowerCase() == 'true' || isProduction;
  }

  /// API Timeouts (in milliseconds)
  static int get connectTimeout {
    const timeout = String.fromEnvironment(
      'CONNECT_TIMEOUT',
      defaultValue: '10000',
    );
    return int.tryParse(timeout) ?? 10000;
  }

  /// HTTP receive timeout in milliseconds
  static int get receiveTimeout {
    const timeout = String.fromEnvironment(
      'RECEIVE_TIMEOUT',
      defaultValue: '30000',
    );
    return int.tryParse(timeout) ?? 30000;
  }

  /// HTTP send timeout in milliseconds
  static int get sendTimeout {
    const timeout = String.fromEnvironment(
      'SEND_TIMEOUT',
      defaultValue: '30000',
    );
    return int.tryParse(timeout) ?? 30000;
  }

  /// Configuration validation
  static void validateConfig() {
    final errors = <String>[];

    if (isProduction) {
      if (hankoApiKey.isEmpty) {
        errors.add('HANKO_API_KEY is required in production');
      }
      if (sentryDsn.isEmpty) {
        errors.add('SENTRY_DSN is recommended in production');
      }
    }
    if (!isDevelopment) {
      // Force the fail-fast getters so misconfigured builds die at startup
      // rather than on first request.
      apiBaseUrl;
      hankoBaseUrl;
    }

    if (errors.isNotEmpty) {
      throw StateError(
        'Configuration validation failed:\n${errors.join('\n')}',
      );
    }
  }

  /// Debug configuration summary
  static Map<String, dynamic> getConfigSummary() => {
    'environment': currentEnvironment.name,
    'apiBaseUrl': apiBaseUrl,
    'hankoBaseUrl': hankoBaseUrl,
    'enableLogging': enableLogging,
    'enableAnalytics': enableAnalytics,
    'enableCrashReporting': enableCrashReporting,
    'connectTimeout': connectTimeout,
    'receiveTimeout': receiveTimeout,
    'sendTimeout': sendTimeout,
  };
}
