// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Theme repository provider

@ProviderFor(themeRepository)
const themeRepositoryProvider = ThemeRepositoryProvider._();

/// Theme repository provider

final class ThemeRepositoryProvider
    extends
        $FunctionalProvider<ThemeRepository, ThemeRepository, ThemeRepository>
    with $Provider<ThemeRepository> {
  /// Theme repository provider
  const ThemeRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'themeRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$themeRepositoryHash();

  @$internal
  @override
  $ProviderElement<ThemeRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ThemeRepository create(Ref ref) {
    return themeRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeRepository>(value),
    );
  }
}

String _$themeRepositoryHash() => r'4c023e61fe0c4a4609c4e8a5c1010525e840faf6';

/// Current app theme mode state provider

@ProviderFor(ThemeModeNotifier)
const themeModeProvider = ThemeModeNotifierProvider._();

/// Current app theme mode state provider
final class ThemeModeNotifierProvider
    extends $AsyncNotifierProvider<ThemeModeNotifier, AppThemeMode> {
  /// Current app theme mode state provider
  const ThemeModeNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'themeModeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$themeModeNotifierHash();

  @$internal
  @override
  ThemeModeNotifier create() => ThemeModeNotifier();
}

String _$themeModeNotifierHash() => r'7ac8032d1262977f52b34f3d920ce1719c930a02';

/// Current app theme mode state provider

abstract class _$ThemeModeNotifier extends $AsyncNotifier<AppThemeMode> {
  FutureOr<AppThemeMode> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<AppThemeMode>, AppThemeMode>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<AppThemeMode>, AppThemeMode>,
              AsyncValue<AppThemeMode>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Current theme mode provider for the app

@ProviderFor(currentThemeMode)
const currentThemeModeProvider = CurrentThemeModeProvider._();

/// Current theme mode provider for the app

final class CurrentThemeModeProvider
    extends $FunctionalProvider<ThemeMode, ThemeMode, ThemeMode>
    with $Provider<ThemeMode> {
  /// Current theme mode provider for the app
  const CurrentThemeModeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentThemeModeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentThemeModeHash();

  @$internal
  @override
  $ProviderElement<ThemeMode> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ThemeMode create(Ref ref) {
    return currentThemeMode(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeMode>(value),
    );
  }
}

String _$currentThemeModeHash() => r'c2aa9bd0281cad1358e5b5834461de90cca5873e';
