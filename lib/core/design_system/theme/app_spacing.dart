import 'package:flutter/material.dart';

/// Spacing and sizing constants for Clubland app
class AppSpacing {
  /// Private constructor to prevent instantiation of this utility class.
  AppSpacing._();

  // Base spacing unit
  // The private base unit for scaling all other spacing values.
  static const double _baseUnit = 4.0;

  // Spacing Scale
  /// Extra-small spacing (4.0).
  static const double xs = _baseUnit; // 4
  /// Small spacing (8.0).
  static const double sm = _baseUnit * 2; // 8
  /// Medium spacing (12.0).
  static const double md = _baseUnit * 3; // 12
  /// Large spacing (16.0).
  static const double lg = _baseUnit * 4; // 16
  /// Extra-large spacing (20.0).
  static const double xl = _baseUnit * 5; // 20
  /// Double extra-large spacing (24.0).
  static const double xxl = _baseUnit * 6; // 24
  /// Triple extra-large spacing (32.0).
  static const double xxxl = _baseUnit * 8; // 32
  /// Huge spacing (48.0).
  static const double huge = _baseUnit * 12; // 48
  /// Massive spacing (64.0).
  static const double massive = _baseUnit * 16; // 64

  // Common spacing values
  /// Zero spacing.
  static const double none = 0;

  /// Very small spacing (2.0).
  static const double micro = 2;

  /// Alias for [xs] (4.0).
  static const double tiny = xs;

  /// Alias for [sm] (8.0).
  static const double small = sm;

  /// Alias for [lg] (16.0).
  static const double medium = lg;

  /// Alias for [xxl] (24.0).
  static const double large = xxl;

  /// Alias for [xxxl] (32.0).
  static const double extraLarge = xxxl;

  // Layout spacing
  /// Standard horizontal padding for page content (16.0).
  static const double pageHorizontal = lg;

  /// Standard vertical padding for page content (16.0).
  static const double pageVertical = lg;

  /// Standard spacing between large sections (24.0).
  static const double sectionSpacing = xxl;

  /// Standard padding inside cards (16.0).
  static const double cardPadding = lg;

  /// Standard spacing between list items (8.0).
  static const double listItemSpacing = sm;

  // Component spacing
  /// Standard padding inside buttons (16.0).
  static const double buttonPadding = lg;

  /// Standard spacing next to or between icons (8.0).
  static const double iconSpacing = sm;

  /// Standard spacing next to or between text elements (4.0).
  static const double textSpacing = xs;

  /// Standard spacing inside or around chips (8.0).
  static const double chipSpacing = sm;

  /// Standard internal padding for input fields (16.0).
  static const double inputPadding = lg;

  // Edge Insets
  /// [EdgeInsets] with all sides set to [xs] (4.0).
  static const EdgeInsets paddingXS = EdgeInsets.all(xs);

  /// [EdgeInsets] with all sides set to [sm] (8.0).
  static const EdgeInsets paddingSM = EdgeInsets.all(sm);

  /// [EdgeInsets] with all sides set to [md] (12.0).
  static const EdgeInsets paddingMD = EdgeInsets.all(md);

  /// [EdgeInsets] with all sides set to [lg] (16.0).
  static const EdgeInsets paddingLG = EdgeInsets.all(lg);

  /// [EdgeInsets] with all sides set to [xl] (20.0).
  static const EdgeInsets paddingXL = EdgeInsets.all(xl);

  /// [EdgeInsets] with all sides set to [xxl] (24.0).
  static const EdgeInsets paddingXXL = EdgeInsets.all(xxl);

  /// [EdgeInsets] with all sides set to [xxxl] (32.0).
  static const EdgeInsets paddingXXXL = EdgeInsets.all(xxxl);

  // Horizontal padding
  /// [EdgeInsets] with horizontal sides set to [xs] (4.0).
  static const EdgeInsets horizontalXS = EdgeInsets.symmetric(horizontal: xs);

  /// [EdgeInsets] with horizontal sides set to [sm] (8.0).
  static const EdgeInsets horizontalSM = EdgeInsets.symmetric(horizontal: sm);

  /// [EdgeInsets] with horizontal sides set to [md] (12.0).
  static const EdgeInsets horizontalMD = EdgeInsets.symmetric(horizontal: md);

  /// [EdgeInsets] with horizontal sides set to [lg] (16.0).
  static const EdgeInsets horizontalLG = EdgeInsets.symmetric(horizontal: lg);

  /// [EdgeInsets] with horizontal sides set to [xl] (20.0).
  static const EdgeInsets horizontalXL = EdgeInsets.symmetric(horizontal: xl);

  /// [EdgeInsets] with horizontal sides set to [xxl] (24.0).
  static const EdgeInsets horizontalXXL = EdgeInsets.symmetric(horizontal: xxl);

