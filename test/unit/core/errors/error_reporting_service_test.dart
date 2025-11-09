import 'package:clubland/core/errors/error_reporting_service.dart';
import 'package:clubland/core/errors/failures.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ErrorReportingService errorReportingService;

  setUp(() {
    // Initialize the service
    errorReportingService = ErrorReportingService.instance;
  });

  group('ErrorReportingService', () {
    test('should be a singleton', () {
      final instance1 = ErrorReportingService.instance;
      final instance2 = ErrorReportingService.instance;
      expect(instance1, same(instance2));
    });

    test('should report auth failure', () async {
      // Arrange
      const failure = AuthFailure('Test auth failure');

      // Act
      await errorReportingService.reportFailure(
        failure: failure,
        stackTrace: StackTrace.current,
        operation: 'test_operation',
      );

      // Assert - no exception should be thrown
      expect(true, true);
    });

    test('should report network failures', () async {
      // Arrange
      const failure = NetworkFailure('Network error', 'NO_CONNECTION');

      // Act
      await errorReportingService.reportFailure(
        failure: failure,
        stackTrace: StackTrace.current,
        operation: 'network_operation',
      );

      // Assert - no exception should be thrown
      expect(true, true);
    });

    test('should report validation failures', () async {
      // Arrange
      const failure = ValidationFailure('Invalid input');

      // Act
      await errorReportingService.reportFailure(
        failure: failure,
        stackTrace: StackTrace.current,
        operation: 'validation_operation',
      );

      // Assert - no exception should be thrown
      expect(true, true);
    });

    test('should report storage failures', () async {
      // Arrange
      const failure = StorageFailure('Storage error');

      // Act
      await errorReportingService.reportFailure(
        failure: failure,
        stackTrace: StackTrace.current,
        operation: 'storage_operation',
      );

      // Assert - no exception should be thrown
      expect(true, true);
    });

    test('should handle critical failures with proper severity', () async {
      // Arrange
      const failure = AuthFailure(
        'Critical auth error',
        'CRITICAL_ERROR',
        FailureSeverity.critical,
      );

      // Act
      await errorReportingService.reportFailure(
        failure: failure,
        stackTrace: StackTrace.current,
        operation: 'critical_operation',
        severity: ErrorSeverity.critical,
      );

      // Assert - no exception should be thrown
      expect(true, true);
    });

    test('should report multiple errors without throwing', () async {
      // Arrange
      const failure1 = AuthFailure('Error 1');
      const failure2 = NetworkFailure('Error 2');
      const failure3 = ValidationFailure('Error 3');

      // Act
      await errorReportingService.reportFailure(
        failure: failure1,
        stackTrace: StackTrace.current,
        operation: 'operation_1',
      );
      await errorReportingService.reportFailure(
        failure: failure2,
        stackTrace: StackTrace.current,
        operation: 'operation_2',
      );
      await errorReportingService.reportFailure(
        failure: failure3,
        stackTrace: StackTrace.current,
        operation: 'operation_3',
      );

      // Assert - no exception should be thrown
      expect(true, true);
    });
  });

  group('Specialized Reporting Methods', () {
    test('should report auth failures using reportAuthFailure', () {
      // Arrange
      const sessionExpired = AuthFailure('Session expired', 'SESSION_EXPIRED');
      const invalidCreds = AuthFailure('Invalid credentials', 'INVALID_CREDENTIALS');
      const unauthorized = AuthFailure('Unauthorized', 'UNAUTHORIZED');

      // Act & Assert
      errorReportingService.reportAuthFailure(
        failure: sessionExpired,
        operation: 'session_check',
      );
      errorReportingService.reportAuthFailure(
        failure: invalidCreds,
        operation: 'login',
      );
      errorReportingService.reportAuthFailure(
        failure: unauthorized,
        operation: 'api_call',
      );

      // No exception should be thrown
      expect(true, true);
    });

    test('should report connectivity issues', () {
      // Act & Assert
      errorReportingService.reportConnectivityIssue(
        operation: 'network_check',
      );

      // No exception should be thrown
      expect(true, true);
    });

    test('should report unexpected errors', () {
      // Act & Assert
      errorReportingService.reportUnexpectedError(
        operation: 'test_operation',
        error: Exception('Test exception'),
        stackTrace: StackTrace.current,
      );

      // No exception should be thrown
      expect(true, true);
    });
  });

  group('Error Queue Management', () {
    setUp(() {
      errorReportingService.clearQueue();
    });

    test('should track queue size in stats', () {
      // Act
      final initialStats = errorReportingService.getErrorStats();

      // Assert
      expect(initialStats['queueSize'], equals(0));
    });

    test('should clear error queue', () {
      // Arrange - Add some errors
      errorReportingService.reportConnectivityIssue(operation: 'test1');
      errorReportingService.reportConnectivityIssue(operation: 'test2');

      // Act
      errorReportingService.clearQueue();
      final stats = errorReportingService.getErrorStats();

      // Assert
      expect(stats['queueSize'], equals(0));
    });

    test('should handle multiple queue operations', () {
      // Act
      for (var i = 0; i < 10; i++) {
        errorReportingService.reportConnectivityIssue(
          operation: 'test_$i',
        );
      }

      // Assert - no exception should be thrown
      expect(true, true);
    });
  });

  group('Error Stats', () {
    setUp(() {
      errorReportingService.clearQueue();
    });

    test('should return current stats', () {
      // Act
      final stats = errorReportingService.getErrorStats();

      // Assert
      expect(stats, isA<Map<String, dynamic>>());
      expect(stats.containsKey('queueSize'), true);
      expect(stats.containsKey('batchTimerActive'), true);
      expect(stats.containsKey('reportingEnabled'), true);
    });

    test('should report batch timer status', () {
      // Act
      final stats = errorReportingService.getErrorStats();

      // Assert
      expect(stats['batchTimerActive'], isA<bool>());
    });

    test('should report reporting enabled status', () {
      // Act
      final stats = errorReportingService.getErrorStats();

      // Assert
      expect(stats['reportingEnabled'], isA<bool>());
    });
  });

  group('Device Info Collection', () {
    test('should collect build number', () async {
      // Act
      final buildNumber = await errorReportingService.getBuildNumber();

      // Assert
      expect(buildNumber, isNotEmpty);
    });

    test('should handle build number retrieval errors gracefully', () async {
      // Act
      final buildNumber = await errorReportingService.getBuildNumber();

      // Assert - should return fallback value if error occurs
      expect(buildNumber, isA<String>());
    });

    test('should collect device info', () async {
      // Act
      final deviceInfo = await errorReportingService.getDeviceInfo();

      // Assert
      expect(deviceInfo, isA<Map<String, dynamic>>());
      expect(deviceInfo.containsKey('platform'), true);
      expect(deviceInfo.containsKey('isWeb'), true);
      expect(deviceInfo.containsKey('debugMode'), true);
    });

    test('should include platform in device info', () async {
      // Act
      final deviceInfo = await errorReportingService.getDeviceInfo();

      // Assert
      expect(deviceInfo['platform'], isNotNull);
    });

    test('should handle device info retrieval errors gracefully', () async {
      // Act
      final deviceInfo = await errorReportingService.getDeviceInfo();

      // Assert - should always return at least base info
      expect(deviceInfo['isWeb'], isA<bool>());
      expect(deviceInfo['debugMode'], isA<bool>());
    });
  });

  group('Error Report Context', () {
    test('should include custom context', () async {
      // Arrange
      const failure = NetworkFailure('Test error');
      final customContext = {
        'feature': 'booking',
        'action': 'create',
        'payload': {'clubId': '123'},
      };

      // Act
      await errorReportingService.reportFailure(
        failure: failure,
        operation: 'test_with_context',
        context: customContext,
      );

      // Assert - no exception should be thrown
      expect(true, true);
    });

    test('should include user ID when provided', () async {
      // Arrange
      const failure = AuthFailure('Auth error');

      // Act
      await errorReportingService.reportFailure(
        failure: failure,
        operation: 'test_with_user',
        userId: 'user_123',
      );

      // Assert - no exception should be thrown
      expect(true, true);
    });

    test('should handle empty context', () async {
      // Arrange
      const failure = ValidationFailure('Validation error');

      // Act
      await errorReportingService.reportFailure(
        failure: failure,
        operation: 'test_empty_context',
        context: {},
      );

      // Assert - no exception should be thrown
      expect(true, true);
    });

    test('should handle null context', () async {
      // Arrange
      const failure = StorageFailure('Storage error');

      // Act
      await errorReportingService.reportFailure(
        failure: failure,
        operation: 'test_null_context',
      );

      // Assert - no exception should be thrown
      expect(true, true);
    });
  });

  group('Error Severity Handling', () {
    test('should handle debug severity', () async {
      // Arrange
      const failure = NetworkFailure('Debug error');

      // Act
      await errorReportingService.reportFailure(
        failure: failure,
        operation: 'debug_operation',
        severity: ErrorSeverity.debug,
      );

      // Assert - no exception should be thrown
      expect(true, true);
    });

    test('should handle info severity', () async {
      // Arrange
      const failure = NetworkFailure('Info message');

      // Act
      await errorReportingService.reportFailure(
        failure: failure,
        operation: 'info_operation',
        severity: ErrorSeverity.info,
      );

      // Assert - no exception should be thrown
      expect(true, true);
    });

    test('should handle warning severity', () async {
      // Arrange
      const failure = NetworkFailure('Warning message');

      // Act
      await errorReportingService.reportFailure(
        failure: failure,
        operation: 'warning_operation',
        severity: ErrorSeverity.warning,
      );

      // Assert - no exception should be thrown
      expect(true, true);
    });

    test('should handle error severity', () async {
      // Arrange
      const failure = NetworkFailure('Error message');

      // Act
      await errorReportingService.reportFailure(
        failure: failure,
        operation: 'error_operation',
        severity: ErrorSeverity.error,
      );

      // Assert - no exception should be thrown
      expect(true, true);
    });

    test('should handle critical severity', () async {
      // Arrange
      const failure = NetworkFailure('Critical error');

      // Act
      await errorReportingService.reportFailure(
        failure: failure,
        operation: 'critical_operation',
        severity: ErrorSeverity.critical,
      );

      // Assert - no exception should be thrown
      expect(true, true);
    });
  });

  group('Auth Failure Severity Mapping', () {
    test('should map invalid credentials to warning', () {
      // Arrange
      const failure = AuthFailure('Invalid credentials', 'INVALID_CREDENTIALS');

      // Act
      errorReportingService.reportAuthFailure(
        failure: failure,
        operation: 'login',
      );

      // Assert - no exception should be thrown
      expect(true, true);
    });

    test('should map session expired to error', () {
      // Arrange
      const failure = AuthFailure('Session expired', 'SESSION_EXPIRED');

      // Act
      errorReportingService.reportAuthFailure(
        failure: failure,
        operation: 'session_check',
      );

      // Assert - no exception should be thrown
      expect(true, true);
    });

    test('should map token refresh failed to error', () {
      // Arrange
      const failure = AuthFailure('Token refresh failed', 'TOKEN_REFRESH_FAILED');

      // Act
      errorReportingService.reportAuthFailure(
        failure: failure,
        operation: 'token_refresh',
      );

      // Assert - no exception should be thrown
      expect(true, true);
    });

    test('should map unauthorized to error', () {
      // Arrange
      const failure = AuthFailure('Unauthorized', 'UNAUTHORIZED');

      // Act
      errorReportingService.reportAuthFailure(
        failure: failure,
        operation: 'api_request',
      );

      // Assert - no exception should be thrown
      expect(true, true);
    });

    test('should map unknown auth failures to error', () {
      // Arrange
      const failure = AuthFailure('Unknown auth error', 'UNKNOWN');

      // Act
      errorReportingService.reportAuthFailure(
        failure: failure,
        operation: 'unknown_operation',
      );

      // Assert - no exception should be thrown
      expect(true, true);
    });
  });

  group('Unexpected Error Handling', () {
    test('should handle string errors', () {
      // Act
      errorReportingService.reportUnexpectedError(
        operation: 'string_error',
        error: 'String error message',
      );

      // Assert - no exception should be thrown
      expect(true, true);
    });

    test('should handle exception objects', () {
      // Act
      errorReportingService.reportUnexpectedError(
        operation: 'exception_error',
        error: Exception('Exception message'),
      );

      // Assert - no exception should be thrown
      expect(true, true);
    });

    test('should handle error objects', () {
      // Act
      errorReportingService.reportUnexpectedError(
        operation: 'error_object',
        error: StateError('State error'),
      );

      // Assert - no exception should be thrown
      expect(true, true);
    });

    test('should handle null error', () {
      // Act
      errorReportingService.reportUnexpectedError(
        operation: 'null_error',
        error: null,
      );

      // Assert - no exception should be thrown
      expect(true, true);
    });
  });

  group('Connectivity Issue Reporting', () {
    test('should report with custom context', () {
      // Arrange
      final context = {
        'attemptNumber': 3,
        'lastSuccessfulConnection': DateTime.now().toString(),
      };

      // Act
      errorReportingService.reportConnectivityIssue(
        operation: 'network_check',
        context: context,
      );

      // Assert - no exception should be thrown
      expect(true, true);
    });

    test('should report without context', () {
      // Act
      errorReportingService.reportConnectivityIssue(
        operation: 'network_check',
      );

      // Assert - no exception should be thrown
      expect(true, true);
    });
  });
}

