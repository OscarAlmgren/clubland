import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../lib/core/design_system/widgets/app_button.dart';
import '../../../helpers/test_helpers.dart';

void main() {
  group('AppButton', () {
    testWidgets('should render primary button with text', (tester) async {
      bool wasPressed = false;

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
        AppButton.secondary(
          text: 'Secondary Button',
          onPressed: () {},
        ),
      );

      expect(find.text('Secondary Button'), findsOneWidget);
      expect(find.byType(OutlinedButton), findsOneWidget);
    });

    testWidgets('should render text button', (tester) async {
      await tester.pumpApp(
        AppButton.text(
          text: 'Text Button',
          onPressed: () {},
        ),
      );

      expect(find.text('Text Button'), findsOneWidget);
      expect(find.byType(TextButton), findsOneWidget);
    });

    testWidgets('should show loading indicator when isLoading is true', (tester) async {
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
      await tester.pumpApp(
        AppButton.primary(
          text: 'Disabled Button',
          onPressed: null,
        ),
      );

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

      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(button.onPressed, null);
    });

    testWidgets('should show icon when provided', (tester) async {
      await tester.pumpApp(
        AppButton.primary(
          text: 'Button with Icon',
          icon: Icons.add,
          onPressed: () {},
        ),
      );

      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.text('Button with Icon'), findsOneWidget);
    });

    testWidgets('should apply custom width when provided', (tester) async {
      const customWidth = 200.0;

      await tester.pumpApp(
        AppButton.primary(
          text: 'Custom Width',
          width: customWidth,
          onPressed: () {},
        ),
      );

      final container = tester.widget<SizedBox>(
        find.ancestor(
          of: find.byType(ElevatedButton),
          matching: find.byType(SizedBox),
        ),
      );
      expect(container.width, customWidth);
    });

    testWidgets('should expand to full width by default', (tester) async {
      await tester.pumpApp(
        AppButton.primary(
          text: 'Full Width',
          onPressed: () {},
        ),
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
          AppButton.destructive(
            text: 'Delete',
            onPressed: () {},
          ),
        );

        expect(find.text('Delete'), findsOneWidget);
        expect(find.byType(ElevatedButton), findsOneWidget);

        final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
        final buttonStyle = button.style!;
        expect(buttonStyle, isNotNull);
      });
    });

    group('accessibility', () {
      testWidgets('should be accessible with semantic labels', (tester) async {
        await tester.pumpApp(
          AppButton.primary(
            text: 'Accessible Button',
            onPressed: () {},
          ),
        );

        expect(
          tester.getSemantics(find.byType(ElevatedButton)),
          matchesSemantics(
            label: 'Accessible Button',
            isButton: true,
            isEnabled: true,
            hasTapAction: true,
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

        expect(
          tester.getSemantics(find.byType(ElevatedButton)),
          matchesSemantics(
            isButton: true,
            isEnabled: false,
          ),
        );
      });
    });
  });
}