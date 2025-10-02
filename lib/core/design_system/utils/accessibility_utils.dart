import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Utilities for ensuring WCAG compliance in the application.
///
/// Provides methods to check color contrast ratios, text sizing,
/// and other accessibility requirements.
class AccessibilityUtils {
  AccessibilityUtils._();

  /// Minimum contrast ratio for normal text (WCAG AA standard).
  static const double minContrastRatioNormal = 4.5;

  /// Minimum contrast ratio for large text (WCAG AA standard).
  static const double minContrastRatioLarge = 3.0;

  /// Minimum contrast ratio for normal text (WCAG AAA standard).
  static const double minContrastRatioNormalAAA = 7.0;

  /// Minimum contrast ratio for large text (WCAG AAA standard).
  static const double minContrastRatioLargeAAA = 4.5;

  /// Minimum font size for large text per WCAG guidelines (18pt = ~24px).
  static const double largeTextSize = 24.0;

  /// Minimum font size for bold large text (14pt = ~18.67px).
  static const double largeBoldTextSize = 18.67;

  /// Minimum touch target size per WCAG guidelines (44x44 dp).
  static const double minTouchTargetSize = 44.0;

  /// Calculate the relative luminance of a color per WCAG guidelines.
  ///
  /// Returns a value between 0 (darkest) and 1 (lightest).
  static double _calculateLuminance(Color color) {
    // Convert RGB to relative luminance
    final r = _linearizeColorComponent(color.red / 255.0);
    final g = _linearizeColorComponent(color.green / 255.0);
    final b = _linearizeColorComponent(color.blue / 255.0);

    return 0.2126 * r + 0.7152 * g + 0.0722 * b;
  }

  /// Linearize a color component value per WCAG formula.
  static double _linearizeColorComponent(double value) {
    if (value <= 0.03928) {
      return value / 12.92;
    }
    return math.pow((value + 0.055) / 1.055, 2.4).toDouble();
  }

  /// Calculate the contrast ratio between two colors.
  ///
  /// Returns a value >= 1.0, where higher values indicate better contrast.
  /// WCAG AA requires:
  /// - 4.5:1 for normal text
  /// - 3.0:1 for large text
  static double calculateContrastRatio(Color foreground, Color background) {
    final l1 = _calculateLuminance(foreground);
    final l2 = _calculateLuminance(background);

    final lighter = l1 > l2 ? l1 : l2;
    final darker = l1 > l2 ? l2 : l1;

    return (lighter + 0.05) / (darker + 0.05);
  }

  /// Check if text color has sufficient contrast with background per WCAG AA.
  ///
  /// [fontSize] should be in logical pixels (dp).
  /// [isBold] indicates if the text uses a bold font weight.
  static bool hasSufficientContrast(
    Color foreground,
    Color background, {
    double fontSize = 16.0,
    bool isBold = false,
  }) {
    final ratio = calculateContrastRatio(foreground, background);
    final isLargeText =
        fontSize >= largeTextSize || (isBold && fontSize >= largeBoldTextSize);

    final minRatio = isLargeText
        ? minContrastRatioLarge
        : minContrastRatioNormal;

    return ratio >= minRatio;
  }

  /// Check if text color has sufficient contrast with background per WCAG AAA.
  static bool hasSufficientContrastAAA(
    Color foreground,
    Color background, {
    double fontSize = 16.0,
    bool isBold = false,
  }) {
    final ratio = calculateContrastRatio(foreground, background);
    final isLargeText =
        fontSize >= largeTextSize || (isBold && fontSize >= largeBoldTextSize);

    final minRatio = isLargeText
        ? minContrastRatioLargeAAA
        : minContrastRatioNormalAAA;

    return ratio >= minRatio;
  }

  /// Check if a widget size meets minimum touch target requirements.
  static bool hasMinimumTouchTarget(Size size) {
    return size.width >= minTouchTargetSize &&
        size.height >= minTouchTargetSize;
  }

  /// Get a suggested foreground color that provides sufficient contrast.
  ///
  /// Returns either white or black depending on which provides better contrast.
  static Color getSuggestedForegroundColor(Color background) {
    final whiteContrast = calculateContrastRatio(Colors.white, background);
    final blackContrast = calculateContrastRatio(Colors.black, background);

    return whiteContrast > blackContrast ? Colors.white : Colors.black;
  }

  /// Assert that a color combination meets WCAG AA standards in debug mode.
  ///
  /// Logs a warning if contrast is insufficient but doesn't throw.
  static void assertContrastCompliance(
    Color foreground,
    Color background, {
    required String context,
    double fontSize = 16.0,
    bool isBold = false,
  }) {
    assert(() {
      if (!hasSufficientContrast(
        foreground,
        background,
        fontSize: fontSize,
        isBold: isBold,
      )) {
        final ratio = calculateContrastRatio(foreground, background);
        debugPrint(
          'WCAG AA Warning in $context: Insufficient contrast ratio $ratio:1 '
          '(minimum required: ${fontSize >= largeTextSize ? minContrastRatioLarge : minContrastRatioNormal}:1)',
        );
      }
      return true;
    }());
  }
}
