import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../constants/app_constants.dart';

part 'app_providers.g.dart';

/// App theme mode provider
@riverpod
class AppThemeMode extends _$AppThemeMode {
  @override
  ThemeMode build() => ThemeMode.system;

  void setThemeMode(ThemeMode mode) {
    state = mode;
    // TODO: Persist to storage
  }

  void toggleTheme() {
    switch (state) {
      case ThemeMode.light:
        setThemeMode(ThemeMode.dark);
        break;
      case ThemeMode.dark:
        setThemeMode(ThemeMode.light);
        break;
      case ThemeMode.system:
        setThemeMode(ThemeMode.light);
        break;
    }
  }
}

/// App locale provider
@riverpod
class AppLocale extends _$AppLocale {
  @override
  Locale build() => const Locale('en', 'US');

  void setLocale(Locale locale) {
    state = locale;
    // TODO: Persist to storage
  }
}

/// App settings model
class AppSettings {
  const AppSettings({
    this.enableNotifications = true,
    this.enableAnalytics = AppConstants.enableAnalytics,
    this.enableCrashReporting = AppConstants.enableCrashReporting,
    this.enableLocationServices = AppConstants.enableLocationFeatures,
    this.wifiOnlySync = false,
    this.autoSync = true,
    this.imageQuality = 'high',
    this.reducedMotion = false,
  });

  factory AppSettings.fromJson(Map<String, dynamic> json) => AppSettings(
    enableNotifications: json['enableNotifications'] as bool? ?? true,
    enableAnalytics: json['enableAnalytics'] as bool? ?? AppConstants.enableAnalytics,
    enableCrashReporting:
        json['enableCrashReporting'] as bool? ?? AppConstants.enableCrashReporting,
    enableLocationServices:
        json['enableLocationServices'] as bool? ?? AppConstants.enableLocationFeatures,
    wifiOnlySync: json['wifiOnlySync'] as bool? ?? false,
    autoSync: json['autoSync'] as bool? ?? true,
    imageQuality: json['imageQuality'] as String? ?? 'high',
    reducedMotion: json['reducedMotion'] as bool? ?? false,
  );
  final bool enableNotifications;
  final bool enableAnalytics;
  final bool enableCrashReporting;
  final bool enableLocationServices;
  final bool wifiOnlySync;
  final bool autoSync;
  final String imageQuality;
  final bool reducedMotion;

  AppSettings copyWith({
    bool? enableNotifications,
    bool? enableAnalytics,
    bool? enableCrashReporting,
    bool? enableLocationServices,
    bool? wifiOnlySync,
    bool? autoSync,
    String? imageQuality,
    bool? reducedMotion,
  }) => AppSettings(
    enableNotifications: enableNotifications ?? this.enableNotifications,
    enableAnalytics: enableAnalytics ?? this.enableAnalytics,
    enableCrashReporting: enableCrashReporting ?? this.enableCrashReporting,
    enableLocationServices:
        enableLocationServices ?? this.enableLocationServices,
    wifiOnlySync: wifiOnlySync ?? this.wifiOnlySync,
    autoSync: autoSync ?? this.autoSync,
    imageQuality: imageQuality ?? this.imageQuality,
    reducedMotion: reducedMotion ?? this.reducedMotion,
  );

  Map<String, dynamic> toJson() => {
    'enableNotifications': enableNotifications,
    'enableAnalytics': enableAnalytics,
    'enableCrashReporting': enableCrashReporting,
    'enableLocationServices': enableLocationServices,
    'wifiOnlySync': wifiOnlySync,
    'autoSync': autoSync,
    'imageQuality': imageQuality,
    'reducedMotion': reducedMotion,
  };
}

/// App settings provider
@riverpod
class AppSettingsNotifier extends _$AppSettingsNotifier {
  @override
  Future<AppSettings> build() async {
    // TODO: Load from storage
    return const AppSettings();
  }

  Future<void> updateSettings(AppSettings settings) async {
    state = AsyncData(settings);
    // TODO: Save to storage
  }

  Future<void> updateSetting<T>(
    T value,
    AppSettings Function(AppSettings, T) updater,
  ) async {
    final currentSettings = state.value ?? const AppSettings();
    final newSettings = updater(currentSettings, value);
    await updateSettings(newSettings);
  }

  Future<void> toggleNotifications() async {
    await updateSetting<bool>(
      !(state.value?.enableNotifications ?? true),
      (settings, value) => settings.copyWith(enableNotifications: value),
    );
  }

  Future<void> toggleAnalytics() async {
    await updateSetting<bool>(
      !(state.value?.enableAnalytics ?? true),
      (settings, value) => settings.copyWith(enableAnalytics: value),
    );
  }

  Future<void> toggleLocationServices() async {
    await updateSetting<bool>(
      !(state.value?.enableLocationServices ?? true),
      (settings, value) => settings.copyWith(enableLocationServices: value),
    );
  }

  Future<void> setImageQuality(String quality) async {
    await updateSetting<String>(
      quality,
      (settings, value) => settings.copyWith(imageQuality: value),
    );
  }
}

/// App lifecycle state provider
final appLifecycleStateProvider = StateProvider<AppLifecycleState>(
  (ref) => AppLifecycleState.resumed,
);

