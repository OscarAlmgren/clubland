import 'package:flutter/foundation.dart';

/// Environment types
enum Environment {
  development,
  staging,
  production,
}

/// Comprehensive environment configuration for the Clubland app
class EnvironmentConfig {
  static Environment _currentEnvironment = Environment.development;

  /// Initialize environment based on compile-time constants
  static void initialize() {
    const envString = String.fromEnvironment('ENVIRONMENT', defaultValue: 'development');

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
  static bool get isDevelopment => _currentEnvironment == Environment.development;

  /// Check if in staging
  static bool get isStaging => _currentEnvironment == Environment.staging;

  /// Check if in production
  static bool get isProduction => _currentEnvironment == Environment.production;

  /// API Configuration
  static String get apiBaseUrl {
    return const String.fromEnvironment(
      'API_BASE_URL',
      defaultValue: 'http://localhost:8080',
    );
  }

  static String get graphqlEndpoint {
    return const String.fromEnvironment(
      'GRAPHQL_ENDPOINT',
      defaultValue: 'http://localhost:8080/graphql',
    );
  }

  /// Authentication Configuration
  static String get hankoBaseUrl {
    return const String.fromEnvironment(
      'HANKO_BASE_URL',
      defaultValue: 'http://localhost:8000',
    );
  }

  static String get hankoApiKey {
    return const String.fromEnvironment(
      'HANKO_API_KEY',
      defaultValue: '',
    );
  }

  /// Security Configuration
  static String get encryptionKey {
    const key = String.fromEnvironment('ENCRYPTION_KEY', defaultValue: '');
    if (key.isEmpty && isProduction) {
      throw StateError('ENCRYPTION_KEY must be provided in production');
    }
    return key.isEmpty ? _generateDevEncryptionKey() : key;
  }

  static String get jwtSecret {
    const secret = String.fromEnvironment('JWT_SECRET', defaultValue: '');
    if (secret.isEmpty && isProduction) {
      throw StateError('JWT_SECRET must be provided in production');
    }
    return secret.isEmpty ? 'dev-jwt-secret-key-change-in-production' : secret;
  }

  /// Database Configuration
  static String get databaseUrl {
    return const String.fromEnvironment(
      'DATABASE_URL',
      defaultValue: 'postgresql://localhost:5432/clubland_dev',
    );
  }

  /// Redis Configuration
  static String get redisUrl {
    return const String.fromEnvironment(
      'REDIS_URL',
      defaultValue: 'redis://localhost:6379',
    );
  }

  /// Blockchain Configuration
  static String get fabricCaUrl {
    return const String.fromEnvironment(
      'FABRIC_CA_URL',
      defaultValue: 'http://localhost:7054',
    );
  }

  static String get fabricPeerUrl {
    return const String.fromEnvironment(
      'FABRIC_PEER_URL',
      defaultValue: 'grpc://localhost:7051',
    );
  }

  static String get fabricOrdererUrl {
    return const String.fromEnvironment(
      'FABRIC_ORDERER_URL',
      defaultValue: 'grpc://localhost:7050',
    );
  }

  /// Monitoring Configuration
  static String get sentryDsn {
    return const String.fromEnvironment('SENTRY_DSN', defaultValue: '');
  }

  static String get amplitudeApiKey {
    return const String.fromEnvironment('AMPLITUDE_API_KEY', defaultValue: '');
  }

  /// Feature Flags
  static bool get enableLogging {
    const enabled = String.fromEnvironment('ENABLE_LOGGING', defaultValue: 'true');
    return enabled.toLowerCase() == 'true' || isDevelopment;
  }

  static bool get enableAnalytics {
    const enabled = String.fromEnvironment('ENABLE_ANALYTICS', defaultValue: 'false');
    return enabled.toLowerCase() == 'true';
  }

  static bool get enableCrashReporting {
    const enabled = String.fromEnvironment('ENABLE_CRASH_REPORTING', defaultValue: 'false');
    return enabled.toLowerCase() == 'true' || isProduction;
  }

  /// API Timeouts (in milliseconds)
  static int get connectTimeout {
    const timeout = String.fromEnvironment('CONNECT_TIMEOUT', defaultValue: '10000');
    return int.tryParse(timeout) ?? 10000;
  }

  static int get receiveTimeout {
    const timeout = String.fromEnvironment('RECEIVE_TIMEOUT', defaultValue: '30000');
    return int.tryParse(timeout) ?? 30000;
  }

  static int get sendTimeout {
    const timeout = String.fromEnvironment('SEND_TIMEOUT', defaultValue: '30000');
    return int.tryParse(timeout) ?? 30000;
  }

  /// Development helpers
  static String _generateDevEncryptionKey() {
    if (kDebugMode) {
      return 'dev-encryption-key-32-characters!!';
    }
    return 'fallback-key-for-non-debug-builds!';
  }

  /// Configuration validation
  static void validateConfig() {
    final errors = <String>[];

    if (isProduction) {
      if (hankoApiKey.isEmpty) errors.add('HANKO_API_KEY is required in production');
      if (sentryDsn.isEmpty) errors.add('SENTRY_DSN is recommended in production');
      if (const String.fromEnvironment('ENCRYPTION_KEY', defaultValue: '').isEmpty) {
        errors.add('ENCRYPTION_KEY is required in production');
      }
      if (const String.fromEnvironment('JWT_SECRET', defaultValue: '').isEmpty) {
        errors.add('JWT_SECRET is required in production');
      }
    }

    if (errors.isNotEmpty) {
      throw StateError('Configuration validation failed:\n${errors.join('\n')}');
    }
  }

  /// Debug configuration summary
  static Map<String, dynamic> getConfigSummary() {
    return {
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
}