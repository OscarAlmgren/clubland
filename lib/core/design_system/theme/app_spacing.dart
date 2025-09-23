import 'package:flutter/material.dart';

/// Spacing and sizing constants for Clubland app
class AppSpacing {
  AppSpacing._();

  // Base spacing unit
  static const double _baseUnit = 4.0;

  // Spacing Scale
  static const double xs = _baseUnit; // 4
  static const double sm = _baseUnit * 2; // 8
  static const double md = _baseUnit * 3; // 12
  static const double lg = _baseUnit * 4; // 16
  static const double xl = _baseUnit * 5; // 20
  static const double xxl = _baseUnit * 6; // 24
  static const double xxxl = _baseUnit * 8; // 32
  static const double huge = _baseUnit * 12; // 48
  static const double massive = _baseUnit * 16; // 64

  // Common spacing values
  static const double none = 0;
  static const double micro = 2;
  static const double tiny = xs;
  static const double small = sm;
  static const double medium = lg;
  static const double large = xxl;
  static const double extraLarge = xxxl;

  // Layout spacing
  static const double pageHorizontal = lg;
  static const double pageVertical = lg;
  static const double sectionSpacing = xxl;
  static const double cardPadding = lg;
  static const double listItemSpacing = sm;

  // Component spacing
  static const double buttonPadding = lg;
  static const double iconSpacing = sm;
  static const double textSpacing = xs;
  static const double chipSpacing = sm;
  static const double inputPadding = lg;

  // Edge Insets
  static const EdgeInsets paddingXS = EdgeInsets.all(xs);
  static const EdgeInsets paddingSM = EdgeInsets.all(sm);
  static const EdgeInsets paddingMD = EdgeInsets.all(md);
  static const EdgeInsets paddingLG = EdgeInsets.all(lg);
  static const EdgeInsets paddingXL = EdgeInsets.all(xl);
  static const EdgeInsets paddingXXL = EdgeInsets.all(xxl);
  static const EdgeInsets paddingXXXL = EdgeInsets.all(xxxl);

  // Horizontal padding
  static const EdgeInsets horizontalXS = EdgeInsets.symmetric(horizontal: xs);
  static const EdgeInsets horizontalSM = EdgeInsets.symmetric(horizontal: sm);
  static const EdgeInsets horizontalMD = EdgeInsets.symmetric(horizontal: md);
  static const EdgeInsets horizontalLG = EdgeInsets.symmetric(horizontal: lg);
  static const EdgeInsets horizontalXL = EdgeInsets.symmetric(horizontal: xl);
  static const EdgeInsets horizontalXXL = EdgeInsets.symmetric(horizontal: xxl);

  // Vertical padding
  static const EdgeInsets verticalXS = EdgeInsets.symmetric(vertical: xs);
  static const EdgeInsets verticalSM = EdgeInsets.symmetric(vertical: sm);
  static const EdgeInsets verticalMD = EdgeInsets.symmetric(vertical: md);
  static const EdgeInsets verticalLG = EdgeInsets.symmetric(vertical: lg);
  static const EdgeInsets verticalXL = EdgeInsets.symmetric(vertical: xl);
  static const EdgeInsets verticalXXL = EdgeInsets.symmetric(vertical: xxl);

  // Page padding
  static const EdgeInsets pagePadding = EdgeInsets.symmetric(
    horizontal: pageHorizontal,
    vertical: pageVertical,
  );

  // Card padding
  static const EdgeInsets cardPaddingAll = EdgeInsets.all(cardPadding);
  static const EdgeInsets cardPaddingVertical = EdgeInsets.symmetric(
    vertical: cardPadding,
    horizontal: lg,
  );

  // List item padding
  static const EdgeInsets listItemPadding = EdgeInsets.symmetric(
    horizontal: lg,
    vertical: md,
  );

  // Button padding
  static const EdgeInsets buttonPaddingLarge = EdgeInsets.symmetric(
    horizontal: xxl,
    vertical: lg,
  );
  static const EdgeInsets buttonPaddingMedium = EdgeInsets.symmetric(
    horizontal: lg,
    vertical: md,
  );
  static const EdgeInsets buttonPaddingSmall = EdgeInsets.symmetric(
    horizontal: md,
    vertical: sm,
  );

  // SizedBox widgets for spacing
  static const Widget horizontalSpaceXS = SizedBox(width: xs);
  static const Widget horizontalSpaceSM = SizedBox(width: sm);
  static const Widget horizontalSpaceMD = SizedBox(width: md);
  static const Widget horizontalSpaceLG = SizedBox(width: lg);
  static const Widget horizontalSpaceXL = SizedBox(width: xl);
  static const Widget horizontalSpaceXXL = SizedBox(width: xxl);

