import 'dart:convert';

import 'package:logger/logger.dart';

import '../constants/api_constants.dart';
import '../errors/exceptions.dart';
import 'local_storage.dart';

/// Cache entry metadata
class CacheEntry<T> {
  factory CacheEntry.fromJson(Map<String, dynamic> json) => CacheEntry(
    data: json['data'] as T,
    createdAt: DateTime.fromMillisecondsSinceEpoch(json['createdAt'] as int),
    expiresAt: DateTime.fromMillisecondsSinceEpoch(json['expiresAt'] as int),
    etag: json['etag'] as String? ?? '',
    metadata: Map<String, dynamic>.from(json['metadata'] as Map? ?? {}),
  );

  CacheEntry({
    required this.data,
    required this.createdAt,
    required this.expiresAt,
    required this.etag,
    this.metadata = const {},
  });
  final T data;
  final DateTime createdAt;
  final DateTime expiresAt;
  final String etag;
  final Map<String, dynamic> metadata;

  bool get isExpired => DateTime.now().isAfter(expiresAt);

  Map<String, dynamic> toJson() => {
    'data': data,
    'createdAt': createdAt.millisecondsSinceEpoch,
    'expiresAt': expiresAt.millisecondsSinceEpoch,
    'etag': etag,
    'metadata': metadata,
  };
}

/// Cache policy configuration
class CachePolicy {
  const CachePolicy({
    this.maxAge = ApiConstants.defaultCacheMaxAge,
    this.staleWhileRevalidate = const Duration(minutes: 5),
    this.allowStale = true,
    this.maxSize = 1000,
  });
  final Duration maxAge;
  final Duration staleWhileRevalidate;
  final bool allowStale;
  final int maxSize;

  static const short = CachePolicy(
    maxAge: ApiConstants.shortCacheMaxAge,
    maxSize: 500,
  );

  static const medium = CachePolicy(
    maxAge: ApiConstants.defaultCacheMaxAge,
    maxSize: 1000,
  );

  static const long = CachePolicy(
    maxAge: ApiConstants.longCacheMaxAge,
    maxSize: 2000,
  );
}

/// Advanced cache manager with TTL, LRU eviction, and persistence
class CacheManager {
  CacheManager({required TypedLocalStorage storage, Logger? logger})
    : _storage = storage,
      _logger = logger ?? Logger();
  final TypedLocalStorage _storage;
  final Logger _logger;
  final Map<String, CachePolicy> _policies = {};
  final Map<String, DateTime> _accessTimes = {};

  /// Initialize cache manager
  Future<void> init() async {
    await _cleanExpiredEntries();
    _logger.i('Cache manager initialized');
  }

  /// Set cache policy for a specific key pattern
  void setPolicy(String keyPattern, CachePolicy policy) {
    _policies[keyPattern] = policy;
    _logger.d('Cache policy set for pattern: $keyPattern');
  }

  /// Get cache policy for a key
  CachePolicy _getPolicyForKey(String key) {
    for (final pattern in _policies.keys) {
      if (key.startsWith(pattern)) {
        return _policies[pattern]!;
      }
    }
    return CachePolicy.medium; // Default policy
  }

  /// Store data in cache
  Future<void> put<T>(
    String key,
    T data, {
    Duration? maxAge,
    String? etag,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      final policy = _getPolicyForKey(key);
      final effectiveMaxAge = maxAge ?? policy.maxAge;

      final entry = CacheEntry<T>(
        data: data,
        createdAt: DateTime.now(),
        expiresAt: DateTime.now().add(effectiveMaxAge),
        etag: etag ?? _generateEtag(data),
        metadata: metadata ?? {},
      );

      await _storage.writeJson(key, entry.toJson());
      _accessTimes[key] = DateTime.now();

      _logger.d(
        'Cache entry stored: $key (expires in ${effectiveMaxAge.inMinutes}min)',
      );

      // Check if we need to evict old entries
      await _enforceMaxSize(policy);
    } catch (e) {
      _logger.e('Failed to store cache entry: $e');
      throw CacheException.writeFailed();
    }
  }

