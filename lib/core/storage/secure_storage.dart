import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';

import '../constants/storage_keys.dart';
import '../errors/exceptions.dart';
import '../security/encryption_service.dart';

/// Secure storage wrapper for sensitive data.
///
/// Provides encrypted storage for sensitive information like authentication
/// tokens, passwords, and API keys using platform-specific secure storage
/// (Keychain on iOS, KeyStore on Android).
abstract class SecureStorage {
  /// Write a value securely to storage.
  ///
  /// The value is encrypted using platform-specific secure storage mechanisms.
  Future<void> write(String key, String value);

  /// Read a value from secure storage.
  ///
  /// Returns null if the key doesn't exist. Automatically decrypts the value.
  Future<String?> read(String key);

  /// Delete a specific key from secure storage.
  Future<void> delete(String key);

  /// Delete all data from secure storage. Use with extreme caution.
  Future<void> deleteAll();

  /// Check if a key exists in secure storage.
  Future<bool> containsKey(String key);

  /// Read all key-value pairs from secure storage.
  ///
  /// Returns a map of all stored values. Use sparingly as this loads all data.
  Future<Map<String, String>> readAll();
}

/// Implementation of secure storage using FlutterSecureStorage
class SecureStorageImpl implements SecureStorage {
  /// Constructs a [SecureStorageImpl]
  SecureStorageImpl({FlutterSecureStorage? storage, Logger? logger})
    : _storage = storage ?? const FlutterSecureStorage(),
      _logger = logger ?? Logger();
  final FlutterSecureStorage _storage;
  final Logger _logger;

  @override
  Future<void> write(String key, String value) async {
    try {
      await _storage.write(key: key, value: value);
      _logger.d('Secure storage write successful for key: $key');
    } on Exception catch (e) {
      _logger.e('Failed to write to secure storage: $e');
      throw StorageException.writeError();
    }
  }

  @override
  Future<String?> read(String key) async {
    try {
      final value = await _storage.read(key: key);
      _logger.d(
        'Secure storage read for key: $key ${value != null ? 'found' : 'not found'}',
      );
      return value;
    } on Exception catch (e) {
      _logger.e('Failed to read from secure storage: $e');
      throw StorageException.readError();
    }
  }

  @override
  Future<void> delete(String key) async {
    try {
      await _storage.delete(key: key);
      _logger.d('Secure storage delete successful for key: $key');
    } on Exception catch (e) {
      _logger.e('Failed to delete from secure storage: $e');
      throw StorageException.writeError();
    }
  }

  @override
  Future<void> deleteAll() async {
    try {
      await _storage.deleteAll();
      _logger.i('All secure storage data cleared');
    } on Exception catch (e) {
      _logger.e('Failed to clear secure storage: $e');
      throw StorageException.writeError();
    }
  }

  @override
  Future<bool> containsKey(String key) async {
    try {
      return await _storage.containsKey(key: key);
    } on Exception catch (e) {
      _logger.e('Failed to check secure storage key: $e');
      return false;
    }
  }

  @override
  Future<Map<String, String>> readAll() async {
    try {
      return await _storage.readAll();
    } on Exception catch (e) {
      _logger.e('Failed to read all from secure storage: $e');
      throw StorageException.readError();
    }
  }
}

/// Enhanced secure storage with additional features
class EnhancedSecureStorage extends SecureStorageImpl {
  EnhancedSecureStorage({super.storage, super.logger});

  /// Write JSON object to secure storage
  Future<void> writeJson(String key, Map<String, dynamic> value) async {
    try {
      final jsonString = jsonEncode(value);
      await write(key, jsonString);
    } on Exception catch (e) {
      _logger.e('Failed to write JSON to secure storage: $e');
      throw StorageException.writeError();
    }
  }

  /// Read JSON object from secure storage
  Future<Map<String, dynamic>?> readJson(String key) async {
    try {
      final jsonString = await read(key);
      if (jsonString == null) return null;

      return jsonDecode(jsonString) as Map<String, dynamic>;
    } on Exception catch (e) {
      _logger.e('Failed to read JSON from secure storage: $e');
      throw StorageException.readError();
    }
  }

  /// Write encrypted string to secure storage
  Future<void> writeEncrypted(
    String key,
    String value, {
    String? encryptionKey,
  }) async {
    try {
      final encryptionService = EncryptionService.instance;
      final encryptedValue = encryptionService.encryptText(value);
      await write(key, encryptedValue);
      _logger.d('Encrypted write to secure storage for key: $key');
    } on Exception catch (e) {
      _logger.e('Failed to write encrypted data: $e');
      throw StorageException.encryptionFailed();
    }
  }

