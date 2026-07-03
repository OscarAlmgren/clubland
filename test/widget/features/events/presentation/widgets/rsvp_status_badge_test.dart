import 'package:clubland/core/design_system/theme/app_colors.dart';
import 'package:clubland/core/graphql/graphql_api.dart';
import 'package:clubland/features/events/presentation/widgets/rsvp_status_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../helpers/test_helpers.dart';

void main() {
  group('RSVPStatusBadge', () {
    testWidgets('renders CONFIRMED with green check icon and label', (
      tester,
    ) async {
      await tester.pumpApp(
        const RSVPStatusBadge(status: Enum$RSVPStatus.CONFIRMED),
      );

      expect(find.text('Confirmed'), findsOneWidget);
      expect(find.byIcon(Icons.check_circle), findsOneWidget);

      final icon = tester.widget<Icon>(find.byIcon(Icons.check_circle));
      expect(icon.color, AppColors.success);
    });

    testWidgets('renders PENDING with warning schedule icon and label', (
      tester,
    ) async {
      await tester.pumpApp(
        const RSVPStatusBadge(status: Enum$RSVPStatus.PENDING),
      );

      expect(find.text('Pending'), findsOneWidget);
      expect(find.byIcon(Icons.schedule), findsOneWidget);

      final icon = tester.widget<Icon>(find.byIcon(Icons.schedule));
      expect(icon.color, AppColors.warning);
    });

    testWidgets('renders WAITLISTED with info hourglass icon and label', (
      tester,
    ) async {
      await tester.pumpApp(
        const RSVPStatusBadge(status: Enum$RSVPStatus.WAITLISTED),
      );

      expect(find.text('Waitlisted'), findsOneWidget);
      expect(find.byIcon(Icons.hourglass_empty), findsOneWidget);

      final icon = tester.widget<Icon>(find.byIcon(Icons.hourglass_empty));
      expect(icon.color, AppColors.info);
    });

    testWidgets('renders ATTENDED with success how_to_reg icon and label', (
      tester,
    ) async {
      await tester.pumpApp(
        const RSVPStatusBadge(status: Enum$RSVPStatus.ATTENDED),
      );

      expect(find.text('Attended'), findsOneWidget);
      expect(find.byIcon(Icons.how_to_reg), findsOneWidget);

      final icon = tester.widget<Icon>(find.byIcon(Icons.how_to_reg));
      expect(icon.color, AppColors.success);
    });

    testWidgets('renders NO_SHOW with neutral not_interested icon and label', (
      tester,
    ) async {
      await tester.pumpApp(
        const RSVPStatusBadge(status: Enum$RSVPStatus.NO_SHOW),
      );

      expect(find.text('No Show'), findsOneWidget);
      expect(find.byIcon(Icons.not_interested), findsOneWidget);

      final icon = tester.widget<Icon>(find.byIcon(Icons.not_interested));
      expect(icon.color, AppColors.neutral600);
    });

    testWidgets('renders CANCELLED with error cancel icon and label', (
      tester,
    ) async {
      await tester.pumpApp(
        const RSVPStatusBadge(status: Enum$RSVPStatus.CANCELLED),
      );

      expect(find.text('Cancelled'), findsOneWidget);
      expect(find.byIcon(Icons.cancel), findsOneWidget);

      final icon = tester.widget<Icon>(find.byIcon(Icons.cancel));
      expect(icon.color, AppColors.error);
    });

    testWidgets('renders unknown with neutral info icon and label', (
      tester,
    ) async {
      await tester.pumpApp(
        const RSVPStatusBadge(status: Enum$RSVPStatus.$unknown),
      );

      expect(find.text('Unknown'), findsOneWidget);
      expect(find.byIcon(Icons.info), findsOneWidget);

      final icon = tester.widget<Icon>(find.byIcon(Icons.info));
      expect(icon.color, AppColors.neutral600);
    });

    testWidgets('shows only icon when showLabel is false', (tester) async {
      await tester.pumpApp(
        const RSVPStatusBadge(
          status: Enum$RSVPStatus.CONFIRMED,
          showLabel: false,
        ),
      );

      expect(find.text('Confirmed'), findsNothing);
      expect(find.byIcon(Icons.check_circle), findsOneWidget);
    });

    testWidgets('respects custom size parameter', (tester) async {
      await tester.pumpApp(
        const RSVPStatusBadge(status: Enum$RSVPStatus.CONFIRMED, size: 32),
      );

      final icon = tester.widget<Icon>(find.byIcon(Icons.check_circle));
      expect(icon.size, 32);
    });

    testWidgets('uses default size when not specified', (tester) async {
      await tester.pumpApp(
        const RSVPStatusBadge(status: Enum$RSVPStatus.CONFIRMED),
      );

      final icon = tester.widget<Icon>(find.byIcon(Icons.check_circle));
      expect(icon.size, 16); // Default size with label
    });

    testWidgets('renders with proper container styling', (tester) async {
      await tester.pumpApp(
        const RSVPStatusBadge(status: Enum$RSVPStatus.CONFIRMED),
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
      testWidgets('renders without issues (CONFIRMED)', (tester) async {
        await tester.pumpApp(
          const RSVPStatusBadge(status: Enum$RSVPStatus.CONFIRMED),
        );

        expect(find.byType(RSVPStatusBadge), findsOneWidget);
        expect(find.text('Confirmed'), findsOneWidget);
      });

      testWidgets('icon visible for screen readers (PENDING)', (tester) async {
        await tester.pumpApp(
          const RSVPStatusBadge(status: Enum$RSVPStatus.PENDING),
        );

        expect(find.byIcon(Icons.schedule), findsOneWidget);
        expect(find.text('Pending'), findsOneWidget);
      });
    });
  });
}