/// Device info model
class DeviceInfo {
  const DeviceInfo({
    required this.platform,
    required this.version,
    required this.model,
    required this.isPhysicalDevice,
    required this.isTablet,
    required this.screenWidth,
    required this.screenHeight,
    required this.pixelRatio,
  });
  final String platform;
  final String version;
  final String model;
  final bool isPhysicalDevice;
  final bool isTablet;
  final double screenWidth;
  final double screenHeight;
  final double pixelRatio;

  bool get isMobile => !isTablet;
  bool get isLargeScreen => screenWidth >= 768;

  Map<String, dynamic> toJson() => {
    'platform': platform,
    'version': version,
    'model': model,
    'isPhysicalDevice': isPhysicalDevice,
    'isTablet': isTablet,
    'screenWidth': screenWidth,
    'screenHeight': screenHeight,
    'pixelRatio': pixelRatio,
  };
}

/// Device info provider
@riverpod
Future<DeviceInfo> deviceInfo(DeviceInfoRef ref) async {
  // TODO: Implement actual device info gathering
  return const DeviceInfo(
    platform: 'Flutter',
    version: '3.16.0',
    model: 'Unknown',
    isPhysicalDevice: true,
    isTablet: false,
    screenWidth: 375,
    screenHeight: 812,
    pixelRatio: 2.0,
  );
}

/// Permission status enum
enum PermissionStatus {
  granted,
  denied,
  restricted,
  limited,
  permanentlyDenied,
  provisional,
}

/// App permissions model
class AppPermissions {
  const AppPermissions({
    this.camera = PermissionStatus.denied,
    this.location = PermissionStatus.denied,
    this.notifications = PermissionStatus.denied,
    this.microphone = PermissionStatus.denied,
    this.storage = PermissionStatus.denied,
    this.contacts = PermissionStatus.denied,
  });
  final PermissionStatus camera;
  final PermissionStatus location;
  final PermissionStatus notifications;
  final PermissionStatus microphone;
  final PermissionStatus storage;
  final PermissionStatus contacts;

  AppPermissions copyWith({
    PermissionStatus? camera,
    PermissionStatus? location,
    PermissionStatus? notifications,
    PermissionStatus? microphone,
    PermissionStatus? storage,
    PermissionStatus? contacts,
  }) => AppPermissions(
    camera: camera ?? this.camera,
    location: location ?? this.location,
    notifications: notifications ?? this.notifications,
    microphone: microphone ?? this.microphone,
    storage: storage ?? this.storage,
    contacts: contacts ?? this.contacts,
  );

  bool get hasLocationPermission => location == PermissionStatus.granted;
  bool get hasNotificationPermission =>
      notifications == PermissionStatus.granted;
  bool get hasCameraPermission => camera == PermissionStatus.granted;

  Map<String, String> toJson() => {
    'camera': camera.name,
    'location': location.name,
    'notifications': notifications.name,
    'microphone': microphone.name,
    'storage': storage.name,
    'contacts': contacts.name,
  };
}

/// App permissions provider
@riverpod
class AppPermissionsNotifier extends _$AppPermissionsNotifier {
  @override
  Future<AppPermissions> build() async {
    // TODO: Check actual permissions
    return const AppPermissions();
  }

  Future<void> requestLocationPermission() async {
    // TODO: Implement permission request
    state = AsyncData(
      state.value?.copyWith(location: PermissionStatus.granted) ??
          const AppPermissions(location: PermissionStatus.granted),
    );
  }

  Future<void> requestNotificationPermission() async {
    // TODO: Implement permission request
    state = AsyncData(
      state.value?.copyWith(notifications: PermissionStatus.granted) ??
          const AppPermissions(notifications: PermissionStatus.granted),
    );
  }

  Future<void> requestCameraPermission() async {
    // TODO: Implement permission request
    state = AsyncData(
      state.value?.copyWith(camera: PermissionStatus.granted) ??
          const AppPermissions(camera: PermissionStatus.granted),
    );
  }

  Future<void> refreshPermissions() async {
    ref.invalidateSelf();
  }
}

/// App state model for global app state
class AppState {
  const AppState({
    this.isInitialized = false,
    this.isOnline = true,
    this.isLoading = false,
    this.error,
    this.lastSyncTime,
  });
  final bool isInitialized;
  final bool isOnline;
  final bool isLoading;
  final String? error;
  final DateTime? lastSyncTime;

  AppState copyWith({
    bool? isInitialized,
    bool? isOnline,
    bool? isLoading,
    String? error,
    DateTime? lastSyncTime,
  }) => AppState(
    isInitialized: isInitialized ?? this.isInitialized,
    isOnline: isOnline ?? this.isOnline,
    isLoading: isLoading ?? this.isLoading,
    error: error ?? this.error,
    lastSyncTime: lastSyncTime ?? this.lastSyncTime,
  );
}

/// Global app state provider
@riverpod
class GlobalAppState extends _$GlobalAppState {
  @override
  AppState build() => const AppState();

  void setInitialized(bool isInitialized) {
    state = state.copyWith(isInitialized: isInitialized);
  }

  void setOnlineStatus(bool isOnline) {
    state = state.copyWith(isOnline: isOnline);
  }

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  void setError(String? error) {
    state = state.copyWith(error: error);
  }

  void updateLastSyncTime() {
    state = state.copyWith(lastSyncTime: DateTime.now());
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}
