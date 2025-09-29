import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';

/// Service for handling font loading with network fallbacks
///
/// This service provides robust font handling that gracefully falls back to
/// system fonts when Google Fonts fail to load due to network issues or
/// missing entitlements.
class FontService {
  static final Logger _logger = Logger();
  static bool _networkAvailable = true;
  static bool _googleFontsEnabled = true;

  /// Primary font family - loads from Google Fonts with system fallback
  static const String _primaryFontFamily = 'Roboto Flex';

  /// System font fallbacks for different platforms
  static const Map<String, List<String>> _platformFallbacks = {
    'macos': [
      'SF Pro Display',
      'SF Pro Text',
      'Helvetica Neue',
      'Helvetica',
      'Arial',
      'sans-serif',
    ],
    'windows': ['Segoe UI', 'Tahoma', 'Arial', 'sans-serif'],
    'linux': [
      'Ubuntu',
      'DejaVu Sans',
      'Liberation Sans',
      'Arial',
      'sans-serif',
    ],
    'ios': [
      'SF Pro Display',
      'SF Pro Text',
      'Helvetica Neue',
      'Helvetica',
      'Arial',
      'sans-serif',
    ],
    'android': ['Roboto', 'Arial', 'sans-serif'],
  };

  /// Check if network is available for font loading
  static Future<bool> _checkNetworkAvailability() async {
    try {
      final result = await InternetAddress.lookup('fonts.googleapis.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (e) {
      _logger.w('Network check failed for Google Fonts: $e');
      return false;
    }
  }

  /// Initialize font service and detect capabilities
  static Future<void> initialize() async {
    _logger.i('🔤 Initializing FontService...');

    // Check network availability
    _networkAvailable = await _checkNetworkAvailability();
    _logger.i('📶 Network available for fonts: $_networkAvailable');

    // Test Google Fonts loading capability
    if (_networkAvailable) {
      try {
        // Try to load a simple Google Font to test entitlements
        GoogleFonts.roboto();
        _googleFontsEnabled = true;
        _logger.i('✅ Google Fonts enabled and working');
      } on Exception catch (e) {
        _googleFontsEnabled = false;
        _logger.w('⚠️ Google Fonts disabled due to error: $e');
        _logger.i('🔄 Falling back to system fonts');
      }
    } else {
      _googleFontsEnabled = false;
      _logger.i('📱 Using system fonts (offline mode)');
    }
  }

  /// Get platform-specific font fallbacks
  static List<String> _getPlatformFallbacks() {
    String platform;
    if (Platform.isMacOS) {
      platform = 'macos';
    } else if (Platform.isWindows) {
      platform = 'windows';
    } else if (Platform.isLinux) {
      platform = 'linux';
    } else if (Platform.isIOS) {
      platform = 'ios';
    } else if (Platform.isAndroid) {
      platform = 'android';
    } else {
      platform = 'macos'; // Default fallback
    }

    return _platformFallbacks[platform] ?? _platformFallbacks['macos']!;
  }

  /// Get text theme with fallback support
  static TextTheme getTextTheme({Brightness brightness = Brightness.light}) {
    if (_googleFontsEnabled && _networkAvailable) {
      try {
        // Try to load Google Fonts text theme
        _logger.d('📱 Loading Google Fonts text theme: $_primaryFontFamily');
        return GoogleFonts.robotoFlexTextTheme();
      } on Exception catch (e) {
        _logger.w('⚠️ Failed to load Google Fonts text theme: $e');
        // Fall through to system fonts
      }
    }

    // Use system font fallbacks
    _logger.d('🔄 Using system font fallbacks');
    return _createSystemTextTheme();
  }

  /// Get font family with fallback support
  static String? getFontFamily() {
    if (_googleFontsEnabled && _networkAvailable) {
      try {
        return GoogleFonts.robotoFlex().fontFamily;
      } on Exception catch (e) {
        _logger.w('⚠️ Failed to get Google Font family: $e');
      }
    }

    // Return null to use system default or specify fallback
    return null; // Let Flutter use default system font
  }

  /// Create system font text theme with platform-appropriate fallbacks
  static TextTheme _createSystemTextTheme() {
    final fallbacks = _getPlatformFallbacks();
    final fontFamily = fallbacks.first;

    _logger.d('🔤 Using system font: $fontFamily with fallbacks: $fallbacks');

    return TextTheme(
      displayLarge: TextStyle(
        fontFamily: fontFamily,
        fontFamilyFallback: fallbacks.skip(1).toList(),
        fontSize: 57,
        fontWeight: FontWeight.w400,
        height: 1.12,
        letterSpacing: -0.25,
      ),
      displayMedium: TextStyle(
        fontFamily: fontFamily,
        fontFamilyFallback: fallbacks.skip(1).toList(),
        fontSize: 45,
        fontWeight: FontWeight.w400,
        height: 1.16,
      ),
      displaySmall: TextStyle(
        fontFamily: fontFamily,
        fontFamilyFallback: fallbacks.skip(1).toList(),
        fontSize: 36,
        fontWeight: FontWeight.w400,
        height: 1.22,
      ),
      headlineLarge: TextStyle(
        fontFamily: fontFamily,
        fontFamilyFallback: fallbacks.skip(1).toList(),
        fontSize: 32,
        fontWeight: FontWeight.w400,
        height: 1.25,
      ),
      headlineMedium: TextStyle(
        fontFamily: fontFamily,
        fontFamilyFallback: fallbacks.skip(1).toList(),
        fontSize: 28,
        fontWeight: FontWeight.w400,
        height: 1.29,
      ),
      headlineSmall: TextStyle(
        fontFamily: fontFamily,
        fontFamilyFallback: fallbacks.skip(1).toList(),
        fontSize: 24,
        fontWeight: FontWeight.w400,
        height: 1.33,
      ),
      titleLarge: TextStyle(
        fontFamily: fontFamily,
        fontFamilyFallback: fallbacks.skip(1).toList(),
        fontSize: 22,
        fontWeight: FontWeight.w400,
        height: 1.27,
      ),
      titleMedium: TextStyle(
        fontFamily: fontFamily,
        fontFamilyFallback: fallbacks.skip(1).toList(),
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 1.50,
        letterSpacing: 0.15,
      ),
      titleSmall: TextStyle(
        fontFamily: fontFamily,
        fontFamilyFallback: fallbacks.skip(1).toList(),
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.43,
        letterSpacing: 0.1,
      ),
      labelLarge: TextStyle(
        fontFamily: fontFamily,
        fontFamilyFallback: fallbacks.skip(1).toList(),
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.43,
        letterSpacing: 0.1,
      ),
      labelMedium: TextStyle(
        fontFamily: fontFamily,
        fontFamilyFallback: fallbacks.skip(1).toList(),
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1.33,
        letterSpacing: 0.5,
      ),
      labelSmall: TextStyle(
        fontFamily: fontFamily,
        fontFamilyFallback: fallbacks.skip(1).toList(),
        fontSize: 11,
        fontWeight: FontWeight.w500,
        height: 1.45,
        letterSpacing: 0.5,
      ),
      bodyLarge: TextStyle(
        fontFamily: fontFamily,
        fontFamilyFallback: fallbacks.skip(1).toList(),
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.50,
        letterSpacing: 0.15,
      ),
      bodyMedium: TextStyle(
        fontFamily: fontFamily,
        fontFamilyFallback: fallbacks.skip(1).toList(),
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.43,
        letterSpacing: 0.25,
      ),
      bodySmall: TextStyle(
        fontFamily: fontFamily,
        fontFamilyFallback: fallbacks.skip(1).toList(),
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 1.33,
        letterSpacing: 0.4,
      ),
    );
  }

  /// Force refresh font capabilities (useful after network changes)
  static Future<void> refresh() async {
    _logger.i('🔄 Refreshing FontService capabilities...');
    await initialize();
  }

  /// Get current font status for debugging
  static Map<String, dynamic> getStatus() => {
    'networkAvailable': _networkAvailable,
    'googleFontsEnabled': _googleFontsEnabled,
    'platform': Platform.operatingSystem,
    'fallbacks': _getPlatformFallbacks(),
  };

  /// Manually disable Google Fonts (useful for testing fallbacks)
  static void disableGoogleFonts() {
    _googleFontsEnabled = false;
    _logger.w('⚠️ Google Fonts manually disabled');
  }

  /// Re-enable Google Fonts
  static void enableGoogleFonts() {
    _googleFontsEnabled = true;
    _logger.i('✅ Google Fonts manually enabled');
  }
}
