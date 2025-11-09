import 'package:clubland/core/errors/exceptions.dart';
import 'package:clubland/core/network/graphql_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() {
  group('GraphQLHelpers', () {
    group('Constants', () {
      test('should have correct default timeout durations', () {
        expect(
          GraphQLHelpers.defaultQueryTimeout,
          equals(const Duration(seconds: 15)),
        );
        expect(
          GraphQLHelpers.defaultMutationTimeout,
          equals(const Duration(seconds: 20)),
        );
        expect(
          GraphQLHelpers.defaultSingleItemTimeout,
          equals(const Duration(seconds: 10)),
        );
      });

      test('query timeout should be longer than single-item timeout', () {
        expect(
          GraphQLHelpers.defaultQueryTimeout >
              GraphQLHelpers.defaultSingleItemTimeout,
          isTrue,
        );
      });

      test('mutation timeout should be longer than query timeout', () {
        expect(
          GraphQLHelpers.defaultMutationTimeout >=
              GraphQLHelpers.defaultQueryTimeout,
          isTrue,
        );
      });
    });

    group('Error Classification - isValidationError', () {
      test('should identify GraphQL field validation errors', () {
        final testCases = [
          Exception('Cannot query field "user" on type "Query".'),
          Exception('Cannot query field "event" on type "Query".'),
          Exception(
            'Field "invalidField" doesn\'t exist on type "Mutation".',
          ),
          Exception('Error: Cannot query field "test"'),
        ];

        for (final exception in testCases) {
          expect(
            GraphQLHelpers.isValidationError(exception),
            isTrue,
            reason:
                'Should identify validation error: ${exception.toString()}',
          );
        }
      });

      test('should identify GRAPHQL_VALIDATION_FAILED errors', () {
        final testCases = [
          Exception('GRAPHQL_VALIDATION_FAILED'),
          Exception('Error code: GRAPHQL_VALIDATION_FAILED'),
          Exception(
            'OperationException(graphqlErrors: [GRAPHQL_VALIDATION_FAILED])',
          ),
        ];

        for (final exception in testCases) {
          expect(
            GraphQLHelpers.isValidationError(exception),
            isTrue,
            reason:
                'Should identify GRAPHQL_VALIDATION_FAILED: ${exception.toString()}',
          );
        }
      });

      test('should identify ValidationError exceptions', () {
        final testCases = [
          Exception('ValidationError: Invalid input'),
          Exception('ValidationError occurred'),
          Exception('Error: ValidationError in mutation'),
        ];

        for (final exception in testCases) {
          expect(
            GraphQLHelpers.isValidationError(exception),
            isTrue,
            reason: 'Should identify ValidationError: ${exception.toString()}',
          );
        }
      });

      test('should NOT identify non-validation errors', () {
        final testCases = [
          Exception('Network connection failed'),
          Exception('Server error 500'),
          Exception('Request timeout'),
          NetworkException.timeout(),
          NetworkException.noConnection(),
          NetworkException.serverError(500, 'Internal error'),
        ];

        for (final exception in testCases) {
          expect(
            GraphQLHelpers.isValidationError(exception),
            isFalse,
            reason: 'Should NOT be validation error: ${exception.toString()}',
          );
        }
      });
    });

    group('Error Classification - isTimeoutError', () {
      test('should identify NetworkException timeout errors', () {
        final timeoutException = NetworkException.timeout();
        expect(GraphQLHelpers.isTimeoutError(timeoutException), isTrue);
      });

      test('should identify exceptions containing TIMEOUT', () {
        final testCases = [
          Exception('Request TIMEOUT'),
          Exception('Operation TIMEOUT occurred'),
          Exception('TIMEOUT: Request took too long'),
          Exception('Connection TIMEOUT after 30 seconds'),
        ];

        for (final exception in testCases) {
          expect(
            GraphQLHelpers.isTimeoutError(exception),
            isTrue,
            reason: 'Should identify timeout error: ${exception.toString()}',
          );
        }
      });

      test('should NOT identify non-timeout errors', () {
        final testCases = [
          Exception('Network connection failed'),
          Exception('Cannot query field'),
          NetworkException.noConnection(),
          NetworkException.serverError(500, 'Error'),
          Exception('Server error'),
        ];

        for (final exception in testCases) {
          expect(
            GraphQLHelpers.isTimeoutError(exception),
            isFalse,
            reason: 'Should NOT be timeout error: ${exception.toString()}',
          );
        }
      });
    });

    group('Error Classification - isNetworkError', () {
      test('should identify NetworkException with NO_CONNECTION code', () {
        final networkException = NetworkException.noConnection();
        expect(GraphQLHelpers.isNetworkError(networkException), isTrue);
      });

      test('should identify exceptions containing NO_CONNECTION', () {
        final testCases = [
          Exception('NO_CONNECTION detected'),
          Exception('Error: NO_CONNECTION to server'),
          Exception('Network NO_CONNECTION error'),
        ];

        for (final exception in testCases) {
          expect(
            GraphQLHelpers.isNetworkError(exception),
            isTrue,
            reason: 'Should identify network error: ${exception.toString()}',
          );
        }
      });

      test('should identify SocketException errors', () {
        final testCases = [
          Exception('SocketException: Connection refused'),
          Exception('SocketException: Network is unreachable'),
          Exception('Error: SocketException occurred'),
          Exception('SocketException: Failed to connect'),
        ];

        for (final exception in testCases) {
          expect(
            GraphQLHelpers.isNetworkError(exception),
            isTrue,
            reason: 'Should identify SocketException: ${exception.toString()}',
          );
        }
      });

      test('should NOT identify non-network errors', () {
        final testCases = [
          Exception('Request timeout'),
          Exception('Validation error'),
          Exception('Cannot query field'),
          NetworkException.timeout(),
          NetworkException.serverError(500, 'Error'),
        ];

        for (final exception in testCases) {
          expect(
            GraphQLHelpers.isNetworkError(exception),
            isFalse,
            reason: 'Should NOT be network error: ${exception.toString()}',
          );
        }
      });
    });

    group('Result Helper Methods', () {
      group('isSuccess', () {
        test('should return true for successful result with data', () {
          final result = QueryResult(
            data: {'test': 'data'},
            source: QueryResultSource.network,
          );
          expect(GraphQLHelpers.isSuccess(result), isTrue);
        });

        test('should return false for result with exception', () {
          final result = QueryResult(
            source: QueryResultSource.network,
            exception: OperationException(),
          );
          expect(GraphQLHelpers.isSuccess(result), isFalse);
        });

        test('should return false for result without data', () {
          final result = QueryResult(
            source: QueryResultSource.network,
          );
          expect(GraphQLHelpers.isSuccess(result), isFalse);
        });
      });

      group('getErrorMessage', () {
        test('should return GraphQL error message when present', () {
          final result = QueryResult(
            source: QueryResultSource.network,
            exception: OperationException(
              graphqlErrors: [
                const GraphQLError(message: 'Field not found'),
              ],
            ),
          );
          final message = GraphQLHelpers.getErrorMessage(result);
          expect(message, equals('Field not found'));
        });

        test('should return link exception message when present', () {
          final result = QueryResult(
            source: QueryResultSource.network,
            exception: OperationException(
              linkException: const ServerException(
                parsedResponse: null,
              ),
            ),
          );
          final message = GraphQLHelpers.getErrorMessage(result);
          expect(message, isNotNull);
        });

        test('should return null when no exception', () {
          final result = QueryResult(
            data: {'test': 'data'},
            source: QueryResultSource.network,
          );
          final message = GraphQLHelpers.getErrorMessage(result);
          expect(message, isNull);
        });
      });
    });

    group('Real-World Error Scenarios', () {
      test('should correctly classify Pixel 8 event details error', () {
        // This is the actual error from the Pixel 8 issue
        final pixel8Error = Exception(
          'Cannot query field "event" on type "Query".',
        );

        expect(GraphQLHelpers.isValidationError(pixel8Error), isTrue);
        expect(GraphQLHelpers.isTimeoutError(pixel8Error), isFalse);
        expect(GraphQLHelpers.isNetworkError(pixel8Error), isFalse);
      });

      test('should correctly classify network connectivity issues', () {
        final connectivityErrors = [
          Exception('SocketException: Network is unreachable'),
          NetworkException.noConnection(),
          Exception('NO_CONNECTION to server'),
        ];

        for (final error in connectivityErrors) {
          expect(GraphQLHelpers.isNetworkError(error), isTrue);
          expect(GraphQLHelpers.isValidationError(error), isFalse);
          expect(GraphQLHelpers.isTimeoutError(error), isFalse);
        }
      });

      test('should correctly classify slow API response timeouts', () {
        final timeoutErrors = [
          NetworkException.timeout(),
          Exception('Request TIMEOUT after 30 seconds'),
          Exception('Operation TIMEOUT'),
        ];

        for (final error in timeoutErrors) {
          expect(GraphQLHelpers.isTimeoutError(error), isTrue);
          expect(GraphQLHelpers.isValidationError(error), isFalse);
          expect(GraphQLHelpers.isNetworkError(error), isFalse);
        }
      });
    });
  });
}
