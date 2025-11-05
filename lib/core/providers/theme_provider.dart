import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_provider.g.dart';

/// Available theme modes in the app
enum AppThemeMode {
  /// Light theme option
  light('light', 'Light', 'Ljus'),

  /// Dark theme option
  dark('dark', 'Dark', 'Mörk'),

  /// System theme option (follows device settings)
  system('system', 'System', 'System');

  /// Creates an app theme mode with the given code and display names
  const AppThemeMode(this.code, this.englishName, this.swedishName);

  /// Theme mode code (e.g., 'light', 'dark', 'system')
  final String code;

  /// Display name in English
  final String englishName;

  /// Display name in Swedish
  final String swedishName;

  /// Get display name based on current language
  String getDisplayName(String languageCode) {
    switch (languageCode) {
      case 'en':
        return englishName;
      case 'sv':
        return swedishName;
      default:
        return englishName;
    }
  }

  /// Convert to Flutter ThemeMode
  ThemeMode get themeMode {
    switch (this) {
      case AppThemeMode.light:
        return ThemeMode.light;
      case AppThemeMode.dark:
        return ThemeMode.dark;
      case AppThemeMode.system:
        return ThemeMode.system;
    }
  }

  /// Find theme mode by code
  static AppThemeMode? fromCode(String? code) {
    if (code == null) return null;
    try {
      return AppThemeMode.values.firstWhere((mode) => mode.code == code);
    } on StateError catch (_) {
      // Theme mode code not found in enum values
      return null;
    }
  }
}

/// Theme settings repository
class ThemeRepository {
  static const String _themeKey = 'app_theme_mode';

  /// Get saved theme mode
  Future<AppThemeMode?> getSavedThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final themeCode = prefs.getString(_themeKey);
    return AppThemeMode.fromCode(themeCode);
  }

  /// Save theme mode preference
  Future<void> saveThemeMode(AppThemeMode themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeKey, themeMode.code);
  }

  /// Clear theme mode preference (use system default)
  Future<void> clearThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_themeKey);
  }
}

/// Theme repository provider
@riverpod
ThemeRepository themeRepository(Ref ref) {
  return ThemeRepository();
}

/// Current app theme mode state provider
@riverpod
class ThemeModeNotifier extends _$ThemeModeNotifier {
  @override
  Future<AppThemeMode> build() async {
    // Try to get saved theme mode first
    final savedThemeMode = await ref
        .read(themeRepositoryProvider)
        .getSavedThemeMode();

    // Default to system theme if no saved preference
    return savedThemeMode ?? AppThemeMode.system;
  }

  /// Change the app theme mode
  Future<void> setThemeMode(AppThemeMode themeMode) async {
    state = AsyncData(themeMode);
    await ref.read(themeRepositoryProvider).saveThemeMode(themeMode);
  }

  /// Reset to system default theme
  Future<void> resetToSystemDefault() async {
    await ref.read(themeRepositoryProvider).clearThemeMode();
    state = const AsyncData(AppThemeMode.system);
  }
}

/// Current theme mode provider for the app
@riverpod
ThemeMode currentThemeMode(Ref ref) {
  final themeModeAsync = ref.watch(themeModeProvider);
  return themeModeAsync.when(
    data: (AppThemeMode themeMode) => themeMode.themeMode,
    loading: () => ThemeMode.system,
    error: (_, __) => ThemeMode.system,
  );
}
