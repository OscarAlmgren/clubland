import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/storage_keys.dart';
import '../errors/exceptions.dart';

/// Local storage interface for non-sensitive data.
///
/// Provides a type-safe abstraction over persistent key-value storage for
/// non-sensitive application data. Uses SharedPreferences under the hood.
abstract class LocalStorage {
  /// Initialize the storage system. Must be called before any other operations.
  Future<void> init();

  /// Write a value to storage with the given key.
  ///
  /// Supports primitive types (String, int, double, bool) and complex objects
  /// that can be JSON serialized.
  Future<void> write<T>(String key, T value);

  /// Read a value from storage by key.
  ///
  /// Returns null if the key doesn't exist. Automatically deserializes JSON
  /// for complex types.
  Future<T?> read<T>(String key);

  /// Delete a specific key from storage.
  Future<void> delete(String key);

  /// Clear all data from storage. Use with caution.
  Future<void> clear();

  /// Check if a key exists in storage.
  Future<bool> containsKey(String key);

  /// Get all keys currently stored.
  Future<List<String>> getKeys();

  /// Cleanup and dispose of storage resources.
  Future<void> dispose();
}

/// SharedPreferences implementation of local storage
class SharedPreferencesLocalStorage implements LocalStorage {
  SharedPreferencesLocalStorage({String boxName = 'app_storage', Logger? logger})
      : _boxName = boxName,
        _logger = logger ?? Logger();

  late SharedPreferences _prefs;
  final Logger _logger;
  final String _boxName;
  bool _isInitialized = false;

  @override
  Future<void> init() async {
    try {
      if (_isInitialized) return;

      _prefs = await SharedPreferences.getInstance();
      _isInitialized = true;

      _logger.i('SharedPreferences local storage initialized');
    } on Exception catch (e) {
      _logger.e('Failed to initialize SharedPreferences storage: $e');
      throw const StorageException('Failed to initialize local storage');
    }
  }

  void _ensureInitialized() {
    if (!_isInitialized) {
      throw const StorageException(
        'Local storage not initialized. Call init() first.',
      );
    }
  }

  String _getKey(String key) => '${_boxName}_$key';

  @override
  Future<void> write<T>(String key, T value) async {
    try {
      _ensureInitialized();
      final prefKey = _getKey(key);

      if (value is String) {
        await _prefs.setString(prefKey, value);
      } else if (value is int) {
        await _prefs.setInt(prefKey, value);
      } else if (value is double) {
        await _prefs.setDouble(prefKey, value);
      } else if (value is bool) {
        await _prefs.setBool(prefKey, value);
      } else if (value is List<String>) {
        await _prefs.setStringList(prefKey, value);
      } else {
        // Serialize other types as JSON
        await _prefs.setString(prefKey, jsonEncode(value));
      }

      _logger.d('Local storage write successful for key: $key');
    } on Exception catch (e) {
      _logger.e('Failed to write to local storage: $e');
      throw StorageException.writeError();
    }
  }

  @override
  Future<T?> read<T>(String key) async {
    try {
      _ensureInitialized();
      final prefKey = _getKey(key);

      if (T == String) {
        return _prefs.getString(prefKey) as T?;
      } else if (T == int) {
        return _prefs.getInt(prefKey) as T?;
      } else if (T == double) {
        return _prefs.getDouble(prefKey) as T?;
      } else if (T == bool) {
        return _prefs.getBool(prefKey) as T?;
      } else if (T == List<String>) {
        return _prefs.getStringList(prefKey) as T?;
      } else {
        // Try to deserialize from JSON
        final jsonString = _prefs.getString(prefKey);
        if (jsonString == null) return null;
        return jsonDecode(jsonString) as T?;
      }
    } on Exception catch (e) {
      _logger.e('Failed to read from local storage: $e');
      throw StorageException.readError();
    }
  }

  @override
  Future<void> delete(String key) async {
    try {
      _ensureInitialized();
      final prefKey = _getKey(key);
      await _prefs.remove(prefKey);
      _logger.d('Local storage delete successful for key: $key');
    } on Exception catch (e) {
      _logger.e('Failed to delete from local storage: $e');
      throw StorageException.writeError();
    }
  }

