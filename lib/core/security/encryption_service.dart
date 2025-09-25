import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';

import '../config/environment_config.dart';

/// Encryption service for sensitive data protection
class EncryptionService {
  EncryptionService._() {
    _initializeEncryption();
  }
  static EncryptionService? _instance;
  late final Encrypter _encrypter;

  static EncryptionService get instance {
    _instance ??= EncryptionService._();
    return _instance!;
  }

  void _initializeEncryption() {
    final keyString = EnvironmentConfig.encryptionKey;

    // Ensure key is exactly 32 characters for AES-256
    final normalizedKey = _normalizeKey(keyString);
    final key = Key.fromBase64(base64Encode(normalizedKey.codeUnits));

    _encrypter = Encrypter(AES(key));
  }

  String _normalizeKey(String key) {
    if (key.length == 32) return key;

    if (key.length > 32) {
      // Truncate if too long
      return key.substring(0, 32);
    }

    // Pad if too short
    return key.padRight(32, '0');
  }

  /// Encrypt sensitive text data
  String encryptText(String plaintext) {
    try {
      final iv = IV.fromSecureRandom(16);
      final encrypted = _encrypter.encrypt(plaintext, iv: iv);

      // Combine IV and encrypted data for storage
      final combined = base64Encode([...iv.bytes, ...encrypted.bytes]);

      return combined;
    } on Exception catch (e) {
      throw EncryptionException('Failed to encrypt data: $e');
    }
  }

  /// Decrypt encrypted text data
  String decryptText(String encryptedData) {
    try {
      final combined = base64Decode(encryptedData);

      if (combined.length < 16) {
        throw const EncryptionException('Invalid encrypted data format');
      }

      // Extract IV and encrypted data
      final iv = IV(Uint8List.fromList(combined.take(16).toList()));
      final encryptedBytes = combined.skip(16).toList();
      final encrypted = Encrypted(Uint8List.fromList(encryptedBytes));

      return _encrypter.decrypt(encrypted, iv: iv);
    } on Exception catch (e) {
      throw EncryptionException('Failed to decrypt data: $e');
    }
  }

  /// Encrypt JSON data
  String encryptJson(Map<String, dynamic> data) {
    final jsonString = jsonEncode(data);
    return encryptText(jsonString);
  }

  /// Decrypt JSON data
  Map<String, dynamic> decryptJson(String encryptedData) {
    final decryptedString = decryptText(encryptedData);
    return jsonDecode(decryptedString) as Map<String, dynamic>;
  }

  /// Hash password with salt
  String hashPassword(String password, String salt) {
    final bytes = utf8.encode(password + salt);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  /// Generate secure salt
  String generateSalt([int length = 16]) {
    final iv = IV.fromSecureRandom(length);
    return base64Encode(iv.bytes);
  }

  /// Verify password against hash
  bool verifyPassword(String password, String salt, String hash) {
    final computedHash = hashPassword(password, salt);
    return computedHash == hash;
  }

  /// Generate secure random token
  String generateSecureToken([int length = 32]) {
    final iv = IV.fromSecureRandom(length);
    return base64Encode(iv.bytes);
  }

  /// Create HMAC signature for data integrity
  String createHmacSignature(String data, String secret) {
    final key = utf8.encode(secret);
    final bytes = utf8.encode(data);
    final hmac = Hmac(sha256, key);
    final digest = hmac.convert(bytes);
    return base64Encode(digest.bytes);
  }

  /// Verify HMAC signature
  bool verifyHmacSignature(String data, String signature, String secret) {
    final computedSignature = createHmacSignature(data, secret);
    return computedSignature == signature;
  }

  /// Secure key derivation using PBKDF2
  Uint8List deriveKey(
    String password,
    String salt,
    int iterations,
    int keyLength,
  ) {
    final saltBytes = base64Decode(salt);
    final passwordBytes = utf8.encode(password);

    // Using a simple PBKDF2 implementation
    var result = passwordBytes;
    for (var i = 0; i < iterations; i++) {
      final hmac = Hmac(sha256, result);
      result = Uint8List.fromList(hmac.convert(saltBytes).bytes);
    }

    return Uint8List.fromList(result.take(keyLength).toList());
  }
}

/// Custom exception for encryption operations
class EncryptionException implements Exception {
  const EncryptionException(this.message);
  final String message;

  @override
  String toString() => 'EncryptionException: $message';
}
