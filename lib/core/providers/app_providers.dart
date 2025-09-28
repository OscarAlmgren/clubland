import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../constants/app_constants.dart';

part 'app_providers.g.dart';

// --- MOCK STORAGE AND PLATFORM PLACEHOLDERS ---

/// MOCK: Simulate reading data from local storage.
Future<String?> _mockReadStorage(String key) async {
  await Future<void>.delayed(const Duration(milliseconds: 100));
  // Example for theme mode: return stored value on initial load
  if (key == 'theme_mode') return 'dark';
  return null;
}

/// MOCK: Simulate writing data to local storage.
Future<void> _mockWriteStorage(String key, String value) async {
  await Future<void>.delayed(const Duration(milliseconds: 100));
  debugPrint('MOCK STORAGE: Saved $value for key $key');
}

// --- PROVIDERS: THEME & LOCALE ---

/// App theme mode provider.
///
/// Manages the current application theme mode (light, dark, or system).
@riverpod
class AppThemeMode extends _$AppThemeMode {
  /// Loads the persisted theme mode from storage, defaulting to [ThemeMode.system].
  @override
  ThemeMode build() {
    // MOCK: Load from storage.
    _mockReadStorage('theme_mode').then((value) {
      if (value == 'light') {
        state = ThemeMode.light;
      } else if (value == 'dark') {
        state = ThemeMode.dark;
      }
    });
    return ThemeMode.system;
  }

  /// Sets the application theme mode and persists the choice to storage.
  void setThemeMode(ThemeMode mode) {
    state = mode;
    // MOCK: Persist to storage
    _mockWriteStorage('theme_mode', mode.name);
  }

  /// Toggles the theme mode between light and dark, or defaults to light from system.
  void toggleTheme() {
    switch (state) {
      case ThemeMode.light:
        setThemeMode(ThemeMode.dark);
        break;
      case ThemeMode.dark:
      case ThemeMode.system: // Default to light when toggling from system
        setThemeMode(ThemeMode.light);
        break;
    }
  }
}

/// App locale provider.
///
/// Manages the currently selected application locale.
@riverpod
class AppLocale extends _$AppLocale {
  /// Loads the persisted locale from storage, defaulting to English ('en', 'US').
  @override
  Locale build() {
    // MOCK: Load from storage.
    _mockReadStorage('app_locale').then((value) {
      if (value != null && value.contains('_')) {
        final parts = value.split('_');
        state = Locale(parts[0], parts[1]);
      }
    });
    return const Locale('en', 'US');
  }

  /// Sets the application locale and persists the choice to storage.
  void setLocale(Locale locale) {
    state = locale;
    // MOCK: Persist to storage
    _mockWriteStorage(
      'app_locale',
      '${locale.languageCode}_${locale.countryCode}',
    );
  }
}

// --- MODEL: APP SETTINGS ---

/// App settings model containing user preferences for features, sync, and quality.
@immutable
class AppSettings {
  /// Constructs an [AppSettings].
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

  /// Creates an [AppSettings] from a JSON map.
  factory AppSettings.fromJson(Map<String, dynamic> json) => AppSettings(
    enableNotifications: json['enableNotifications'] as bool? ?? true,
    enableAnalytics:
        json['enableAnalytics'] as bool? ?? AppConstants.enableAnalytics,
    enableCrashReporting:
        json['enableCrashReporting'] as bool? ??
        AppConstants.enableCrashReporting,
    enableLocationServices:
        json['enableLocationServices'] as bool? ??
        AppConstants.enableLocationFeatures,
    wifiOnlySync: json['wifiOnlySync'] as bool? ?? false,
    autoSync: json['autoSync'] as bool? ?? true,
    imageQuality: json['imageQuality'] as String? ?? 'high',
    reducedMotion: json['reducedMotion'] as bool? ?? false,
  );

  /// If push notifications are enabled.
  final bool enableNotifications;

  /// If anonymous analytics data collection is enabled.
  final bool enableAnalytics;

  /// If crash reporting is enabled.
  final bool enableCrashReporting;

  /// If location features (like maps) are enabled.
  final bool enableLocationServices;

  /// If data synchronization should only occur over Wi-Fi.
  final bool wifiOnlySync;

