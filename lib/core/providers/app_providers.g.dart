// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$deviceInfoHash() => r'416350b1996f396682815f154b3c071bf1cb639c';

/// Device info provider
///
/// Copied from [deviceInfo].
@ProviderFor(deviceInfo)
final deviceInfoProvider = AutoDisposeFutureProvider<DeviceInfo>.internal(
  deviceInfo,
  name: r'deviceInfoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$deviceInfoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DeviceInfoRef = AutoDisposeFutureProviderRef<DeviceInfo>;
String _$appThemeModeHash() => r'0258da4ba681e5505de173421d4731f68b166595';

/// App theme mode provider
///
/// Copied from [AppThemeMode].
@ProviderFor(AppThemeMode)
final appThemeModeProvider =
    AutoDisposeNotifierProvider<AppThemeMode, ThemeMode>.internal(
  AppThemeMode.new,
  name: r'appThemeModeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appThemeModeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AppThemeMode = AutoDisposeNotifier<ThemeMode>;
String _$appLocaleHash() => r'4665ebb95249c0693dee586eadc04435dd16a7e6';

/// App locale provider
///
/// Copied from [AppLocale].
@ProviderFor(AppLocale)
final appLocaleProvider =
    AutoDisposeNotifierProvider<AppLocale, Locale>.internal(
  AppLocale.new,
  name: r'appLocaleProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appLocaleHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AppLocale = AutoDisposeNotifier<Locale>;
String _$appSettingsNotifierHash() =>
    r'6da75cbd83d90a63f24d8f492f21579430af47a2';

/// App settings provider
///
/// Copied from [AppSettingsNotifier].
@ProviderFor(AppSettingsNotifier)
final appSettingsNotifierProvider =
    AutoDisposeAsyncNotifierProvider<AppSettingsNotifier, AppSettings>.internal(
  AppSettingsNotifier.new,
  name: r'appSettingsNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appSettingsNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AppSettingsNotifier = AutoDisposeAsyncNotifier<AppSettings>;
String _$appPermissionsNotifierHash() =>
    r'9c7ea3a699284c89628f0a2345d28bef0a677cc9';

/// App permissions provider
///
/// Copied from [AppPermissionsNotifier].
@ProviderFor(AppPermissionsNotifier)
final appPermissionsNotifierProvider = AutoDisposeAsyncNotifierProvider<
    AppPermissionsNotifier, AppPermissions>.internal(
  AppPermissionsNotifier.new,
  name: r'appPermissionsNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appPermissionsNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AppPermissionsNotifier = AutoDisposeAsyncNotifier<AppPermissions>;
String _$globalAppStateHash() => r'8a247e8ab6bae55ab99384b55e9a5be1207bcc93';

/// Global app state provider
///
/// Copied from [GlobalAppState].
@ProviderFor(GlobalAppState)
final globalAppStateProvider =
    AutoDisposeNotifierProvider<GlobalAppState, AppState>.internal(
  GlobalAppState.new,
  name: r'globalAppStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$globalAppStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GlobalAppState = AutoDisposeNotifier<AppState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
