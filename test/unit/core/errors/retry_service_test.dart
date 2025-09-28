import 'package:clubland/core/errors/failures.dart';
import 'package:clubland/core/errors/retry_service.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late RetryService retryService;

  setUp(() {
    retryService = RetryService.instance;
  });

  tearDown(() {
    // Reset any potential state between tests
    // Note: RetryService is a singleton but doesn't maintain persistent state
    // This is here for completeness and future-proofing
  });

  group('RetryService', () {
    group('executeWithRetry', () {
      test('should return success on first attempt', () async {
        var callCount = 0;

        Future<Either<Failure, String>> operation() async {
          callCount++;
          return const Right('success');
        }

        final result = await retryService.executeWithRetry(
          operation,
          config: const RetryConfig(),
          operationName: 'testOperation',
        );

        expect(result.isRight(), isTrue);
        result.fold(
          (failure) => fail('Expected success but got failure: $failure'),
          (value) => expect(value, equals('success')),
        );
        expect(callCount, equals(1));
      });

      test('should retry on retryable failure and succeed', () async {
        var callCount = 0;

        Future<Either<Failure, String>> operation() async {
          callCount++;
          if (callCount == 1) {
            return Left(NetworkFailure.timeout());
          }
          return const Right('success');
        }

        final result = await retryService.executeWithRetry(
          operation,
          config: const RetryConfig(initialDelay: Duration(milliseconds: 10)),
          operationName: 'testOperation',
        );

        expect(result.isRight(), isTrue);
        result.fold(
          (failure) => fail('Expected success but got failure: $failure'),
          (value) => expect(value, equals('success')),
        );
        expect(callCount, equals(2));
      });

      test('should exhaust retries and return failure', () async {
        var callCount = 0;

        Future<Either<Failure, String>> operation() async {
          callCount++;
          return Left(NetworkFailure.timeout());
        }

        final result = await retryService.executeWithRetry(
          operation,
          config: const RetryConfig(
            maxRetries: 2,
            initialDelay: Duration(milliseconds: 10),
          ),
          operationName: 'testOperation',
        );

        expect(result.isLeft(), isTrue);
        result.fold(
          (failure) => expect(failure, isA<NetworkFailure>()),
          (value) => fail('Expected failure but got success: $value'),
        );
        expect(callCount, equals(3)); // Initial attempt + 2 retries
      });

      test('should not retry non-retryable failure', () async {
        var callCount = 0;

        Future<Either<Failure, String>> operation() async {
          callCount++;
          return Left(AuthFailure.invalidCredentials());
        }

        final result = await retryService.executeWithRetry(
          operation,
          config: const RetryConfig(initialDelay: Duration(milliseconds: 10)),
          operationName: 'testOperation',
        );

        expect(result.isLeft(), isTrue);
        result.fold(
          (failure) => expect(failure, isA<AuthFailure>()),
          (value) => fail('Expected failure but got success: $value'),
        );
        expect(callCount, equals(1)); // Should not retry
      });

      test('should handle exceptions and convert to failures', () async {
        var callCount = 0;

        Future<Either<Failure, String>> operation() async {
          callCount++;
          throw Exception('Test exception');
        }

        final result = await retryService.executeWithRetry(
          operation,
          config: const RetryConfig(
            maxRetries: 1,
            initialDelay: Duration(milliseconds: 10),
          ),
          operationName: 'testOperation',
        );

        expect(result.isLeft(), isTrue);
        result.fold(
          (failure) => expect(failure, isA<NetworkFailure>()),
          (value) => fail('Expected failure but got success: $value'),
        );
        expect(callCount, equals(2)); // Initial attempt + 1 retry
      });
    });

    group('executeWithSimpleRetry', () {
      test('should return success on first attempt', () async {
        var callCount = 0;

        Future<String> operation() async {
          callCount++;
          return 'success';
        }

        final result = await retryService.executeWithSimpleRetry(
          operation,
          config: const RetryConfig(),
          operationName: 'testOperation',
        );

        expect(result, equals('success'));
        expect(callCount, equals(1));
      });

      test('should retry on exception and succeed', () async {
        var callCount = 0;

        Future<String> operation() async {
          callCount++;
          if (callCount == 1) {
            throw Exception('Temporary error');
          }
          return 'success';
        }

        final result = await retryService.executeWithSimpleRetry(
          operation,
          config: const RetryConfig(initialDelay: Duration(milliseconds: 10)),
          operationName: 'testOperation',
        );

        expect(result, equals('success'));
        expect(callCount, equals(2));
      });

      test('should exhaust retries and throw exception', () async {
        Future<String> operation() async {
          throw Exception('Persistent error');
        }

        expect(
          () => retryService.executeWithSimpleRetry(
            operation,
            config: const RetryConfig(
              maxRetries: 2,
              initialDelay: Duration(milliseconds: 10),
            ),
            operationName: 'testOperation',
          ),
          throwsException,
        );
      });
    });

    group('retry logic', () {
      test('should retry timeout failures', () async {
        var callCount = 0;

        Future<Either<Failure, String>> operation() async {
          callCount++;
          if (callCount == 1) {
            return Left(NetworkFailure.timeout());
          }
          return const Right('success');
        }

        final result = await retryService.executeWithRetry(
          operation,
          config: const RetryConfig(
            maxRetries: 1,
            initialDelay: Duration(milliseconds: 10),
          ),
        );

        expect(result.isRight(), isTrue);
        expect(callCount, equals(2));
      });

      test('should retry no connection failures', () async {
        var callCount = 0;

        Future<Either<Failure, String>> operation() async {
          callCount++;
          if (callCount == 1) {
            return Left(NetworkFailure.noConnection());
          }
          return const Right('success');
        }

        final result = await retryService.executeWithRetry(
          operation,
          config: const RetryConfig(
            maxRetries: 1,
            initialDelay: Duration(milliseconds: 10),
          ),
        );

        expect(result.isRight(), isTrue);
        expect(callCount, equals(2));
      });

      test('should retry 5xx server errors', () async {
        var callCount = 0;

        Future<Either<Failure, String>> operation() async {
          callCount++;
          if (callCount == 1) {
            return Left(
              NetworkFailure.serverError(500, 'Internal server error'),
            );
          }
          return const Right('success');
        }

        final result = await retryService.executeWithRetry(
          operation,
          config: const RetryConfig(
            maxRetries: 1,
            initialDelay: Duration(milliseconds: 10),
          ),
        );

        expect(result.isRight(), isTrue);
        expect(callCount, equals(2));
      });

      test('should retry rate limited failures', () async {
        var callCount = 0;

        Future<Either<Failure, String>> operation() async {
          callCount++;
          if (callCount == 1) {
            return Left(NetworkFailure.rateLimited());
          }
          return const Right('success');
        }

        final result = await retryService.executeWithRetry(
          operation,
          config: const RetryConfig(
            maxRetries: 1,
            initialDelay: Duration(milliseconds: 10),
          ),
        );

        expect(result.isRight(), isTrue);
        expect(callCount, equals(2));
      });

      test('should not retry 4xx client errors', () async {
        var callCount = 0;

        Future<Either<Failure, String>> operation() async {
          callCount++;
          return Left(NetworkFailure.badRequest('Bad request'));
        }

        final result = await retryService.executeWithRetry(
          operation,
          config: const RetryConfig(initialDelay: Duration(milliseconds: 10)),
        );

        expect(result.isLeft(), isTrue);
        expect(callCount, equals(1)); // Should not retry
      });

      test('should retry auth failures when retryAuth is enabled', () async {
        var callCount = 0;

        Future<Either<Failure, String>> operation() async {
          callCount++;
          if (callCount == 1) {
            return Left(AuthFailure.tokenRefreshFailed());
          }
          return const Right('success');
        }

        final result = await retryService.executeWithRetry(
          operation,
          config: const RetryConfig(
            maxRetries: 1,
            initialDelay: Duration(milliseconds: 10),
            retryAuth: true,
            retryableFailures: [AuthFailure],
          ),
        );

        expect(result.isRight(), isTrue);
        expect(callCount, equals(2));
      });

      test(
        'should not retry auth failures when retryAuth is disabled',
        () async {
          var callCount = 0;

          Future<Either<Failure, String>> operation() async {
            callCount++;
            return Left(AuthFailure.tokenRefreshFailed());
          }

          final result = await retryService.executeWithRetry(
            operation,
            config: const RetryConfig(
              initialDelay: Duration(milliseconds: 10),
              retryableFailures: [AuthFailure],
            ),
          );

          expect(result.isLeft(), isTrue);
          expect(callCount, equals(1)); // Should not retry
        },
      );
    });

    group('retry configurations', () {
      test('should use default config', () {
        final config = RetryConfig.defaultConfig;

        expect(config.maxRetries, greaterThan(0));
        expect(config.initialDelay, greaterThan(Duration.zero));
        expect(config.retryableFailures, isNotEmpty);
      });

      test('should create auth retry config', () {
        final config = RetryService.authRetryConfig();

        expect(config.retryAuth, isTrue);
        expect(config.retryableFailures, contains(AuthFailure));
        expect(config.retryableFailures, contains(NetworkFailure));
      });

      test('should create network retry config', () {
        final config = RetryService.networkRetryConfig();

        expect(config.enableJitter, isTrue);
        expect(config.retryableFailures, contains(NetworkFailure));
        expect(config.retryableFailures, contains(GraphQLFailure));
      });

      test('should create critical retry config', () {
        final config = RetryService.criticalRetryConfig();

        expect(config.maxRetries, greaterThanOrEqualTo(5));
        expect(config.enableJitter, isTrue);
        expect(config.retryAuth, isTrue);
        expect(config.retryableFailures, contains(NetworkFailure));
        expect(config.retryableFailures, contains(AuthFailure));
        expect(config.retryableFailures, contains(GraphQLFailure));
      });

      test('should create quick retry config', () {
        final config = RetryService.quickRetryConfig();

        expect(config.maxRetries, equals(1));
        expect(config.maxDelay.inSeconds, lessThanOrEqualTo(1));
      });
    });

    group('delay calculation', () {
      test('should calculate exponential backoff', () async {
        const config = RetryConfig(
          initialDelay: Duration(milliseconds: 100),
          maxDelay: Duration(seconds: 10),
        );

        // Test delay calculation through actual retry execution
        var callCount = 0;

        Future<Either<Failure, String>> operation() async {
          callCount++;
          if (callCount <= 3) {
            return Left(NetworkFailure.timeout());
          }
          return const Right('success');
        }

        await retryService.executeWithRetry(operation, config: config);

        // Should have made 4 calls (1 initial + 3 retries)
        expect(callCount, equals(4));
      });

      test('should respect max delay', () async {
        const config = RetryConfig(
          initialDelay: Duration(milliseconds: 500),
          backoffMultiplier: 10.0,
          maxDelay: Duration(milliseconds: 100), // Much smaller than calculated delay
        );

        var callCount = 0;

        Future<Either<Failure, String>> operation() async {
          callCount++;
          if (callCount <= 2) {
            return Left(NetworkFailure.timeout());
          }
          return const Right('success');
        }

        // This should complete quickly due to maxDelay limit
        final stopwatch = Stopwatch()..start();

        await retryService.executeWithRetry(operation, config: config);

        stopwatch.stop();

        // Should complete in less than 1 second (would be much longer without maxDelay)
        // Using more generous timing to account for test environment variability
        expect(stopwatch.elapsedMilliseconds, lessThan(1000));
        expect(callCount, equals(3));
      });
    });

    group('singleton pattern', () {
      test('should return same instance', () {
        final instance1 = RetryService.instance;
        final instance2 = RetryService.instance;

        expect(instance1, same(instance2));
      });
    });

    group('direct retry service usage', () {
      test('should use executeWithRetry directly', () async {
        // Test direct usage of RetryService without extension methods
        var callCount = 0;

        Future<Either<Failure, String>> operation() async {
          callCount++;
          return const Right('success');
        }

        final result = await retryService.executeWithRetry(
          operation,
          config: const RetryConfig(
            maxRetries: 1,
            initialDelay: Duration(milliseconds: 10),
          ),
          operationName: 'testOperation',
        );

        expect(result.isRight(), isTrue);
        result.fold(
          (failure) => fail('Expected success but got failure: $failure'),
          (value) => expect(value, equals('success')),
        );
        expect(callCount, equals(1));
      });

      test('should use executeWithSimpleRetry directly', () async {
        // Test direct usage of RetryService for simple operations
        var callCount = 0;

        Future<String> operation() async {
          callCount++;
          if (callCount == 1) {
            throw Exception('First attempt fails');
          }
          return 'success';
        }

        final result = await retryService.executeWithSimpleRetry(
          operation,
          config: const RetryConfig(
            maxRetries: 1,
            initialDelay: Duration(milliseconds: 10),
          ),
          operationName: 'testOperation',
        );

        expect(result, equals('success'));
        expect(callCount, equals(2));
      });
    });
  });
}