  /// If background synchronization is enabled.
  final bool autoSync;

  /// The selected quality for images (e.g., 'high', 'medium', 'low').
  final String imageQuality;

  /// If accessibility option for reduced motion is enabled.
  final bool reducedMotion;

  /// Creates a new [AppSettings] instance with updated fields.
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

  /// Converts the [AppSettings] to a JSON map.
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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AppSettings &&
        other.enableNotifications == enableNotifications &&
        other.enableAnalytics == enableAnalytics &&
        other.enableCrashReporting == enableCrashReporting &&
        other.enableLocationServices == enableLocationServices &&
        other.wifiOnlySync == wifiOnlySync &&
        other.autoSync == autoSync &&
        other.imageQuality == imageQuality &&
        other.reducedMotion == reducedMotion;
  }

  @override
  int get hashCode => Object.hash(
    enableNotifications,
    enableAnalytics,
    enableCrashReporting,
    enableLocationServices,
    wifiOnlySync,
    autoSync,
    imageQuality,
    reducedMotion,
  );
}

// --- PROVIDERS: APP SETTINGS ---

/// App settings provider.
///
/// Manages the loading, saving, and updating of all application settings.
@riverpod
class AppSettingsNotifier extends _$AppSettingsNotifier {
  /// Loads the persisted [AppSettings] from storage.
  @override
  Future<AppSettings> build() async {
    // MOCK: Load from storage
    final json = await _mockReadStorage('app_settings');
    if (json != null) {
      // In a real app, you would need to decode the JSON string first:
      // final map = jsonDecode(json) as Map<String, dynamic>;
      // return AppSettings.fromJson(map);
    }
    return const AppSettings();
  }

  /// Updates the entire settings object and saves it to storage.
  Future<void> updateSettings(AppSettings settings) async {
    state = AsyncData(settings);
    // MOCK: Save to storage
    // In a real app, you would encode the map to a JSON string:
    // await _mockWriteStorage('app_settings', jsonEncode(settings.toJson()));
  }

  /// Generic method to update a single setting property.
  Future<void> updateSetting<T>(
    T value,
    AppSettings Function(AppSettings, T) updater,
  ) async {
    final currentSettings = state.value ?? const AppSettings();
    final newSettings = updater(currentSettings, value);
    await updateSettings(newSettings);
  }

  /// Toggles the notification preference.
  Future<void> toggleNotifications() async {
    await updateSetting<bool>(
      !(state.value?.enableNotifications ?? true),
      (settings, value) => settings.copyWith(enableNotifications: value),
    );
  }

  /// Toggles the analytics preference.
  Future<void> toggleAnalytics() async {
    await updateSetting<bool>(
      !(state.value?.enableAnalytics ?? true),
      (settings, value) => settings.copyWith(enableAnalytics: value),
    );
  }

  /// Toggles the location services preference.
  Future<void> toggleLocationServices() async {
    await updateSetting<bool>(
      !(state.value?.enableLocationServices ?? true),
      (settings, value) => settings.copyWith(enableLocationServices: value),
    );
  }

  /// Sets the desired image quality.
  Future<void> setImageQuality(String quality) async {
    await updateSetting<String>(
      quality,
      (settings, value) => settings.copyWith(imageQuality: value),
    );
  }
}

// --- PROVIDERS: LIFECYCLE & DEVICE INFO ---

/// Provides the current [AppLifecycleState] of the application.
@riverpod
AppLifecycleState appLifecycleState(Ref ref) => AppLifecycleState.resumed;

/// Device info model containing hardware and screen specifics.
@immutable
class DeviceInfo {
  /// Constructs a [DeviceInfo].
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

  /// The operating system platform (e.g., 'iOS', 'Android').
  final String platform;

  /// The OS version string.
  final String version;

  /// The device model name.
  final String model;

  /// True if running on a physical device, false if on an emulator.
  final bool isPhysicalDevice;

  /// True if the screen dimensions classify it as a tablet.
  final bool isTablet;

  /// The screen width in logical pixels.
  final double screenWidth;

  /// The screen height in logical pixels.
  final double screenHeight;

  /// The device pixel ratio (DPR).
  final double pixelRatio;

