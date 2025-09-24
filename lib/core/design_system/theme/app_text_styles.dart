import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Text styles for Clubland app
class AppTextStyles {
  AppTextStyles._();

  // Base font family

  // Display Styles
  static TextStyle get displayLarge => GoogleFonts.roboto(
    fontSize: 57,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.25,
    height: 1.12,
  );

  static TextStyle get displayMedium => GoogleFonts.roboto(
    fontSize: 45,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.16,
  );

  static TextStyle get displaySmall => GoogleFonts.roboto(
    fontSize: 36,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.22,
  );

  // Headline Styles
  static TextStyle get headlineLarge => GoogleFonts.roboto(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.25,
  );

  static TextStyle get headlineMedium => GoogleFonts.roboto(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.29,
  );

  static TextStyle get headlineSmall => GoogleFonts.roboto(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.33,
  );

  // Title Styles
  static TextStyle get titleLarge => GoogleFonts.roboto(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.27,
  );

  static TextStyle get titleMedium => GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.15,
    height: 1.50,
  );

  static TextStyle get titleSmall => GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
    height: 1.43,
  );

  // Label Styles
  static TextStyle get labelLarge => GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    height: 1.43,
  );

  static TextStyle get labelMedium => GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 1.33,
  );

  static TextStyle get labelSmall => GoogleFonts.roboto(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 1.45,
  );

  // Body Styles
  static TextStyle get bodyLarge => GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    height: 1.50,
  );

  static TextStyle get bodyMedium => GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    height: 1.43,
  );

  static TextStyle get bodySmall => GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    height: 1.33,
  );

  // Custom App-Specific Styles

  /// Style for app logo text
  static TextStyle get logo => GoogleFonts.roboto(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.5,
    height: 1.0,
  );

  /// Style for club names
  static TextStyle get clubName => GoogleFonts.roboto(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.33,
  );

  /// Style for member names
  static TextStyle get memberName => GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    height: 1.5,
  );

  /// Style for addresses
  static TextStyle get address => GoogleFonts.roboto(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.2,
    height: 1.38,
  );

  /// Style for prices and monetary values
  static TextStyle get price => GoogleFonts.roboto(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    height: 1.33,
  );

  /// Style for small prices
  static TextStyle get priceSmall => GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.43,
  );

  /// Style for navigation items
  static TextStyle get navigation => GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.4,
    height: 1.33,
  );

  /// Style for tab labels
  static TextStyle get tab => GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
    height: 1.43,
  );

  /// Style for chip labels
  static TextStyle get chip => GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    height: 1.33,
  );

  /// Style for status badges
  static TextStyle get status => GoogleFonts.roboto(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
    height: 1.4,
  );

  /// Style for timestamps
  static TextStyle get timestamp => GoogleFonts.roboto(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.3,
    height: 1.45,
  );

  /// Style for form field labels
  static TextStyle get fieldLabel => GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    height: 1.33,
  );

  /// Style for helper text
  static TextStyle get helper => GoogleFonts.roboto(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.3,
    height: 1.45,
  );

  /// Style for error messages
  static TextStyle get error => GoogleFonts.roboto(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.3,
    height: 1.45,
  );

  /// Style for success messages
  static TextStyle get success => GoogleFonts.roboto(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.3,
    height: 1.45,
  );

  /// Style for captions
  static TextStyle get caption => GoogleFonts.roboto(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    height: 1.4,
  );

  /// Style for overlines
  static TextStyle get overline => GoogleFonts.roboto(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.5,
    height: 1.4,
  );

  // Text Style Utilities

  /// Create a text style with custom color
  static TextStyle withColor(TextStyle style, Color color) =>
      style.copyWith(color: color);

  /// Create a text style with custom weight
  static TextStyle withWeight(TextStyle style, FontWeight weight) =>
      style.copyWith(fontWeight: weight);

  /// Create a text style with custom size
  static TextStyle withSize(TextStyle style, double size) =>
      style.copyWith(fontSize: size);

  /// Create a text style with decoration
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

  /// Create an underlined text style
  static TextStyle underlined(TextStyle style, {Color? color}) =>
      withDecoration(style, TextDecoration.underline, decorationColor: color);

  /// Create a strikethrough text style
  static TextStyle strikethrough(TextStyle style, {Color? color}) =>
      withDecoration(style, TextDecoration.lineThrough, decorationColor: color);

  /// Create an italic text style
  static TextStyle italic(TextStyle style) =>
      style.copyWith(fontStyle: FontStyle.italic);

  /// Create a bold text style
  static TextStyle bold(TextStyle style) => withWeight(style, FontWeight.bold);

  /// Create a medium weight text style
  static TextStyle medium(TextStyle style) =>
      withWeight(style, FontWeight.w500);

  /// Create a light weight text style
  static TextStyle light(TextStyle style) => withWeight(style, FontWeight.w300);
}
