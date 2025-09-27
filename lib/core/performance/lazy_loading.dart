import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../design_system/design_system.dart';

/// A utility for implementing lazy loading patterns in the app
class LazyLoadingManager {
  LazyLoadingManager._() : _logger = Logger();

  static LazyLoadingManager? _instance;
  static LazyLoadingManager get instance =>
      _instance ??= LazyLoadingManager._();

  final Logger _logger;
  final Map<String, dynamic> _cache = {};
  final Map<String, DateTime> _cacheTimestamps = {};
  final Map<String, Completer<dynamic>> _loadingOperations = {};

  /// Load data lazily with caching
  Future<T> lazyLoad<T>({
    required String key,
    required Future<T> Function() loader,
    Duration? cacheDuration = const Duration(minutes: 10),
    bool forceReload = false,
  }) async {
    // Check if already loading
    if (_loadingOperations.containsKey(key)) {
      _logger.d('Waiting for existing load operation: $key');
      return await _loadingOperations[key]!.future as T;
    }

    // Check cache if not forcing reload
    if (!forceReload && _cache.containsKey(key)) {
      final timestamp = _cacheTimestamps[key];
      if (timestamp != null && cacheDuration != null) {
        final age = DateTime.now().difference(timestamp);
        if (age <= cacheDuration) {
          _logger.d('Returning cached data for: $key');
          return _cache[key] as T;
        } else {
          _logger.d('Cache expired for: $key');
          _invalidateKey(key);
        }
      } else {
        _logger.d('Returning cached data (no expiration): $key');
        return _cache[key] as T;
      }
    }

    // Start loading
    final completer = Completer<T>();
    _loadingOperations[key] = completer as Completer<dynamic>;

    try {
      _logger.d('Loading data for: $key');
      final result = await loader();

      // Cache the result
      _cache[key] = result;
      _cacheTimestamps[key] = DateTime.now();

      _logger.d('Successfully loaded and cached: $key');
      completer.complete(result);
      return result;
    } catch (error) {
      _logger.e('Failed to load data for $key: $error');
      completer.completeError(error);
      rethrow;
    } finally {
      _loadingOperations.remove(key);
    }
  }

  /// Preload data in the background
  void preload<T>({
    required String key,
    required Future<T> Function() loader,
    Duration? cacheDuration = const Duration(minutes: 10),
  }) {
    if (_cache.containsKey(key) && !_isExpired(key, cacheDuration)) {
      return; // Already cached and not expired
    }

    unawaited(lazyLoad(key: key, loader: loader, cacheDuration: cacheDuration));
  }

  /// Check if a cached item is expired
  bool _isExpired(String key, Duration? cacheDuration) {
    if (cacheDuration == null) return false;
    final timestamp = _cacheTimestamps[key];
    if (timestamp == null) return true;
    return DateTime.now().difference(timestamp) > cacheDuration;
  }

  /// Invalidate cached data for a specific key
  void invalidate(String key) {
    _invalidateKey(key);
    _logger.d('Invalidated cache for: $key');
  }

  void _invalidateKey(String key) {
    _cache.remove(key);
    _cacheTimestamps.remove(key);
  }

  /// Invalidate all cached data matching a pattern
  void invalidatePattern(RegExp pattern) {
    final keysToRemove = <String>[];
    for (final key in _cache.keys) {
      if (pattern.hasMatch(key)) {
        keysToRemove.add(key);
      }
    }
    for (final key in keysToRemove) {
      _invalidateKey(key);
    }
    _logger.d(
      'Invalidated ${keysToRemove.length} cache entries matching pattern',
    );
  }

  /// Clear all cached data
  void clearAll() {
    final count = _cache.length;
    _cache.clear();
    _cacheTimestamps.clear();
    _logger.d('Cleared all $count cache entries');
  }

  /// Get cache statistics
  Map<String, dynamic> getCacheStats() => {
    'totalEntries': _cache.length,
    'activeLoads': _loadingOperations.length,
    'keys': _cache.keys.toList(),
    'oldestEntry': _cacheTimestamps.values.isEmpty
        ? null
        : _cacheTimestamps.values
              .reduce((a, b) => a.isBefore(b) ? a : b)
              .toIso8601String(),
    'newestEntry': _cacheTimestamps.values.isEmpty
        ? null
        : _cacheTimestamps.values
              .reduce((a, b) => a.isAfter(b) ? a : b)
              .toIso8601String(),
  };
}

