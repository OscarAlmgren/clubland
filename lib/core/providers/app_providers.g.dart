// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// App theme mode provider.
///
/// Manages the current application theme mode (light, dark, or system).

@ProviderFor(AppThemeMode)
const appThemeModeProvider = AppThemeModeProvider._();

/// App theme mode provider.
///
/// Manages the current application theme mode (light, dark, or system).
final class AppThemeModeProvider
    extends $NotifierProvider<AppThemeMode, ThemeMode> {
  /// App theme mode provider.
  ///
  /// Manages the current application theme mode (light, dark, or system).
  const AppThemeModeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appThemeModeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appThemeModeHash();

  @$internal
  @override
  AppThemeMode create() => AppThemeMode();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeMode>(value),
    );
  }
}

String _$appThemeModeHash() => r'a3db36fb0316d2806369586d915f9bbb7f2838d8';

/// App theme mode provider.
///
/// Manages the current application theme mode (light, dark, or system).

abstract class _$AppThemeMode extends $Notifier<ThemeMode> {
  ThemeMode build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ThemeMode, ThemeMode>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ThemeMode, ThemeMode>,
              ThemeMode,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// App locale provider.
///
/// Manages the currently selected application locale.

@ProviderFor(AppLocale)
const appLocaleProvider = AppLocaleProvider._();

/// App locale provider.
///
/// Manages the currently selected application locale.
final class AppLocaleProvider extends $NotifierProvider<AppLocale, Locale> {
  /// App locale provider.
  ///
  /// Manages the currently selected application locale.
  const AppLocaleProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appLocaleProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appLocaleHash();

  @$internal
  @override
  AppLocale create() => AppLocale();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Locale value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Locale>(value),
    );
  }
}

String _$appLocaleHash() => r'dc3e20333cb17b2fe86cb6d352c6af858bb071e2';

/// App locale provider.
///
/// Manages the currently selected application locale.

abstract class _$AppLocale extends $Notifier<Locale> {
  Locale build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Locale, Locale>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Locale, Locale>,
              Locale,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// App settings provider.
///
/// Manages the loading, saving, and updating of all application settings.

@ProviderFor(AppSettingsNotifier)
const appSettingsProvider = AppSettingsNotifierProvider._();

/// App settings provider.
///
/// Manages the loading, saving, and updating of all application settings.
final class AppSettingsNotifierProvider
    extends $AsyncNotifierProvider<AppSettingsNotifier, AppSettings> {
  /// App settings provider.
  ///
  /// Manages the loading, saving, and updating of all application settings.
  const AppSettingsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appSettingsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appSettingsNotifierHash();

  @$internal
  @override
  AppSettingsNotifier create() => AppSettingsNotifier();
}

String _$appSettingsNotifierHash() =>
    r'd0cdd1d4172dd61ac85077bbe8277124c177e13a';

/// App settings provider.
///
/// Manages the loading, saving, and updating of all application settings.

abstract class _$AppSettingsNotifier extends $AsyncNotifier<AppSettings> {
  FutureOr<AppSettings> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<AppSettings>, AppSettings>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<AppSettings>, AppSettings>,
              AsyncValue<AppSettings>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Provides the current [AppLifecycleState] of the application.

@ProviderFor(appLifecycleState)
const appLifecycleStateProvider = AppLifecycleStateProvider._();

/// Provides the current [AppLifecycleState] of the application.

final class AppLifecycleStateProvider
    extends
        $FunctionalProvider<
          AppLifecycleState,
          AppLifecycleState,
          AppLifecycleState
        >
    with $Provider<AppLifecycleState> {
  /// Provides the current [AppLifecycleState] of the application.
  const AppLifecycleStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appLifecycleStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appLifecycleStateHash();

  @$internal
  @override
  $ProviderElement<AppLifecycleState> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AppLifecycleState create(Ref ref) {
    return appLifecycleState(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppLifecycleState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppLifecycleState>(value),
    );
  }
}

String _$appLifecycleStateHash() => r'55890eac77f4eaf547cb087321e5c3d19948f54e';

/// Provides detailed information about the device.
///
/// **MOCK Implementation:** In a real application, this would use a package
/// like `device_info_plus` to gather specific device properties.

@ProviderFor(deviceInfo)
const deviceInfoProvider = DeviceInfoProvider._();

/// Provides detailed information about the device.
///
/// **MOCK Implementation:** In a real application, this would use a package
/// like `device_info_plus` to gather specific device properties.

final class DeviceInfoProvider
    extends
        $FunctionalProvider<
          AsyncValue<DeviceInfo>,
          DeviceInfo,
          FutureOr<DeviceInfo>
        >
    with $FutureModifier<DeviceInfo>, $FutureProvider<DeviceInfo> {
  /// Provides detailed information about the device.
  ///
  /// **MOCK Implementation:** In a real application, this would use a package
  /// like `device_info_plus` to gather specific device properties.
  const DeviceInfoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deviceInfoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deviceInfoHash();

  @$internal
  @override
  $FutureProviderElement<DeviceInfo> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<DeviceInfo> create(Ref ref) {
    return deviceInfo(ref);
  }
}

String _$deviceInfoHash() => r'f26dd84037640c88de389e23032a0ffdc9074687';

/// App permissions provider.
///
/// Manages and tracks the status of various device permissions.

@ProviderFor(AppPermissionsNotifier)
const appPermissionsProvider = AppPermissionsNotifierProvider._();

/// App permissions provider.
///
/// Manages and tracks the status of various device permissions.
final class AppPermissionsNotifierProvider
    extends $AsyncNotifierProvider<AppPermissionsNotifier, AppPermissions> {
  /// App permissions provider.
  ///
  /// Manages and tracks the status of various device permissions.
  const AppPermissionsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appPermissionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appPermissionsNotifierHash();

  @$internal
  @override
  AppPermissionsNotifier create() => AppPermissionsNotifier();
}

String _$appPermissionsNotifierHash() =>
    r'c34d3d67e91645c7f5cded5041817f62984bc5de';

/// App permissions provider.
///
/// Manages and tracks the status of various device permissions.

abstract class _$AppPermissionsNotifier extends $AsyncNotifier<AppPermissions> {
  FutureOr<AppPermissions> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<AppPermissions>, AppPermissions>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<AppPermissions>, AppPermissions>,
              AsyncValue<AppPermissions>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Global app state provider.
///
/// Manages and tracks global flags like initialization, online status, and loading states.

@ProviderFor(GlobalAppState)
const globalAppStateProvider = GlobalAppStateProvider._();

/// Global app state provider.
///
/// Manages and tracks global flags like initialization, online status, and loading states.
final class GlobalAppStateProvider
    extends $NotifierProvider<GlobalAppState, AppState> {
  /// Global app state provider.
  ///
  /// Manages and tracks global flags like initialization, online status, and loading states.
  const GlobalAppStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'globalAppStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$globalAppStateHash();

  @$internal
  @override
  GlobalAppState create() => GlobalAppState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppState>(value),
    );
  }
}

String _$globalAppStateHash() => r'5b073677caf457f789fd1551d8a5344f643457ee';

/// Global app state provider.
///
/// Manages and tracks global flags like initialization, online status, and loading states.

abstract class _$GlobalAppState extends $Notifier<AppState> {
  AppState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AppState, AppState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AppState, AppState>,
              AppState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
