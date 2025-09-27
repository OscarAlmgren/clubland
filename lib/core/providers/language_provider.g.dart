// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$languageRepositoryHash() =>
    r'be680bde5e3e8f6306ee68a27474b13cdb91ecf1';

/// Language repository provider
///
/// Copied from [languageRepository].
@ProviderFor(languageRepository)
final languageRepositoryProvider =
    AutoDisposeProvider<LanguageRepository>.internal(
  languageRepository,
  name: r'languageRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$languageRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LanguageRepositoryRef = AutoDisposeProviderRef<LanguageRepository>;
String _$currentLocaleHash() => r'cac87ca2defd48d954a7aaaff793ff10297bdc15';

/// Current locale provider for the app
///
/// Copied from [currentLocale].
@ProviderFor(currentLocale)
final currentLocaleProvider = AutoDisposeProvider<Locale?>.internal(
  currentLocale,
  name: r'currentLocaleProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentLocaleHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentLocaleRef = AutoDisposeProviderRef<Locale?>;
String _$supportedLocalesHash() => r'c51d0286a181a8cfa12793b4fb21c489c76d6c70';

/// Supported locales provider
///
/// Copied from [supportedLocales].
@ProviderFor(supportedLocales)
final supportedLocalesProvider = AutoDisposeProvider<List<Locale>>.internal(
  supportedLocales,
  name: r'supportedLocalesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$supportedLocalesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SupportedLocalesRef = AutoDisposeProviderRef<List<Locale>>;
String _$languageNotifierHash() => r'f3f73a084759c300bc870534279c07b2791121f5';

/// Current app language state provider
///
/// Copied from [LanguageNotifier].
@ProviderFor(LanguageNotifier)
final languageNotifierProvider =
    AutoDisposeAsyncNotifierProvider<LanguageNotifier, AppLanguage?>.internal(
  LanguageNotifier.new,
  name: r'languageNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$languageNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LanguageNotifier = AutoDisposeAsyncNotifier<AppLanguage?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
