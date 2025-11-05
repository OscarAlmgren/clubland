import 'package:clubland/features/events/presentation/widgets/rsvp_status_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/test_helpers.dart';

void main() {
  group('RSVPStatusBadge', () {
    testWidgets('should render confirmed status with correct color and icon',
        (tester) async {
      await tester.pumpApp(
        const RSVPStatusBadge(status: 'confirmed'),
      );

      expect(find.text('Confirmed'), findsOneWidget);
      expect(find.byIcon(Icons.check_circle), findsOneWidget);

      final icon = tester.widget<Icon>(find.byIcon(Icons.check_circle));
      expect(icon.color, Colors.green);
    });

    testWidgets('should render tentative status with correct color and icon',
        (tester) async {
      await tester.pumpApp(
        const RSVPStatusBadge(status: 'tentative'),
      );

      expect(find.text('Tentative'), findsOneWidget);
      expect(find.byIcon(Icons.help_outline), findsOneWidget);

      final icon = tester.widget<Icon>(find.byIcon(Icons.help_outline));
      expect(icon.color, Colors.orange);
    });

    testWidgets('should render pending status with correct color and icon',
        (tester) async {
      await tester.pumpApp(
        const RSVPStatusBadge(status: 'pending'),
      );

      expect(find.text('Pending'), findsOneWidget);
      expect(find.byIcon(Icons.schedule), findsOneWidget);

      final icon = tester.widget<Icon>(find.byIcon(Icons.schedule));
      expect(icon.color, Colors.amber);
    });

    testWidgets(
        'should render pending_approval status with correct color and icon',
        (tester) async {
      await tester.pumpApp(
        const RSVPStatusBadge(status: 'pending_approval'),
      );

      expect(find.text('Pending'), findsOneWidget);
      expect(find.byIcon(Icons.schedule), findsOneWidget);

      final icon = tester.widget<Icon>(find.byIcon(Icons.schedule));
      expect(icon.color, Colors.amber);
    });

    testWidgets('should render waitlist status with correct color and icon',
        (tester) async {
      await tester.pumpApp(
        const RSVPStatusBadge(status: 'waitlist'),
      );

      expect(find.text('Waitlist'), findsOneWidget);
      expect(find.byIcon(Icons.hourglass_empty), findsOneWidget);

      final icon = tester.widget<Icon>(find.byIcon(Icons.hourglass_empty));
      expect(icon.color, Colors.blue);
    });

    testWidgets('should render cancelled status with correct color and icon',
        (tester) async {
      await tester.pumpApp(
        const RSVPStatusBadge(status: 'cancelled'),
      );

      expect(find.text('Cancelled'), findsOneWidget);
      expect(find.byIcon(Icons.cancel), findsOneWidget);

      final icon = tester.widget<Icon>(find.byIcon(Icons.cancel));
      expect(icon.color, Colors.red);
    });

    testWidgets('should render declined status with correct color and icon',
        (tester) async {
      await tester.pumpApp(
        const RSVPStatusBadge(status: 'declined'),
      );

      expect(find.text('Declined'), findsOneWidget);
      expect(find.byIcon(Icons.not_interested), findsOneWidget);

      final icon = tester.widget<Icon>(find.byIcon(Icons.not_interested));
      expect(icon.color, Colors.grey);
    });

    testWidgets('should handle unknown status gracefully', (tester) async {
      await tester.pumpApp(
        const RSVPStatusBadge(status: 'unknown_status'),
      );

      expect(find.text('unknown_status'), findsOneWidget);
      expect(find.byIcon(Icons.info), findsOneWidget);

      final icon = tester.widget<Icon>(find.byIcon(Icons.info));
      expect(icon.color, Colors.grey);
    });

    testWidgets('should be case-insensitive for status matching',
        (tester) async {
      await tester.pumpApp(
        const RSVPStatusBadge(status: 'CONFIRMED'),
      );

      expect(find.text('Confirmed'), findsOneWidget);
      expect(find.byIcon(Icons.check_circle), findsOneWidget);
    });

    testWidgets('should show only icon when showLabel is false',
        (tester) async {
      await tester.pumpApp(
        const RSVPStatusBadge(
          status: 'confirmed',
          showLabel: false,
        ),
      );

      expect(find.text('Confirmed'), findsNothing);
      expect(find.byIcon(Icons.check_circle), findsOneWidget);
    });

    testWidgets('should respect custom size parameter', (tester) async {
      await tester.pumpApp(
        const RSVPStatusBadge(
          status: 'confirmed',
          size: 32,
        ),
      );

      final icon = tester.widget<Icon>(find.byIcon(Icons.check_circle));
      expect(icon.size, 32);
    });

    testWidgets('should use default size when not specified', (tester) async {
      await tester.pumpApp(
        const RSVPStatusBadge(status: 'confirmed'),
      );

      final icon = tester.widget<Icon>(find.byIcon(Icons.check_circle));
      expect(icon.size, 16); // Default size with label
    });

    testWidgets('should render with proper container styling', (tester) async {
      await tester.pumpApp(
        const RSVPStatusBadge(status: 'confirmed'),
      );

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(RSVPStatusBadge),
          matching: find.byType(Container),
        ),
      );

      final decoration = container.decoration as BoxDecoration;
      expect(decoration.borderRadius, BorderRadius.circular(12));
      expect(decoration.border, isNotNull);
    });

    group('accessibility', () {
      testWidgets('should be accessible with proper semantics',
          (tester) async {
        await tester.pumpApp(
          const RSVPStatusBadge(status: 'confirmed'),
        );

        // Verify the widget renders without issues
        expect(find.byType(RSVPStatusBadge), findsOneWidget);
        expect(find.text('Confirmed'), findsOneWidget);
      });

      testWidgets('should work with screen readers', (tester) async {
        await tester.pumpApp(
          const RSVPStatusBadge(status: 'pending'),
        );

        // Icon should be visible for screen readers
        expect(find.byIcon(Icons.schedule), findsOneWidget);
        expect(find.text('Pending'), findsOneWidget);
      });
    });
  });
}