  static const Widget verticalSpaceXS = SizedBox(height: xs);
  static const Widget verticalSpaceSM = SizedBox(height: sm);
  static const Widget verticalSpaceMD = SizedBox(height: md);
  static const Widget verticalSpaceLG = SizedBox(height: lg);
  static const Widget verticalSpaceXL = SizedBox(height: xl);
  static const Widget verticalSpaceXXL = SizedBox(height: xxl);
  static const Widget verticalSpaceXXXL = SizedBox(height: xxxl);

  // Custom spacing widgets
  static Widget horizontalSpace(double width) => SizedBox(width: width);
  static Widget verticalSpace(double height) => SizedBox(height: height);
}

/// Sizing constants for Clubland app
class AppSizing {
  AppSizing._();

  // Icon sizes
  static const double iconXS = 12;
  static const double iconSM = 16;
  static const double iconMD = 20;
  static const double iconLG = 24;
  static const double iconXL = 32;
  static const double iconXXL = 48;
  static const double iconHuge = 64;

  // Button sizes
  static const double buttonHeightSmall = 32;
  static const double buttonHeightMedium = 40;
  static const double buttonHeightLarge = 48;
  static const double buttonHeightXLarge = 56;

  // Input field sizes
  static const double inputHeight = 48;
  static const double inputHeightLarge = 56;
  static const double inputHeightSmall = 40;

  // Avatar sizes
  static const double avatarXS = 24;
  static const double avatarSM = 32;
  static const double avatarMD = 40;
  static const double avatarLG = 48;
  static const double avatarXL = 64;
  static const double avatarXXL = 80;
  static const double avatarHuge = 120;

  // Card sizes
  static const double cardMinHeight = 120;
  static const double cardMediumHeight = 200;
  static const double cardLargeHeight = 300;

  // Border radius
  static const double radiusXS = 4;
  static const double radiusSM = 6;
  static const double radiusMD = 8;
  static const double radiusLG = 12;
  static const double radiusXL = 16;
  static const double radiusXXL = 20;
  static const double radiusRound = 1000;

  // BorderRadius objects
  static const BorderRadius borderRadiusXS = BorderRadius.all(Radius.circular(radiusXS));
  static const BorderRadius borderRadiusSM = BorderRadius.all(Radius.circular(radiusSM));
  static const BorderRadius borderRadiusMD = BorderRadius.all(Radius.circular(radiusMD));
  static const BorderRadius borderRadiusLG = BorderRadius.all(Radius.circular(radiusLG));
  static const BorderRadius borderRadiusXL = BorderRadius.all(Radius.circular(radiusXL));
  static const BorderRadius borderRadiusXXL = BorderRadius.all(Radius.circular(radiusXXL));

  // Elevation levels
  static const double elevationNone = 0;
  static const double elevationXS = 1;
  static const double elevationSM = 2;
  static const double elevationMD = 4;
  static const double elevationLG = 8;
  static const double elevationXL = 12;
  static const double elevationXXL = 16;

  // Line heights
  static const double lineHeightTight = 1.2;
  static const double lineHeightNormal = 1.4;
  static const double lineHeightRelaxed = 1.6;
  static const double lineHeightLoose = 1.8;

  // Max widths
  static const double maxWidthSmall = 400;
  static const double maxWidthMedium = 600;
  static const double maxWidthLarge = 800;
  static const double maxWidthXLarge = 1200;

  // Breakpoints
  static const double breakpointMobile = 480;
  static const double breakpointTablet = 768;
  static const double breakpointDesktop = 1024;
  static const double breakpointLargeDesktop = 1440;

  // Common component sizes
  static const Size fabSize = Size(56, 56);
  static const Size fabSizeSmall = Size(40, 40);
  static const Size fabSizeLarge = Size(72, 72);

  // AppBar height
  static const double appBarHeight = 56;
  static const double appBarHeightLarge = 64;

  // Bottom navigation bar height
  static const double bottomNavBarHeight = 60;

  // Tab bar height
  static const double tabBarHeight = 48;

  // Minimum touch target size (accessibility)
  static const double minTouchTarget = 48;

  // Helper methods
  static bool isMobile(double width) => width < breakpointTablet;
  static bool isTablet(double width) => width >= breakpointTablet && width < breakpointDesktop;
  static bool isDesktop(double width) => width >= breakpointDesktop;

  /// Get responsive value based on screen width
  static T getResponsiveValue<T>({
    required double screenWidth,
    required T mobile,
    required T tablet,
    required T desktop,
  }) {
    if (isDesktop(screenWidth)) return desktop;
    if (isTablet(screenWidth)) return tablet;
    return mobile;
  }
}