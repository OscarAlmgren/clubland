import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';

import '../errors/failures.dart';
import 'performance_monitor.dart';

/// Database optimization utilities for efficient queries and caching
class DatabaseOptimizations with PerformanceMonitoring {
  DatabaseOptimizations._() : _logger = Logger();

  static DatabaseOptimizations? _instance;
  static DatabaseOptimizations get instance => _instance ??= DatabaseOptimizations._();

  final Logger _logger;
  final Map<String, dynamic> _queryCache = {};
  final Map<String, DateTime> _cacheTimestamps = {};
  final Map<String, Timer> _cacheExpirationTimers = {};

  /// Execute a query with caching and performance monitoring
  Future<Either<Failure, T>> executeOptimizedQuery<T>({
    required String queryKey,
    required Future<Either<Failure, T>> Function() query,
    Duration cacheDuration = const Duration(minutes: 5),
    bool useCache = true,
    bool trackPerformance = true,
  }) async {
    // Check cache first
    if (useCache && _queryCache.containsKey(queryKey)) {
      _logger.d('Returning cached result for query: $queryKey');
      return Right(_queryCache[queryKey] as T);
    }

    Future<Either<Failure, T>> executeQuery() async {
      final result = await query();

      return result.fold(
        (failure) {
          _logger.w('Query failed: $queryKey - ${failure.message}');
          return Left(failure);
        },
        (data) {
          if (useCache) {
            _cacheQuery(queryKey, data, cacheDuration);
          }
          return Right(data);
        },
      );
    }

    if (trackPerformance) {
      return await timeMethod('executeQuery', () => executeQuery());
    } else {
      return await executeQuery();
    }
  }

  /// Cache query result with expiration
  void _cacheQuery<T>(String queryKey, T data, Duration cacheDuration) {
    _queryCache[queryKey] = data;
    _cacheTimestamps[queryKey] = DateTime.now();

    // Cancel existing timer if any
    _cacheExpirationTimers[queryKey]?.cancel();

    // Set expiration timer
    _cacheExpirationTimers[queryKey] = Timer(cacheDuration, () {
      _invalidateQuery(queryKey);
    });

    _logger.d('Cached query result: $queryKey (expires in ${cacheDuration.inMinutes}m)');
  }

  /// Invalidate cached query
  void invalidateQuery(String queryKey) {
    _invalidateQuery(queryKey);
    _logger.d('Invalidated cache for query: $queryKey');
  }

  void _invalidateQuery(String queryKey) {
    _queryCache.remove(queryKey);
    _cacheTimestamps.remove(queryKey);
    _cacheExpirationTimers[queryKey]?.cancel();
    _cacheExpirationTimers.remove(queryKey);
  }

  /// Invalidate all queries matching a pattern
  void invalidatePattern(RegExp pattern) {
    final keysToInvalidate = <String>[];
    for (final key in _queryCache.keys) {
      if (pattern.hasMatch(key)) {
        keysToInvalidate.add(key);
      }
    }
    for (final key in keysToInvalidate) {
      _invalidateQuery(key);
    }
    _logger.d('Invalidated ${keysToInvalidate.length} cached queries');
  }

  /// Clear all cached queries
  void clearCache() {
    final count = _queryCache.length;
    for (final timer in _cacheExpirationTimers.values) {
      timer.cancel();
    }
    _queryCache.clear();
    _cacheTimestamps.clear();
    _cacheExpirationTimers.clear();
    _logger.d('Cleared $count cached queries');
  }

  /// Get cache statistics
  Map<String, dynamic> getCacheStats() {
    return {
      'cachedQueries': _queryCache.length,
      'activeTimers': _cacheExpirationTimers.length,
      'queries': _queryCache.keys.toList(),
      'oldestCache': _cacheTimestamps.values.isEmpty
          ? null
          : _cacheTimestamps.values.reduce((a, b) => a.isBefore(b) ? a : b).toIso8601String(),
    };
  }
}

/// Batch query executor for efficient bulk operations
class BatchQueryExecutor with PerformanceMonitoring {
  static const int defaultBatchSize = 50;
  static const Duration defaultBatchDelay = Duration(milliseconds: 100);

