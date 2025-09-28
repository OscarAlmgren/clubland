import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../config/environment_config.dart';
import 'failures.dart';

/// Service for comprehensive error reporting and analytics
class ErrorReportingService {
  ErrorReportingService._() : _logger = Logger() {
    if (EnvironmentConfig.enableCrashReporting) {
      _initializeBatchReporting();
    }
  }
  static ErrorReportingService? _instance;
  final Logger _logger;
  final List<ErrorReport> _errorQueue = [];
  Timer? _batchTimer;

  /// The singleton instance of the [ErrorReportingService].
  ///
  /// Accessing this getter lazily initializes the service if it hasn't been created yet.
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
  Future<void> reportFailure({
    required Failure failure,
    required String operation,
    StackTrace? stackTrace,
    String? userId,
    Map<String, dynamic>? context,
    ErrorSeverity severity = ErrorSeverity.error,
  }) async {
    final report = ErrorReport(
      failure: failure,
      operation: operation,
      stackTrace: stackTrace,
      userId: userId,
      context: context ?? {},
      severity: severity,
      timestamp: DateTime.now(),
      environment: EnvironmentConfig.currentEnvironment.name,
      buildNumber: await getBuildNumber(),
      deviceInfo: await getDeviceInfo(),
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
    final failure = NetworkFailure.serverError(0, 'Unexpected error: $error');

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
      _logger.e(
        'CRITICAL ERROR: ${report.operation} - ${report.failure.message}',
      );
    }
  }

