import 'dart:convert';

import 'package:clubland/core/security/encryption_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late EncryptionService encryptionService;

  setUp(() {
    encryptionService = EncryptionService.instance;
  });

  group('EncryptionService', () {
    group('text encryption/decryption', () {
      test('should encrypt and decrypt text successfully', () {
        const plaintext = 'Hello, World!';

        final encrypted = encryptionService.encryptText(plaintext);
        expect(encrypted, isNotEmpty);
        expect(encrypted, isNot(plaintext));

        final decrypted = encryptionService.decryptText(encrypted);
        expect(decrypted, equals(plaintext));
      });

      test('should produce different encrypted values for same input', () {
        const plaintext = 'Hello, World!';

        final encrypted1 = encryptionService.encryptText(plaintext);
        final encrypted2 = encryptionService.encryptText(plaintext);

        expect(encrypted1, isNot(equals(encrypted2)));

        // But both should decrypt to same plaintext
        final decrypted1 = encryptionService.decryptText(encrypted1);
        final decrypted2 = encryptionService.decryptText(encrypted2);

        expect(decrypted1, equals(plaintext));
        expect(decrypted2, equals(plaintext));
      });

      test('should throw exception for invalid encrypted data', () {
        expect(
          () => encryptionService.decryptText('invalid-data'),
          throwsA(isA<EncryptionException>()),
        );
      });

      test('should throw exception for empty encrypted data', () {
        expect(
          () => encryptionService.decryptText(''),
          throwsA(isA<EncryptionException>()),
        );
      });
    });

    group('JSON encryption/decryption', () {
      test('should encrypt and decrypt JSON successfully', () {
        final jsonData = {
          'name': 'John Doe',
          'email': 'john@example.com',
          'age': 30,
          'isActive': true,
        };

        final encrypted = encryptionService.encryptJson(jsonData);
        expect(encrypted, isNotEmpty);

        final decrypted = encryptionService.decryptJson(encrypted);
        expect(decrypted, equals(jsonData));
      });

      test('should handle nested JSON objects', () {
        final jsonData = {
          'user': {
            'profile': {
              'name': 'John Doe',
              'preferences': ['setting1', 'setting2'],
            },
          },
          'metadata': {
            'created': '2023-01-01T00:00:00Z',
            'version': 1,
          },
        };

        final encrypted = encryptionService.encryptJson(jsonData);
        final decrypted = encryptionService.decryptJson(encrypted);

        expect(decrypted, equals(jsonData));
      });
    });

    group('password hashing', () {
      test('should hash password with salt', () {
        const password = 'mySecurePassword123';
        const salt = 'randomSalt';

        final hash = encryptionService.hashPassword(password, salt);

        expect(hash, isNotEmpty);
        expect(hash.length, equals(64)); // SHA-256 produces 64-char hex string
      });

      test('should produce same hash for same password and salt', () {
        const password = 'mySecurePassword123';
        const salt = 'randomSalt';

        final hash1 = encryptionService.hashPassword(password, salt);
        final hash2 = encryptionService.hashPassword(password, salt);

        expect(hash1, equals(hash2));
      });

      test('should produce different hash for different salt', () {
        const password = 'mySecurePassword123';
        const salt1 = 'salt1';
        const salt2 = 'salt2';

        final hash1 = encryptionService.hashPassword(password, salt1);
        final hash2 = encryptionService.hashPassword(password, salt2);

        expect(hash1, isNot(equals(hash2)));
      });

      test('should verify password correctly', () {
        const password = 'mySecurePassword123';
        const wrongPassword = 'wrongPassword';
        const salt = 'randomSalt';

        final hash = encryptionService.hashPassword(password, salt);

        expect(
          encryptionService.verifyPassword(password, salt, hash),
          isTrue,
        );
        expect(
          encryptionService.verifyPassword(wrongPassword, salt, hash),
          isFalse,
        );
      });
    });

    group('salt generation', () {
      test('should generate salt with default length', () {
        final salt = encryptionService.generateSalt();

        expect(salt, isNotEmpty);
        // Base64 encoding of 16 bytes should be ~22-24 chars
        expect(salt.length, greaterThan(20));
      });

      test('should generate salt with custom length', () {
        final salt = encryptionService.generateSalt(32);

        expect(salt, isNotEmpty);
        // Base64 encoding of 32 bytes should be ~43-44 chars
        expect(salt.length, greaterThan(40));
      });

      test('should generate different salts each time', () {
        final salt1 = encryptionService.generateSalt();
        final salt2 = encryptionService.generateSalt();

        expect(salt1, isNot(equals(salt2)));
      });
    });

    group('secure token generation', () {
      test('should generate secure token with default length', () {
        final token = encryptionService.generateSecureToken();

        expect(token, isNotEmpty);
        // Base64 encoding of 32 bytes should be ~43-44 chars
        expect(token.length, greaterThan(40));
      });

      test('should generate secure token with custom length', () {
        final token = encryptionService.generateSecureToken(64);

        expect(token, isNotEmpty);
        // Base64 encoding of 64 bytes should be ~85-88 chars
        expect(token.length, greaterThan(80));
      });

      test('should generate different tokens each time', () {
        final token1 = encryptionService.generateSecureToken();
        final token2 = encryptionService.generateSecureToken();

        expect(token1, isNot(equals(token2)));
      });
    });

    group('HMAC signatures', () {
      test('should create and verify HMAC signature', () {
        const data = 'Hello, World!';
        const secret = 'mySecretKey';

        final signature = encryptionService.createHmacSignature(data, secret);

        expect(signature, isNotEmpty);
        expect(
          encryptionService.verifyHmacSignature(data, signature, secret),
          isTrue,
        );
      });

      test('should fail verification with wrong secret', () {
        const data = 'Hello, World!';
        const secret = 'mySecretKey';
        const wrongSecret = 'wrongSecret';

        final signature = encryptionService.createHmacSignature(data, secret);

        expect(
          encryptionService.verifyHmacSignature(data, signature, wrongSecret),
          isFalse,
        );
      });

      test('should fail verification with modified data', () {
        const data = 'Hello, World!';
        const modifiedData = 'Hello, World? ';
        const secret = 'mySecretKey';

        final signature = encryptionService.createHmacSignature(data, secret);

        expect(
          encryptionService.verifyHmacSignature(modifiedData, signature, secret),
          isFalse,
        );
      });

      test('should produce same signature for same data and secret', () {
        const data = 'Hello, World!';
        const secret = 'mySecretKey';

        final signature1 = encryptionService.createHmacSignature(data, secret);
        final signature2 = encryptionService.createHmacSignature(data, secret);

        expect(signature1, equals(signature2));
      });
    });

    group('key derivation', () {
      test('should derive key using PBKDF2', () {
        const password = 'myPassword';
        final salt = encryptionService.generateSalt();
        const iterations = 1000;
        const keyLength = 32;

        final derivedKey = encryptionService.deriveKey(
          password,
          salt,
          iterations,
          keyLength,
        );

        expect(derivedKey, isNotNull);
        expect(derivedKey.length, equals(keyLength));
      });

      test('should produce same key for same parameters', () {
        const password = 'myPassword';
        // Use base64-encoded salt as expected by deriveKey method
        final salt = base64Encode(utf8.encode('fixedSalt'));
        const iterations = 1000;
        const keyLength = 32;

        final key1 = encryptionService.deriveKey(
          password,
          salt,
          iterations,
          keyLength,
        );
        final key2 = encryptionService.deriveKey(
          password,
          salt,
          iterations,
          keyLength,
        );

        expect(key1, equals(key2));
      });

      test('should produce different key for different password', () {
        const password1 = 'password1';
        const password2 = 'password2';
        // Use base64-encoded salt as expected by deriveKey method
        final salt = base64Encode(utf8.encode('fixedSalt'));
        const iterations = 1000;
        const keyLength = 32;

        final key1 = encryptionService.deriveKey(
          password1,
          salt,
          iterations,
          keyLength,
        );
        final key2 = encryptionService.deriveKey(
          password2,
          salt,
          iterations,
          keyLength,
        );

        expect(key1, isNot(equals(key2)));
      });
    });

    group('singleton pattern', () {
      test('should return same instance', () {
        final instance1 = EncryptionService.instance;
        final instance2 = EncryptionService.instance;

        expect(instance1, same(instance2));
      });
    });

    group('EncryptionException', () {
      test('should format exception message correctly', () {
        const message = 'Test error message';
        const exception = EncryptionException(message);

        expect(exception.message, equals(message));
        expect(exception.toString(), equals('EncryptionException: $message'));
      });
    });
  });
}
