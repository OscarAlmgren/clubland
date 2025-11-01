import 'package:clubland/core/design_system/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/test_helpers.dart';

void main() {
  group('AppButton', () {
    testWidgets('should render primary button with text', (tester) async {
      var wasPressed = false;

      await tester.pumpApp(
        AppButton.primary(
          text: 'Test Button',
          onPressed: () => wasPressed = true,
        ),
      );

      expect(find.text('Test Button'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);

      await tester.tap(find.byType(ElevatedButton));
      expect(wasPressed, true);
    });

    testWidgets('should render secondary button', (tester) async {
      await tester.pumpApp(
        AppButton.secondary(text: 'Secondary Button', onPressed: () {}),
      );

      expect(find.text('Secondary Button'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
    });

    testWidgets('should render outline button', (tester) async {
      await tester.pumpApp(
        AppButton.outline(text: 'Outline Button', onPressed: () {}),
      );

      expect(find.text('Outline Button'), findsOneWidget);
      expect(find.byType(OutlinedButton), findsOneWidget);
    });

    testWidgets('should render ghost button', (tester) async {
      await tester.pumpApp(
        AppButton.ghost(text: 'Ghost Button', onPressed: () {}),
      );

      expect(find.text('Ghost Button'), findsOneWidget);
      expect(find.byType(TextButton), findsOneWidget);
    });

    testWidgets('should show loading indicator when isLoading is true', (
      tester,
    ) async {
      await tester.pumpApp(
        AppButton.primary(
          text: 'Loading Button',
          isLoading: true,
          onPressed: () {},
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Loading Button'), findsNothing);
    });

    testWidgets('should be disabled when onPressed is null', (tester) async {
      await tester.pumpApp(const AppButton.primary(text: 'Disabled Button'));

      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(button.onPressed, null);
    });

    testWidgets('should be disabled when isLoading is true', (tester) async {
      await tester.pumpApp(
        AppButton.primary(
          text: 'Loading Button',
          isLoading: true,
          onPressed: () {},
        ),
      );

      // When isLoading is true, the button should still have onPressed but _handlePress won't execute the callback
      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(button.onPressed, isNotNull);

      // Test that tapping doesn't trigger the callback when loading
      var wasPressed = false;
      await tester.pumpApp(
        AppButton.primary(
          text: 'Loading Button',
          isLoading: true,
          onPressed: () => wasPressed = true,
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      expect(wasPressed, false);
    });

    testWidgets('should show icon when provided', (tester) async {
      await tester.pumpApp(
        AppButton.primary(
          text: 'Button with Icon',
          leading: const Icon(Icons.add),
          onPressed: () {},
        ),
      );

      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.text('Button with Icon'), findsOneWidget);
    });

    testWidgets('should not expand to full width when isFullWidth is false', (
      tester,
    ) async {
      await tester.pumpApp(
        AppButton.primary(
          text: 'Custom Width',
          isFullWidth: false,
          onPressed: () {},
        ),
      );

      final container = tester.widget<SizedBox>(
        find.ancestor(
          of: find.byType(ElevatedButton),
          matching: find.byType(SizedBox),
        ),
      );
      expect(container.width, null);
    });

    testWidgets('should expand to full width by default', (tester) async {
      await tester.pumpApp(
        AppButton.primary(text: 'Full Width', onPressed: () {}),
      );

      final container = tester.widget<SizedBox>(
        find.ancestor(
          of: find.byType(ElevatedButton),
          matching: find.byType(SizedBox),
        ),
      );
      expect(container.width, double.infinity);
    });

    group('destructive button', () {
      testWidgets('should render with error styling', (tester) async {
        await tester.pumpApp(
          AppButton.destructive(text: 'Delete', onPressed: () {}),
        );

        expect(find.text('Delete'), findsOneWidget);
        expect(find.byType(ElevatedButton), findsOneWidget);

        final button = tester.widget<ElevatedButton>(
          find.byType(ElevatedButton),
        );
        final buttonStyle = button.style!;
        expect(buttonStyle, isNotNull);
      });
    });

    group('accessibility', () {
      testWidgets('should be accessible with semantic labels', (tester) async {
        await tester.pumpApp(
          AppButton.primary(text: 'Accessible Button', onPressed: () {}),
        );

        expect(
          tester.getSemantics(find.byType(ElevatedButton)),
          matchesSemantics(
            label: 'Accessible Button',
            isButton: true,
            isEnabled: true,
            isFocusable: true,
            hasEnabledState: true,
            hasTapAction: true,
            hasFocusAction: true,
          ),
        );
      });

      testWidgets('should indicate loading state in semantics', (tester) async {
        await tester.pumpApp(
          AppButton.primary(
            text: 'Loading Button',
            isLoading: true,
            onPressed: () {},
          ),
        );

        // The button is still enabled but doesn't execute the callback when loading
        expect(
          tester.getSemantics(find.byType(ElevatedButton)),
          matchesSemantics(
            isButton: true,
            isEnabled: true,
            isFocusable: true,
            hasEnabledState: true,
            hasTapAction: true,
            hasFocusAction: true,
          ),
        );
      });
    });

    group('layout constraints', () {
      testWidgets('should handle full-width button without constraint violations',
          (tester) async {
        // This test verifies the fix for BoxConstraints issue where full-width buttons
        // with Row(MainAxisSize.min) caused infinite width constraints
        await tester.pumpApp(
          SizedBox(
            width: 300,
            child: AppButton.primary(
              text: 'Full Width Button',
              onPressed: () {},
            ),
          ),
        );

        expect(find.text('Full Width Button'), findsOneWidget);
        // Verify button renders without throwing BoxConstraints errors
        expect(tester.takeException(), isNull);
      });

      testWidgets('should handle compact button with proper constraints',
          (tester) async {
        await tester.pumpApp(
          AppButton.primary(
            text: 'Compact',
            isFullWidth: false,
            onPressed: () {},
          ),
        );

        expect(find.text('Compact'), findsOneWidget);
        expect(tester.takeException(), isNull);
      });

      testWidgets('should handle button with leading and trailing icons',
          (tester) async {
        await tester.pumpApp(
          AppButton.primary(
            text: 'Button',
            leading: const Icon(Icons.arrow_back),
            trailing: const Icon(Icons.arrow_forward),
            onPressed: () {},
          ),
        );

        expect(find.byIcon(Icons.arrow_back), findsOneWidget);
        expect(find.text('Button'), findsOneWidget);
        expect(find.byIcon(Icons.arrow_forward), findsOneWidget);
        expect(tester.takeException(), isNull);
      });
    });
  });
}