  /// Retrieve data from cache
  Future<T?> get<T>(String key, {bool allowStale = true}) async {
    try {
      final json = await _storage.readJson(key);
      if (json == null) {
        _logger.d('Cache miss: $key');
        return null;
      }

      final entry = CacheEntry<T>.fromJson(json);
      _accessTimes[key] = DateTime.now();

      if (entry.isExpired) {
        if (!allowStale) {
          _logger.d('Cache expired (stale not allowed): $key');
          await _storage.delete(key);
          return null;
        }
        _logger.d('Cache expired (returning stale): $key');
      } else {
        _logger.d('Cache hit: $key');
      }

      return entry.data;
    } catch (e) {
      _logger.e('Failed to retrieve cache entry: $e');
      throw CacheException.readFailed();
    }
  }

  /// Get cache entry with metadata
  Future<CacheEntry<T>?> getEntry<T>(String key) async {
    try {
      final json = await _storage.readJson(key);
      if (json == null) return null;

      final entry = CacheEntry<T>.fromJson(json);
      _accessTimes[key] = DateTime.now();

      return entry;
    } catch (e) {
      _logger.e('Failed to retrieve cache entry with metadata: $e');
      return null;
    }
  }

  /// Check if cache contains a valid entry
  Future<bool> contains(String key, {bool allowStale = true}) async {
    final entry = await getEntry<dynamic>(key);
    if (entry == null) return false;

    return allowStale || !entry.isExpired;
  }

  /// Remove entry from cache
  Future<void> remove(String key) async {
    try {
      await _storage.delete(key);
      _accessTimes.remove(key);
      _logger.d('Cache entry removed: $key');
    } catch (e) {
      _logger.e('Failed to remove cache entry: $e');
      throw CacheException.writeFailed();
    }
  }

  /// Clear all cache entries
  Future<void> clear() async {
    try {
      await _storage.clear();
      _accessTimes.clear();
      _logger.i('Cache cleared');
    } catch (e) {
      _logger.e('Failed to clear cache: $e');
      throw CacheException.writeFailed();
    }
  }

  /// Invalidate entries matching a pattern
  Future<void> invalidatePattern(String pattern) async {
    try {
      final keys = await _storage.getKeys();
      final matchingKeys = keys.where((key) => key.startsWith(pattern));

      for (final key in matchingKeys) {
        await remove(key);
      }

      _logger.i(
        'Invalidated ${matchingKeys.length} cache entries matching: $pattern',
      );
    } catch (e) {
      _logger.e('Failed to invalidate cache pattern: $e');
    }
  }

  /// Get cache statistics
  Future<CacheStats> getStats() async {
    try {
      final keys = await _storage.getKeys();
      var validEntries = 0;
      var expiredEntries = 0;
      var totalSize = await _storage.getSize();

      for (final key in keys) {
        final entry = await getEntry<dynamic>(key);
        if (entry != null) {
          if (entry.isExpired) {
            expiredEntries++;
          } else {
            validEntries++;
          }
        }
      }

      return CacheStats(
        totalEntries: keys.length,
        validEntries: validEntries,
        expiredEntries: expiredEntries,
        totalSizeBytes: totalSize,
        hitRate: 0.0, // Would need to track hits/misses over time
      );
    } catch (e) {
      _logger.e('Failed to get cache stats: $e');
      return CacheStats.empty();
    }
  }

  /// Clean expired entries
  Future<void> _cleanExpiredEntries() async {
    try {
      final keys = await _storage.getKeys();
      var cleanedCount = 0;

      for (final key in keys) {
        final entry = await getEntry<dynamic>(key);
        if (entry != null && entry.isExpired) {
          await remove(key);
          cleanedCount++;
        }
      }

      if (cleanedCount > 0) {
        _logger.i('Cleaned $cleanedCount expired cache entries');
      }
    } catch (e) {
      _logger.e('Failed to clean expired entries: $e');
    }
  }