  /// Read encrypted string from secure storage
  Future<String?> readEncrypted(String key, {String? encryptionKey}) async {
    try {
      final encryptedValue = await read(key);
      if (encryptedValue == null) return null;

      final encryptionService = EncryptionService.instance;
      final decryptedValue = encryptionService.decryptText(encryptedValue);
      _logger.d('Encrypted read from secure storage for key: $key');
      return decryptedValue;
    } on Exception catch (e) {
      _logger.e('Failed to read encrypted data: $e');
      throw StorageException.decryptionFailed();
    }
  }

  /// Check if storage is available
  Future<bool> isAvailable() async {
    try {
      // Try to write and read a test value
      const testKey = '_test_key_';
      const testValue = 'test';

      await write(testKey, testValue);
      final readValue = await read(testKey);
      await delete(testKey);

      return readValue == testValue;
    } on Exception catch (e) {
      _logger.w('Secure storage not available: $e');
      return false;
    }
  }

  /// Get storage size (approximate)
  Future<int> getStorageSize() async {
    try {
      final allData = await readAll();
      var totalSize = 0;

      for (final entry in allData.entries) {
        totalSize += entry.key.length + entry.value.length;
      }

      return totalSize;
    } on Exception catch (e) {
      _logger.e('Failed to calculate storage size: $e');
      return 0;
    }
  }

  /// Backup all data to a JSON string
  Future<String> backup() async {
    try {
      final allData = await readAll();
      return jsonEncode(allData);
    } on Exception catch (e) {
      _logger.e('Failed to backup secure storage: $e');
      throw StorageException.readError();
    }
  }

  /// Restore data from a backup JSON string
  Future<void> restore(String backupData) async {
    try {
      final data = jsonDecode(backupData) as Map<String, dynamic>;

      for (final entry in data.entries) {
        await write(entry.key, entry.value.toString());
      }

      _logger.i('Secure storage restored from backup');
    } on Exception catch (e) {
      _logger.e('Failed to restore secure storage: $e');
      throw StorageException.writeError();
    }
  }
}

/// Secure storage service with predefined key operations
class SecureStorageService {
  SecureStorageService(this._storage);
  final EnhancedSecureStorage _storage;

  // Authentication tokens
  Future<void> saveAccessToken(String token) =>
      _storage.write(StorageKeys.accessToken, token);
  Future<String?> getAccessToken() => _storage.read(StorageKeys.accessToken);
  Future<void> deleteAccessToken() => _storage.delete(StorageKeys.accessToken);

  Future<void> saveRefreshToken(String token) =>
      _storage.write(StorageKeys.refreshToken, token);
  Future<String?> getRefreshToken() => _storage.read(StorageKeys.refreshToken);
  Future<void> deleteRefreshToken() =>
      _storage.delete(StorageKeys.refreshToken);

  // User credentials
  Future<void> saveUserCredentials(Map<String, dynamic> credentials) =>
      _storage.writeJson(StorageKeys.userCredentials, credentials);
  Future<Map<String, dynamic>?> getUserCredentials() =>
      _storage.readJson(StorageKeys.userCredentials);
  Future<void> deleteUserCredentials() =>
      _storage.delete(StorageKeys.userCredentials);

  // Biometric settings
  Future<void> setBiometricEnabled(bool enabled) =>
      _storage.write(StorageKeys.biometricEnabled, enabled.toString());
  Future<bool> isBiometricEnabled() async {
    final value = await _storage.read(StorageKeys.biometricEnabled);
    return value?.toLowerCase() == 'true';
  }

  // Hanko session
  Future<void> saveHankoSessionId(String sessionId) =>
      _storage.write(StorageKeys.hankoSessionId, sessionId);
  Future<String?> getHankoSessionId() =>
      _storage.read(StorageKeys.hankoSessionId);
  Future<void> deleteHankoSessionId() =>
      _storage.delete(StorageKeys.hankoSessionId);

  // Clear all authentication data
  Future<void> clearAuthData() async {
    await Future.wait([
      deleteAccessToken(),
      deleteRefreshToken(),
      deleteUserCredentials(),
      deleteHankoSessionId(),
    ]);
  }

  // Aliases for auth repository compatibility
  Future<void> storeAccessToken(String token) => saveAccessToken(token);
  Future<void> storeRefreshToken(String token) => saveRefreshToken(token);

  // Check if user is logged in
  Future<bool> isLoggedIn() async {
    final accessToken = await getAccessToken();
    return accessToken != null && accessToken.isNotEmpty;
  }

  // Storage health check
  Future<bool> isHealthy() => _storage.isAvailable();
}
