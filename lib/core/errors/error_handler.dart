// ignore_for_file: lines_longer_than_80_chars

import 'dart:async';
import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as flutter_services;
import 'package:graphql_flutter/graphql_flutter.dart' hide NetworkException;
import 'package:logger/logger.dart';

import '../constants/app_constants.dart';
import 'exceptions.dart';
import 'failures.dart';

/// Global error handler for the application
class ErrorHandler {
  static late Logger _logger;
  static late GlobalKey<NavigatorState> _navigatorKey;
  static late GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey;

  /// Initialize the error handler
  static void initialize({
    required GlobalKey<NavigatorState> navigatorKey,
    required GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey,
    Logger? logger,
  }) {
    _navigatorKey = navigatorKey;
    _scaffoldMessengerKey = scaffoldMessengerKey;
    _logger = logger ?? Logger();

    // Set up Flutter error handling
    FlutterError.onError = _handleFlutterError;

    // Set up platform dispatcher error handling
    PlatformDispatcher.instance.onError = (error, stack) {
      _handlePlatformError(error, stack);
      return true;
    };
  }

  /// Handle Flutter framework errors
  static void _handleFlutterError(FlutterErrorDetails details) {
    _logger.e(
      'Flutter Error',
      error: details.exception,
      stackTrace: details.stack,
    );

    if (kDebugMode) {
      FlutterError.presentError(details);
    } else {
      // In release mode, report to crash analytics
      _reportCrashToAnalytics(details.exception, details.stack);
    }
  }

  /// Handle platform errors
  static bool _handlePlatformError(Object error, StackTrace stack) {
    _logger.e('Platform Error', error: error, stackTrace: stack);

    if (!kDebugMode) {
      _reportCrashToAnalytics(error, stack);
    }

    return true;
  }

  /// Convert exceptions to failures
  static Failure handleException(Object exception) {
    developer.log('Handling exception: $exception', name: 'ErrorHandler');

    if (exception is AppException) {
      return _convertAppExceptionToFailure(exception);
    }

    if (exception is DioException) {
      return _handleDioException(exception);
    }

    if (exception is OperationException) {
      return _handleGraphQLException(exception);
    }

    if (exception is flutter_services.PlatformException) {
      return _handlePlatformException(exception);
    }

    if (exception is TimeoutException) {
      return NetworkFailure.timeout();
    }

    // Generic error handling
    return UnknownFailure.unexpected(exception.toString());
  }

  /// Convert app exceptions to failures
  static Failure _convertAppExceptionToFailure(AppException exception) {
    switch (exception) {
      case AuthException _:
        return AuthFailure(exception.message, exception.code);
      case NetworkException _:
        return NetworkFailure(exception.message, exception.code);
      case GraphQLException _:
        final graphqlEx = exception;
        return GraphQLFailure(
          exception.message,
          exception.code,
          graphqlEx.extensions,
        );
      case StorageException _:
        return StorageFailure(exception.message, exception.code);
      case LocationException _:
        return LocationFailure(exception.message, exception.code);
      case CacheException _:
        return CacheFailure(exception.message, exception.code);
      case ValidationException _:
        final validationEx = exception;
        return ValidationFailure(
          exception.message,
          exception.code,
          validationEx.errors,
        );
      case BusinessLogicException _:
        return BusinessLogicFailure(exception.message, exception.code);
      case MediaException _:
        return MediaFailure(exception.message, exception.code);
      default:
        return UnknownFailure.unexpected(exception.message);
    }
  }

