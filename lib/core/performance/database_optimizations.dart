import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';

import '../errors/failures.dart';
import 'performance_monitor.dart';

/// Database optimization utilities for efficient queries and caching.
///
/// This singleton class provides methods to execute queries with caching,
/// performance monitoring, and cache invalidation features.
class DatabaseOptimizations with PerformanceMonitoring {
  DatabaseOptimizations._() : _logger = Logger();

  static DatabaseOptimizations? _instance;

  /// Provides the singleton instance of [DatabaseOptimizations].
  static DatabaseOptimizations get instance =>
      _instance ??= _instance ??= DatabaseOptimizations._();

  final Logger _logger;
  final Map<String, dynamic> _queryCache = {};
  final Map<String, DateTime> _cacheTimestamps = {};
  final Map<String, Timer> _cacheExpirationTimers = {};

  /// Execute a query with caching and performance monitoring.
  ///
  /// If [useCache] is true and a valid cached result exists for [queryKey],
  /// it is returned immediately. Otherwise, the [query] function is executed,
  /// its result is cached (if successful), and then returned.
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
      return timeMethod('executeQuery', executeQuery);
    } else {
      return executeQuery();
    }
  }

  /// Cache query result with expiration.
  void _cacheQuery<T>(String queryKey, T data, Duration cacheDuration) {
    _queryCache[queryKey] = data;
    _cacheTimestamps[queryKey] = DateTime.now();

    // Cancel existing timer if any
    _cacheExpirationTimers[queryKey]?.cancel();

    // Set expiration timer
    _cacheExpirationTimers[queryKey] = Timer(cacheDuration, () {
      _invalidateQuery(queryKey);
    });

    _logger.d(
      'Cached query result: $queryKey (expires in ${cacheDuration.inMinutes}m)',
    );
  }

  /// Invalidate cached query for a specific [queryKey].
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

  /// Invalidate all queries whose keys match the given [pattern].
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

  /// Clear all cached queries and cancel all expiration timers.
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

  /// Get cache statistics including the number of cached queries, active timers,
  /// query keys, and the timestamp of the oldest cached item.
  Map<String, dynamic> getCacheStats() => {
    'cachedQueries': _queryCache.length,
    'activeTimers': _cacheExpirationTimers.length,
    'queries': _queryCache.keys.toList(),
    'oldestCache': _cacheTimestamps.values.isEmpty
        ? null
        : _cacheTimestamps.values
              .reduce((a, b) => a.isBefore(b) ? a : b)
              .toIso8601String(),
  };
}

/// Batch query executor for efficient bulk operations.
///
/// Handles execution of multiple queries concurrently in batches with optional
/// delays and retry logic.
class BatchQueryExecutor with PerformanceMonitoring {
  /// The default number of queries to execute in a single batch.
  static const int defaultBatchSize = 50;

  /// The default delay to wait between executing subsequent batches.
  static const Duration defaultBatchDelay = Duration(milliseconds: 100);

  /// Execute queries in batches to avoid overwhelming the database.
  ///
  /// Queries are executed concurrently within each batch. A delay is applied
  /// between batches based on [batchDelay].
  Future<List<Either<Failure, T>>> executeBatch<T>({
    required List<Future<Either<Failure, T>> Function()> queries,
    int batchSize = defaultBatchSize,
    Duration batchDelay = defaultBatchDelay,
    bool trackPerformance = true,
  }) async {
    Future<List<Either<Failure, T>>> execute() async {
      final results = <Either<Failure, T>>[];

      for (var i = 0; i < queries.length; i += batchSize) {
        final end = (i + batchSize < queries.length)
            ? i + batchSize
            : queries.length;
        final batch = queries.sublist(i, end);

        // Execute batch concurrently
        final batchResults = await Future.wait(batch.map((query) => query()));

        results.addAll(batchResults);

        // Add delay between batches to prevent overwhelming the system
        if (end < queries.length) {
          // Note: The original code returned Future<List<Either<Failure, T>>> here,
          // which is technically correct but not what was desired. We change the
          // generic type to Future<void> as the intent is to pause.
          await Future<void>.delayed(batchDelay);
        }
      }

      return results;
    }

    if (trackPerformance) {
      return timeMethod('executeBatch_${queries.length}', execute);
    } else {
      return execute();
    }
  }