  @override
  Future<void> clear() async {
    try {
      _ensureInitialized();
      // Only clear keys with our box prefix
      final keys = _prefs.getKeys().where((key) => key.startsWith('${_boxName}_')).toList();
      for (final key in keys) {
        await _prefs.remove(key);
      }
      _logger.i('Local storage cleared');
    } on Exception catch (e) {
      _logger.e('Failed to clear local storage: $e');
      throw StorageException.writeError();
    }
  }

  @override
  Future<bool> containsKey(String key) async {
    try {
      _ensureInitialized();
      final prefKey = _getKey(key);
      return _prefs.containsKey(prefKey);
    } on Exception catch (e) {
      _logger.e('Failed to check local storage key: $e');
      return false;
    }
  }

  @override
  Future<List<String>> getKeys() async {
    try {
      _ensureInitialized();
      return _prefs.getKeys()
          .where((key) => key.startsWith('${_boxName}_'))
          .map((key) => key.substring('${_boxName}_'.length))
          .toList();
    } on Exception catch (e) {
      _logger.e('Failed to get local storage keys: $e');
      return [];
    }
  }

  @override
  Future<void> dispose() async {
    try {
      if (_isInitialized) {
        _isInitialized = false;
        _logger.i('Local storage disposed');
      }
    } on Exception catch (e) {
      _logger.e('Failed to dispose local storage: $e');
    }
  }

  /// Get approximate storage size in bytes.
  ///
  /// Calculates the total size of all stored key-value pairs. Note that this
  /// is an approximation and may not match the exact disk usage.
  Future<int> getSize() async {
    try {
      _ensureInitialized();
      var totalSize = 0;

      final keys = await getKeys();
      for (final key in keys) {
        final value = await read<dynamic>(key);
        totalSize += _estimateObjectSize(key) + _estimateObjectSize(value);
      }

      return totalSize;
    } on Exception catch (e) {
      _logger.e('Failed to calculate storage size: $e');
      return 0;
    }
  }

  int _estimateObjectSize(dynamic obj) {
    if (obj is String) {
      return obj.length * 2; // Approximate for UTF-16
    } else if (obj is List || obj is Map) {
      return jsonEncode(obj).length * 2;
    } else {
      return obj.toString().length * 2;
    }
  }
}

/// Enhanced local storage with typed operations.
///
/// Extends [SharedPreferencesLocalStorage] with convenient methods for common
/// data types including JSON, lists, primitives, and DateTime.
class TypedLocalStorage extends SharedPreferencesLocalStorage {
  /// Creates a typed local storage instance.
  ///
  /// [boxName] is used for logical organization but doesn't create separate
  /// storage namespaces (SharedPreferences is app-wide).
  TypedLocalStorage({super.boxName, super.logger});

  /// Write a JSON object to storage.
  ///
  /// Automatically encodes the map to a JSON string before storing.
  Future<void> writeJson(String key, Map<String, dynamic> value) async {
    await write(key, jsonEncode(value));
  }

  /// Read a JSON object from storage.
  ///
  /// Returns null if the key doesn't exist or JSON parsing fails.
  Future<Map<String, dynamic>?> readJson(String key) async {
    final jsonString = await read<String>(key);
    if (jsonString == null) return null;

    try {
      return jsonDecode(jsonString) as Map<String, dynamic>;
    } on Exception catch (e) {
      _logger.e('Failed to decode JSON for key $key: $e');
      return null;
    }
  }

  /// Write list
  Future<void> writeList<T>(String key, List<T> value) async {
    await write(key, value);
  }

  /// Read list
  Future<List<T>?> readList<T>(String key) async {
    final value = await read<List<dynamic>>(key);
    return value?.cast<T>();
  }

  /// Write boolean
  Future<void> writeBool(String key, bool value) async {
    await write(key, value);
  }

  /// Read boolean
  Future<bool?> readBool(String key) async => read<bool>(key);