  /// Enforce maximum cache size using LRU eviction
  Future<void> _enforceMaxSize(CachePolicy policy) async {
    try {
      final keys = await _storage.getKeys();
      if (keys.length <= policy.maxSize) return;

      // Sort keys by last access time (LRU)
      final sortedKeys = keys.toList()
        ..sort((a, b) {
          final aTime =
              _accessTimes[a] ?? DateTime.fromMillisecondsSinceEpoch(0);
          final bTime =
              _accessTimes[b] ?? DateTime.fromMillisecondsSinceEpoch(0);
          return aTime.compareTo(bTime);
        });

      // Remove oldest entries
      final toRemove = keys.length - policy.maxSize;
      for (var i = 0; i < toRemove; i++) {
        await remove(sortedKeys[i]);
      }

      _logger.i('Evicted $toRemove cache entries (LRU)');
    } catch (e) {
      _logger.e('Failed to enforce cache size limit: $e');
    }
  }

  /// Generate ETag for data
  String _generateEtag<T>(T data) {
    final dataString = data is String ? data : jsonEncode(data);
    return dataString.hashCode.toString();
  }

  /// Dispose cache manager
  Future<void> dispose() async {
    await _cleanExpiredEntries();
    _logger.i('Cache manager disposed');
  }
}

/// Cache statistics
class CacheStats {
  const CacheStats({
    required this.totalEntries,
    required this.validEntries,
    required this.expiredEntries,
    required this.totalSizeBytes,
    required this.hitRate,
  });

  factory CacheStats.empty() => const CacheStats(
    totalEntries: 0,
    validEntries: 0,
    expiredEntries: 0,
    totalSizeBytes: 0,
    hitRate: 0.0,
  );
  final int totalEntries;
  final int validEntries;
  final int expiredEntries;
  final int totalSizeBytes;
  final double hitRate;

  @override
  String toString() =>
      '''
CacheStats(
  totalEntries: $totalEntries,
  validEntries: $validEntries,
  expiredEntries: $expiredEntries,
  totalSizeBytes: $totalSizeBytes,
  hitRate: ${(hitRate * 100).toStringAsFixed(1)}%
)''';
}

/// Specialized cache managers for different data types
class AppCacheManager {
  AppCacheManager(this._cacheManager) {
    _setupPolicies();
  }
  final CacheManager _cacheManager;

  void _setupPolicies() {
    // User data - medium cache
    _cacheManager.setPolicy('user_', CachePolicy.medium);

    // Club data - long cache
    _cacheManager.setPolicy('club_', CachePolicy.long);

    // Search results - short cache
    _cacheManager.setPolicy('search_', CachePolicy.short);

    // Images - very long cache
    _cacheManager.setPolicy(
      'image_',
      const CachePolicy(maxAge: Duration(days: 7), maxSize: 5000),
    );

    // API responses - medium cache
    _cacheManager.setPolicy('api_', CachePolicy.medium);
  }

  /// Cache user data
  Future<void> cacheUser(String userId, Map<String, dynamic> userData) =>
      _cacheManager.put('user_$userId', userData);

  Future<Map<String, dynamic>?> getUser(String userId) =>
      _cacheManager.get<Map<String, dynamic>>('user_$userId');

  /// Cache club data
  Future<void> cacheClub(String clubId, Map<String, dynamic> clubData) =>
      _cacheManager.put('club_$clubId', clubData);

  Future<Map<String, dynamic>?> getClub(String clubId) =>
      _cacheManager.get<Map<String, dynamic>>('club_$clubId');

  /// Cache search results
  Future<void> cacheSearchResults(
    String query,
    List<Map<String, dynamic>> results,
  ) => _cacheManager.put('search_${query.hashCode}', results);

  Future<List<Map<String, dynamic>>?> getSearchResults(String query) =>
      _cacheManager.get<List<Map<String, dynamic>>>('search_${query.hashCode}');

  /// Cache API responses
  Future<void> cacheApiResponse(
    String endpoint,
    Map<String, dynamic> response,
  ) => _cacheManager.put('api_${endpoint.hashCode}', response);

  Future<Map<String, dynamic>?> getApiResponse(String endpoint) =>
      _cacheManager.get<Map<String, dynamic>>('api_${endpoint.hashCode}');

  /// Invalidate user cache
  Future<void> invalidateUserCache() =>
      _cacheManager.invalidatePattern('user_');

  /// Invalidate club cache
  Future<void> invalidateClubCache() =>
      _cacheManager.invalidatePattern('club_');

  /// Get cache statistics
  Future<CacheStats> getStats() => _cacheManager.getStats();

  /// Clear all cache
  Future<void> clearAll() => _cacheManager.clear();
}