  /// Execute queries with retry logic for failed operations.
  ///
  /// The function attempts to re-execute failed queries up to [maxRetries] times
  /// with a delay of [retryDelay] between attempts.
  Future<List<Either<Failure, T>>> executeBatchWithRetry<T>({
    required List<Future<Either<Failure, T>> Function()> queries,
    int batchSize = defaultBatchSize,
    Duration batchDelay = defaultBatchDelay,
    int maxRetries = 2,
    Duration retryDelay = const Duration(seconds: 1),
  }) async {
    final results = <Either<Failure, T>>[];

    for (var i = 0; i < queries.length; i += batchSize) {
      final end = (i + batchSize < queries.length)
          ? i + batchSize
          : queries.length;
      final batch = queries.sublist(i, end);

      final batchResults = <Either<Failure, T>>[];

      for (final query in batch) {
        Either<Failure, T>? result;
        var attempts = 0;

        while (result == null && attempts <= maxRetries) {
          try {
            result = await query();

            // If it failed, retry (only if it's not the last attempt)
            if (result.isLeft() && attempts < maxRetries) {
              await Future<void>.delayed(retryDelay);
              result = null; // Clear result to trigger loop continuation
              attempts++;
            }
          } on Exception catch (e) {
            // Handle platform-level exceptions
            if (attempts >= maxRetries) {
              result = Left(UnknownFailure.unexpected(e.toString()));
            } else {
              await Future<void>.delayed(retryDelay);
              attempts++;
            }
          }
        }

        batchResults.add(result!);
      }

      results.addAll(batchResults);

      // Add delay between batches
      if (end < queries.length) {
        await Future<void>.delayed(batchDelay);
      }
    }

    return results;
  }
}

/// Query builder for optimized database operations.
///
/// Provides a fluent interface for constructing complex SQL queries
/// while separating the query structure from parameter values.
class OptimizedQueryBuilder {
  String? _table;
  List<String> _select = [];
  // Refactored to hold detailed conditions: {field, operator, value}
  final List<Map<String, dynamic>> _whereConditions = [];
  final List<Map<String, dynamic>> _havingConditions = [];

  final List<String> _orderBy = [];
  int? _limit;
  int? _offset;
  final List<String> _joins = [];
  final List<String> _groupBy = [];

  /// Select specific fields (optimizes data transfer).
  OptimizedQueryBuilder select(List<String> fields) {
    _select = fields;
    return this;
  }

  /// Set the table to query.
  OptimizedQueryBuilder from(String table) {
    _table = table;
    return this;
  }

  /// Add WHERE conditions. Supports custom [operator]s like '>', '<', 'IN', 'LIKE'.
  OptimizedQueryBuilder where(
    String field,
    dynamic value, {
    String operator = '=',
  }) {
    _whereConditions.add({
      'field': field,
      'operator': operator,
      'value': value,
    });
    return this;
  }

  /// Add multiple WHERE conditions.
  /// Note: This simple method only supports the default equality operator (=).
  OptimizedQueryBuilder whereMap(Map<String, dynamic> conditions) {
    conditions.forEach((field, value) {
      where(field, value, operator: '=');
    });
    return this;
  }

  /// Add ORDER BY clause.
  OptimizedQueryBuilder orderBy(String field, {bool ascending = true}) {
    _orderBy.add('$field ${ascending ? 'ASC' : 'DESC'}');
    return this;
  }

  /// Set LIMIT (for pagination).
  OptimizedQueryBuilder limit(int count) {
    _limit = count;
    return this;
  }

  /// Set OFFSET (for pagination).
  OptimizedQueryBuilder offset(int count) {
    _offset = count;
    return this;
  }

  /// Add JOIN clause.
  OptimizedQueryBuilder join(String table, String condition) {
    _joins.add('JOIN $table ON $condition');
    return this;
  }

  /// Add LEFT JOIN clause.
  OptimizedQueryBuilder leftJoin(String table, String condition) {
    _joins.add('LEFT JOIN $table ON $condition');
    return this;
  }

  /// Add GROUP BY clause.
  OptimizedQueryBuilder groupBy(String field) {
    _groupBy.add(field);
    return this;
  }

  /// Add HAVING conditions. Supports custom [operator]s like '>', '<', 'IN', 'LIKE'.
  OptimizedQueryBuilder having(
    String field,
    dynamic value, {
    String operator = '=',
  }) {
    _havingConditions.add({
      'field': field,
      'operator': operator,
      'value': value,
    });
    return this;
  }

