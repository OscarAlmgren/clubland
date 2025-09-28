import 'package:flutter/material.dart';

/// Sizing constants for Clubland app
class AppSizing {
  /// Private constructor to prevent instantiation of this utility class.
  AppSizing._();

  // Icon sizes
  /// Extra-small icon size (12.0).
  static const double iconXS = 12;

  /// Small icon size (16.0).
  static const double iconSM = 16;

  /// Medium icon size (20.0).
  static const double iconMD = 20;

  /// Large icon size (24.0), often the default for [Icons].
  static const double iconLG = 24;

  /// Extra-large icon size (32.0).
  static const double iconXL = 32;

  /// Double extra-large icon size (48.0).
  static const double iconXXL = 48;

  /// Huge icon size (64.0).
  static const double iconHuge = 64;

  // Button sizes
  /// Height for small buttons (32.0).
  static const double buttonHeightSmall = 32;

  /// Height for medium buttons (40.0).
  static const double buttonHeightMedium = 40;

  /// Height for large buttons (48.0).
  static const double buttonHeightLarge = 48;

  /// Height for extra-large buttons (56.0).
  static const double buttonHeightXLarge = 56;

  // Input field sizes
  /// Standard height for input fields (48.0).
  static const double inputHeight = 48;

  /// Height for large input fields (56.0).
  static const double inputHeightLarge = 56;

  /// Height for small input fields (40.0).
  static const double inputHeightSmall = 40;

  // Avatar sizes
  /// Extra-small avatar size (24.0).
  static const double avatarXS = 24;

  /// Small avatar size (32.0).
  static const double avatarSM = 32;

  /// Medium avatar size (40.0).
  static const double avatarMD = 40;

  /// Large avatar size (48.0).
  static const double avatarLG = 48;

  /// Extra-large avatar size (64.0).
  static const double avatarXL = 64;

  /// Double extra-large avatar size (80.0).
  static const double avatarXXL = 80;

  /// Huge avatar size (120.0).
  static const double avatarHuge = 120;

  // Card sizes
  /// Minimum height for cards (120.0).
  static const double cardMinHeight = 120;

  /// Medium height for cards (200.0).
  static const double cardMediumHeight = 200;

  /// Large height for cards (300.0).
  static const double cardLargeHeight = 300;

  // Border radius
  /// Extra-small border radius (4.0).
  static const double radiusXS = 4;

  /// Small border radius (6.0).
  static const double radiusSM = 6;

  /// Medium border radius (8.0).
  static const double radiusMD = 8;

  /// Large border radius (12.0).
  static const double radiusLG = 12;

  /// Extra-large border radius (16.0).
  static const double radiusXL = 16;

  /// Double extra-large border radius (20.0).
  static const double radiusXXL = 20;

  /// Very large radius for fully rounded elements (1000.0).
  static const double radiusRound = 1000;

  // BorderRadius objects
  /// [BorderRadius] with circular radius [radiusXS].
  static const BorderRadius borderRadiusXS = BorderRadius.all(
    Radius.circular(radiusXS),
  );

  /// [BorderRadius] with circular radius [radiusSM].
  static const BorderRadius borderRadiusSM = BorderRadius.all(
    Radius.circular(radiusSM),
  );

  /// [BorderRadius] with circular radius [radiusMD].
  static const BorderRadius borderRadiusMD = BorderRadius.all(
    Radius.circular(radiusMD),
  );

  /// [BorderRadius] with circular radius [radiusLG].
  static const BorderRadius borderRadiusLG = BorderRadius.all(
    Radius.circular(radiusLG),
  );

  /// [BorderRadius] with circular radius [radiusXL].
  static const BorderRadius borderRadiusXL = BorderRadius.all(
    Radius.circular(radiusXL),
  );

  /// [BorderRadius] with circular radius [radiusXXL].
  static const BorderRadius borderRadiusXXL = BorderRadius.all(
    Radius.circular(radiusXXL),
  );

  // Elevation levels
  /// Zero elevation.
  static const double elevationNone = 0;

  /// Extra-small elevation (1.0).
  static const double elevationXS = 1;

  /// Small elevation (2.0).
  static const double elevationSM = 2;

  /// Medium elevation (4.0).
  static const double elevationMD = 4;

  /// Large elevation (8.0).
  static const double elevationLG = 8;

  /// Extra-large elevation (12.0).
  static const double elevationXL = 12;

  /// Double extra-large elevation (16.0).
  static const double elevationXXL = 16;

  // Line heights
  /// Tight line height (1.2).
  static const double lineHeightTight = 1.2;

  /// Normal line height (1.4).
  static const double lineHeightNormal = 1.4;

  /// Relaxed line height (1.6).
  static const double lineHeightRelaxed = 1.6;

  /// Loose line height (1.8).
  static const double lineHeightLoose = 1.8;

  // Max widths
  /// Maximum width for small containers or modals (400.0).
  static const double maxWidthSmall = 400;

  /// Maximum width for medium containers (600.0).
  static const double maxWidthMedium = 600;

  /// Maximum width for large content containers (800.0).
  static const double maxWidthLarge = 800;

  /// Maximum width for extra-large containers (1200.0).
  static const double maxWidthXLarge = 1200;

  // Breakpoints
  /// Maximum width for mobile layouts (480.0).
  static const double breakpointMobile = 480;

  /// Minimum width for tablet layouts (768.0).
  static const double breakpointTablet = 768;

  /// Minimum width for desktop layouts (1024.0).
  static const double breakpointDesktop = 1024;

  /// Minimum width for large desktop layouts (1440.0).
  static const double breakpointLargeDesktop = 1440;

  // Common component sizes
  /// Standard size for a Floating Action Button (56x56).
  static const Size fabSize = Size(56, 56);

  /// Small size for a Floating Action Button (40x40).
  static const Size fabSizeSmall = Size(40, 40);

  /// Large size for a Floating Action Button (72x72).
  static const Size fabSizeLarge = Size(72, 72);

  // AppBar height
  /// Standard height for AppBars (56.0).
  static const double appBarHeight = 56;

  /// Height for large AppBars (64.0).
  static const double appBarHeightLarge = 64;

  // Bottom navigation bar height
  /// Standard height for bottom navigation bars (60.0).
  static const double bottomNavBarHeight = 60;

  // Tab bar height
  /// Standard height for tab bars (48.0).
  static const double tabBarHeight = 48;

  // Minimum touch target size (accessibility)
  /// Minimum recommended size for touch targets according to accessibility guidelines (48.0).
  static const double minTouchTarget = 48;

  // Helper methods
  /// Checks if the given [width] falls within the mobile breakpoint range.
  static bool isMobile(double width) => width < breakpointTablet;

  /// Checks if the given [width] falls within the tablet breakpoint range.
  static bool isTablet(double width) =>
      width >= breakpointTablet && width < breakpointDesktop;

  /// Checks if the given [width] falls within the desktop breakpoint range.
  static bool isDesktop(double width) => width >= breakpointDesktop;

  /// Retrieves a responsive value based on the current [screenWidth] relative to breakpoints.
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
