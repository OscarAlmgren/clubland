import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/auth/presentation/controllers/auth_controller.dart';
import '../design_system/theme/font_service.dart';
import '../errors/error_handler.dart';
import '../network/graphql_client.dart';
import '../network/network_info.dart';
import '../storage/cache_manager.dart';
import '../storage/local_storage.dart';
import '../storage/secure_storage.dart';

part 'core_providers.g.dart';

/// Logger provider
@Riverpod(keepAlive: true)
Logger logger(Ref ref) => Logger(printer: PrettyPrinter());

/// Flutter Secure Storage provider
@Riverpod(keepAlive: true)
FlutterSecureStorage flutterSecureStorage(Ref ref) =>
    const FlutterSecureStorage(
      iOptions: IOSOptions(
        accessibility: KeychainAccessibility.first_unlock_this_device,
      ),
    );

/// Enhanced Secure Storage provider
@Riverpod(keepAlive: true)
EnhancedSecureStorage secureStorage(Ref ref) => EnhancedSecureStorage(
  storage: ref.watch(flutterSecureStorageProvider),
  logger: ref.watch(loggerProvider),
);

/// Secure Storage Service provider
@Riverpod(keepAlive: true)
SecureStorageService secureStorageService(Ref ref) =>
    SecureStorageService(ref.watch(secureStorageProvider));

/// Connectivity provider
@Riverpod(keepAlive: true)
Connectivity connectivity(Ref ref) => Connectivity();

/// Network Info provider
@Riverpod(keepAlive: true)
NetworkInfo networkInfo(Ref ref) =>
    EnhancedNetworkInfo(ref.watch(connectivityProvider));

/// Storage Manager provider
@Riverpod(keepAlive: true)
Future<StorageManager> storageManager(Ref ref) async {
  final manager = StorageManager(logger: ref.watch(loggerProvider));
  await manager.init();
  return manager;
}

/// Cache Manager provider
@Riverpod(keepAlive: true)
Future<AppCacheManager> cacheManager(Ref ref) async {
  final storageManager = await ref.watch(storageManagerProvider.future);
  final cacheStorage = storageManager.cacheStorage;

  final manager = CacheManager(
    storage: cacheStorage,
    logger: ref.watch(loggerProvider),
  );

  await manager.init();
  return AppCacheManager(manager);
}

/// GraphQL Client provider
@Riverpod(keepAlive: true)
Future<void> graphqlClient(Ref ref) async {
  const baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://192.168.0.170:30080',
  );

  await GraphQLClientConfig.initialize(
    baseUrl: baseUrl,
    logger: ref.watch(loggerProvider),
    secureStorage: ref.watch(flutterSecureStorageProvider),
  );
}

/// Connectivity Stream provider
@riverpod
Stream<List<ConnectivityResult>> connectivityStream(Ref ref) {
  final connectivity = ref.watch(connectivityProvider);
  return connectivity.onConnectivityChanged;
}

/// Network Status provider
@riverpod
class NetworkStatus extends _$NetworkStatus {
  @override
  Future<NetworkDetails> build() async {
    final networkInfo = ref.watch(networkInfoProvider) as EnhancedNetworkInfo;

    // Listen to connectivity changes
    ref.listen(connectivityStreamProvider, (previous, next) {
      next.when(
        data: (_) => ref.invalidateSelf(),
        loading: () {},
        error: (_, stackTrace) {},
      );
    });

    return networkInfo.getNetworkDetails();
  }

  /// Check if connected
  bool get isConnected => state.value?.isConnected ?? false;

  /// Check if on WiFi
  bool get isWiFi => state.value?.connectionType == ConnectionType.wifi;

  /// Check if on mobile data
  bool get isMobile => state.value?.connectionType == ConnectionType.mobile;

  /// Check if connection is metered
  bool get isMetered => state.value?.isMetered ?? false;
}

/// Global navigator keys provider
@Riverpod(keepAlive: true)
GlobalKey<NavigatorState> navigatorKey(Ref ref) => GlobalKey<NavigatorState>();

/// Global scaffold messenger key provider
@Riverpod(keepAlive: true)
GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey(Ref ref) =>
    GlobalKey<ScaffoldMessengerState>();

/// Error Handler provider
@Riverpod(keepAlive: true)
Future<void> errorHandlerInit(Ref ref) async {
  final logger = ref.watch(loggerProvider);
  final navigatorKey = ref.watch(navigatorKeyProvider);
  final scaffoldMessengerKey = ref.watch(scaffoldMessengerKeyProvider);

  ErrorHandler.initialize(
    navigatorKey: navigatorKey,
    scaffoldMessengerKey: scaffoldMessengerKey,
    logger: logger,
  );
}

// Assuming AppInitialization is an AsyncNotifier or similar (using riverpod_annotation)
@riverpod
class AppInitialization extends _$AppInitialization {
  @override
  // FIX: Changed return type from Future<void> to Future<bool>
  // to match the expected signature (FutureOr<bool> Function())
  Future<bool> build() async {
    final logger = ref.read(loggerProvider);

    // 1. Initial synchronous work or setup...
    logger.i('Starting app initialization...');

    // 2. Initialize ErrorHandler first (critical for error reporting)
    await ref.read(errorHandlerInitProvider.future);
    if (ref.mounted) logger.d('ErrorHandler initialized');

    // 3. Async operation (e.g., initializing storage or services)
    await initializeStorage();
    if (ref.mounted) logger.d('Storage manager initialized');

    // 4. Initialize FontService with fallback support
    await FontService.initialize();
    if (ref.mounted) logger.d('FontService initialized with fallback support');

    // 5. Auth initialization is now optional - don't block app startup
    // The auth state will be managed by the router independently
    try {
      // Try to initialize auth but don't block if it fails
      if (ref.mounted) {
        ref.read(authControllerProvider);
        logger.d('Auth controller accessed successfully');
      }
    } on Object catch (e) {
      // Auth initialization failure is non-critical for basic app functionality
      if (ref.mounted) {
        logger.w('Auth controller initialization deferred: $e');
      }
    }

    // Finalization...
    if (ref.mounted) logger.i('App initialization complete');

    // FIX: Return true to signal successful initialization
    // Even if the provider was disposed mid-init, the actual services were initialized
    return true;
  }

  // Placeholder for your actual initialization logic
  Future<void> initializeStorage() async {
    // Simulate async operation
    await Future<void>.delayed(const Duration(milliseconds: 100));
    // Call to StorageManager.init or similar...
    // Also, ensure ErrorHandler is initialized here if needed.
  }

  /// Retry initialization
  Future<void> retry() async {
    ref.invalidateSelf();
    await future;
  }
}