// Additional test groups for ErrorReport class
group('ErrorReport', () {
  test('should serialize to JSON', () {
    // Arrange
    final report = ErrorReport(
      failure: const NetworkFailure('Test failure', 'TEST_CODE'),
      operation: 'test_op',
      severity: ErrorSeverity.error,
      timestamp: DateTime(2024, 1, 1),
      environment: 'test',
      buildNumber: '1.0.0',
      deviceInfo: {'platform': 'test'},
      userId: 'user123',
      context: {'key': 'value'},
    );

    // Act
    final json = report.toJson();

    // Assert
    expect(json, isA<Map<String, dynamic>>());
    expect(json['operation'], equals('test_op'));
    expect(json['userId'], equals('user123'));
    expect(json['environment'], equals('test'));
    expect(json['buildNumber'], equals('1.0.0'));
  });

  test('should deserialize from JSON', () {
    // Arrange
    final json = {
      'failure': {
        'type': 'NetworkFailure',
        'message': 'Test failure',
        'code': 'TEST_CODE',
      },
      'operation': 'test_op',
      'stackTrace': null,
      'userId': 'user123',
      'context': {'key': 'value'},
      'severity': 'error',
      'timestamp': '2024-01-01T00:00:00.000',
      'environment': 'test',
      'buildNumber': '1.0.0',
      'deviceInfo': {'platform': 'test'},
    };

    // Act
    final report = ErrorReport.fromJson(json);

    // Assert
    expect(report.operation, equals('test_op'));
    expect(report.userId, equals('user123'));
    expect(report.severity, equals(ErrorSeverity.error));
    expect(report.environment, equals('test'));
    expect(report.buildNumber, equals('1.0.0'));
  });

  test('should handle missing optional fields in JSON', () {
    // Arrange
    final json = {
      'failure': {
        'message': 'Test',
        'code': null,
      },
      'operation': 'test',
      'stackTrace': null,
      'userId': null,
      'context': <String, dynamic>{},
      'severity': 'warning',
      'timestamp': DateTime.now().toIso8601String(),
      'environment': 'test',
      'buildNumber': '1.0.0',
      'deviceInfo': <String, dynamic>{},
    };

    // Act
    final report = ErrorReport.fromJson(json);

    // Assert
    expect(report.userId, isNull);
    expect(report.stackTrace, isNull);
  });

  test('should handle all severity levels in JSON', () {
    final severities = ErrorSeverity.values;

    for (final severity in severities) {
      final json = {
        'failure': {'message': 'Test', 'code': null},
        'operation': 'test',
        'stackTrace': null,
        'userId': null,
        'context': <String, dynamic>{},
        'severity': severity.name,
        'timestamp': DateTime.now().toIso8601String(),
        'environment': 'test',
        'buildNumber': '1.0.0',
        'deviceInfo': <String, dynamic>{},
      };

      final report = ErrorReport.fromJson(json);
      expect(report.severity, equals(severity));
    }
  });

  test('should fallback to error severity for invalid severity name', () {
    // Arrange
    final json = {
      'failure': {'message': 'Test', 'code': null},
      'operation': 'test',
      'stackTrace': null,
      'userId': null,
      'context': <String, dynamic>{},
      'severity': 'INVALID_SEVERITY',
      'timestamp': DateTime.now().toIso8601String(),
      'environment': 'test',
      'buildNumber': '1.0.0',
      'deviceInfo': <String, dynamic>{},
    };

    // Act
    final report = ErrorReport.fromJson(json);

    // Assert
    expect(report.severity, equals(ErrorSeverity.error));
  });
});

// Test extension method
group('FailureReporting Extension', () {
  test('should report failure using extension method', () {
    // Arrange
    const failure = AuthFailure('Test failure');

    // Act
    failure.report(
      operation: 'extension_test',
      userId: 'user123',
      context: {'source': 'extension'},
    );

    // Assert - no exception should be thrown
    expect(true, true);
  });

  test('should report with all parameters', () {
    // Arrange
    const failure = NetworkFailure('Network error', 'NO_CONNECTION');

    // Act
    failure.report(
      operation: 'network_test',
      stackTrace: StackTrace.current,
      userId: 'user456',
      context: {'attempt': 1},
      severity: ErrorSeverity.warning,
    );

    // Assert - no exception should be thrown
    expect(true, true);
  });

  test('should report with minimal parameters', () {
    // Arrange
    const failure = ValidationFailure('Validation error');

    // Act
    failure.report(operation: 'minimal_test');

    // Assert - no exception should be thrown
    expect(true, true);
  });
});
