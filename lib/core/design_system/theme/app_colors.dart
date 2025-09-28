import 'package:flutter/material.dart';

/// App color schemes, constants, and utility methods for the Clubland application.
///
/// This class defines brand colors, semantic colors, neutral palette, and the
/// application's light and dark [ColorScheme]s, along with helper methods
/// for gradient creation and color manipulation.
class AppColors {
  // Private constructor to prevent instantiation
  AppColors._();

  // Brand Colors
  /// The main brand color: Navy Blue (0xFF1B365D).
  static const Color brandPrimary = Color(0xFF1B365D); // Navy Blue

  /// The secondary brand color: Forest Green (0xFF2E7D32).
  static const Color brandSecondary = Color(0xFF2E7D32); // Forest Green

  /// The accent color used for highlights and premium elements: Elegant Gold (0xFFD4AF37).
  static const Color brandAccent = Color(0xFFD4AF37); // Elegant Gold

  /// A tertiary brand color: Rich Brown (0xFF8B4513).
  static const Color brandTertiary = Color(0xFF8B4513); // Rich Brown

  // Semantic Colors
  /// Color used to indicate a successful operation.
  static const Color success = Color(0xFF4CAF50);

  /// Color used for warnings or caution.
  static const Color warning = Color(0xFFFF9800);

  /// Color used to indicate errors or destructive actions.
  static const Color error = Color(0xFFE53E3E);

  /// Color used for informational messages.
  static const Color info = Color(0xFF2196F3);

  // Neutral Colors
  /// Lightest neutral shade (near white).
  static const Color neutral100 = Color(0xFFF8F9FA);

  /// Second lightest neutral shade.
  static const Color neutral200 = Color(0xFFE9ECEF);

  /// Third lightest neutral shade.
  static const Color neutral300 = Color(0xFFDEE2E6);

  /// Mid-light neutral shade.
  static const Color neutral400 = Color(0xFFCED4DA);

  /// Mid-neutral shade (standard grey).
  static const Color neutral500 = Color(0xFFADB5BD);

  /// Mid-dark neutral shade.
  static const Color neutral600 = Color(0xFF6C757D);

  /// Dark neutral shade.
  static const Color neutral700 = Color(0xFF495057);

  /// Darker neutral shade.
  static const Color neutral800 = Color(0xFF343A40);

  /// Darkest neutral shade (near black).
  static const Color neutral900 = Color(0xFF212529);

  // Light Color Scheme
  /// The complete light [ColorScheme] for the application.
  static const ColorScheme lightColorScheme = ColorScheme.light(
    // Primary Colors
    primary: brandPrimary,
    primaryContainer: Color(0xFFE3F2FD),
    onPrimaryContainer: Color(0xFF0D47A1),

    // Secondary Colors
    secondary: brandSecondary,
    onSecondary: Colors.white,
    secondaryContainer: Color(0xFFE8F5E8),
    onSecondaryContainer: Color(0xFF1B5E20),

    // Tertiary Colors
    tertiary: brandAccent,
    onTertiary: Color(0xFF1A1A1A),
    tertiaryContainer: Color(0xFFFFF8E1),
    onTertiaryContainer: Color(0xFF7F6000),

    // Error Colors
    error: error,
    errorContainer: Color(0xFFFFEBEE),
    onErrorContainer: Color(0xFFB71C1C),
    onSurface: neutral900,
    surfaceContainerHighest: neutral100,
    onSurfaceVariant: neutral700,

    // Outline Colors
    outline: neutral400,
    outlineVariant: neutral300,

    // Shadow and Scrim
    shadow: Colors.black26,
    scrim: Colors.black54,

    // Inverse Colors
    inverseSurface: neutral800,
    onInverseSurface: neutral100,
    inversePrimary: Color(0xFF90CAF9),
  );

  // Dark Color Scheme
  /// The complete dark [ColorScheme] for the application.
  static const ColorScheme darkColorScheme = ColorScheme.dark(
    // Primary Colors
    primary: Color(0xFF90CAF9),
    onPrimary: Color(0xFF0D47A1),
    primaryContainer: Color(0xFF1565C0),
    onPrimaryContainer: Color(0xFFE3F2FD),

    // Secondary Colors
    secondary: Color(0xFFA5D6A7),
    onSecondary: Color(0xFF1B5E20),
    secondaryContainer: Color(0xFF2E7D32),
    onSecondaryContainer: Color(0xFFE8F5E8),

    // Tertiary Colors
    tertiary: Color(0xFFFFD54F),
    onTertiary: Color(0xFF7F6000),
    tertiaryContainer: Color(0xFFB8860B),
    onTertiaryContainer: Color(0xFFFFF8E1),

    // Error Colors
    error: Color(0xFFFF5722),
    onError: Colors.white,
    errorContainer: Color(0xFFD32F2F),
    onErrorContainer: Color(0xFFFFEBEE),
    onSurface: Color(0xFFE0E0E0),
    surfaceContainerHighest: Color(0xFF1E1E1E),
    onSurfaceVariant: Color(0xFFBDBDBD),

    // Outline Colors
    outline: Color(0xFF616161),
    outlineVariant: Color(0xFF424242),

    // Shadow and Scrim
    shadow: Colors.black87,
    scrim: Colors.black87,

    // Inverse Colors
    inverseSurface: Color(0xFFE0E0E0),
    onInverseSurface: Color(0xFF121212),
    inversePrimary: brandPrimary,
  );

