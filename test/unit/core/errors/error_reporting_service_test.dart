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
}
