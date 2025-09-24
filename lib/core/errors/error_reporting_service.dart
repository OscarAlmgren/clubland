import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

import '../config/environment_config.dart';
import 'failures.dart';

/// Service for comprehensive error reporting and analytics
class ErrorReportingService {
  static ErrorReportingService? _instance;
  final Logger _logger;
  final List<ErrorReport> _errorQueue = [];
  Timer? _batchTimer;

  ErrorReportingService._() : _logger = Logger() {
    if (EnvironmentConfig.enableCrashReporting) {
      _initializeBatchReporting();
    }
  }

  static ErrorReportingService get instance {
    _instance ??= ErrorReportingService._();
    return _instance!;
  }

  /// Initialize batch error reporting
  void _initializeBatchReporting() {
    _batchTimer = Timer.periodic(const Duration(minutes: 5), (_) {
      _processBatch();
    });
  }

  /// Report a failure with context
  void reportFailure({
    required Failure failure,
    required String operation,
    StackTrace? stackTrace,
    String? userId,
    Map<String, dynamic>? context,
    ErrorSeverity severity = ErrorSeverity.error,
  }) {
    final report = ErrorReport(
      failure: failure,
      operation: operation,
      stackTrace: stackTrace,
      userId: userId,
      context: context ?? {},
      severity: severity,
      timestamp: DateTime.now(),
      environment: EnvironmentConfig.currentEnvironment.name,
      buildNumber: _getBuildNumber(),
      deviceInfo: _getDeviceInfo(),
    );

    _processReport(report);
  }

  /// Report an unexpected error
  void reportUnexpectedError({
    required String operation,
    required dynamic error,
    StackTrace? stackTrace,
    String? userId,
    Map<String, dynamic>? context,
    ErrorSeverity severity = ErrorSeverity.error,
  }) {
    final failure = NetworkFailure.serverError(0, 'Unexpected error: ${error.toString()}');

    reportFailure(
      failure: failure,
      operation: operation,
      stackTrace: stackTrace,
      userId: userId,
      context: context,
      severity: severity,
    );
  }

  /// Report network connectivity issue
  void reportConnectivityIssue({
    required String operation,
    Map<String, dynamic>? context,
  }) {
    reportFailure(
      failure: NetworkFailure.noConnection(),
      operation: operation,
      context: context,
      severity: ErrorSeverity.warning,
    );
  }

  /// Report authentication failure
  void reportAuthFailure({
    required AuthFailure failure,
    required String operation,
    String? userId,
    Map<String, dynamic>? context,
  }) {
    reportFailure(
      failure: failure,
      operation: operation,
      userId: userId,
      context: context,
      severity: _getAuthSeverity(failure),
    );
  }

  /// Process error report
  void _processReport(ErrorReport report) {
    // Log locally
    _logError(report);

    // Add to batch for remote reporting
    if (EnvironmentConfig.enableCrashReporting) {
      _addToBatch(report);
    }

    // Show critical errors to user in debug mode
    if (kDebugMode && report.severity == ErrorSeverity.critical) {
      _logger.e('CRITICAL ERROR: ${report.operation} - ${report.failure.message}');
    }
  }

  /// Log error locally
  void _logError(ErrorReport report) {
    final logMessage = 'Operation: ${report.operation} | '
        'Failure: ${report.failure.runtimeType} | '
        'Code: ${report.failure.code} | '
        'Message: ${report.failure.message}';

    switch (report.severity) {
      case ErrorSeverity.debug:
        _logger.d(logMessage, error: report.failure, stackTrace: report.stackTrace);
        break;
      case ErrorSeverity.info:
        _logger.i(logMessage);
        break;
      case ErrorSeverity.warning:
        _logger.w(logMessage, error: report.failure);
        break;
      case ErrorSeverity.error:
        _logger.e(logMessage, error: report.failure, stackTrace: report.stackTrace);
        break;
      case ErrorSeverity.critical:
        _logger.f(logMessage, error: report.failure, stackTrace: report.stackTrace);
        break;
    }

    // Add context in debug mode
    if (kDebugMode && report.context.isNotEmpty) {
      _logger.d('Error context: ${report.context}');
    }
  }

  /// Add error to batch queue
  void _addToBatch(ErrorReport report) {
    _errorQueue.add(report);

    // Process immediately for critical errors
    if (report.severity == ErrorSeverity.critical) {
      _processBatch();
    }
  }

  /// Process batch of errors for remote reporting
  void _processBatch() {
    if (_errorQueue.isEmpty) return;

    final batch = List<ErrorReport>.from(_errorQueue);
    _errorQueue.clear();

    if (kDebugMode) {
      _logger.d('Processing error batch: ${batch.length} errors');
    }

    // TODO: Send to actual crash reporting service (Sentry, Firebase, etc.)
    _sendToRemoteService(batch);
  }

