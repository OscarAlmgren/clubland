import 'package:flutter_test/flutter_test.dart';
import 'package:clubland/core/performance/performance_monitor.dart';

void main() {
  group('PerformanceMonitor', () {
    late PerformanceMonitor monitor;

    setUp(() {
      // Reset singleton instance before each test
      PerformanceMonitor.resetInstance();
      monitor = PerformanceMonitor();
      monitor.clearStats();
    });

    tearDown(() {
      monitor.clearStats();
      PerformanceMonitor.resetInstance();
    });

    group('Singleton Pattern', () {
      test('should return the same instance', () {
        final instance1 = PerformanceMonitor();
        final instance2 = PerformanceMonitor();

        expect(instance1, same(instance2));
      });

      test('should maintain state across instances', () {
        final instance1 = PerformanceMonitor();
        instance1.startOperation('test_op');

        final instance2 = PerformanceMonitor();
        final stats = instance2.getPerformanceStats();

        expect(stats['activeOperations'], contains('test_op'));
      });
    });

    group('Operation Timing', () {
      test('should track operation start time', () {
        monitor.startOperation('test_operation');

        final stats = monitor.getPerformanceStats();
        expect(stats['activeOperations'], contains('test_operation'));
      });

      test('should remove operation from active list when ended', () {
        monitor.startOperation('test_operation');
        monitor.endOperation('test_operation');

        final stats = monitor.getPerformanceStats();
        expect(stats['activeOperations'], isEmpty);
      });

      test('should handle ending operation without starting', () {
        // Should not throw, just log warning
        expect(() => monitor.endOperation('nonexistent'), returnsNormally);
      });

      test('should track operation duration', () {
        monitor.startOperation('test_operation');
        monitor.endOperation('test_operation');

        final stats = monitor.getPerformanceStats();
        final durations = stats['averageDurations'] as Map<String, double>;

        expect(durations.containsKey('test_operation'), true);
        expect(durations['test_operation'], greaterThanOrEqualTo(0));
      });

      test('should calculate average duration for multiple operations', () {
        for (var i = 0; i < 3; i++) {
          monitor.startOperation('repeated_op');
          monitor.endOperation('repeated_op');
        }

        final stats = monitor.getPerformanceStats();
        final counts = stats['operationCounts'] as Map<String, int>;
        final durations = stats['averageDurations'] as Map<String, double>;

        expect(counts['repeated_op'], equals(3));
        expect(durations['repeated_op'], greaterThanOrEqualTo(0));
      });

      test('should track multiple concurrent operations', () {
        monitor.startOperation('operation_1');
        monitor.startOperation('operation_2');
        monitor.startOperation('operation_3');

        final stats = monitor.getPerformanceStats();
        final activeOps = stats['activeOperations'] as List;

        expect(activeOps.length, equals(3));
        expect(
          activeOps,
          containsAll(['operation_1', 'operation_2', 'operation_3']),
        );
      });

      test('should handle rapid successive operations', () {
        for (var i = 0; i < 100; i++) {
          monitor.startOperation('rapid_op_$i');
          monitor.endOperation('rapid_op_$i');
        }

        final stats = monitor.getPerformanceStats();
        final counts = stats['operationCounts'] as Map<String, int>;

        expect(counts.length, equals(100));
      });
    });

    group('Async Operation Timing', () {
      test('should time async operation and return result', () async {
        final result = await monitor.timeOperation(
          'async_test',
          () async => 'test_result',
        );

        expect(result, equals('test_result'));

        final stats = monitor.getPerformanceStats();
        final counts = stats['operationCounts'] as Map<String, int>;
        expect(counts['async_test'], equals(1));
      });

      test('should time delayed async operation', () async {
        final result = await monitor.timeOperation('delayed_op', () async {
          await Future.delayed(const Duration(milliseconds: 50));
          return 42;
        });

        expect(result, equals(42));

        final stats = monitor.getPerformanceStats();
        final durations = stats['averageDurations'] as Map<String, double>;
        expect(durations['delayed_op'], greaterThanOrEqualTo(50));
      });

      test('should handle async operation errors', () async {
        await expectLater(
          monitor.timeOperation(
            'error_op',
            () async => throw Exception('Test error'),
          ),
          throwsException,
        );

        // Operation should still be tracked even if it fails
        final stats = monitor.getPerformanceStats();
        final counts = stats['operationCounts'] as Map<String, int>;
        expect(counts['error_op'], equals(1));
      });

      test('should handle multiple concurrent async operations', () async {
        final futures = List.generate(
          5,
          (i) => monitor.timeOperation('concurrent_$i', () async {
            await Future.delayed(Duration(milliseconds: 10 * (i + 1)));
            return i;
          }),
        );

        final results = await Future.wait(futures);

        expect(results, equals([0, 1, 2, 3, 4]));

        final stats = monitor.getPerformanceStats();
        final counts = stats['operationCounts'] as Map<String, int>;
        expect(counts.length, equals(5));
      });

      test('should maintain order with async operations', () async {
        final results = <int>[];

        await monitor.timeOperation('first', () async {
          await Future.delayed(const Duration(milliseconds: 20));
          results.add(1);
        });

        await monitor.timeOperation('second', () async {
          await Future.delayed(const Duration(milliseconds: 10));
          results.add(2);
        });

        expect(results, equals([1, 2]));
      });
    });

    group('Sync Operation Timing', () {
      test('should time sync operation and return result', () {
        final result = monitor.timeSync('sync_test', () => 'sync_result');

        expect(result, equals('sync_result'));

        final stats = monitor.getPerformanceStats();
        final counts = stats['operationCounts'] as Map<String, int>;
        expect(counts['sync_test'], equals(1));
      });

      test('should time sync computation', () {
        var sum = 0;
        final result = monitor.timeSync('computation', () {
          for (var i = 0; i < 1000; i++) {
            sum += i;
          }
          return sum;
        });

        expect(result, equals(499500));

        final stats = monitor.getPerformanceStats();
        final counts = stats['operationCounts'] as Map<String, int>;
        expect(counts['computation'], equals(1));
      });

      test('should handle sync operation errors', () {
        expect(
          () => monitor.timeSync(
            'sync_error',
            () => throw Exception('Sync error'),
          ),
          throwsException,
        );

        // Operation should still be tracked
        final stats = monitor.getPerformanceStats();
        final counts = stats['operationCounts'] as Map<String, int>;
        expect(counts['sync_error'], equals(1));
      });

      test('should track multiple sync operations', () {
        for (var i = 0; i < 10; i++) {
          monitor.timeSync('sync_op_$i', () => i * 2);
        }

        final stats = monitor.getPerformanceStats();
        final counts = stats['operationCounts'] as Map<String, int>;
        expect(counts.length, equals(10));
      });
    });

    group('Performance Statistics', () {
      test('should return empty stats initially', () {
        final stats = monitor.getPerformanceStats();

        expect(stats['operationCounts'], isEmpty);
        expect(stats['averageDurations'], isEmpty);
        expect(stats['activeOperations'], isEmpty);
      });

      test('should include memory usage information', () {
        final stats = monitor.getPerformanceStats();

        expect(stats.containsKey('memoryUsage'), true);
        expect(stats['memoryUsage'], isA<Map>());
      });

      test('should track operation counts accurately', () {
        monitor.timeSync('op1', () => 1);
        monitor.timeSync('op1', () => 2);
        monitor.timeSync('op2', () => 3);

        final stats = monitor.getPerformanceStats();
        final counts = stats['operationCounts'] as Map<String, int>;

        expect(counts['op1'], equals(2));
        expect(counts['op2'], equals(1));
      });

      test('should calculate running average for durations', () {
        // First operation
        monitor.startOperation('avg_test');
        monitor.endOperation('avg_test');

        var stats = monitor.getPerformanceStats();
        var durations = stats['averageDurations'] as Map<String, double>;
        final firstDuration = durations['avg_test']!;

        // Second operation
        monitor.startOperation('avg_test');
        monitor.endOperation('avg_test');

        stats = monitor.getPerformanceStats();
        durations = stats['averageDurations'] as Map<String, double>;
        final avgDuration = durations['avg_test']!;

        // Average should be recalculated
        expect(avgDuration, greaterThanOrEqualTo(0));
      });

      test('should list all active operations', () {
        monitor.startOperation('active1');
        monitor.startOperation('active2');
        monitor.startOperation('active3');

        final stats = monitor.getPerformanceStats();
        final activeOps = stats['activeOperations'] as List;

        expect(activeOps.length, equals(3));
        expect(activeOps, containsAll(['active1', 'active2', 'active3']));
      });

      test('should clear all statistics', () {
        monitor.startOperation('test1');
        monitor.endOperation('test1');
        monitor.startOperation('test2');

        monitor.clearStats();

        final stats = monitor.getPerformanceStats();
        expect(stats['operationCounts'], isEmpty);
        expect(stats['averageDurations'], isEmpty);
        expect(stats['activeOperations'], isEmpty);
      });

      test('should log performance stats without errors', () {
        monitor.timeSync('logged_op', () => 123);

        expect(() => monitor.logPerformanceStats(), returnsNormally);
      });
    });

    group('Extension Methods', () {
      test('should work with Future extension', () async {
        final future = Future.delayed(
          const Duration(milliseconds: 10),
          () => 'extension_result',
        );

        final result = await future.withPerformanceMonitoring('extension_test');

        expect(result, equals('extension_result'));

        final stats = monitor.getPerformanceStats();
        final counts = stats['operationCounts'] as Map<String, int>;
        expect(counts['extension_test'], equals(1));
      });

      test('should handle Future extension errors', () async {
        final future = Future<String>.error(Exception('Extension error'));

        await expectLater(
          future.withPerformanceMonitoring('extension_error'),
          throwsException,
        );
      });
    });

    group('PerformanceMonitoring Mixin', () {
      test('should provide performanceMonitor instance', () {
        final testClass = _TestClassWithMixin();

        expect(testClass.performanceMonitor, isA<PerformanceMonitor>());
        expect(testClass.performanceMonitor, same(monitor));
      });

      test('should time async method execution', () async {
        final testClass = _TestClassWithMixin();

        final result = await testClass.testAsyncMethod();

        expect(result, equals('async_result'));

        final stats = monitor.getPerformanceStats();
        final counts = stats['operationCounts'] as Map<String, int>;
        expect(counts.containsKey('_TestClassWithMixin.testMethod'), true);
      });

      test('should time sync method execution', () {
        final testClass = _TestClassWithMixin();

        final result = testClass.testSyncMethod();

        expect(result, equals(42));

        final stats = monitor.getPerformanceStats();
        final counts = stats['operationCounts'] as Map<String, int>;
        expect(counts.containsKey('_TestClassWithMixin.syncMethod'), true);
      });
    });

    group('Edge Cases', () {
      test('should handle very fast operations', () {
        final result = monitor.timeSync('instant', () => 'done');

        expect(result, equals('done'));

        final stats = monitor.getPerformanceStats();
        final durations = stats['averageDurations'] as Map<String, double>;
        expect(durations['instant'], greaterThanOrEqualTo(0));
      });

      test('should handle operations with same name', () {
        monitor.startOperation('duplicate');
        monitor.startOperation('duplicate');

        // Second start should overwrite first
        monitor.endOperation('duplicate');

        final stats = monitor.getPerformanceStats();
        final activeOps = stats['activeOperations'] as List;
        expect(activeOps, isEmpty);
      });

      test('should handle null or empty operation names', () {
        expect(() => monitor.startOperation(''), returnsNormally);
        expect(() => monitor.endOperation(''), returnsNormally);
      });

      test('should handle very long operation names', () {
        final longName = 'operation_' * 100;

        monitor.startOperation(longName);
        monitor.endOperation(longName);

        final stats = monitor.getPerformanceStats();
        final counts = stats['operationCounts'] as Map<String, int>;
        expect(counts.containsKey(longName), true);
      });

      test('should handle special characters in operation names', () {
        const specialName = 'op-with.special@chars#123';

        monitor.startOperation(specialName);
        monitor.endOperation(specialName);

        final stats = monitor.getPerformanceStats();
        final counts = stats['operationCounts'] as Map<String, int>;
        expect(counts.containsKey(specialName), true);
      });
    });

    group('Stream Controller Creation', () {
      test('should create broadcast stream controller', () {
        final controller = monitor.createPerformantStreamController<int>(
          'test_stream',
        );

        expect(controller.stream.isBroadcast, true);
        expect(controller.hasListener, false);

        controller.close();
      });

      test('should handle multiple listeners', () async {
        final controller = monitor.createPerformantStreamController<String>(
          'multi_stream',
        );

        var listener1Called = false;
        var listener2Called = false;

        controller.stream.listen((_) => listener1Called = true);
        controller.stream.listen((_) => listener2Called = true);

        controller.add('test');

        // Wait for stream events to be delivered
        await Future.delayed(Duration.zero);

        expect(listener1Called, true);
        expect(listener2Called, true);

        await controller.close();
      });
    });
  });
}

// Test class for mixin testing
class _TestClassWithMixin with PerformanceMonitoring {
  Future<String> testAsyncMethod() {
    return timeMethod('testMethod', () async => 'async_result');
  }

  int testSyncMethod() {
    return timeMethodSync('syncMethod', () => 42);
  }
}
