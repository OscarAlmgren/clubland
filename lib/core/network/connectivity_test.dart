import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../constants/api_constants.dart';

/// Connectivity test utility for backend health check
class ConnectivityTest {
  /// Test backend connection
  static Future<BackendHealthStatus> testBackendConnection() async {
    final logger = Logger();
    final dio = Dio();

    try {
      logger.i('Testing backend connection to ${ApiConstants.baseUrl}');

      final response = await dio.get<Map<String, dynamic>>(
        '${ApiConstants.baseUrl}${ApiConstants.healthEndpoint}',
        options: Options(
          sendTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 5),
        ),
      );

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data!;
        final status = data['status'] as String?;

        if (status == 'healthy') {
          logger.i('✅ Backend connection successful');
          logger.i('Version: ${data['version']}');
          logger.i('Services: ${data['services']}');

          return BackendHealthStatus(
            isConnected: true,
            status: status ?? 'unknown',
            version: data['version'] as String?,
            services: data['services'] as Map<String, dynamic>?,
            timestamp: data['timestamp'] as String?,
          );
        }
      }

      logger.w('⚠️ Backend responded but status is not healthy');
      return BackendHealthStatus(
        isConnected: false,
        status: 'unhealthy',
        error: 'Backend status: ${response.data?['status']}',
      );
    } on DioException catch (e) {
      logger.e('❌ Backend connection failed: ${e.message}');

      String errorMessage;
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          errorMessage = 'Connection timeout - backend not responding';
        case DioExceptionType.connectionError:
          errorMessage =
              'Cannot reach backend at ${ApiConstants.baseUrl}\n'
              'Ensure device is on the same network';
        case DioExceptionType.badResponse:
          errorMessage =
              'Backend error (${e.response?.statusCode}): ${e.response?.data}';
        case DioExceptionType.cancel:
        case DioExceptionType.badCertificate:
        case DioExceptionType.unknown:
          errorMessage = 'Connection error: ${e.message}';
      }

      return BackendHealthStatus(
        isConnected: false,
        status: 'error',
        error: errorMessage,
      );
    } on Exception catch (e) {
      logger.e('❌ Unexpected error: $e');
      return BackendHealthStatus(
        isConnected: false,
        status: 'error',
        error: 'Unexpected error: $e',
      );
    }
  }

  /// Test GraphQL endpoint specifically
  static Future<bool> testGraphQLEndpoint() async {
    final logger = Logger();
    final dio = Dio();

    try {
      logger.i('Testing GraphQL endpoint at ${ApiConstants.graphqlUrl}');

      // Send a simple introspection query
      final response = await dio.post<Map<String, dynamic>>(
        ApiConstants.graphqlUrl,
        data: {
          'query': '{ __schema { queryType { name } } }',
        },
        options: Options(
          headers: {'Content-Type': 'application/json'},
          sendTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 5),
        ),
      );

      if (response.statusCode == 200) {
        logger.i('✅ GraphQL endpoint is accessible');
        return true;
      }

      logger.w('⚠️ GraphQL endpoint responded with ${response.statusCode}');
      return false;
    } on DioException catch (e) {
      logger.e('❌ GraphQL endpoint test failed: ${e.message}');
      return false;
    } on Exception catch (e) {
      logger.e('❌ Unexpected error: $e');
      return false;
    }
  }
}

/// Backend health status
class BackendHealthStatus {
  /// Creates a [BackendHealthStatus]
  const BackendHealthStatus({
    required this.isConnected,
    required this.status,
    this.version,
    this.services,
    this.timestamp,
    this.error,
  });

  /// Whether backend is reachable
  final bool isConnected;

  /// Health status from backend
  final String status;

  /// Backend version
  final String? version;

  /// Service health status
  final Map<String, dynamic>? services;

  /// Health check timestamp
  final String? timestamp;

  /// Error message if connection failed
  final String? error;

  /// Check if all services are healthy
  bool get allServicesHealthy {
    if (services == null) return false;
    return services!.values.every((status) => status == 'healthy');
  }

  @override
  String toString() {
    if (!isConnected) {
      return 'Backend: Disconnected - $error';
    }
    return 'Backend: Connected - Status: $status, Version: $version';
  }
}