  /// Execute queries in batches to avoid overwhelming the database
  Future<List<Either<Failure, T>>> executeBatch<T>({
    required List<Future<Either<Failure, T>> Function()> queries,
    int batchSize = defaultBatchSize,
    Duration batchDelay = defaultBatchDelay,
    bool trackPerformance = true,
  }) async {
    Future<List<Either<Failure, T>>> execute() async {
      final results = <Either<Failure, T>>[];

      for (int i = 0; i < queries.length; i += batchSize) {
        final end = (i + batchSize < queries.length) ? i + batchSize : queries.length;
        final batch = queries.sublist(i, end);

        // Execute batch concurrently
        final batchResults = await Future.wait(
          batch.map((query) => query()),
        );

        results.addAll(batchResults);

        // Add delay between batches to prevent overwhelming the system
        if (end < queries.length) {
          await Future.delayed(batchDelay);
        }
      }

      return results;
    }

    if (trackPerformance) {
      return await timeMethod('executeBatch_${queries.length}', () => execute());
    } else {
      return await execute();
    }
  }

  /// Execute queries with retry logic for failed operations
  Future<List<Either<Failure, T>>> executeBatchWithRetry<T>({
    required List<Future<Either<Failure, T>> Function()> queries,
    int batchSize = defaultBatchSize,
    Duration batchDelay = defaultBatchDelay,
    int maxRetries = 2,
    Duration retryDelay = const Duration(seconds: 1),
  }) async {
    final results = <Either<Failure, T>>[];

    for (int i = 0; i < queries.length; i += batchSize) {
      final end = (i + batchSize < queries.length) ? i + batchSize : queries.length;
      final batch = queries.sublist(i, end);

      final batchResults = <Either<Failure, T>>[];

      for (final query in batch) {
        Either<Failure, T>? result;
        int attempts = 0;

        while (result == null && attempts <= maxRetries) {
          try {
            result = await query();

            // If it failed, retry
            if (result.isLeft() && attempts < maxRetries) {
              await Future.delayed(retryDelay);
              result = null;
              attempts++;
            }
          } catch (e) {
            if (attempts >= maxRetries) {
              result = Left(UnknownFailure.unexpected(e.toString()));
            } else {
              await Future.delayed(retryDelay);
              attempts++;
            }
          }
        }

        batchResults.add(result!);
      }

      results.addAll(batchResults);

      // Add delay between batches
      if (end < queries.length) {
        await Future.delayed(batchDelay);
      }
    }

    return results;
  }
}

/// Query builder for optimized database operations
class OptimizedQueryBuilder {
  String? _table;
  List<String> _select = [];
  Map<String, dynamic> _where = {};
  List<String> _orderBy = [];
  int? _limit;
  int? _offset;
  List<String> _joins = [];
  List<String> _groupBy = [];
  Map<String, dynamic> _having = {};

  /// Select specific fields (optimizes data transfer)
  OptimizedQueryBuilder select(List<String> fields) {
    _select = fields;
    return this;
  }

  /// Set the table to query
  OptimizedQueryBuilder from(String table) {
    _table = table;
    return this;
  }

  /// Add WHERE conditions
  OptimizedQueryBuilder where(String field, dynamic value) {
    _where[field] = value;
    return this;
  }

  /// Add multiple WHERE conditions
  OptimizedQueryBuilder whereMap(Map<String, dynamic> conditions) {
    _where.addAll(conditions);
    return this;
  }

  /// Add ORDER BY clause
  OptimizedQueryBuilder orderBy(String field, {bool ascending = true}) {
    _orderBy.add('$field ${ascending ? 'ASC' : 'DESC'}');
    return this;
  }

  /// Set LIMIT (for pagination)
  OptimizedQueryBuilder limit(int count) {
    _limit = count;
    return this;
  }

  /// Set OFFSET (for pagination)
  OptimizedQueryBuilder offset(int count) {
    _offset = count;
    return this;
  }

  /// Add JOIN clause
  OptimizedQueryBuilder join(String table, String condition) {
    _joins.add('JOIN $table ON $condition');
    return this;
  }

  /// Add LEFT JOIN clause
  OptimizedQueryBuilder leftJoin(String table, String condition) {
    _joins.add('LEFT JOIN $table ON $condition');
    return this;
  }

  /// Add GROUP BY clause
  OptimizedQueryBuilder groupBy(String field) {
    _groupBy.add(field);
    return this;
  }

