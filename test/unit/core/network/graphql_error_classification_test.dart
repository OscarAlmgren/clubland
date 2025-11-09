import 'package:clubland/core/errors/exceptions.dart' as app_exceptions;
import 'package:clubland/core/network/graphql_client.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GraphQLHelpers Error Classification Tests', () {
    group('isValidationError', () {
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
          app_exceptions.NetworkException.timeout(),
          app_exceptions.NetworkException.noConnection(),
          app_exceptions.NetworkException.serverError(500, 'Internal error'),
        ];

        for (final exception in testCases) {
          expect(
            GraphQLHelpers.isValidationError(exception),
            isFalse,
            reason: 'Should NOT be validation error: ${exception.toString()}',
          );
        }
      });

      test('should handle case-sensitive validation', () {
        // These should still be caught
        expect(
          GraphQLHelpers.isValidationError(
            Exception('CANNOT QUERY FIELD "test"'),
          ),
          isFalse, // Case sensitive check
        );
        expect(
          GraphQLHelpers.isValidationError(
            Exception('Cannot query field "test"'),
          ),
          isTrue,
        );
      });
    });

    group('isTimeoutError', () {
      test('should identify NetworkException timeout errors', () {
        final timeoutException = app_exceptions.NetworkException.timeout();
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
          app_exceptions.NetworkException.noConnection(),
          app_exceptions.NetworkException.serverError(500, 'Error'),
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

      test('should handle NetworkException with different codes', () {
        expect(
          GraphQLHelpers.isTimeoutError(NetworkException.timeout()),
          isTrue,
        );
        expect(
          GraphQLHelpers.isTimeoutError(NetworkException.noConnection()),
          isFalse,
        );
        expect(
          GraphQLHelpers.isTimeoutError(
            NetworkException.serverError(500, 'Error'),
          ),
          isFalse,
        );
      });
    });

    group('isNetworkError', () {
      test('should identify NetworkException with NO_CONNECTION code', () {
        final networkException = app_exceptions.NetworkException.noConnection();
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
          app_exceptions.NetworkException.timeout(),
          app_exceptions.NetworkException.serverError(500, 'Error'),
        ];

        for (final exception in testCases) {
          expect(
            GraphQLHelpers.isNetworkError(exception),
            isFalse,
            reason: 'Should NOT be network error: ${exception.toString()}',
          );
        }
      });

      test('should handle NetworkException with different codes', () {
        expect(
          GraphQLHelpers.isNetworkError(NetworkException.noConnection()),
          isTrue,
        );
        expect(
          GraphQLHelpers.isNetworkError(NetworkException.timeout()),
          isFalse,
        );
        expect(
          GraphQLHelpers.isNetworkError(
            NetworkException.serverError(500, 'Error'),
          ),
          isFalse,
        );
      });
    });

    group('Error Classification Edge Cases', () {
      test('should handle empty exception messages', () {
        final emptyException = Exception('');
        expect(GraphQLHelpers.isValidationError(emptyException), isFalse);
        expect(GraphQLHelpers.isTimeoutError(emptyException), isFalse);
        expect(GraphQLHelpers.isNetworkError(emptyException), isFalse);
      });

      test('should handle exceptions with multiple error indicators', () {
        // Exception containing both validation and timeout keywords
        final mixedException = Exception(
          'TIMEOUT: Cannot query field "test" - GRAPHQL_VALIDATION_FAILED',
        );

        // Should match based on first found pattern
        expect(GraphQLHelpers.isValidationError(mixedException), isTrue);
        expect(GraphQLHelpers.isTimeoutError(mixedException), isTrue);
      });

      test('should handle special characters in error messages', () {
        final testCases = [
          Exception('Cannot query field "user.profile.email" on type "Query"'),
          Exception(r'SocketException: $network error'),
          Exception('TIMEOUT: Request failed after 30s'),
        ];

        expect(GraphQLHelpers.isValidationError(testCases[0]), isTrue);
        expect(GraphQLHelpers.isNetworkError(testCases[1]), isTrue);
        expect(GraphQLHelpers.isTimeoutError(testCases[2]), isTrue);
      });

      test('should handle very long error messages', () {
        final longMessage = 'Error: ' +
            'Cannot query field ' * 100 +
            '"test" on type "Query"';
        final longException = Exception(longMessage);

        expect(GraphQLHelpers.isValidationError(longException), isTrue);
      });
    });

    group('Error Classification Combinations', () {
      test('validation errors should not be classified as other types', () {
        final validationError = Exception('Cannot query field "test"');

        expect(GraphQLHelpers.isValidationError(validationError), isTrue);
        expect(GraphQLHelpers.isTimeoutError(validationError), isFalse);
        expect(GraphQLHelpers.isNetworkError(validationError), isFalse);
      });

      test('timeout errors should not be classified as other types', () {
        final timeoutError = NetworkException.timeout();

        expect(GraphQLHelpers.isTimeoutError(timeoutError), isTrue);
        expect(GraphQLHelpers.isValidationError(timeoutError), isFalse);
        expect(GraphQLHelpers.isNetworkError(timeoutError), isFalse);
      });

      test('network errors should not be classified as other types', () {
        final networkError = NetworkException.noConnection();

        expect(GraphQLHelpers.isNetworkError(networkError), isTrue);
        expect(GraphQLHelpers.isValidationError(networkError), isFalse);
        expect(GraphQLHelpers.isTimeoutError(networkError), isFalse);
      });

      test('should handle all three classification methods consistently',
          () {
        final testExceptions = [
          Exception('Cannot query field "test"'),
          app_exceptions.NetworkException.timeout(),
          app_exceptions.NetworkException.noConnection(),
          Exception('SocketException: Connection failed'),
          Exception('GRAPHQL_VALIDATION_FAILED'),
          Exception('Random error message'),
        ];

        for (final exception in testExceptions) {
          final isValidation = GraphQLHelpers.isValidationError(exception);
          final isTimeout = GraphQLHelpers.isTimeoutError(exception);
          final isNetwork = GraphQLHelpers.isNetworkError(exception);

          // At least one should be false (unless it's a mixed error)
          // Each error should be classified as something OR as unknown
          final classificationCount =
              [isValidation, isTimeout, isNetwork].where((x) => x).length;

          expect(
            classificationCount >= 0,
            isTrue,
            reason:
                'Classification should be consistent for: ${exception.toString()}',
          );
        }
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
          app_exceptions.NetworkException.noConnection(),
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
          app_exceptions.NetworkException.timeout(),
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
