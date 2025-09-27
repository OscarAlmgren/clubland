import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'language_provider.g.dart';

/// Available languages in the app
enum AppLanguage {
  english('en', 'English', 'Engelska'),
  swedish('sv', 'Swedish', 'Svenska');

  const AppLanguage(this.code, this.englishName, this.swedishName);

  final String code;
  final String englishName;
  final String swedishName;

  /// Get display name based on current language
  String getDisplayName(AppLanguage currentLanguage) {
    switch (currentLanguage) {
      case AppLanguage.english:
        return englishName;
      case AppLanguage.swedish:
        return swedishName;
    }
  }

  /// Get locale object
  Locale get locale => Locale(code);

  /// Find language by code
  static AppLanguage? fromCode(String? code) {
    if (code == null) return null;
    try {
      return AppLanguage.values.firstWhere((lang) => lang.code == code);
    } catch (e) {
      return null;
    }
  }
}

/// Language settings repository
class LanguageRepository {
  static const String _languageKey = 'app_language';

  /// Get saved language
  Future<AppLanguage?> getSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString(_languageKey);
    return AppLanguage.fromCode(languageCode);
  }

  /// Save language preference
  Future<void> saveLanguage(AppLanguage language) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, language.code);
  }

  /// Clear language preference (use system default)
  Future<void> clearLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_languageKey);
  }
}

/// Language repository provider
@riverpod
LanguageRepository languageRepository(LanguageRepositoryRef ref) {
  return LanguageRepository();
}

/// Current app language state provider
@riverpod
class LanguageNotifier extends _$LanguageNotifier {
  @override
  Future<AppLanguage?> build() async {
    // Try to get saved language first
    final savedLanguage = await ref.read(languageRepositoryProvider).getSavedLanguage();
    if (savedLanguage != null) {
      return savedLanguage;
    }

    // Fall back to system locale
    final systemLocale = PlatformDispatcher.instance.locale;
    final systemLanguage = AppLanguage.fromCode(systemLocale.languageCode);

    // If system language is supported, use it; otherwise default to English
    return systemLanguage ?? AppLanguage.english;
  }

  /// Change the app language
  Future<void> setLanguage(AppLanguage language) async {
    state = AsyncData(language);
    await ref.read(languageRepositoryProvider).saveLanguage(language);
  }

  /// Reset to system default language
  Future<void> resetToSystemDefault() async {
    await ref.read(languageRepositoryProvider).clearLanguage();

    // Get system locale and set accordingly
    final systemLocale = PlatformDispatcher.instance.locale;
    final systemLanguage = AppLanguage.fromCode(systemLocale.languageCode);
    final newLanguage = systemLanguage ?? AppLanguage.english;

    state = AsyncData(newLanguage);
  }
}

/// Current locale provider for the app
@riverpod
Locale? currentLocale(CurrentLocaleRef ref) {
  final languageAsync = ref.watch(languageNotifierProvider);
  return languageAsync.when(
    data: (language) => language?.locale,
    loading: () => null,
    error: (_, __) => AppLanguage.english.locale,
  );
}

/// Supported locales provider
@riverpod
List<Locale> supportedLocales(SupportedLocalesRef ref) {
  return AppLanguage.values.map((lang) => lang.locale).toList();
}