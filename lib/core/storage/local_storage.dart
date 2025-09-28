import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/storage_keys.dart';
import '../errors/exceptions.dart';

/// Local storage interface for non-sensitive data
abstract class LocalStorage {
  Future<void> init();
  Future<void> write<T>(String key, T value);
  Future<T?> read<T>(String key);
  Future<void> delete(String key);
  Future<void> clear();
  Future<bool> containsKey(String key);
  Future<List<String>> getKeys();
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

  /// Get box size in bytes (approximate)
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

/// Enhanced local storage with typed operations
class TypedLocalStorage extends SharedPreferencesLocalStorage {
  TypedLocalStorage({super.boxName, super.logger});

  /// Write JSON object
  Future<void> writeJson(String key, Map<String, dynamic> value) async {
    await write(key, jsonEncode(value));
  }

  /// Read JSON object
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

/// Multi-box storage manager
class StorageManager {
  StorageManager({Logger? logger}) : _logger = logger ?? Logger();
  final Map<String, TypedLocalStorage> _boxes = {};
  final Logger _logger;
  bool _isInitialized = false;

  /// Initialize all storage boxes
  Future<void> init() async {
    if (_isInitialized) return;

    try {
      // Initialize core boxes
      await _initializeBox(StorageKeys.userBox);
      await _initializeBox(StorageKeys.clubsBox);
      await _initializeBox(StorageKeys.bookingsBox);
      await _initializeBox(StorageKeys.visitsBox);
      await _initializeBox(StorageKeys.socialBox);
      await _initializeBox(StorageKeys.cacheBox);
      await _initializeBox(StorageKeys.settingsBox);
      await _initializeBox(StorageKeys.offlineBox);

      _isInitialized = true;
      _logger.i('Storage manager initialized with ${_boxes.length} boxes');
    } on Exception catch (e) {
      _logger.e('Failed to initialize storage manager: $e');
      throw const StorageException('Failed to initialize storage manager');
    }
  }

  Future<void> _initializeBox(String boxName) async {
    final storage = TypedLocalStorage(boxName: boxName, logger: _logger);
    await storage.init();
    _boxes[boxName] = storage;
  }

  /// Get storage box by name
  TypedLocalStorage getBox(String boxName) {
    if (!_isInitialized) {
      throw const StorageException('Storage manager not initialized');
    }

    final box = _boxes[boxName];
    if (box == null) {
      throw StorageException('Storage box not found: $boxName');
    }

    return box;
  }

  /// Get user storage
  TypedLocalStorage get userStorage => getBox(StorageKeys.userBox);

  /// Get clubs storage
  TypedLocalStorage get clubsStorage => getBox(StorageKeys.clubsBox);

  /// Get bookings storage
  TypedLocalStorage get bookingsStorage => getBox(StorageKeys.bookingsBox);

  /// Get visits storage
  TypedLocalStorage get visitsStorage => getBox(StorageKeys.visitsBox);

  /// Get social storage
  TypedLocalStorage get socialStorage => getBox(StorageKeys.socialBox);

  /// Get cache storage
  TypedLocalStorage get cacheStorage => getBox(StorageKeys.cacheBox);

  /// Get settings storage
  TypedLocalStorage get settingsStorage => getBox(StorageKeys.settingsBox);

  /// Get offline storage
  TypedLocalStorage get offlineStorage => getBox(StorageKeys.offlineBox);

  /// Clear all data
  Future<void> clearAll() async {
    for (final storage in _boxes.values) {
      await storage.clear();
    }
    _logger.i('All storage boxes cleared');
  }

  /// Get total storage size
  Future<int> getTotalSize() async {
    var totalSize = 0;
    for (final storage in _boxes.values) {
      totalSize += await storage.getSize();
    }
    return totalSize;
  }

  /// Dispose all storage boxes
  Future<void> dispose() async {
    for (final storage in _boxes.values) {
      await storage.dispose();
    }
    _boxes.clear();
    _isInitialized = false;
    _logger.i('Storage manager disposed');
  }
}