  /// Write integer
  Future<void> writeInt(String key, int value) async {
    await write(key, value);
  }

  /// Read integer
  Future<int?> readInt(String key) async => read<int>(key);

  /// Write double
  Future<void> writeDouble(String key, double value) async {
    await write(key, value);
  }

  /// Read double
  Future<double?> readDouble(String key) async => read<double>(key);

  /// Write DateTime
  Future<void> writeDateTime(String key, DateTime value) async {
    await write(key, value.millisecondsSinceEpoch);
  }

  /// Read DateTime
  Future<DateTime?> readDateTime(String key) async {
    final timestamp = await read<int>(key);
    return timestamp != null
        ? DateTime.fromMillisecondsSinceEpoch(timestamp)
        : null;
  }
}

/// Multi-prefix storage manager
class StorageManager {
  StorageManager({Logger? logger}) : _logger = logger ?? Logger();
  final Map<String, TypedLocalStorage> _storages = {};
  final Logger _logger;
  bool _isInitialized = false;

  /// Initialize all storage prefixes
  Future<void> init() async {
    if (_isInitialized) return;

    try {
      // Initialize core storage prefixes
      await _initializeBox(StorageKeys.userDataPrefix);
      await _initializeBox(StorageKeys.clubsDataPrefix);
      await _initializeBox(StorageKeys.bookingsDataPrefix);
      await _initializeBox(StorageKeys.visitsDataPrefix);
      await _initializeBox(StorageKeys.socialDataPrefix);
      await _initializeBox(StorageKeys.cacheDataPrefix);
      await _initializeBox(StorageKeys.settingsDataPrefix);
      await _initializeBox(StorageKeys.offlineDataPrefix);

      _isInitialized = true;
      _logger.i('Storage manager initialized with ${_storages.length} storage prefixes');
    } on Exception catch (e) {
      _logger.e('Failed to initialize storage manager: $e');
      throw const StorageException('Failed to initialize storage manager');
    }
  }

  Future<void> _initializeBox(String prefix) async {
    final storage = TypedLocalStorage(boxName: prefix, logger: _logger);
    await storage.init();
    _storages[prefix] = storage;
  }

  /// Get storage by prefix
  TypedLocalStorage getStorage(String prefix) {
    if (!_isInitialized) {
      throw const StorageException('Storage manager not initialized');
    }

    final storage = _storages[prefix];
    if (storage == null) {
      throw StorageException('Storage prefix not found: $prefix');
    }

    return storage;
  }

  /// Get user storage
  TypedLocalStorage get userStorage => getStorage(StorageKeys.userDataPrefix);

  /// Get clubs storage
  TypedLocalStorage get clubsStorage => getStorage(StorageKeys.clubsDataPrefix);

  /// Get bookings storage
  TypedLocalStorage get bookingsStorage => getStorage(StorageKeys.bookingsDataPrefix);

  /// Get visits storage
  TypedLocalStorage get visitsStorage => getStorage(StorageKeys.visitsDataPrefix);

  /// Get social storage
  TypedLocalStorage get socialStorage => getStorage(StorageKeys.socialDataPrefix);

  /// Get cache storage
  TypedLocalStorage get cacheStorage => getStorage(StorageKeys.cacheDataPrefix);

  /// Get settings storage
  TypedLocalStorage get settingsStorage => getStorage(StorageKeys.settingsDataPrefix);

  /// Get offline storage
  TypedLocalStorage get offlineStorage => getStorage(StorageKeys.offlineDataPrefix);

  /// Clear all data
  Future<void> clearAll() async {
    for (final storage in _storages.values) {
      await storage.clear();
    }
    _logger.i('All storage prefixes cleared');
  }

  /// Get total storage size
  Future<int> getTotalSize() async {
    var totalSize = 0;
    for (final storage in _storages.values) {
      totalSize += await storage.getSize();
    }
    return totalSize;
  }

  /// Dispose all storage
  Future<void> dispose() async {
    for (final storage in _storages.values) {
      await storage.dispose();
    }
    _storages.clear();
    _isInitialized = false;
    _logger.i('Storage manager disposed');
  }
}
