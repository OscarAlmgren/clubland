import 'package:flutter/material.dart';

/// App color schemes for Clubland
class AppColors {
  // Private constructor to prevent instantiation
  AppColors._();

  // Brand Colors
  static const Color brandPrimary = Color(0xFF1B365D); // Navy Blue
  static const Color brandSecondary = Color(0xFF2E7D32); // Forest Green
  static const Color brandAccent = Color(0xFFD4AF37); // Elegant Gold
  static const Color brandTertiary = Color(0xFF8B4513); // Rich Brown

  // Semantic Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color error = Color(0xFFE53E3E);
  static const Color info = Color(0xFF2196F3);

  // Neutral Colors
  static const Color neutral100 = Color(0xFFF8F9FA);
  static const Color neutral200 = Color(0xFFE9ECEF);
  static const Color neutral300 = Color(0xFFDEE2E6);
  static const Color neutral400 = Color(0xFFCED4DA);
  static const Color neutral500 = Color(0xFFADB5BD);
  static const Color neutral600 = Color(0xFF6C757D);
  static const Color neutral700 = Color(0xFF495057);
  static const Color neutral800 = Color(0xFF343A40);
  static const Color neutral900 = Color(0xFF212529);

  // Light Color Scheme
  static const ColorScheme lightColorScheme = ColorScheme.light(
    // Primary Colors
    primary: brandPrimary,
    onPrimary: Colors.white,
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
    onError: Colors.white,
    errorContainer: Color(0xFFFFEBEE),
    onErrorContainer: Color(0xFFB71C1C),

    // Surface Colors
    surface: Colors.white,
    onSurface: neutral900,
    surfaceVariant: neutral100,
    onSurfaceVariant: neutral700,

    // Background Colors
    background: neutral100,
    onBackground: neutral900,

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

    // Surface Colors
    surface: Color(0xFF121212),
    onSurface: Color(0xFFE0E0E0),
    surfaceVariant: Color(0xFF1E1E1E),
    onSurfaceVariant: Color(0xFFBDBDBD),

    // Background Colors
    background: Color(0xFF0A0A0A),
    onBackground: Color(0xFFE0E0E0),

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
  static const Map<String, Color> statusColors = {
    'active': success,
    'pending': warning,
    'inactive': neutral500,
    'suspended': error,
    'verified': info,
  };

  // Booking Status Colors
  static const Map<String, Color> bookingStatusColors = {
    'confirmed': success,
    'pending': warning,
    'cancelled': error,
    'completed': info,
    'no_show': neutral600,
  };

  // Membership Tier Colors
  static const Map<String, Color> membershipTierColors = {
    'bronze': Color(0xFFCD7F32),
    'silver': Color(0xFFC0C0C0),
    'gold': brandAccent,
    'platinum': Color(0xFFE5E4E2),
    'diamond': Color(0xFFB9F2FF),
  };

  // Gradient Definitions
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      brandPrimary,
      Color(0xFF2E3B4E),
    ],
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      brandSecondary,
      Color(0xFF1B5E20),
    ],
  );

  static const LinearGradient accentGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      brandAccent,
      Color(0xFFB8860B),
    ],
  );

  static const LinearGradient surfaceGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFFAFAFA),
      Color(0xFFF5F5F5),
    ],
  );

  static const LinearGradient cardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Colors.white,
      Color(0xFFFCFCFC),
    ],
  );

  // Helper methods
  static Color getClubCategoryColor(String category) {
    return clubCategoryColors[category.toLowerCase()] ?? neutral500;
  }

  static Color getStatusColor(String status) {
    return statusColors[status.toLowerCase()] ?? neutral500;
  }

  static Color getBookingStatusColor(String status) {
    return bookingStatusColors[status.toLowerCase()] ?? neutral500;
  }

  static Color getMembershipTierColor(String tier) {
    return membershipTierColors[tier.toLowerCase()] ?? neutral500;
  }

  /// Get color with opacity
  static Color withOpacity(Color color, double opacity) {
    return color.withOpacity(opacity);
  }

  /// Lighten a color by a percentage
  static Color lighten(Color color, [double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(color);
    final lightness = (hsl.lightness + amount).clamp(0.0, 1.0);
    return hsl.withLightness(lightness).toColor();
  }

  /// Darken a color by a percentage
  static Color darken(Color color, [double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(color);
    final lightness = (hsl.lightness - amount).clamp(0.0, 1.0);
    return hsl.withLightness(lightness).toColor();
  }
}