  /// Convenience getter: returns `true` if the device is not classified as a tablet.
  bool get isMobile => !isTablet;

  /// Convenience getter: returns `true` if the screen width is large (e.g., >= 768px).
  bool get isLargeScreen => screenWidth >= 768;

  /// Converts the [DeviceInfo] to a JSON map.
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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DeviceInfo &&
        other.platform == platform &&
        other.version == version &&
        other.model == model &&
        other.isPhysicalDevice == isPhysicalDevice &&
        other.isTablet == isTablet &&
        other.screenWidth == screenWidth &&
        other.screenHeight == screenHeight &&
        other.pixelRatio == pixelRatio;
  }

  @override
  int get hashCode => Object.hash(
    platform,
    version,
    model,
    isPhysicalDevice,
    isTablet,
    screenWidth,
    screenHeight,
    pixelRatio,
  );
}

/// Provides detailed information about the device.
///
/// **MOCK Implementation:** In a real application, this would use a package
/// like `device_info_plus` to gather specific device properties.
@riverpod
Future<DeviceInfo> deviceInfo(Ref ref) async {
  // MOCK: Simulate actual device info gathering delay
  await Future<void>.delayed(const Duration(milliseconds: 200));

  // TODO(oscaralmgren): Implement actual device info gathering using platform channels/packages
  return const DeviceInfo(
    platform: 'Flutter',
    version: '3.16.0',
    model: 'Mock Device',
    isPhysicalDevice: true,
    isTablet: false,
    screenWidth: 375,
    screenHeight: 812,
    pixelRatio: 2.0,
  );
}

// --- PROVIDERS: PERMISSIONS ---

/// Enum representing the status of a device permission.
enum PermissionStatus {
  /// Permission has been granted.
  granted,

  /// Permission has been denied by the user.
  denied,

  /// Permission is restricted by system policies (e.g., enterprise control).
  restricted,

  /// Permission is partially granted (e.g., location is limited).
  limited,

  /// Permission has been permanently denied and requires manual settings change.
  permanentlyDenied,

  /// Permission is granted provisionally (e.g., notifications on iOS).
  provisional,
}

/// App permissions model containing the status for various device permissions.
@immutable
class AppPermissions {
  /// Constructs an [AppPermissions].
  const AppPermissions({
    this.camera = PermissionStatus.denied,
    this.location = PermissionStatus.denied,
    this.notifications = PermissionStatus.denied,
    this.microphone = PermissionStatus.denied,
    this.storage = PermissionStatus.denied,
    this.contacts = PermissionStatus.denied,
  });

  /// Status of the camera permission.
  final PermissionStatus camera;

  /// Status of the location permission.
  final PermissionStatus location;

  /// Status of the notifications permission.
  final PermissionStatus notifications;

  /// Status of the microphone permission.
  final PermissionStatus microphone;

  /// Status of the external storage (files) permission.
  final PermissionStatus storage;

  /// Status of the contacts permission.
  final PermissionStatus contacts;

  /// Creates a new [AppPermissions] instance with updated fields.
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

  /// Convenience getter: returns `true` if location permission is granted.
  bool get hasLocationPermission => location == PermissionStatus.granted;

  /// Convenience getter: returns `true` if notification permission is granted.
  bool get hasNotificationPermission =>
      notifications == PermissionStatus.granted;

  /// Convenience getter: returns `true` if camera permission is granted.
  bool get hasCameraPermission => camera == PermissionStatus.granted;

  /// Converts the [AppPermissions] to a map of permission names and their status names.
  Map<String, String> toJson() => {
    'camera': camera.name,
    'location': location.name,
    'notifications': notifications.name,
    'microphone': microphone.name,
    'storage': storage.name,
    'contacts': contacts.name,
  };

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AppPermissions &&
        other.camera == camera &&
        other.location == location &&
        other.notifications == notifications &&
        other.microphone == microphone &&
        other.storage == storage &&
        other.contacts == contacts;
  }

  @override
  int get hashCode => Object.hash(
    camera,
    location,
    notifications,
    microphone,
    storage,
    contacts,
  );
}

