import 'package:clubland/features/events/presentation/widgets/capacity_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/test_helpers.dart';

void main() {
  group('CapacityIndicator', () {
    testWidgets('should render with low capacity (green)', (tester) async {
      await tester.pumpApp(
        const CapacityIndicator(
          currentAttendees: 20,
          capacity: 100,
        ),
      );

      expect(find.text('80 spots available'), findsOneWidget);
      expect(find.text('20 / 100'), findsOneWidget);
      expect(find.byType(LinearProgressIndicator), findsOneWidget);

      final progressIndicator = tester.widget<LinearProgressIndicator>(
        find.byType(LinearProgressIndicator),
      );
      expect(progressIndicator.value, 0.2);
      expect(
        (progressIndicator.valueColor as AlwaysStoppedAnimation<Color>).value,
        Colors.green,
      );
    });

    testWidgets('should render nearly full capacity (orange)', (tester) async {
      await tester.pumpApp(
        const CapacityIndicator(
          currentAttendees: 85,
          capacity: 100,
        ),
      );

      expect(find.text('15 spots available'), findsOneWidget);
      expect(find.text('85 / 100'), findsOneWidget);

      final progressIndicator = tester.widget<LinearProgressIndicator>(
        find.byType(LinearProgressIndicator),
      );
      expect(progressIndicator.value, 0.85);
      expect(
        (progressIndicator.valueColor as AlwaysStoppedAnimation<Color>).value,
        Colors.orange,
      );
    });

    testWidgets('should render full capacity (red)', (tester) async {
      await tester.pumpApp(
        const CapacityIndicator(
          currentAttendees: 100,
          capacity: 100,
        ),
      );

      expect(find.text('Event Full'), findsOneWidget);
      expect(find.text('100 / 100'), findsOneWidget);

      final progressIndicator = tester.widget<LinearProgressIndicator>(
        find.byType(LinearProgressIndicator),
      );
      expect(progressIndicator.value, 1.0);
      expect(
        (progressIndicator.valueColor as AlwaysStoppedAnimation<Color>).value,
        Colors.red,
      );
    });

    testWidgets('should render over capacity (red)', (tester) async {
      await tester.pumpApp(
        const CapacityIndicator(
          currentAttendees: 105,
          capacity: 100,
        ),
      );

      expect(find.text('Event Full'), findsOneWidget);
      expect(find.text('105 / 100'), findsOneWidget);

      final progressIndicator = tester.widget<LinearProgressIndicator>(
        find.byType(LinearProgressIndicator),
      );
      expect(progressIndicator.value, 1.05);
      expect(
        (progressIndicator.valueColor as AlwaysStoppedAnimation<Color>).value,
        Colors.red,
      );
    });

    testWidgets('should handle singular spot text correctly', (tester) async {
      await tester.pumpApp(
        const CapacityIndicator(
          currentAttendees: 9,
          capacity: 10,
        ),
      );

      expect(find.text('1 spot available'), findsOneWidget);
    });

    testWidgets('should handle plural spots text correctly', (tester) async {
      await tester.pumpApp(
        const CapacityIndicator(
          currentAttendees: 8,
          capacity: 10,
        ),
      );

      expect(find.text('2 spots available'), findsOneWidget);
    });

    testWidgets('should hide label when showLabel is false', (tester) async {
      await tester.pumpApp(
        const CapacityIndicator(
          currentAttendees: 20,
          capacity: 100,
          showLabel: false,
        ),
      );

      expect(find.text('80 spots available'), findsNothing);
      expect(find.text('20 / 100'), findsNothing);
      expect(find.byType(LinearProgressIndicator), findsOneWidget);
    });

    testWidgets('should respect custom height parameter', (tester) async {
      await tester.pumpApp(
        const CapacityIndicator(
          currentAttendees: 50,
          capacity: 100,
          height: 12,
        ),
      );

      final progressIndicator = tester.widget<LinearProgressIndicator>(
        find.byType(LinearProgressIndicator),
      );
      expect(progressIndicator.minHeight, 12);
    });

    testWidgets('should use default height when not specified',
        (tester) async {
      await tester.pumpApp(
        const CapacityIndicator(
          currentAttendees: 50,
          capacity: 100,
        ),
      );

      final progressIndicator = tester.widget<LinearProgressIndicator>(
        find.byType(LinearProgressIndicator),
      );
      expect(progressIndicator.minHeight, 8);
    });

    testWidgets('should handle zero capacity gracefully', (tester) async {
      await tester.pumpApp(
        const CapacityIndicator(
          currentAttendees: 0,
          capacity: 0,
        ),
      );

      expect(find.text('Event Full'), findsOneWidget);
      expect(find.text('0 / 0'), findsOneWidget);

      final progressIndicator = tester.widget<LinearProgressIndicator>(
        find.byType(LinearProgressIndicator),
      );
      expect(progressIndicator.value, 0.0);
    });

    testWidgets('should calculate progress correctly at 80% threshold',
        (tester) async {
      await tester.pumpApp(
        const CapacityIndicator(
          currentAttendees: 80,
          capacity: 100,
        ),
      );

      final progressIndicator = tester.widget<LinearProgressIndicator>(
        find.byType(LinearProgressIndicator),
      );
      expect(progressIndicator.value, 0.8);
      // At exactly 80%, should be orange (isNearlyFull)
      expect(
        (progressIndicator.valueColor as AlwaysStoppedAnimation<Color>).value,
        Colors.orange,
      );
    });

    testWidgets('should be green just below 80% threshold', (tester) async {
      await tester.pumpApp(
        const CapacityIndicator(
          currentAttendees: 79,
          capacity: 100,
        ),
      );

      final progressIndicator = tester.widget<LinearProgressIndicator>(
        find.byType(LinearProgressIndicator),
      );
      expect(progressIndicator.value, 0.79);
      expect(
        (progressIndicator.valueColor as AlwaysStoppedAnimation<Color>).value,
        Colors.green,
      );
    });
  });

  group('CompactCapacityIndicator', () {
    testWidgets('should render compact view with available spots',
        (tester) async {
      await tester.pumpApp(
        const CompactCapacityIndicator(
          currentAttendees: 30,
          capacity: 100,
        ),
      );

      expect(find.text('30/100'), findsOneWidget);
      expect(find.byIcon(Icons.people), findsOneWidget);
    });

    testWidgets('should render compact view when full', (tester) async {
      await tester.pumpApp(
        const CompactCapacityIndicator(
          currentAttendees: 100,
          capacity: 100,
        ),
      );

      expect(find.text('100/100'), findsOneWidget);
      expect(find.byIcon(Icons.event_busy), findsOneWidget);

      final icon = tester.widget<Icon>(find.byIcon(Icons.event_busy));
      expect(icon.color, Colors.red);
    });

    testWidgets('should show correct icon for available spots',
        (tester) async {
      await tester.pumpApp(
        const CompactCapacityIndicator(
          currentAttendees: 50,
          capacity: 100,
        ),
      );

      expect(find.byIcon(Icons.people), findsOneWidget);
      expect(find.byIcon(Icons.event_busy), findsNothing);
    });

    testWidgets('should render with proper icon size', (tester) async {
      await tester.pumpApp(
        const CompactCapacityIndicator(
          currentAttendees: 30,
          capacity: 100,
        ),
      );

      final icon = tester.widget<Icon>(find.byIcon(Icons.people));
      expect(icon.size, 16);
    });

    testWidgets('should handle zero attendees', (tester) async {
      await tester.pumpApp(
        const CompactCapacityIndicator(
          currentAttendees: 0,
          capacity: 50,
        ),
      );

      expect(find.text('0/50'), findsOneWidget);
      expect(find.byIcon(Icons.people), findsOneWidget);
    });

    group('accessibility', () {
      testWidgets('should be accessible', (tester) async {
        await tester.pumpApp(
          const CapacityIndicator(
            currentAttendees: 50,
            capacity: 100,
          ),
        );

        expect(find.byType(CapacityIndicator), findsOneWidget);
        expect(find.text('50 spots available'), findsOneWidget);
      });
    });
  });
}