  /// Log error locally
  void _logError(ErrorReport report) {
    final logMessage =
        'Operation: ${report.operation} | '
        'Failure: ${report.failure.runtimeType} | '
        'Code: ${report.failure.code} | '
        'Message: ${report.failure.message}';

    switch (report.severity) {
      case ErrorSeverity.debug:
        _logger.d(
          logMessage,
          error: report.failure,
          stackTrace: report.stackTrace,
        );
        break;
      case ErrorSeverity.info:
        _logger.i(logMessage);
        break;
      case ErrorSeverity.warning:
        _logger.w(logMessage, error: report.failure);
        break;
      case ErrorSeverity.error:
        _logger.e(
          logMessage,
          error: report.failure,
          stackTrace: report.stackTrace,
        );
        break;
      case ErrorSeverity.critical:
        _logger.f(
          logMessage,
          error: report.failure,
          stackTrace: report.stackTrace,
        );
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

    // TODO(oscaralmgren): Send to actual crash reporting service (Sentry, Firebase, etc.)
    _sendToRemoteService(batch);
  }

  /// Send errors to remote service
  Future<void> _sendToRemoteService(List<ErrorReport> reports) async {
    try {
      // Mock implementation - replace with actual service
      if (kDebugMode) {
        _logger.d(
          'Would send ${reports.length} error reports to remote service',
        );

        for (final report in reports) {
          _logger.d('Report: ${report.operation} - ${report.failure.message}');
        }
      }

      // TODO(oscaralmgren): Implement actual service integration
      // Examples:
      // - Sentry.captureException()
      // - Firebase Crashlytics.recordError()
      // - Custom API endpoint
    } on Exception catch (e) {
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

  /// Gets the build number (or version code) for reporting purposes.
  ///
  /// This function is asynchronous because it relies on platform channels
  /// via the `package_info_plus` plugin to fetch application metadata.
  ///
  /// It returns 'dev-build' as a fallback if fetching fails.
  Future<String> getBuildNumber() async {
    try {
      final info = await PackageInfo.fromPlatform();
      return info.buildNumber;
    }
    // Satisfies the linter rule while catching all throwables (Exceptions and Errors).
    on Object catch (e, s) {
      // The 's' variable holds the StackTrace, which is very useful for debugging.
      debugPrint('Error fetching build number: $e');
      debugPrint('Stack trace: $s');

      // Returns a clear development fallback if the package fails.
      return 'dev-build';
    }
  }

  /// Gets detailed device information for reporting and debugging.
  ///
  /// This function is asynchronous as it uses the `device_info_plus` plugin
  /// which communicates with native platform APIs.
  ///
  /// It falls back to basic, synchronously available platform information
  /// (`platform`, `isWeb`, `debugMode`) if the device-specific data retrieval fails.
  Future<Map<String, dynamic>> getDeviceInfo() async {
    final deviceInfoPlugin = DeviceInfoPlugin();

    // Start with basic, always-available information
    final baseInfo = <String, dynamic>{
      'platform': defaultTargetPlatform.name,
      'isWeb': kIsWeb,
      'debugMode': kDebugMode,
    };

    if (kIsWeb) {
      try {
        final webInfo = await deviceInfoPlugin.webBrowserInfo;
        return {...baseInfo, ...webInfo.data};
      } on Object catch (e) {
        debugPrint('Error fetching web info: $e');
        return baseInfo;
      }
    }

    // Handle other native platforms
    try {
      if (Platform.isAndroid) {
        final androidInfo = await deviceInfoPlugin.androidInfo;
        return {...baseInfo, ...androidInfo.data};
      } else if (Platform.isIOS) {
        final iosInfo = await deviceInfoPlugin.iosInfo;
        return {...baseInfo, ...iosInfo.data};
      } else if (Platform.isWindows) {
        final windowsInfo = await deviceInfoPlugin.windowsInfo;
        return {...baseInfo, ...windowsInfo.data};
      } else if (Platform.isLinux) {
        final linuxInfo = await deviceInfoPlugin.linuxInfo;
        return {...baseInfo, ...linuxInfo.data};
      } else if (Platform.isMacOS) {
        final macosInfo = await deviceInfoPlugin.macOsInfo;
        return {...baseInfo, ...macosInfo.data};
      }
    } on Object catch (e) {
      // General safety net for any platform channel exception/error
      debugPrint('Error fetching native device info: $e');
    }

    // Return the base info if platform-specific data could not be retrieved
    return baseInfo;
  }

  /// Get error statistics
  Map<String, dynamic> getErrorStats() => {
    'queueSize': _errorQueue.length,
    'batchTimerActive': _batchTimer?.isActive ?? false,
    'reportingEnabled': EnvironmentConfig.enableCrashReporting,
  };

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

/// Represents a standardized object for capturing and reporting errors within the application.
///
/// This model ensures consistency when logging, storing, or sending error data
/// to an external reporting service.
class ErrorReport {
  /// Converts a JSON map into an [ErrorReport] object.
  /// Constructs an [ErrorReport] instance, initializing all necessary fields for reporting.
  const ErrorReport({
    required this.failure,
    required this.operation,
    required this.severity,
    required this.timestamp,
    required this.environment,
    required this.buildNumber,
    required this.deviceInfo,
    this.stackTrace,
    this.userId,
    this.context = const {},
  });

  /// Converts a JSON map into an [ErrorReport] object.
  ///
  /// The [severity] field is robustly parsed using enum names, falling back to [ErrorSeverity.error]
  /// if the name is unrecognized.
  factory ErrorReport.fromJson(Map<String, dynamic> json) {
    // Cast the nested 'failure' map once to resolve dynamic access warnings
    final failureJson = json['failure'] as Map<String, dynamic>;

    return ErrorReport(
      failure: NetworkFailure(
        // FIX: Access properties on the explicitly typed 'failureJson'
        failureJson['message'] as String,
        failureJson['code'] as String?,
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

  // Assuming a default constructor exists or is implied for initialization.
  // Add an explicit constructor here if the class is not fully defined above,
  // but for documentation purposes, we focus on the public members.

  /// The specific type of failure or exception that occurred.
  final Failure failure;

  /// A description of the operation or context where the error occurred (e.g., 'login', 'fetchBookings').
  final String operation;

  /// The full Dart stack trace at the time the error was captured. Nullable.
  final StackTrace? stackTrace;

  /// The ID of the user currently logged in, if available.
  final String? userId;

  /// Additional key-value pairs providing context (e.g., feature flags, input parameters).
  final Map<String, dynamic> context;

  /// The severity level of the error, used for filtering and prioritization.
  final ErrorSeverity severity;

  /// The precise time the error was captured.
  final DateTime timestamp;

  /// The deployment environment where the error occurred (e.g., 'staging', 'production').
  final String environment;

  /// The specific build number of the application.
  final String buildNumber;

  /// A map containing device and operating system information.
  final Map<String, dynamic> deviceInfo;

  /// Converts the [ErrorReport] object to a JSON map for remote reporting.
  Map<String, dynamic> toJson() => {
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

/// Defines standard severity levels for logging and error reporting.
enum ErrorSeverity {
  /// Detailed information on the flow, lowest priority.
  debug,

  /// General application flow information.
  info,

  /// A non-critical issue that should be investigated.
  warning,

  /// A standard application error, medium priority.
  error,

  /// A severe, stability-threatening error, highest priority.
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