/// App permissions provider.
///
/// Manages and tracks the status of various device permissions.
@riverpod
class AppPermissionsNotifier extends _$AppPermissionsNotifier {
  /// Checks and loads the initial status of all permissions.
  @override
  Future<AppPermissions> build() async {
    // MOCK: Simulate checking permissions
    await Future<void>.delayed(const Duration(milliseconds: 200));
    // TODO(oscaralmgren): Check actual permissions using platform channels/packages
    return const AppPermissions();
  }

  /// Requests the device's location permission.
  Future<void> requestLocationPermission() async {
    // MOCK: Simulate permission request
    debugPrint('MOCK: Requesting Location Permission...');
    await Future<void>.delayed(const Duration(milliseconds: 500));
    // TODO(oscaralmgren): Implement permission request using `permission_handler`
    state = AsyncData(
      state.value?.copyWith(location: PermissionStatus.granted) ??
          const AppPermissions(location: PermissionStatus.granted),
    );
  }

  /// Requests the device's notification permission.
  Future<void> requestNotificationPermission() async {
    // MOCK: Simulate permission request
    debugPrint('MOCK: Requesting Notification Permission...');
    await Future<void>.delayed(const Duration(milliseconds: 500));
    // TODO(oscaralmgren): Implement permission request using `permission_handler`
    state = AsyncData(
      state.value?.copyWith(notifications: PermissionStatus.granted) ??
          const AppPermissions(notifications: PermissionStatus.granted),
    );
  }

  /// Requests the device's camera permission.
  Future<void> requestCameraPermission() async {
    // MOCK: Simulate permission request
    debugPrint('MOCK: Requesting Camera Permission...');
    await Future<void>.delayed(const Duration(milliseconds: 500));
    // TODO(oscaralmgren): Implement permission request using `permission_handler`
    state = AsyncData(
      state.value?.copyWith(camera: PermissionStatus.granted) ??
          const AppPermissions(camera: PermissionStatus.granted),
    );
  }

  /// Forces a refresh of all permission statuses.
  Future<void> refreshPermissions() async {
    ref.invalidateSelf();
  }
}

// --- MODEL: GLOBAL APP STATE ---

/// App state model for global runtime state.
@immutable
class AppState {
  /// Constructs an [AppState].
  const AppState({
    this.isInitialized = false,
    this.isOnline = true,
    this.isLoading = false,
    this.error,
    this.lastSyncTime,
  });

  /// True if core app services have finished initialization.
  final bool isInitialized;

  /// True if the device has a network connection.
  final bool isOnline;

  /// True if a major background operation is running.
  final bool isLoading;

  /// A global error message to be displayed to the user.
  final String? error;

  /// The timestamp of the last successful data synchronization.
  final DateTime? lastSyncTime;

  /// Creates a new [AppState] instance with updated fields.
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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AppState &&
        other.isInitialized == isInitialized &&
        other.isOnline == isOnline &&
        other.isLoading == isLoading &&
        other.error == error &&
        other.lastSyncTime == lastSyncTime;
  }

  @override
  int get hashCode =>
      Object.hash(isInitialized, isOnline, isLoading, error, lastSyncTime);
}

// --- PROVIDERS: GLOBAL APP STATE ---

/// Global app state provider.
///
/// Manages and tracks global flags like initialization, online status, and loading states.
@riverpod
class GlobalAppState extends _$GlobalAppState {
  /// Initializes the state with default values.
  @override
  AppState build() => const AppState();

  /// **SETTER:** Sets the initialization status of the app.
  set isInitialized(bool isInitialized) {
    state = state.copyWith(isInitialized: isInitialized);
  }

  /// **SETTER:** Sets the online connectivity status.
  set isOnline(bool isOnline) {
    state = state.copyWith(isOnline: isOnline);
  }

  /// **SETTER:** Sets the global loading indicator status.
  set isLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  /// **SETTER:** Sets a global error message.
  set error(String? error) {
    state = state.copyWith(error: error);
  }

  /// Clears the current global error message.
  void clearError() {
    state = state.copyWith();
  }

  /// Updates the timestamp of the last successful data synchronization.
  void updateLastSyncTime() {
    state = state.copyWith(lastSyncTime: DateTime.now());
  }
}