  /// Handle Dio HTTP exceptions
  static NetworkFailure _handleDioException(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NetworkFailure.timeout();

      case DioExceptionType.badResponse:
        final statusCode = exception.response?.statusCode ?? 0;
        final responseData = exception.response?.data;
        final message = responseData is Map<String, dynamic>
            ? responseData['message'] as String?
            : null;
        final errorMessage = message ?? exception.message ?? 'Unknown error';

        switch (statusCode) {
          case 400:
            return NetworkFailure.badRequest(errorMessage);
          case 401:
            return const NetworkFailure('Unauthorized access', 'UNAUTHORIZED');
          case 403:
            return NetworkFailure.forbidden();
          case 404:
            return NetworkFailure.notFound();
          case 429:
            return NetworkFailure.rateLimited();
          case >= 500:
            return NetworkFailure.serverError(statusCode, errorMessage);
          default:
            return NetworkFailure(
              'HTTP error: $statusCode',
              'HTTP_ERROR_$statusCode',
            );
        }

      case DioExceptionType.cancel:
        return const NetworkFailure(
          'Request was cancelled',
          'REQUEST_CANCELLED',
        );

      case DioExceptionType.connectionError:
        return NetworkFailure.noConnection();

      case DioExceptionType.badCertificate:
        return const NetworkFailure('SSL certificate error', 'BAD_CERTIFICATE');

      case DioExceptionType.unknown:
        return NetworkFailure(
          'Network error: ${exception.message}',
          'UNKNOWN_NETWORK_ERROR',
        );
    }
  }

  /// Handle GraphQL exceptions
  static GraphQLFailure _handleGraphQLException(OperationException exception) {
    if (exception.graphqlErrors.isNotEmpty) {
      final error = exception.graphqlErrors.first;
      final code = error.extensions?['code'] as String?;
      final message = error.message;

      switch (code) {
        case 'UNAUTHENTICATED':
          return const GraphQLFailure(
            'Authentication required',
            'UNAUTHENTICATED',
          );
        case 'UNAUTHORIZED':
          return const GraphQLFailure(
            'Insufficient permissions',
            'UNAUTHORIZED',
          );
        case 'VALIDATION_ERROR':
          return GraphQLFailure.validationError(message, error.extensions);
        case 'NOT_FOUND':
          return const GraphQLFailure('Resource not found', 'NOT_FOUND');
        case 'RATE_LIMITED':
          return const GraphQLFailure('Rate limit exceeded', 'RATE_LIMITED');
        case 'BLOCKCHAIN_ERROR':
          return GraphQLFailure(
            'Blockchain operation failed: $message',
            'BLOCKCHAIN_ERROR',
          );
        default:
          return GraphQLFailure(message, code, error.extensions);
      }
    }

    if (exception.linkException != null) {
      final linkException = exception.linkException!;
      if (linkException is NetworkException) {
        return const GraphQLFailure(
          'Network error during GraphQL operation',
          'NETWORK_ERROR',
        );
      }
      if (linkException is ServerException) {
        return const GraphQLFailure(
          'Server error during GraphQL operation',
          'SERVER_ERROR',
        );
      }
    }

    return GraphQLFailure(
      'GraphQL operation failed: $exception',
      'GRAPHQL_ERROR',
    );
  }

  /// Handle platform exceptions
  static PlatformFailure _handlePlatformException(
    flutter_services.PlatformException exception,
  ) {
    switch (exception.code) {
      case 'permission_denied':
        return PlatformFailure.permissionDenied(
          exception.message ?? 'Permission denied',
        );
      case 'service_disabled':
        return PlatformFailure.serviceUnavailable(
          exception.message ?? 'Service disabled',
        );
      case 'not_available':
        return PlatformFailure.featureUnavailable();
      default:
        return PlatformFailure.nativeError(
          '${exception.code}: ${exception.message}',
        );
    }
  }

  /// Show user-friendly error message
  static void showErrorToUser(Failure failure, {bool isPersistent = false}) {
    final message = _getUserFriendlyMessage(failure);

    if (_scaffoldMessengerKey.currentState != null) {
      _scaffoldMessengerKey.currentState!.showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,
          duration: isPersistent
              ? const Duration(seconds: 10)
              : const Duration(seconds: 4),
          action: isPersistent
              ? SnackBarAction(
                  label: 'Dismiss',
                  textColor: Colors.white,
                  onPressed: () {
                    _scaffoldMessengerKey.currentState!.hideCurrentSnackBar();
                  },
                )
              : null,
        ),
      );
    }
  }

  /// Get user-friendly error message
  static String _getUserFriendlyMessage(Failure failure) {
    // Auth failures
    if (failure is AuthFailure) {
      switch (failure.code) {
        case 'INVALID_CREDENTIALS':
          return 'Invalid email or password. Please try again.';
        case 'SESSION_EXPIRED':
          return 'Your session has expired. Please log in again.';
        case 'UNAUTHORIZED':
          return "You don't have permission to perform this action.";
        case 'BIOMETRIC_UNAVAILABLE':
          return 'Biometric authentication is not available on this device.';
        case 'BIOMETRIC_NOT_ENROLLED':
          return 'Please set up biometric authentication in your device settings.';
        default:
          return 'Authentication failed. Please try again.';
      }
    }

    // Network failures
    if (failure is NetworkFailure) {
      switch (failure.code) {
        case 'NO_CONNECTION':
          return 'No internet connection. Please check your network and try again.';
        case 'TIMEOUT':
          return 'Request timed out. Please check your connection and try again.';
        case 'SERVER_ERROR_500':
        case 'SERVER_ERROR_502':
        case 'SERVER_ERROR_503':
          return 'Server is temporarily unavailable. Please try again later.';
        case 'NOT_FOUND':
          return 'The requested resource was not found.';
        case 'FORBIDDEN':
          return "You don't have permission to access this resource.";
        case 'RATE_LIMITED':
          return 'Too many requests. Please wait a moment and try again.';
        default:
          return 'Network error occurred. Please try again.';
      }
    }

    // Business logic failures
    if (failure is BusinessLogicFailure) {
      switch (failure.code) {
        case 'BOOKING_CONFLICT':
          return 'This time slot is no longer available. Please choose another time.';
        case 'INSUFFICIENT_PERMISSIONS':
          return "You don't have permission to perform this action.";
        case 'QUOTA_EXCEEDED':
          return 'You have reached your usage limit for this period.';
        case 'MEMBERSHIP_REQUIRED':
          return 'A valid membership is required for this action.';
        case 'CLUB_NOT_AVAILABLE':
          return 'This club is not available for reciprocal visits.';
        default:
          return failure.message;
      }
    }

    // Location failures
    if (failure is LocationFailure) {
      switch (failure.code) {
        case 'PERMISSION_DENIED':
          return 'Location permission is required. Please enable it in settings.';
        case 'SERVICE_DISABLED':
          return 'Location services are disabled. Please enable them in settings.';
        case 'LOCATION_TIMEOUT':
          return 'Unable to get your location. Please try again.';
        default:
          return 'Location error occurred. Please try again.';
      }
    }

    // Validation failures
    if (failure is ValidationFailure) {
      return failure.message;
    }

    // Generic failures
    return 'An unexpected error occurred. Please try again.';
  }

  /// Report crash to analytics service
  static void _reportCrashToAnalytics(Object error, StackTrace? stack) {
    if (!AppConstants.enableCrashReporting) return;

    try {
      // Firebase Crashlytics or other crash reporting service
      developer.log(
        'Reporting crash to analytics',
        name: 'ErrorHandler',
        error: error,
        stackTrace: stack,
      );
      // TODO(team): Implement crash reporting service integration
    } on Exception catch (e) {
      developer.log(
        'Failed to report crash to analytics: $e',
        name: 'ErrorHandler',
      );
    }
  }

  /// Handle authentication errors specially
  static void handleAuthError(Failure failure) {
    if (failure is AuthFailure && failure.code == 'SESSION_EXPIRED') {
      // Navigate to login screen
      _navigatorKey.currentState?.pushNamedAndRemoveUntil(
        '/login',
        (route) => false,
      );
    }
    showErrorToUser(failure);
  }

  /// Log error for debugging
  static void logError(
    String message, {
    Object? error,
    StackTrace? stackTrace,
  }) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }

  /// Log warning
  static void logWarning(String message, {Object? error}) {
    _logger.w(message, error: error);
  }

  /// Log info
  static void logInfo(String message) {
    _logger.i(message);
  }
}