  // Club Category Colors
  /// Map associating club categories (string keys) with distinct colors.
  static const Map<String, Color> clubCategoryColors = {
    'dining': Color(0xFFFF6B35),
    'fitness': Color(0xFF4CAF50),
    'business': Color(0xFF2196F3),
    'social': Color(0xFF9C27B0),
    'wellness': Color(0xFF00BCD4),
    'recreation': Color(0xFFFF9800),
    'accommodation': Color(0xFF795548),
    'exclusive': brandAccent,
  };

  // Status Colors
  /// Map associating generic status strings with semantic colors.
  static const Map<String, Color> statusColors = {
    'active': success,
    'pending': warning,
    'inactive': neutral500,
    'suspended': error,
    'verified': info,
  };

  // Booking Status Colors
  /// Map associating booking status strings with semantic colors.
  static const Map<String, Color> bookingStatusColors = {
    'confirmed': success,
    'pending': warning,
    'cancelled': error,
    'completed': info,
    'no_show': neutral600,
  };

  // Membership Tier Colors
  /// Map associating membership tier strings (e.g., 'gold') with specific colors.
  static const Map<String, Color> membershipTierColors = {
    'bronze': Color(0xFFCD7F32),
    'silver': Color(0xFFC0C0C0),
    'gold': brandAccent,
    'platinum': Color(0xFFE5E4E2),
    'diamond': Color(0xFFB9F2FF),
  };

  // Gradient Definitions
  /// A gradient using the primary brand color.
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [brandPrimary, Color(0xFF2E3B4E)],
  );

  /// A gradient using the secondary brand color.
  static const LinearGradient secondaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [brandSecondary, Color(0xFF1B5E20)],
  );

  /// A gradient using the accent brand color.
  static const LinearGradient accentGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [brandAccent, Color(0xFFB8860B)],
  );

  /// A subtle gradient suitable for backgrounds.
  static const LinearGradient surfaceGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFFAFAFA), Color(0xFFF5F5F5)],
  );

  /// A very light gradient suitable for card backgrounds.
  static const LinearGradient cardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Colors.white, Color(0xFFFCFCFC)],
  );

  // Helper methods
  /// Retrieves the associated color for a given club category string.
  /// Defaults to [neutral500] if the category is not found.
  static Color getClubCategoryColor(String category) =>
      clubCategoryColors[category.toLowerCase()] ?? neutral500;

  /// Retrieves the associated color for a given status string.
  /// Defaults to [neutral500] if the status is not found.
  static Color getStatusColor(String status) =>
      statusColors[status.toLowerCase()] ?? neutral500;

  /// Retrieves the associated color for a given booking status string.
  /// Defaults to [neutral500] if the status is not found.
  static Color getBookingStatusColor(String status) =>
      bookingStatusColors[status.toLowerCase()] ?? neutral500;

  /// Retrieves the associated color for a given membership tier string.
  /// Defaults to [neutral500] if the tier is not found.
  static Color getMembershipTierColor(String tier) =>
      membershipTierColors[tier.toLowerCase()] ?? neutral500;

  /// Returns a new color with the specified opacity applied.
  static Color withOpacity(Color color, double opacity) =>
      color.withValues(alpha: opacity);

  /// Lightens a color by a percentage amount.
  ///
  /// The [amount] must be between 0.0 and 1.0.
  static Color lighten(Color color, [double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1, 'Amount must be between 0 and 1');
    final hsl = HSLColor.fromColor(color);
    final lightness = (hsl.lightness + amount).clamp(0.0, 1.0);
    return hsl.withLightness(lightness).toColor();
  }

  /// Darkens a color by a percentage amount.
  ///
  /// The [amount] must be between 0.0 and 1.0.
  static Color darken(Color color, [double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1, 'Amount must be between 0 and 1');
    final hsl = HSLColor.fromColor(color);
    final lightness = (hsl.lightness - amount).clamp(0.0, 1.0);
    return hsl.withLightness(lightness).toColor();
  }
}