  /// Add HAVING conditions
  OptimizedQueryBuilder having(String field, dynamic value) {
    _having[field] = value;
    return this;
  }

  /// Build the SQL query string
  String buildSql() {
    if (_table == null) {
      throw StateError('Table must be specified');
    }

    final buffer = StringBuffer();

    // SELECT clause
    if (_select.isEmpty) {
      buffer.write('SELECT * ');
    } else {
      buffer.write('SELECT ${_select.join(', ')} ');
    }

    // FROM clause
    buffer.write('FROM $_table ');

    // JOIN clauses
    if (_joins.isNotEmpty) {
      buffer.write('${_joins.join(' ')} ');
    }

    // WHERE clause
    if (_where.isNotEmpty) {
      final conditions = _where.entries
          .map((e) => '${e.key} = ?')
          .join(' AND ');
      buffer.write('WHERE $conditions ');
    }

    // GROUP BY clause
    if (_groupBy.isNotEmpty) {
      buffer.write('GROUP BY ${_groupBy.join(', ')} ');
    }

    // HAVING clause
    if (_having.isNotEmpty) {
      final conditions = _having.entries
          .map((e) => '${e.key} = ?')
          .join(' AND ');
      buffer.write('HAVING $conditions ');
    }

    // ORDER BY clause
    if (_orderBy.isNotEmpty) {
      buffer.write('ORDER BY ${_orderBy.join(', ')} ');
    }

    // LIMIT clause
    if (_limit != null) {
      buffer.write('LIMIT $_limit ');
    }

    // OFFSET clause
    if (_offset != null) {
      buffer.write('OFFSET $_offset ');
    }

    return buffer.toString().trim();
  }

  /// Get parameter values in order
  List<dynamic> getParameters() {
    final params = <dynamic>[];
    params.addAll(_where.values);
    params.addAll(_having.values);
    return params;
  }

  /// Create a cache key for this query
  String getCacheKey() {
    return '${buildSql()}_${getParameters().join('_')}';
  }
}

/// Extension to add database optimization to repository classes
mixin DatabaseOptimizationMixin {
  /// Get the database optimization instance
  DatabaseOptimizations get dbOptimizations => DatabaseOptimizations.instance;

  /// Execute an optimized query with caching
  Future<Either<Failure, T>> executeOptimized<T>({
    required String queryKey,
    required Future<Either<Failure, T>> Function() query,
    Duration cacheDuration = const Duration(minutes: 5),
    bool useCache = true,
  }) {
    return dbOptimizations.executeOptimizedQuery<T>(
      queryKey: queryKey,
      query: query,
      cacheDuration: cacheDuration,
      useCache: useCache,
    );
  }

  /// Create an optimized query builder
  OptimizedQueryBuilder queryBuilder() => OptimizedQueryBuilder();

  /// Invalidate cache for specific queries
  void invalidateCache(String pattern) {
    dbOptimizations.invalidatePattern(RegExp(pattern));
  }
}

/// Pagination helper for efficient large dataset handling
class PaginationHelper {
  /// Calculate optimal page size based on available memory and data complexity
  static int calculateOptimalPageSize({
    int estimatedItemSize = 1024, // bytes per item
    int maxMemoryUsage = 10 * 1024 * 1024, // 10MB
    int minPageSize = 10,
    int maxPageSize = 100,
  }) {
    final calculatedPageSize = maxMemoryUsage ~/ estimatedItemSize;
    return calculatedPageSize.clamp(minPageSize, maxPageSize);
  }

  /// Create paginated query with performance optimization
  static OptimizedQueryBuilder paginatedQuery({
    required String table,
    required int page,
    required int pageSize,
    List<String>? select,
    Map<String, dynamic>? where,
    List<String>? orderBy,
  }) {
    final builder = OptimizedQueryBuilder()
        .from(table)
        .limit(pageSize)
        .offset(page * pageSize);

    if (select != null) {
      builder.select(select);
    }

    if (where != null) {
      builder.whereMap(where);
    }

    if (orderBy != null) {
      for (final order in orderBy) {
        final parts = order.split(' ');
        final field = parts[0];
        final ascending = parts.length == 1 || parts[1].toUpperCase() == 'ASC';
        builder.orderBy(field, ascending: ascending);
      }
    }

    return builder;
  }
}