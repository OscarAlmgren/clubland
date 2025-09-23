import 'package:flutter_test/flutter_test.dart';

import '../../../../lib/core/errors/failures.dart';

void main() {
  group('Failure Classes', () {
    group('NetworkFailure', () {
      test('should create no connection failure', () {
        final failure = NetworkFailure.noConnection();
        expect(failure.message, 'No internet connection available');
        expect(failure.code, 'NO_CONNECTION');
        expect(failure.toString(), contains('Failure'));
        expect(failure.toString(), contains('No internet connection available'));
      });

      test('should create timeout failure', () {
        final failure = NetworkFailure.timeout();
        expect(failure.message, 'Request timed out');
        expect(failure.code, 'TIMEOUT');
      });

      test('should create server error failure', () {
        final failure = NetworkFailure.serverError(500, 'Internal Server Error');
        expect(failure.message, 'Server error: Internal Server Error');
        expect(failure.code, 'SERVER_ERROR_500');
      });

      test('should create bad request failure', () {
        final failure = NetworkFailure.badRequest('Invalid parameters');
        expect(failure.message, 'Bad request: Invalid parameters');
        expect(failure.code, 'BAD_REQUEST');
      });

      test('should support equality comparison', () {
        final failure1 = NetworkFailure.noConnection();
        final failure2 = NetworkFailure.noConnection();
        expect(failure1, equals(failure2));
      });
    });

    group('AuthFailure', () {
      test('should create invalid credentials failure', () {
        final failure = AuthFailure.invalidCredentials();
        expect(failure.message, 'Invalid credentials provided');
        expect(failure.code, 'INVALID_CREDENTIALS');
      });

      test('should create session expired failure', () {
        final failure = AuthFailure.sessionExpired();
        expect(failure.message, 'Session has expired');
        expect(failure.code, 'SESSION_EXPIRED');
      });

      test('should create unauthorized failure', () {
        final failure = AuthFailure.unauthorized();
        expect(failure.message, 'Unauthorized access');
        expect(failure.code, 'UNAUTHORIZED');
      });

      test('should create unexpected error failure', () {
        final failure = AuthFailure.unexpected('Custom error');
        expect(failure.message, 'Unexpected authentication error: Custom error');
        expect(failure.code, 'UNEXPECTED_ERROR');
      });

      test('should create not implemented failure', () {
        final failure = AuthFailure.notImplemented();
        expect(failure.message, 'Authentication feature not implemented');
        expect(failure.code, 'NOT_IMPLEMENTED');
      });

      test('should support equality comparison', () {
        final failure1 = AuthFailure.invalidCredentials();
        final failure2 = AuthFailure.invalidCredentials();
        expect(failure1, equals(failure2));
      });

      test('should support inequality comparison', () {
        final failure1 = AuthFailure.invalidCredentials();
        final failure2 = AuthFailure.sessionExpired();
        expect(failure1, isNot(equals(failure2)));
      });
    });

    group('CacheFailure', () {
      test('should create retrieval failed failure', () {
        final failure = CacheFailure.retrievalFailed('Cache miss');
        expect(failure.message, 'Failed to retrieve from cache: Cache miss');
        expect(failure.code, 'CACHE_RETRIEVAL_FAILED');
      });

      test('should create storage failed failure', () {
        final failure = CacheFailure.storageFailed('Disk full');
        expect(failure.message, 'Failed to store in cache: Disk full');
        expect(failure.code, 'CACHE_STORAGE_FAILED');
      });

      test('should create deletion failed failure', () {
        final failure = CacheFailure.deletionFailed('Permission denied');
        expect(failure.message, 'Failed to delete from cache: Permission denied');
        expect(failure.code, 'CACHE_DELETION_FAILED');
      });

      test('should create not found failure', () {
        final failure = CacheFailure.notFound();
        expect(failure.message, 'Cache entry not found');
        expect(failure.code, 'CACHE_NOT_FOUND');
      });

      test('should support equality comparison', () {
        final failure1 = CacheFailure.notFound();
        final failure2 = CacheFailure.notFound();
        expect(failure1, equals(failure2));
      });
    });

    group('StorageFailure', () {
      test('should create encryption failed failure', () {
        final failure = StorageFailure.encryptionFailed();
        expect(failure.message, 'Failed to encrypt data');
        expect(failure.code, 'ENCRYPTION_FAILED');
      });

      test('should create decryption failed failure', () {
        final failure = StorageFailure.decryptionFailed();
        expect(failure.message, 'Failed to decrypt data');
        expect(failure.code, 'DECRYPTION_FAILED');
      });

      test('should create write error failure', () {
        final failure = StorageFailure.writeError();
        expect(failure.message, 'Failed to write to storage');
        expect(failure.code, 'WRITE_ERROR');
      });

      test('should create read error failure', () {
        final failure = StorageFailure.readError();
        expect(failure.message, 'Failed to read from storage');
        expect(failure.code, 'READ_ERROR');
      });

      test('should support equality comparison', () {
        final failure1 = StorageFailure.readError();
        final failure2 = StorageFailure.readError();
        expect(failure1, equals(failure2));
      });
    });

    group('ValidationFailure', () {
      test('should create invalid email failure', () {
        final failure = ValidationFailure.invalidEmail();
        expect(failure.message, 'Invalid email format');
        expect(failure.code, 'INVALID_EMAIL');
      });

      test('should create password too weak failure', () {
        final failure = ValidationFailure.passwordTooWeak();
        expect(failure.message, 'Password does not meet requirements');
        expect(failure.code, 'WEAK_PASSWORD');
      });

      test('should create field required failure', () {
        final failure = ValidationFailure.fieldRequired('username');
        expect(failure.message, 'username is required');
        expect(failure.code, 'FIELD_REQUIRED');
      });

      test('should support equality comparison', () {
        final failure1 = ValidationFailure.invalidEmail();
        final failure2 = ValidationFailure.invalidEmail();
        expect(failure1, equals(failure2));
      });
    });

    group('Common Failure Behavior', () {
      test('all failures should have toString implementation', () {
        final failures = [
          NetworkFailure.noConnection(),
          AuthFailure.invalidCredentials(),
          CacheFailure.notFound(),
          StorageFailure.readError(),
        ];

        for (final failure in failures) {
          final string = failure.toString();
          expect(string, isNotEmpty);
          expect(string, contains('Failure'));
          expect(string, contains(failure.message));
        }
      });

      test('all failures should implement equality', () {
        final networkFailure1 = NetworkFailure.noConnection();
        final networkFailure2 = NetworkFailure.noConnection();
        final authFailure = AuthFailure.invalidCredentials();

        expect(networkFailure1, equals(networkFailure2));
        expect(networkFailure1, isNot(equals(authFailure)));
      });

      test('failures should include error codes in toString', () {
        final failure = AuthFailure.invalidCredentials();
        final string = failure.toString();
        expect(string, contains('INVALID_CREDENTIALS'));
      });
    });
  });
}