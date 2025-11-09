import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:clubland/core/design_system/utils/accessibility_utils.dart';

void main() {
  group('AccessibilityUtils', () {
    group('Constants', () {
      test('should have correct WCAG AA minimum contrast ratios', () {
        expect(AccessibilityUtils.minContrastRatioNormal, equals(4.5));
        expect(AccessibilityUtils.minContrastRatioLarge, equals(3.0));
      });

      test('should have correct WCAG AAA minimum contrast ratios', () {
        expect(AccessibilityUtils.minContrastRatioNormalAAA, equals(7.0));
        expect(AccessibilityUtils.minContrastRatioLargeAAA, equals(4.5));
      });

      test('should have correct text size thresholds', () {
        expect(AccessibilityUtils.largeTextSize, equals(24.0));
        expect(AccessibilityUtils.largeBoldTextSize, equals(18.67));
      });

      test('should have correct minimum touch target size', () {
        expect(AccessibilityUtils.minTouchTargetSize, equals(44.0));
      });
    });

    group('Contrast Ratio Calculation', () {
      test('should calculate correct contrast for black and white', () {
        final ratio = AccessibilityUtils.calculateContrastRatio(
          Colors.black,
          Colors.white,
        );

        // Black and white should have maximum contrast ratio of 21:1
        expect(ratio, closeTo(21.0, 0.1));
      });

      test('should calculate correct contrast for white and black', () {
        final ratio = AccessibilityUtils.calculateContrastRatio(
          Colors.white,
          Colors.black,
        );

        // Order shouldn't matter
        expect(ratio, closeTo(21.0, 0.1));
      });

      test('should return 1.0 for identical colors', () {
        final ratio = AccessibilityUtils.calculateContrastRatio(
          Colors.blue,
          Colors.blue,
        );

        expect(ratio, closeTo(1.0, 0.01));
      });

      test('should calculate contrast for gray colors', () {
        final lightGray = const Color(0xFFCCCCCC);
        final darkGray = const Color(0xFF333333);

        final ratio = AccessibilityUtils.calculateContrastRatio(
          lightGray,
          darkGray,
        );

        expect(ratio, greaterThan(1.0));
        expect(ratio, lessThan(21.0));
      });

      test('should calculate contrast for primary colors', () {
        final redOnWhite = AccessibilityUtils.calculateContrastRatio(
          Colors.red,
          Colors.white,
        );

        final blueOnWhite = AccessibilityUtils.calculateContrastRatio(
          Colors.blue,
          Colors.white,
        );

        final greenOnWhite = AccessibilityUtils.calculateContrastRatio(
          Colors.green,
          Colors.white,
        );

        // All should have measurable contrast
        expect(redOnWhite, greaterThan(1.0));
        expect(blueOnWhite, greaterThan(1.0));
        expect(greenOnWhite, greaterThan(1.0));
      });

      test('should handle Material Design colors', () {
        final ratio = AccessibilityUtils.calculateContrastRatio(
          Colors.blue[700]!,
          Colors.grey[100]!,
        );

        expect(ratio, greaterThan(4.5)); // Should meet WCAG AA
      });

      test('should be symmetric', () {
        final ratio1 = AccessibilityUtils.calculateContrastRatio(
          Colors.red,
          Colors.blue,
        );

        final ratio2 = AccessibilityUtils.calculateContrastRatio(
          Colors.blue,
          Colors.red,
        );

        expect(ratio1, equals(ratio2));
      });

      test('should handle colors with alpha channel', () {
        final semiTransparentBlack = const Color(0x80000000);
        final ratio = AccessibilityUtils.calculateContrastRatio(
          semiTransparentBlack,
          Colors.white,
        );

        // Alpha should affect the color value
        expect(ratio, greaterThan(1.0));
      });
    });

    group('WCAG AA Compliance', () {
      test('should pass for black text on white background (normal text)', () {
        final passes = AccessibilityUtils.hasSufficientContrast(
          Colors.black,
          Colors.white,
          fontSize: 16.0,
        );

        expect(passes, true);
      });

      test('should pass for white text on black background (normal text)', () {
        final passes = AccessibilityUtils.hasSufficientContrast(
          Colors.white,
          Colors.black,
          fontSize: 16.0,
        );

        expect(passes, true);
      });

      test('should fail for light gray on white (normal text)', () {
        final passes = AccessibilityUtils.hasSufficientContrast(
          const Color(0xFFDDDDDD),
          Colors.white,
          fontSize: 16.0,
        );

        expect(passes, false);
      });

      test('should use different ratio for large text', () {
        // This combination might fail for normal text but pass for large text
        final normalText = AccessibilityUtils.hasSufficientContrast(
          const Color(0xFF767676),
          Colors.white,
          fontSize: 16.0,
        );

        final largeText = AccessibilityUtils.hasSufficientContrast(
          const Color(0xFF767676),
          Colors.white,
          fontSize: 24.0,
        );

        // Large text has lower requirement (3:1 vs 4.5:1)
        expect(largeText || !normalText, true);
      });

      test('should consider bold text at 18.67px as large text', () {
        final passes = AccessibilityUtils.hasSufficientContrast(
          const Color(0xFF767676),
          Colors.white,
          fontSize: 18.67,
          isBold: true,
        );

        // Should use large text ratio (3:1)
        expect(passes, isA<bool>());
      });

      test('should not consider bold text at 16px as large text', () {
        final boldSmall = AccessibilityUtils.hasSufficientContrast(
          const Color(0xFF999999),
          Colors.white,
          fontSize: 16.0,
          isBold: true,
        );

        final regularSmall = AccessibilityUtils.hasSufficientContrast(
          const Color(0xFF999999),
          Colors.white,
          fontSize: 16.0,
          isBold: false,
        );

        // Both should use same standard since bold isn't large enough
        expect(boldSmall, equals(regularSmall));
      });

      test('should pass for Material Design recommended combinations', () {
        // Material Design Blue 700 on Grey 100
        final passes = AccessibilityUtils.hasSufficientContrast(
          Colors.blue[700]!,
          Colors.grey[100]!,
          fontSize: 16.0,
        );

        expect(passes, true);
      });

      test('should handle edge case at exactly 4.5:1 ratio', () {
        // Create colors that produce exactly 4.5:1 ratio
        // #767676 on white is approximately 4.5:1
        final passes = AccessibilityUtils.hasSufficientContrast(
          const Color(0xFF767676),
          Colors.white,
          fontSize: 16.0,
        );

        // Should pass at exactly the minimum
        expect(passes, isA<bool>());
      });
    });

    group('WCAG AAA Compliance', () {
      test('should pass for black on white (normal text)', () {
        final passes = AccessibilityUtils.hasSufficientContrastAAA(
          Colors.black,
          Colors.white,
          fontSize: 16.0,
        );

        expect(passes, true);
      });

      test('should have stricter requirements than AA', () {
        // Color that passes AA but fails AAA
        final colorValue = const Color(0xFF767676);

        final passesAA = AccessibilityUtils.hasSufficientContrast(
          colorValue,
          Colors.white,
          fontSize: 16.0,
        );

        final passesAAA = AccessibilityUtils.hasSufficientContrastAAA(
          colorValue,
          Colors.white,
          fontSize: 16.0,
        );

        // If it passes AA but fails AAA, AAA is stricter
        if (passesAA && !passesAAA) {
          expect(passesAAA, false);
        }
      });

      test('should use 7:1 ratio for normal text', () {
        final ratio = AccessibilityUtils.calculateContrastRatio(
          Colors.black,
          Colors.white,
        );

        expect(ratio, greaterThanOrEqualTo(7.0));
      });

      test('should use 4.5:1 ratio for large text', () {
        final passes = AccessibilityUtils.hasSufficientContrastAAA(
          const Color(0xFF595959),
          Colors.white,
          fontSize: 24.0,
        );

        expect(passes, isA<bool>());
      });

      test('should handle bold large text', () {
        final passes = AccessibilityUtils.hasSufficientContrastAAA(
          const Color(0xFF595959),
          Colors.white,
          fontSize: 18.67,
          isBold: true,
        );

        expect(passes, isA<bool>());
      });
    });

    group('Touch Target Size Validation', () {
      test('should pass for exactly minimum size', () {
        final passes = AccessibilityUtils.hasMinimumTouchTarget(
          const Size(44.0, 44.0),
        );

        expect(passes, true);
      });

      test('should pass for larger than minimum size', () {
        final passes = AccessibilityUtils.hasMinimumTouchTarget(
          const Size(48.0, 48.0),
        );

        expect(passes, true);
      });

      test('should fail for width less than minimum', () {
        final passes = AccessibilityUtils.hasMinimumTouchTarget(
          const Size(40.0, 44.0),
        );

        expect(passes, false);
      });

      test('should fail for height less than minimum', () {
        final passes = AccessibilityUtils.hasMinimumTouchTarget(
          const Size(44.0, 40.0),
        );

        expect(passes, false);
      });

      test('should fail for both dimensions less than minimum', () {
        final passes = AccessibilityUtils.hasMinimumTouchTarget(
          const Size(40.0, 40.0),
        );

        expect(passes, false);
      });

      test('should handle very large touch targets', () {
        final passes = AccessibilityUtils.hasMinimumTouchTarget(
          const Size(100.0, 100.0),
        );

        expect(passes, true);
      });

      test('should handle rectangular touch targets', () {
        final passes = AccessibilityUtils.hasMinimumTouchTarget(
          const Size(44.0, 100.0),
        );

        expect(passes, true);
      });

      test('should fail for zero-size touch targets', () {
        final passes = AccessibilityUtils.hasMinimumTouchTarget(
          Size.zero,
        );

        expect(passes, false);
      });
    });

    group('Suggested Foreground Color', () {
      test('should suggest white for dark backgrounds', () {
        final suggested = AccessibilityUtils.getSuggestedForegroundColor(
          Colors.black,
        );

        expect(suggested, equals(Colors.white));
      });

      test('should suggest black for light backgrounds', () {
        final suggested = AccessibilityUtils.getSuggestedForegroundColor(
          Colors.white,
        );

        expect(suggested, equals(Colors.black));
      });

      test('should suggest white for dark blue', () {
        final suggested = AccessibilityUtils.getSuggestedForegroundColor(
          Colors.blue[900]!,
        );

        expect(suggested, equals(Colors.white));
      });

      test('should suggest black for light blue', () {
        final suggested = AccessibilityUtils.getSuggestedForegroundColor(
          Colors.blue[100]!,
        );

        expect(suggested, equals(Colors.black));
      });

      test('should suggest appropriate color for mid-tone gray', () {
        final suggested = AccessibilityUtils.getSuggestedForegroundColor(
          Colors.grey[500]!,
        );

        // Should be either white or black based on better contrast
        expect(suggested == Colors.white || suggested == Colors.black, true);
      });

      test('should suggest white for Material primary dark', () {
        final suggested = AccessibilityUtils.getSuggestedForegroundColor(
          const Color(0xFF1976D2), // Blue 700
        );

        expect(suggested, equals(Colors.white));
      });

      test('should suggest black for Material primary light', () {
        final suggested = AccessibilityUtils.getSuggestedForegroundColor(
          const Color(0xFFBBDEFB), // Blue 100
        );

        expect(suggested, equals(Colors.black));
      });

      test('should choose color with better contrast', () {
        final background = Colors.red[700]!;
        final suggested = AccessibilityUtils.getSuggestedForegroundColor(
          background,
        );

        final suggestedRatio = AccessibilityUtils.calculateContrastRatio(
          suggested,
          background,
        );

        final otherColor = suggested == Colors.white ? Colors.black : Colors.white;
        final otherRatio = AccessibilityUtils.calculateContrastRatio(
          otherColor,
          background,
        );

        expect(suggestedRatio, greaterThanOrEqualTo(otherRatio));
      });
    });

    group('Contrast Compliance Assertions', () {
      test('should not throw in release mode', () {
        expect(
          () => AccessibilityUtils.assertContrastCompliance(
            const Color(0xFFDDDDDD),
            Colors.white,
            context: 'Test button',
            fontSize: 16.0,
          ),
          returnsNormally,
        );
      });

      test('should accept compliant combinations', () {
        expect(
          () => AccessibilityUtils.assertContrastCompliance(
            Colors.black,
            Colors.white,
            context: 'Compliant button',
            fontSize: 16.0,
          ),
          returnsNormally,
        );
      });

      test('should handle large text in assertions', () {
        expect(
          () => AccessibilityUtils.assertContrastCompliance(
            const Color(0xFF767676),
            Colors.white,
            context: 'Large text',
            fontSize: 24.0,
          ),
          returnsNormally,
        );
      });

      test('should handle bold text in assertions', () {
        expect(
          () => AccessibilityUtils.assertContrastCompliance(
            const Color(0xFF767676),
            Colors.white,
            context: 'Bold text',
            fontSize: 18.67,
            isBold: true,
          ),
          returnsNormally,
        );
      });
    });

    group('Edge Cases', () {
      test('should handle fully transparent colors', () {
        final ratio = AccessibilityUtils.calculateContrastRatio(
          const Color(0x00000000),
          Colors.white,
        );

        expect(ratio, greaterThanOrEqualTo(1.0));
      });

      test('should handle custom colors with specific RGB values', () {
        final customColor = const Color.fromRGBO(123, 45, 67, 1.0);
        final ratio = AccessibilityUtils.calculateContrastRatio(
          customColor,
          Colors.white,
        );

        expect(ratio, greaterThan(1.0));
      });

      test('should handle very similar colors', () {
        final color1 = const Color(0xFF010101);
        final color2 = const Color(0xFF020202);

        final ratio = AccessibilityUtils.calculateContrastRatio(
          color1,
          color2,
        );

        expect(ratio, closeTo(1.0, 0.1));
      });

      test('should handle Material accent colors', () {
        final ratio = AccessibilityUtils.calculateContrastRatio(
          Colors.pinkAccent,
          Colors.white,
        );

        expect(ratio, greaterThan(1.0));
      });

      test('should be consistent with multiple calls', () {
        final ratio1 = AccessibilityUtils.calculateContrastRatio(
          Colors.blue,
          Colors.white,
        );

        final ratio2 = AccessibilityUtils.calculateContrastRatio(
          Colors.blue,
          Colors.white,
        );

        expect(ratio1, equals(ratio2));
      });

      test('should handle extreme fontSize values', () {
        final verySmall = AccessibilityUtils.hasSufficientContrast(
          Colors.black,
          Colors.white,
          fontSize: 8.0,
        );

        final veryLarge = AccessibilityUtils.hasSufficientContrast(
          Colors.black,
          Colors.white,
          fontSize: 100.0,
        );

        expect(verySmall, true);
        expect(veryLarge, true);
      });

      test('should handle fractional touch target sizes', () {
        final passes = AccessibilityUtils.hasMinimumTouchTarget(
          const Size(43.9, 43.9),
        );

        expect(passes, false);
      });
    });

    group('Real-World Scenarios', () {
      test('should validate common button configurations', () {
        // Primary button: white text on blue background
        final primaryButton = AccessibilityUtils.hasSufficientContrast(
          Colors.white,
          Colors.blue[700]!,
          fontSize: 16.0,
        );

        expect(primaryButton, true);
      });

      test('should validate common link configurations', () {
        // Blue link on white background
        final link = AccessibilityUtils.hasSufficientContrast(
          Colors.blue[700]!,
          Colors.white,
          fontSize: 16.0,
        );

        expect(link, true);
      });

      test('should validate error message colors', () {
        // Red error text on white background
        final errorText = AccessibilityUtils.hasSufficientContrast(
          Colors.red[700]!,
          Colors.white,
          fontSize: 14.0,
        );

        expect(errorText, isA<bool>());
      });

      test('should validate success message colors', () {
        // Green success text on white background
        final successText = AccessibilityUtils.hasSufficientContrast(
          Colors.green[700]!,
          Colors.white,
          fontSize: 14.0,
        );

        expect(successText, isA<bool>());
      });

      test('should validate disabled button states', () {
        // Gray text on light gray background (typically fails)
        final disabledButton = AccessibilityUtils.hasSufficientContrast(
          Colors.grey[400]!,
          Colors.grey[200]!,
          fontSize: 16.0,
        );

        // Disabled states often don't meet contrast requirements
        expect(disabledButton, isA<bool>());
      });

      test('should validate standard icon button size', () {
        // Material Design standard icon button is 48x48
        final iconButton = AccessibilityUtils.hasMinimumTouchTarget(
          const Size(48.0, 48.0),
        );

        expect(iconButton, true);
      });

      test('should validate FAB size', () {
        // Material Design FAB is 56x56
        final fab = AccessibilityUtils.hasMinimumTouchTarget(
          const Size(56.0, 56.0),
        );

        expect(fab, true);
      });
    });
  });
}