  /// Helper to generate the SQL placeholder string for a given condition value.
  String _getPlaceholder(dynamic value, String operator) {
    if (operator.toUpperCase() == 'IN' || operator.toUpperCase() == 'NOT IN') {
      if (value is Iterable) {
        // Generates placeholders like (?, ?, ?) for an array/list
        final placeholders = List.filled(value.length, '?').join(', ');
        return '($placeholders)';
      }
    }
    // Default single placeholder
    return '?';
  }

  /// Build the SQL query string.
  ///
  /// Note: The values for WHERE and HAVING clauses are replaced with `?` placeholders.
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
    if (_whereConditions.isNotEmpty) {
      final conditions = _whereConditions
          .map((e) {
            // Explicitly cast field and operator to String to satisfy the analyzer/linter
            final field = e['field'] as String;
            final operator = e['operator'] as String;
            final value = e['value'];
            final placeholder = _getPlaceholder(value, operator);
            return '$field $operator $placeholder';
          })
          .join(' AND ');
      buffer.write('WHERE $conditions ');
    }

    // GROUP BY clause
    if (_groupBy.isNotEmpty) {
      buffer.write('GROUP BY ${_groupBy.join(', ')} ');
    }

    // HAVING clause
    if (_havingConditions.isNotEmpty) {
      final conditions = _havingConditions
          .map((e) {
            // Explicitly cast field and operator to String to satisfy the analyzer/linter
            final field = e['field'] as String;
            final operator = e['operator'] as String;
            final value = e['value'];
            final placeholder = _getPlaceholder(value, operator);
            return '$field $operator $placeholder';
          })
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

  /// Get parameter values in the order they appear in the built SQL query
  /// (first WHERE values, then HAVING values). Handles array values for 'IN' clauses.
  List<dynamic> getParameters() {
    final params = <dynamic>[];

    void addParameters(List<Map<String, dynamic>> conditions) {
      for (final condition in conditions) {
        final value = condition['value'];
        final operator = condition['operator'] as String;

        // If the operator is 'IN' or 'NOT IN' and the value is a list,
        // spread the list's elements as individual parameters.
        if ((operator.toUpperCase() == 'IN' ||
                operator.toUpperCase() == 'NOT IN') &&
            value is Iterable) {
          params.addAll(value);
        } else {
          // Add the value as a single parameter.
          params.add(value);
        }
      }
    }

    addParameters(_whereConditions);
    addParameters(_havingConditions);

    return params;
  }

  /// Create a unique cache key for this query, combining the SQL string and parameters.
  String getCacheKey() => '${buildSql()}_${getParameters().join('_')}';
}

/// Extension to add database optimization utilities to repository classes.
mixin DatabaseOptimizationMixin {
  /// Get the database optimization singleton instance for caching and stats.
  DatabaseOptimizations get dbOptimizations => DatabaseOptimizations.instance;

  /// Execute an optimized query with caching and performance monitoring.
  Future<Either<Failure, T>> executeOptimized<T>({
    required String queryKey,
    required Future<Either<Failure, T>> Function() query,
    Duration cacheDuration = const Duration(minutes: 5),
    bool useCache = true,
  }) => dbOptimizations.executeOptimizedQuery<T>(
    queryKey: queryKey,
    query: query,
    cacheDuration: cacheDuration,
    useCache: useCache,
  );

  /// Create an optimized query builder for constructing database queries.
  OptimizedQueryBuilder queryBuilder() => OptimizedQueryBuilder();

  /// Invalidate cache for all queries whose keys match the given regex [pattern].
  void invalidateCache(String pattern) {
    dbOptimizations.invalidatePattern(RegExp(pattern));
  }
}

/// Pagination helper for efficient large dataset handling.
class PaginationHelper {
  /// Calculate optimal page size based on available memory and data complexity.
  static int calculateOptimalPageSize({
    int estimatedItemSize = 1024, // bytes per item
    int maxMemoryUsage = 10 * 1024 * 1024, // 10MB
    int minPageSize = 10,
    int maxPageSize = 100,
  }) {
    final calculatedPageSize = maxMemoryUsage ~/ estimatedItemSize;
    return calculatedPageSize.clamp(minPageSize, maxPageSize);
  }

  /// Create paginated query with performance optimization.
  ///
  /// Sets the LIMIT and OFFSET clauses based on [page] and [pageSize].
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

    // Use whereMap, which handles simple equality conditions
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
