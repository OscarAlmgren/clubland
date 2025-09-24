import 'dart:async';
import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';

import '../config/environment_config.dart';
import 'failures.dart';

/// Service for implementing retry logic with exponential backoff
class RetryService {
  static RetryService? _instance;
  final Logger _logger;

  RetryService._() : _logger = Logger();

  static RetryService get instance {
    _instance ??= RetryService._();
    return _instance!;
  }

  /// Execute operation with retry logic
  Future<Either<Failure, T>> executeWithRetry<T>(
    Future<Either<Failure, T>> Function() operation, {
    RetryConfig? config,
    String? operationName,
  }) async {
    final retryConfig = config ?? RetryConfig.defaultConfig;
    final opName = operationName ?? 'Operation';

    for (int attempt = 0; attempt <= retryConfig.maxRetries; attempt++) {
      try {
        _logger.d('$opName: Attempt ${attempt + 1}/${retryConfig.maxRetries + 1}');

        final result = await operation();

        return result.fold(
          (failure) {
            if (attempt == retryConfig.maxRetries || !_shouldRetry(failure, retryConfig)) {
              _logger.e('$opName: Failed after ${attempt + 1} attempts', error: failure);
              return Left(failure);
            }

            final delay = _calculateDelay(attempt, retryConfig);
            _logger.w('$opName: Retrying after ${delay.inMilliseconds}ms due to: ${failure.message}');
            return Left(failure); // Will be handled by retry logic below
          },
          (success) {
            if (attempt > 0) {
              _logger.i('$opName: Succeeded on attempt ${attempt + 1}');
            }
            return Right(success);
          },
        );
      } catch (error, stackTrace) {
        _logger.e('$opName: Unexpected error on attempt ${attempt + 1}', error: error, stackTrace: stackTrace);

        if (attempt == retryConfig.maxRetries) {
          return Left(NetworkFailure.serverError(0, 'Unexpected error: ${error.toString()}'));
        }
      }

      // Wait before next attempt
      if (attempt < retryConfig.maxRetries) {
        final delay = _calculateDelay(attempt, retryConfig);
        await Future<void>.delayed(delay);
      }
    }

    return Left(NetworkFailure.serverError(0, '$opName failed after all retry attempts'));
  }

  /// Execute operation with simple retry (non-Either pattern)
  Future<T> executeWithSimpleRetry<T>(
    Future<T> Function() operation, {
    RetryConfig? config,
    String? operationName,
  }) async {
    final retryConfig = config ?? RetryConfig.defaultConfig;
    final opName = operationName ?? 'Operation';

    Exception? lastException;

    for (int attempt = 0; attempt <= retryConfig.maxRetries; attempt++) {
      try {
        _logger.d('$opName: Attempt ${attempt + 1}/${retryConfig.maxRetries + 1}');

        final result = await operation();

        if (attempt > 0) {
          _logger.i('$opName: Succeeded on attempt ${attempt + 1}');
        }

        return result;
      } catch (error) {
        lastException = error is Exception ? error : Exception(error.toString());

        if (attempt == retryConfig.maxRetries) {
          _logger.e('$opName: Failed after ${attempt + 1} attempts', error: error);
          rethrow;
        }

        final delay = _calculateDelay(attempt, retryConfig);
        _logger.w('$opName: Retrying after ${delay.inMilliseconds}ms due to: ${error.toString()}');

        await Future<void>.delayed(delay);
      }
    }

    throw lastException ?? Exception('$opName failed after all retry attempts');
  }

  /// Calculate delay with exponential backoff and jitter
  Duration _calculateDelay(int attempt, RetryConfig config) {
    final exponentialDelay = config.initialDelay.inMilliseconds * pow(config.backoffMultiplier, attempt);
    final maxDelayMs = config.maxDelay.inMilliseconds;
    final delayMs = min(exponentialDelay, maxDelayMs.toDouble());

    // Add jitter to prevent thundering herd problem
    final jitter = config.enableJitter
        ? Random().nextDouble() * config.jitterFactor * delayMs
        : 0.0;

    final finalDelayMs = (delayMs + jitter).round();
    return Duration(milliseconds: finalDelayMs);
  }

  /// Check if failure should be retried
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
        case String code when code.startsWith('SERVER_ERROR_5'):
          return true;
        case 'SERVER_ERROR_429': // Rate limited
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

  /// Create retry configuration for different scenarios
  static RetryConfig authRetryConfig() => const RetryConfig(
    maxRetries: 2,
    initialDelay: Duration(seconds: 1),
    backoffMultiplier: 1.5,
    maxDelay: Duration(seconds: 5),
    retryAuth: true,
    retryableFailures: [AuthFailure, NetworkFailure],
  );

  static RetryConfig networkRetryConfig() => const RetryConfig(
    maxRetries: 3,
    initialDelay: Duration(milliseconds: 500),
    backoffMultiplier: 2.0,
    maxDelay: Duration(seconds: 10),
    enableJitter: true,
    retryableFailures: [NetworkFailure, GraphQLFailure],
  );

  static RetryConfig criticalRetryConfig() => const RetryConfig(
    maxRetries: 5,
    initialDelay: Duration(milliseconds: 100),
    backoffMultiplier: 1.8,
    maxDelay: Duration(seconds: 30),
    enableJitter: true,
    retryAuth: true,
    retryableFailures: [NetworkFailure, AuthFailure, GraphQLFailure],
  );

  static RetryConfig quickRetryConfig() => const RetryConfig(
    maxRetries: 1,
    initialDelay: Duration(milliseconds: 200),
    backoffMultiplier: 1.0,
    maxDelay: Duration(seconds: 1),
    retryableFailures: [NetworkFailure],
  );
}

/// Configuration for retry behavior
class RetryConfig {
  final int maxRetries;
  final Duration initialDelay;
  final double backoffMultiplier;
  final Duration maxDelay;
  final bool enableJitter;
  final double jitterFactor;
  final bool retryAuth;
  final List<Type> retryableFailures;

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

  static RetryConfig get defaultConfig {
    if (EnvironmentConfig.isDevelopment) {
      return const RetryConfig(
        maxRetries: 2,
        initialDelay: Duration(milliseconds: 500),
        backoffMultiplier: 1.5,
        retryableFailures: [NetworkFailure],
      );
    }

    return const RetryConfig(
      maxRetries: 3,
      initialDelay: Duration(seconds: 1),
      backoffMultiplier: 2.0,
      maxDelay: Duration(seconds: 15),
      enableJitter: true,
      retryableFailures: [NetworkFailure, GraphQLFailure],
    );
  }
}

/// Extension methods for convenient retry usage
extension RetryExtension<T> on Future<Either<Failure, T>> {
  /// Add retry logic to any Either-returning Future
  Future<Either<Failure, T>> withRetry({
    RetryConfig? config,
    String? operationName,
  }) {
    return RetryService.instance.executeWithRetry(
      () => this,
      config: config,
      operationName: operationName,
    );
  }
}

extension SimpleRetryExtension<T> on Future<T> {
  /// Add retry logic to any Future
  Future<T> withSimpleRetry({
    RetryConfig? config,
    String? operationName,
  }) {
    return RetryService.instance.executeWithSimpleRetry(
      () => this,
      config: config,
      operationName: operationName,
    );
  }
}