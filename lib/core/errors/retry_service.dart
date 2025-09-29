import 'dart:async';
import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';

import '../config/environment_config.dart';
import 'failures.dart';

/// Service for implementing retry logic with exponential backoff
class RetryService {
  /// Gets the singleton instance of the [RetryService].
  factory RetryService() {
    _instance ??= RetryService._();
    return _instance!;
  }

  RetryService._() : _logger = Logger();
  static RetryService? _instance;
  final Logger _logger;

  /// Execute operation with retry logic.
  ///
  /// This method is designed for operations that return an [Either] and handles
  /// exponential backoff based on retryable failures.
  Future<Either<Failure, T>> executeWithRetry<T>(
    Future<Either<Failure, T>> Function() operation, {

    /// Optional configuration to override the default retry behavior.
    RetryConfig? config,

    /// A name used for logging to identify the operation.
    String? operationName,
  }) async {
    final retryConfig = config ?? RetryConfig.defaultConfig();
    final opName = operationName ?? 'Operation';
    Either<Failure, T>? lastResult;

    for (var attempt = 0; attempt <= retryConfig.maxRetries; attempt++) {
      try {
        _logger.d(
          '$opName: Attempt ${attempt + 1}/${retryConfig.maxRetries + 1}',
        );

        final result = await operation();
        lastResult = result;

        final shouldReturn = result.fold(
          (failure) {
            if (attempt == retryConfig.maxRetries ||
                !_shouldRetry(failure, retryConfig)) {
              _logger.e(
                '$opName: Failed after ${attempt + 1} attempts',
                error: failure,
              );
              return true; // Stop retrying
            }

            _logger.w(
              '$opName: Retrying after delay due to: ${failure.message}',
            );
            return false; // Continue retrying
          },
          (success) {
            if (attempt > 0) {
              _logger.i('$opName: Succeeded on attempt ${attempt + 1}');
            }
            return true; // Stop retrying
          },
        );

        if (shouldReturn) {
          return result;
        }
      } on Exception catch (error, stackTrace) {
        _logger.e(
          '$opName: Unexpected error on attempt ${attempt + 1}',
          error: error,
          stackTrace: stackTrace,
        );

        if (attempt == retryConfig.maxRetries) {
          return Left(
            NetworkFailure.serverError(0, 'Unexpected error: $error'),
          );
        }
      }

      // Wait before next attempt
      if (attempt < retryConfig.maxRetries) {
        final delay = _calculateDelay(attempt, retryConfig);
        await Future<void>.delayed(delay);
      }
    }

    return lastResult ?? Left(
      NetworkFailure.serverError(0, '$opName failed after all retry attempts'),
    );
  }

  /// Execute operation with simple retry (non-Either pattern).
  ///
  /// This method is designed for operations that throw exceptions.
  Future<T> executeWithSimpleRetry<T>(
    Future<T> Function() operation, {

    /// Optional configuration to override the default retry behavior.
    RetryConfig? config,

    /// A name used for logging to identify the operation.
    String? operationName,
  }) async {
    final retryConfig = config ?? RetryConfig.defaultConfig();
    final opName = operationName ?? 'Operation';

    Exception? lastException;

    for (var attempt = 0; attempt <= retryConfig.maxRetries; attempt++) {
      try {
        _logger.d(
          '$opName: Attempt ${attempt + 1}/${retryConfig.maxRetries + 1}',
        );

        final result = await operation();

        if (attempt > 0) {
          _logger.i('$opName: Succeeded on attempt ${attempt + 1}');
        }

        return result;
      } catch (error) {
        lastException = error is Exception
            ? error
            : Exception(error.toString());

        if (attempt == retryConfig.maxRetries) {
          _logger.e(
            '$opName: Failed after ${attempt + 1} attempts',
            error: error,
          );
          rethrow;
        }

        final delay = _calculateDelay(attempt, retryConfig);
        _logger.w(
          '$opName: Retrying after ${delay.inMilliseconds}ms due to: $error',
        );

        await Future<void>.delayed(delay);
      }
    }

    throw lastException ?? Exception('$opName failed after all retry attempts');
  }

  /// Calculate delay with exponential backoff and jitter.
  Duration _calculateDelay(int attempt, RetryConfig config) {
    final exponentialDelay =
        config.initialDelay.inMilliseconds *
        pow(config.backoffMultiplier, attempt);
    final maxDelayMs = config.maxDelay.inMilliseconds;
    final delayMs = min(exponentialDelay, maxDelayMs.toDouble());

    // Add jitter to prevent thundering herd problem
    final jitter = config.enableJitter
        ? Random().nextDouble() * config.jitterFactor * delayMs
        : 0.0;

    final finalDelayMs = (delayMs + jitter).round();
    return Duration(milliseconds: finalDelayMs);
  }