  // Vertical padding
  /// [EdgeInsets] with vertical sides set to [xs] (4.0).
  static const EdgeInsets verticalXS = EdgeInsets.symmetric(vertical: xs);

  /// [EdgeInsets] with vertical sides set to [sm] (8.0).
  static const EdgeInsets verticalSM = EdgeInsets.symmetric(vertical: sm);

  /// [EdgeInsets] with vertical sides set to [md] (12.0).
  static const EdgeInsets verticalMD = EdgeInsets.symmetric(vertical: md);

  /// [EdgeInsets] with vertical sides set to [lg] (16.0).
  static const EdgeInsets verticalLG = EdgeInsets.symmetric(vertical: lg);

  /// [EdgeInsets] with vertical sides set to [xl] (20.0).
  static const EdgeInsets verticalXL = EdgeInsets.symmetric(vertical: xl);

  /// [EdgeInsets] with vertical sides set to [xxl] (24.0).
  static const EdgeInsets verticalXXL = EdgeInsets.symmetric(vertical: xxl);

  // Page padding
  /// Standard symmetric padding for entire pages ([pageHorizontal], [pageVertical]).
  static const EdgeInsets pagePadding = EdgeInsets.symmetric(
    horizontal: pageHorizontal,
    vertical: pageVertical,
  );

  // Card padding
  /// Standard padding for all sides of a card ([cardPadding]).
  static const EdgeInsets cardPaddingAll = EdgeInsets.all(cardPadding);

  /// Vertical padding for cards with standard horizontal padding (16.0 vertical, 16.0 horizontal).
  static const EdgeInsets cardPaddingVertical = EdgeInsets.symmetric(
    vertical: cardPadding,
    horizontal: lg,
  );

  // List item padding
  /// Standard symmetric padding for list items (16.0 horizontal, 12.0 vertical).
  static const EdgeInsets listItemPadding = EdgeInsets.symmetric(
    horizontal: lg,
    vertical: md,
  );

  // Button padding
  /// Large symmetric padding for buttons (24.0 horizontal, 16.0 vertical).
  static const EdgeInsets buttonPaddingLarge = EdgeInsets.symmetric(
    horizontal: xxl,
    vertical: lg,
  );

  /// Medium symmetric padding for buttons (16.0 horizontal, 12.0 vertical).
  static const EdgeInsets buttonPaddingMedium = EdgeInsets.symmetric(
    horizontal: lg,
    vertical: md,
  );

  /// Small symmetric padding for buttons (12.0 horizontal, 8.0 vertical).
  static const EdgeInsets buttonPaddingSmall = EdgeInsets.symmetric(
    horizontal: md,
    vertical: sm,
  );

  // SizedBox widgets for spacing
  /// A horizontal [SizedBox] for [xs] spacing (4.0).
  static const Widget horizontalSpaceXS = SizedBox(width: xs);

  /// A horizontal [SizedBox] for [sm] spacing (8.0).
  static const Widget horizontalSpaceSM = SizedBox(width: sm);

  /// A horizontal [SizedBox] for [md] spacing (12.0).
  static const Widget horizontalSpaceMD = SizedBox(width: md);

  /// A horizontal [SizedBox] for [lg] spacing (16.0).
  static const Widget horizontalSpaceLG = SizedBox(width: lg);

  /// A horizontal [SizedBox] for [xl] spacing (20.0).
  static const Widget horizontalSpaceXL = SizedBox(width: xl);

  /// A horizontal [SizedBox] for [xxl] spacing (24.0).
  static const Widget horizontalSpaceXXL = SizedBox(width: xxl);

  /// A vertical [SizedBox] for [xs] spacing (4.0).
  static const Widget verticalSpaceXS = SizedBox(height: xs);

  /// A vertical [SizedBox] for [sm] spacing (8.0).
  static const Widget verticalSpaceSM = SizedBox(height: sm);

  /// A vertical [SizedBox] for [md] spacing (12.0).
  static const Widget verticalSpaceMD = SizedBox(height: md);

  /// A vertical [SizedBox] for [lg] spacing (16.0).
  static const Widget verticalSpaceLG = SizedBox(height: lg);

  /// A vertical [SizedBox] for [xl] spacing (20.0).
  static const Widget verticalSpaceXL = SizedBox(height: xl);

  /// A vertical [SizedBox] for [xxl] spacing (24.0).
  static const Widget verticalSpaceXXL = SizedBox(height: xxl);

  /// A vertical [SizedBox] for [xxxl] spacing (32.0).
  static const Widget verticalSpaceXXXL = SizedBox(height: xxxl);

  // Custom spacing widgets
  /// Creates a horizontal [SizedBox] of the specified [width].
  static Widget horizontalSpace(double width) => SizedBox(width: width);

  /// Creates a vertical [SizedBox] of the specified [height].
  static Widget verticalSpace(double height) => SizedBox(height: height);
}
