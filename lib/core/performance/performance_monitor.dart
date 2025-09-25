import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

/// Performance monitoring service for tracking app performance metrics
class PerformanceMonitor {
  PerformanceMonitor._() : _logger = Logger();

  static PerformanceMonitor? _instance;
  static PerformanceMonitor get instance => _instance ??= PerformanceMonitor._();

  final Logger _logger;
  final Map<String, DateTime> _operationStartTimes = {};
  final Map<String, int> _operationCounts = {};
  final Map<String, double> _operationDurations = {};

  /// Start timing an operation
  void startOperation(String operationName) {
    _operationStartTimes[operationName] = DateTime.now();
  }

  /// End timing an operation and log the duration
  void endOperation(String operationName) {
    final startTime = _operationStartTimes.remove(operationName);
    if (startTime == null) {
      _logger.w('No start time found for operation: $operationName');
      return;
    }

    final duration = DateTime.now().difference(startTime).inMilliseconds.toDouble();

    // Update statistics
    _operationCounts[operationName] = (_operationCounts[operationName] ?? 0) + 1;
    _operationDurations[operationName] =
        ((_operationDurations[operationName] ?? 0.0) + duration) / _operationCounts[operationName]!;

    if (duration > 100) { // Log operations taking more than 100ms
      _logger.w('Slow operation "$operationName": ${duration}ms');
    } else if (kDebugMode) {
      _logger.d('Operation "$operationName": ${duration}ms');
    }
  }

  /// Time a Future operation and return its result
  Future<T> timeOperation<T>(String operationName, Future<T> Function() operation) async {
    startOperation(operationName);
    try {
      final result = await operation();
      endOperation(operationName);
      return result;
    } catch (e) {
      endOperation(operationName);
      _logger.e('Operation "$operationName" failed: $e');
      rethrow;
    }
  }

  /// Time a synchronous operation and return its result
  T timeSync<T>(String operationName, T Function() operation) {
    startOperation(operationName);
    try {
      final result = operation();
      endOperation(operationName);
      return result;
    } catch (e) {
      endOperation(operationName);
      _logger.e('Sync operation "$operationName" failed: $e');
      rethrow;
    }
  }

  /// Get performance statistics for debugging
  Map<String, dynamic> getPerformanceStats() {
    return {
      'operationCounts': Map.from(_operationCounts),
      'averageDurations': Map.from(_operationDurations),
      'memoryUsage': _getMemoryUsage(),
      'activeOperations': _operationStartTimes.keys.toList(),
    };
  }

  /// Log current performance statistics
  void logPerformanceStats() {
    if (kDebugMode) {
      final stats = getPerformanceStats();
      _logger.i('Performance Stats: $stats');
    }
  }

  /// Clear all performance statistics
  void clearStats() {
    _operationCounts.clear();
    _operationDurations.clear();
    _operationStartTimes.clear();
  }

  /// Get current memory usage (platform-specific)
  Map<String, dynamic> _getMemoryUsage() {
    try {
      if (Platform.isIOS || Platform.isAndroid) {
        // On mobile, we can get basic memory info
        return {
          'platform': Platform.operatingSystem,
          'timestamp': DateTime.now().toIso8601String(),
        };
      }
    } catch (e) {
      _logger.w('Could not get memory usage: $e');
    }
    return {'available': false};
  }

  /// Monitor frame rendering performance
  void startFrameMonitoring() {
    if (kDebugMode) {
      WidgetsBinding.instance.addTimingsCallback((List<FrameTiming> timings) {
        for (final timing in timings) {
          final buildDuration = timing.buildDuration.inMicroseconds / 1000.0;
          final rasterDuration = timing.rasterDuration.inMicroseconds / 1000.0;

          if (buildDuration > 16.0 || rasterDuration > 16.0) { // 60fps = 16ms per frame
            _logger.w('Slow frame - Build: ${buildDuration}ms, Raster: ${rasterDuration}ms');
          }
        }
      });
    }
  }

  /// Create a performance-aware StreamController
  StreamController<T> createPerformantStreamController<T>(String name) {
    return StreamController<T>.broadcast(
      onListen: () => _logger.d('Stream "$name" listener added'),
      onCancel: () => _logger.d('Stream "$name" listener removed'),
    );
  }
}

/// Extension to add performance monitoring to Futures
extension FuturePerformance<T> on Future<T> {
  /// Add performance monitoring to a Future
  Future<T> withPerformanceMonitoring(String operationName) {
    return PerformanceMonitor.instance.timeOperation(operationName, () => this);
  }
}

/// Mixin to add performance monitoring capabilities to any class
mixin PerformanceMonitoring {
  /// Performance monitor instance
  PerformanceMonitor get performanceMonitor => PerformanceMonitor.instance;

  /// Time a method execution
  Future<T> timeMethod<T>(String methodName, Future<T> Function() method) {
    return performanceMonitor.timeOperation('${runtimeType}.$methodName', method);
  }

  /// Time a synchronous method execution
  T timeMethodSync<T>(String methodName, T Function() method) {
    return performanceMonitor.timeSync('${runtimeType}.$methodName', method);
  }
}