  /// Check if failure should be retried based on configuration and failure type.
  bool _shouldRetry(Failure failure, RetryConfig config) {
    // Check if failure type is in retryable list
    if (!config.retryableFailures.any((type) => failure.runtimeType == type)) {
      return false;
    }

    // Specific retry logic for different failure types
    if (failure is NetworkFailure) {
      switch (failure.code) {
        case 'TIMEOUT':
        case 'NO_CONNECTION':
        case 'REQUEST_CANCELLED':
          return true;
        case final String code when code.startsWith('SERVER_ERROR_5'):
          return true;
        case 'SERVER_ERROR_429': // Rate limited (HTTP 429)
        case 'RATE_LIMITED': // Rate limited (general)
          return true;
        default:
          return false;
      }
    }

    if (failure is AuthFailure) {
      switch (failure.code) {
        case 'TOKEN_REFRESH_FAILED':
        case 'SESSION_EXPIRED':
          return config.retryAuth;
        default:
          return false;
      }
    }

    if (failure is GraphQLFailure) {
      switch (failure.code) {
        case 'NETWORK_ERROR':
        case 'TIMEOUT':
        case 'RATE_LIMITED':
          return true;
        default:
          return false;
      }
    }

    return false;
  }

  /// Create retry configuration tailored for authentication operations.
  static RetryConfig authRetryConfig() => const RetryConfig(
    maxRetries: 2,
    backoffMultiplier: 1.5,
    maxDelay: Duration(seconds: 5),
    retryAuth: true,
    retryableFailures: [AuthFailure, NetworkFailure],
  );

  /// Create retry configuration tailored for general network operations.
  static RetryConfig networkRetryConfig() => const RetryConfig(
    initialDelay: Duration(milliseconds: 500),
    maxDelay: Duration(seconds: 10),
    enableJitter: true,
    retryableFailures: [NetworkFailure, GraphQLFailure],
  );

  /// Create retry configuration for critical operations that require high resilience.
  static RetryConfig criticalRetryConfig() => const RetryConfig(
    maxRetries: 5,
    initialDelay: Duration(milliseconds: 100),
    backoffMultiplier: 1.8,
    enableJitter: true,
    retryAuth: true,
    retryableFailures: [NetworkFailure, AuthFailure, GraphQLFailure],
  );

  /// Create a quick retry configuration for minimal latency delay.
  static RetryConfig quickRetryConfig() => const RetryConfig(
    maxRetries: 1,
    initialDelay: Duration(milliseconds: 200),
    backoffMultiplier: 1.0,
    maxDelay: Duration(seconds: 1),
  );
}

// -----------------------------------------------------------------------------

/// Configuration for retry behavior
class RetryConfig {
  /// Creates a configuration for retry behavior.
  const RetryConfig({
    this.maxRetries = 3,
    this.initialDelay = const Duration(seconds: 1),
    this.backoffMultiplier = 2.0,
    this.maxDelay = const Duration(seconds: 30),
    this.enableJitter = false,
    this.jitterFactor = 0.1,
    this.retryAuth = false,
    this.retryableFailures = const [NetworkFailure],
  });

  /// The maximum number of times the operation will be retried.
  final int maxRetries;

  /// The delay duration before the first retry attempt.
  final Duration initialDelay;

  /// The factor by which the delay increases with each subsequent retry.
  final double backoffMultiplier;

  /// The maximum duration for any calculated delay.
  final Duration maxDelay;

  /// Whether to add random "jitter" to the delay to prevent burst retries.
  final bool enableJitter;

  /// The percentage (as a fraction of 1.0) of the calculated delay to use for jitter.
  final double jitterFactor;

  /// Whether to attempt retry on authentication-related failures.
  final bool retryAuth;

  /// A list of [Failure] types that should trigger a retry.
  final List<Type> retryableFailures;

  /// Gets the default configuration based on the current environment.
  factory RetryConfig.defaultConfig() {
    if (EnvironmentConfig.isDevelopment) {
      return const RetryConfig(
        maxRetries: 2,
        initialDelay: Duration(milliseconds: 500),
        backoffMultiplier: 1.5,
      );
    }

    return const RetryConfig(
      maxDelay: Duration(seconds: 15),
      enableJitter: true,
      retryableFailures: [NetworkFailure, GraphQLFailure],
    );
  }
}

// Note: Extension methods for retry functionality have been removed because
// they cannot properly implement retry logic. Retry requires re-executing
// the original operation, which is not possible with an already-created Future.
//
// Use RetryService.instance.executeWithRetry() or executeWithSimpleRetry() directly
// by passing a function that creates the Future, not the Future itself.