/// A widget that implements lazy loading with error handling and loading states
class LazyLoadingWidget<T> extends StatefulWidget {
  /// Constructs a [LazyLoadingWidget]
  const LazyLoadingWidget({
    required this.cacheKey,
    required this.loader,
    required this.builder,
    super.key,
    this.cacheDuration = const Duration(minutes: 10),
    this.loadingBuilder,
    this.errorBuilder,
    this.forceReload = false,
  });

  /// Unique key for caching
  final String cacheKey;

  /// Function to load the data
  final Future<T> Function() loader;

  /// Builder for the loaded data
  final Widget Function(BuildContext context, T data) builder;

  /// Cache duration (null for permanent cache)
  final Duration? cacheDuration;

  /// Builder for loading state
  final Widget Function(BuildContext context)? loadingBuilder;

  /// Builder for error state
  final Widget Function(BuildContext context, dynamic error)? errorBuilder;

  /// Whether to force reload ignoring cache
  final bool forceReload;

  @override
  State<LazyLoadingWidget<T>> createState() => _LazyLoadingWidgetState<T>();
}

class _LazyLoadingWidgetState<T> extends State<LazyLoadingWidget<T>> {
  late Future<T> _future;

  @override
  void initState() {
    super.initState();
    _future = LazyLoadingManager.instance.lazyLoad<T>(
      key: widget.cacheKey,
      loader: widget.loader,
      cacheDuration: widget.cacheDuration,
      forceReload: widget.forceReload,
    );
  }

  @override
  Widget build(BuildContext context) => FutureBuilder<T>(
    future: _future,
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return widget.loadingBuilder?.call(context) ??
            const Center(child: CircularProgressIndicator.adaptive());
      }

      if (snapshot.hasError) {
        return widget.errorBuilder?.call(context, snapshot.error) ??
            Center(child: Text('Error: ${snapshot.error}'));
      }

      if (snapshot.hasData) {
        return widget.builder(context, snapshot.data as T);
      }

      return const SizedBox.shrink();
    },
  );
}

/// Riverpod provider for lazy loading data
class LazyLoadProvider<T> extends FamilyAsyncNotifier<T, String> {
  /// Constructs a [LazyLoadProvider]
  LazyLoadProvider({
    required this.loader,
    this.cacheDuration = const Duration(minutes: 10),
  });

  /// Function to load the data
  final Future<T> Function(String key) loader;

  /// Cache duration
  final Duration cacheDuration;

  @override
  Future<T> build(String key) async => LazyLoadingManager.instance.lazyLoad<T>(
    key: key,
    loader: () => loader(key),
    cacheDuration: cacheDuration,
  );

  /// Refresh the data for a specific key
  void refresh(String key) {
    LazyLoadingManager.instance.invalidate(key);
    ref.invalidate(this as ProviderOrFamily);
  }
}

/// Extension to add lazy loading capabilities to any widget
extension LazyLoadingExtension on Widget {
  /// Wrap this widget with lazy loading
  Widget withLazyLoading<T>({
    required String cacheKey,
    required Future<T> Function() loader,
    required Widget Function(BuildContext context, T data) builder,
    Duration? cacheDuration = const Duration(minutes: 10),
    Widget Function(BuildContext context)? loadingBuilder,
    Widget Function(BuildContext context, dynamic error)? errorBuilder,
  }) => LazyLoadingWidget<T>(
    cacheKey: cacheKey,
    loader: loader,
    builder: builder,
    cacheDuration: cacheDuration,
    loadingBuilder: loadingBuilder,
    errorBuilder: errorBuilder,
  );
}

/// Utility for batch loading operations
class BatchLoader {
  static const int _defaultBatchSize = 20;
  static const Duration _defaultDelay = Duration(milliseconds: 50);

  /// Load items in batches to prevent overwhelming the UI
  static Stream<List<T>> loadInBatches<T>(
    List<T> items, {
    int batchSize = _defaultBatchSize,
    Duration delay = _defaultDelay,
  }) async* {
    for (var i = 0; i < items.length; i += batchSize) {
      final end = (i + batchSize < items.length) ? i + batchSize : items.length;
      yield items.sublist(i, end);
      if (end < items.length) {
        await Future<void>.delayed(delay);
      }
    }
  }

  /// Process items in batches with a processor function
  static Stream<List<R>> processBatches<T, R>(
    List<T> items,
    Future<R> Function(T item) processor, {
    int batchSize = _defaultBatchSize,
    Duration delay = _defaultDelay,
  }) async* {
    await for (final batch in loadInBatches(
      items,
      batchSize: batchSize,
      delay: delay,
    )) {
      final results = await Future.wait(batch.map(processor));
      yield results;
    }
  }
}