  /// Send errors to remote service
  Future<void> _sendToRemoteService(List<ErrorReport> reports) async {
    try {
      // Mock implementation - replace with actual service
      if (kDebugMode) {
        _logger.d('Would send ${reports.length} error reports to remote service');

        for (final report in reports) {
          _logger.d('Report: ${report.operation} - ${report.failure.message}');
        }
      }

      // TODO: Implement actual service integration
      // Examples:
      // - Sentry.captureException()
      // - Firebase Crashlytics.recordError()
      // - Custom API endpoint
    } catch (e) {
      _logger.w('Failed to send error reports to remote service: $e');

      // Re-queue reports for next batch
      _errorQueue.addAll(reports);
    }
  }

  /// Get authentication error severity
  ErrorSeverity _getAuthSeverity(AuthFailure failure) {
    switch (failure.code) {
      case 'INVALID_CREDENTIALS':
        return ErrorSeverity.warning;
      case 'SESSION_EXPIRED':
      case 'TOKEN_REFRESH_FAILED':
        return ErrorSeverity.error;
      case 'UNAUTHORIZED':
        return ErrorSeverity.error;
      default:
        return ErrorSeverity.error;
    }
  }

  /// Get build number for reporting
  String _getBuildNumber() {
    // TODO: Get actual build number from package_info_plus
    return 'dev-build';
  }

  /// Get device info for reporting
  Map<String, dynamic> _getDeviceInfo() {
    // TODO: Get actual device info from device_info_plus
    return {
      'platform': defaultTargetPlatform.name,
      'isWeb': kIsWeb,
      'debugMode': kDebugMode,
    };
  }

  /// Get error statistics
  Map<String, dynamic> getErrorStats() {
    return {
      'queueSize': _errorQueue.length,
      'batchTimerActive': _batchTimer?.isActive ?? false,
      'reportingEnabled': EnvironmentConfig.enableCrashReporting,
    };
  }

  /// Clear error queue (for testing)
  void clearQueue() {
    _errorQueue.clear();
  }

  /// Dispose resources
  void dispose() {
    _batchTimer?.cancel();
    _errorQueue.clear();
  }
}

/// Error report model
class ErrorReport {
  final Failure failure;
  final String operation;
  final StackTrace? stackTrace;
  final String? userId;
  final Map<String, dynamic> context;
  final ErrorSeverity severity;
  final DateTime timestamp;
  final String environment;
  final String buildNumber;
  final Map<String, dynamic> deviceInfo;

  const ErrorReport({
    required this.failure,
    required this.operation,
    this.stackTrace,
    this.userId,
    required this.context,
    required this.severity,
    required this.timestamp,
    required this.environment,
    required this.buildNumber,
    required this.deviceInfo,
  });

  /// Convert to JSON for remote reporting
  Map<String, dynamic> toJson() {
    return {
      'failure': {
        'type': failure.runtimeType.toString(),
        'message': failure.message,
        'code': failure.code,
      },
      'operation': operation,
      'stackTrace': stackTrace?.toString(),
      'userId': userId,
      'context': context,
      'severity': severity.name,
      'timestamp': timestamp.toIso8601String(),
      'environment': environment,
      'buildNumber': buildNumber,
      'deviceInfo': deviceInfo,
    };
  }

  /// Convert from JSON
  factory ErrorReport.fromJson(Map<String, dynamic> json) {
    return ErrorReport(
      failure: NetworkFailure(
        json['failure']['message'] as String,
        json['failure']['code'] as String?,
      ),
      operation: json['operation'] as String,
      stackTrace: json['stackTrace'] != null
          ? StackTrace.fromString(json['stackTrace'] as String)
          : null,
      userId: json['userId'] as String?,
      context: Map<String, dynamic>.from(json['context'] as Map),
      severity: ErrorSeverity.values.firstWhere(
        (e) => e.name == json['severity'],
        orElse: () => ErrorSeverity.error,
      ),
      timestamp: DateTime.parse(json['timestamp'] as String),
      environment: json['environment'] as String,
      buildNumber: json['buildNumber'] as String,
      deviceInfo: Map<String, dynamic>.from(json['deviceInfo'] as Map),
    );
  }
}

/// Error severity levels
enum ErrorSeverity {
  debug,
  info,
  warning,
  error,
  critical,
}

/// Extension for convenient error reporting
extension FailureReporting on Failure {
  /// Report this failure
  void report({
    required String operation,
    StackTrace? stackTrace,
    String? userId,
    Map<String, dynamic>? context,
    ErrorSeverity severity = ErrorSeverity.error,
  }) {
    ErrorReportingService.instance.reportFailure(
      failure: this,
      operation: operation,
      stackTrace: stackTrace,
      userId: userId,
      context: context,
      severity: severity,
    );
  }
}