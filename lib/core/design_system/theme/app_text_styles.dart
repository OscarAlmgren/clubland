import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Text styles for Clubland app, primarily following the Material 3 design system,
/// with custom app-specific styles and utility methods.
class AppTextStyles {
  /// Private constructor to prevent instantiation of this utility class.
  AppTextStyles._();

  // Base font family

  // Display Styles
  /// Largest display style (fontSize: 57, fontWeight: w400).
  static TextStyle get displayLarge => GoogleFonts.roboto(
    fontSize: 57,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.25,
    height: 1.12,
  );

  /// Medium display style (fontSize: 45, fontWeight: w400).
  static TextStyle get displayMedium => GoogleFonts.roboto(
    fontSize: 45,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.16,
  );

  /// Smallest display style (fontSize: 36, fontWeight: w400).
  static TextStyle get displaySmall => GoogleFonts.roboto(
    fontSize: 36,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.22,
  );

  // Headline Styles
  /// Largest headline style (fontSize: 32, fontWeight: w600).
  static TextStyle get headlineLarge => GoogleFonts.roboto(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.25,
  );

  /// Medium headline style (fontSize: 28, fontWeight: w600).
  static TextStyle get headlineMedium => GoogleFonts.roboto(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.29,
  );

  /// Smallest headline style (fontSize: 24, fontWeight: w600).
  static TextStyle get headlineSmall => GoogleFonts.roboto(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.33,
  );

  // Title Styles
  /// Largest title style (fontSize: 22, fontWeight: w600).
  static TextStyle get titleLarge => GoogleFonts.roboto(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.27,
  );

  /// Medium title style (fontSize: 16, fontWeight: w600). Often used for subtitles or list titles.
  static TextStyle get titleMedium => GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.15,
    height: 1.50,
  );

  /// Smallest title style (fontSize: 14, fontWeight: w600).
  static TextStyle get titleSmall => GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
    height: 1.43,
  );

  // Label Styles
  /// Largest label style (fontSize: 14, fontWeight: w500). Often used for button text.
  static TextStyle get labelLarge => GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    height: 1.43,
  );

  /// Medium label style (fontSize: 12, fontWeight: w500).
  static TextStyle get labelMedium => GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 1.33,
  );

  /// Smallest label style (fontSize: 11, fontWeight: w500).
  static TextStyle get labelSmall => GoogleFonts.roboto(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 1.45,
  );

  // Body Styles
  /// Largest body style (fontSize: 16, fontWeight: w400). Standard paragraph text.
  static TextStyle get bodyLarge => GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    height: 1.50,
  );

  /// Medium body style (fontSize: 14, fontWeight: w400).
  static TextStyle get bodyMedium => GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    height: 1.43,
  );

  /// Smallest body style (fontSize: 12, fontWeight: w400).
  static TextStyle get bodySmall => GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    height: 1.33,
  );

  // Custom App-Specific Styles

  /// Style for app logo text (fontSize: 28, fontWeight: w700).
  static TextStyle get logo => GoogleFonts.roboto(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.5,
    height: 1.0,
  );

  /// Style for club names (fontSize: 18, fontWeight: w600).
  static TextStyle get clubName => GoogleFonts.roboto(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.33,
  );

  /// Style for member names (fontSize: 16, fontWeight: w500).
  static TextStyle get memberName => GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    height: 1.5,
  );

  /// Style for addresses (fontSize: 13, fontWeight: w400).
  static TextStyle get address => GoogleFonts.roboto(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.2,
    height: 1.38,
  );

  /// Style for prominent prices and monetary values (fontSize: 18, fontWeight: w700).
  static TextStyle get price => GoogleFonts.roboto(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    height: 1.33,
  );

  /// Style for small prices (fontSize: 14, fontWeight: w600).
  static TextStyle get priceSmall => GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.43,
  );

  /// Style for navigation items (fontSize: 12, fontWeight: w500).
  static TextStyle get navigation => GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.4,
    height: 1.33,
  );

  /// Style for tab labels (fontSize: 14, fontWeight: w600).
  static TextStyle get tab => GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
    height: 1.43,
  );

  /// Style for chip labels (fontSize: 12, fontWeight: w500).
  static TextStyle get chip => GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    height: 1.33,
  );

  /// Style for status badges (fontSize: 10, fontWeight: w600).
  static TextStyle get status => GoogleFonts.roboto(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
    height: 1.4,
  );

  /// Style for timestamps (fontSize: 11, fontWeight: w400).
  static TextStyle get timestamp => GoogleFonts.roboto(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.3,
    height: 1.45,
  );

  /// Style for form field labels (fontSize: 12, fontWeight: w500).
  static TextStyle get fieldLabel => GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    height: 1.33,
  );

  /// Style for helper text (fontSize: 11, fontWeight: w400).
  static TextStyle get helper => GoogleFonts.roboto(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.3,
    height: 1.45,
  );

  /// Style for error messages (fontSize: 11, fontWeight: w400).
  static TextStyle get error => GoogleFonts.roboto(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.3,
    height: 1.45,
  );

  /// Style for success messages (fontSize: 11, fontWeight: w400).
  static TextStyle get success => GoogleFonts.roboto(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.3,
    height: 1.45,
  );

  /// Style for captions (fontSize: 10, fontWeight: w400).
  static TextStyle get caption => GoogleFonts.roboto(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    height: 1.4,
  );

  /// Style for overlines (fontSize: 10, fontWeight: w500).
  static TextStyle get overline => GoogleFonts.roboto(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.5,
    height: 1.4,
  );

  // Text Style Utilities

  /// Returns the given [style] with a new [color].
  static TextStyle withColor(TextStyle style, Color color) =>
      style.copyWith(color: color);

  /// Returns the given [style] with a new [weight].
  static TextStyle withWeight(TextStyle style, FontWeight weight) =>
      style.copyWith(fontWeight: weight);

  /// Returns the given [style] with a new [size].
  static TextStyle withSize(TextStyle style, double size) =>
      style.copyWith(fontSize: size);

  /// Returns the given [style] with a text [decoration].
  static TextStyle withDecoration(
    TextStyle style,
    TextDecoration decoration, {
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
  }) => style.copyWith(
    decoration: decoration,
    decorationColor: decorationColor,
    decorationStyle: decorationStyle,
  );

  /// Returns the given [style] with an underline decoration.
  static TextStyle underlined(TextStyle style, {Color? color}) =>
      withDecoration(style, TextDecoration.underline, decorationColor: color);

  /// Returns the given [style] with a strikethrough decoration.
  static TextStyle strikethrough(TextStyle style, {Color? color}) =>
      withDecoration(style, TextDecoration.lineThrough, decorationColor: color);

  /// Returns the given [style] with italic font style.
  static TextStyle italic(TextStyle style) =>
      style.copyWith(fontStyle: FontStyle.italic);

  /// Returns the given [style] with bold font weight ([FontWeight.bold]).
  static TextStyle bold(TextStyle style) => withWeight(style, FontWeight.bold);

  /// Returns the given [style] with medium font weight ([FontWeight.w500]).
  static TextStyle medium(TextStyle style) =>
      withWeight(style, FontWeight.w500);

  /// Returns the given [style] with light font weight ([FontWeight.w300]).
  static TextStyle light(TextStyle style) => withWeight(style, FontWeight.w300);
}
