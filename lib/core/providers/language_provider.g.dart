// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Language repository provider

@ProviderFor(languageRepository)
const languageRepositoryProvider = LanguageRepositoryProvider._();

/// Language repository provider

final class LanguageRepositoryProvider
    extends
        $FunctionalProvider<
          LanguageRepository,
          LanguageRepository,
          LanguageRepository
        >
    with $Provider<LanguageRepository> {
  /// Language repository provider
  const LanguageRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'languageRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$languageRepositoryHash();

  @$internal
  @override
  $ProviderElement<LanguageRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LanguageRepository create(Ref ref) {
    return languageRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LanguageRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LanguageRepository>(value),
    );
  }
}

String _$languageRepositoryHash() =>
    r'a8d5021be17085d48dcbe5e5192bff7d3159dda4';

/// Current app language state provider

@ProviderFor(LanguageNotifier)
const languageProvider = LanguageNotifierProvider._();

/// Current app language state provider
final class LanguageNotifierProvider
    extends $AsyncNotifierProvider<LanguageNotifier, AppLanguage?> {
  /// Current app language state provider
  const LanguageNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'languageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$languageNotifierHash();

  @$internal
  @override
  LanguageNotifier create() => LanguageNotifier();
}

String _$languageNotifierHash() => r'f3f73a084759c300bc870534279c07b2791121f5';

/// Current app language state provider

abstract class _$LanguageNotifier extends $AsyncNotifier<AppLanguage?> {
  FutureOr<AppLanguage?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<AppLanguage?>, AppLanguage?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<AppLanguage?>, AppLanguage?>,
              AsyncValue<AppLanguage?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Current locale provider for the app

@ProviderFor(currentLocale)
const currentLocaleProvider = CurrentLocaleProvider._();

/// Current locale provider for the app

final class CurrentLocaleProvider
    extends $FunctionalProvider<Locale?, Locale?, Locale?>
    with $Provider<Locale?> {
  /// Current locale provider for the app
  const CurrentLocaleProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentLocaleProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentLocaleHash();

  @$internal
  @override
  $ProviderElement<Locale?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Locale? create(Ref ref) {
    return currentLocale(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Locale? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Locale?>(value),
    );
  }
}

String _$currentLocaleHash() => r'82b9ee433abab4d0173d5003ff8d53e983f42fbe';

/// Supported locales provider

@ProviderFor(supportedLocales)
const supportedLocalesProvider = SupportedLocalesProvider._();

/// Supported locales provider

final class SupportedLocalesProvider
    extends $FunctionalProvider<List<Locale>, List<Locale>, List<Locale>>
    with $Provider<List<Locale>> {
  /// Supported locales provider
  const SupportedLocalesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'supportedLocalesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$supportedLocalesHash();

  @$internal
  @override
  $ProviderElement<List<Locale>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<Locale> create(Ref ref) {
    return supportedLocales(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Locale> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Locale>>(value),
    );
  }
}

String _$supportedLocalesHash() => r'cb4feff667a632c1e015a64a41977239526a57dd';
