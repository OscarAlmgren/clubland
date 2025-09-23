import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../network/graphql_client.dart';
import '../network/network_info.dart';
import '../storage/cache_manager.dart';
import '../storage/local_storage.dart';
import '../storage/secure_storage.dart';

part 'core_providers.g.dart';

/// Logger provider
@Riverpod(keepAlive: true)
Logger logger(LoggerRef ref) => Logger(printer: PrettyPrinter());

/// Flutter Secure Storage provider
@Riverpod(keepAlive: true)
FlutterSecureStorage flutterSecureStorage(FlutterSecureStorageRef ref) =>
    const FlutterSecureStorage(
      iOptions: IOSOptions(
        accessibility: KeychainAccessibility.first_unlock_this_device,
      ),
    );

/// Enhanced Secure Storage provider
@Riverpod(keepAlive: true)
EnhancedSecureStorage secureStorage(SecureStorageRef ref) =>
    EnhancedSecureStorage(
      storage: ref.watch(flutterSecureStorageProvider),
      logger: ref.watch(loggerProvider),
    );

/// Secure Storage Service provider
@Riverpod(keepAlive: true)
SecureStorageService secureStorageService(SecureStorageServiceRef ref) =>
    SecureStorageService(ref.watch(secureStorageProvider));

/// Connectivity provider
@Riverpod(keepAlive: true)
Connectivity connectivity(ConnectivityRef ref) => Connectivity();

/// Network Info provider
@Riverpod(keepAlive: true)
NetworkInfo networkInfo(NetworkInfoRef ref) =>
    EnhancedNetworkInfo(ref.watch(connectivityProvider));

/// Storage Manager provider
@Riverpod(keepAlive: true)
Future<StorageManager> storageManager(StorageManagerRef ref) async {
  final manager = StorageManager(logger: ref.watch(loggerProvider));
  await manager.init();
  return manager;
}

/// Cache Manager provider
@Riverpod(keepAlive: true)
Future<AppCacheManager> cacheManager(CacheManagerRef ref) async {
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
Future<void> graphqlClient(GraphqlClientRef ref) async {
  const baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://localhost:8080',
  );

  await GraphQLClientConfig.initialize(
    baseUrl: baseUrl,
    logger: ref.watch(loggerProvider),
    secureStorage: ref.watch(flutterSecureStorageProvider),
  );
}

/// Connectivity Stream provider
@riverpod
Stream<List<ConnectivityResult>> connectivityStream(ConnectivityStreamRef ref) {
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

/// App Initialization provider
@riverpod
class AppInitialization extends _$AppInitialization {
  @override
  Future<bool> build() async {
    try {
      final logger = ref.read(loggerProvider);
      logger.i('Starting app initialization...');

      // Initialize storage
      await ref.read(storageManagerProvider.future);
      logger.d('Storage manager initialized');

      // Initialize cache
      await ref.read(cacheManagerProvider.future);
      logger.d('Cache manager initialized');

      // Initialize GraphQL client
      await ref.read(graphqlClientProvider.future);
      logger.d('GraphQL client initialized');

      // Check network status
      await ref.read(networkStatusProvider.future);
      logger.d('Network status checked');

      logger.i('App initialization completed successfully');
      return true;
    } on Exception catch (e, stackTrace) {
      final logger = ref.read(loggerProvider);
      logger.e('App initialization failed', error: e, stackTrace: stackTrace);
      return false;
    }
  }

  /// Retry initialization
  Future<void> retry() async {
    ref.invalidateSelf();
    await future;
  }
}
