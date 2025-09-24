// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loggerHash() => r'b7ba73120c1546e652fcce65783a94907481969d';

/// Logger provider
///
/// Copied from [logger].
@ProviderFor(logger)
final loggerProvider = Provider<Logger>.internal(
  logger,
  name: r'loggerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$loggerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LoggerRef = ProviderRef<Logger>;
String _$flutterSecureStorageHash() =>
    r'eccec398e3b6173411085c9fca88fb0100aa6282';

/// Flutter Secure Storage provider
///
/// Copied from [flutterSecureStorage].
@ProviderFor(flutterSecureStorage)
final flutterSecureStorageProvider = Provider<FlutterSecureStorage>.internal(
  flutterSecureStorage,
  name: r'flutterSecureStorageProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$flutterSecureStorageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FlutterSecureStorageRef = ProviderRef<FlutterSecureStorage>;
String _$secureStorageHash() => r'5e925588e2dc3fe0e73ef3ca4ac0feb898f1585d';

/// Enhanced Secure Storage provider
///
/// Copied from [secureStorage].
@ProviderFor(secureStorage)
final secureStorageProvider = Provider<EnhancedSecureStorage>.internal(
  secureStorage,
  name: r'secureStorageProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$secureStorageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SecureStorageRef = ProviderRef<EnhancedSecureStorage>;
String _$secureStorageServiceHash() =>
    r'84a72a9551c06e6ca6ae0d8379bc858864569f98';

/// Secure Storage Service provider
///
/// Copied from [secureStorageService].
@ProviderFor(secureStorageService)
final secureStorageServiceProvider = Provider<SecureStorageService>.internal(
  secureStorageService,
  name: r'secureStorageServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$secureStorageServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SecureStorageServiceRef = ProviderRef<SecureStorageService>;
String _$connectivityHash() => r'fd33e159c65466f0bf8ec37b98d05eba415da792';

/// Connectivity provider
///
/// Copied from [connectivity].
@ProviderFor(connectivity)
final connectivityProvider = Provider<Connectivity>.internal(
  connectivity,
  name: r'connectivityProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$connectivityHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ConnectivityRef = ProviderRef<Connectivity>;
String _$networkInfoHash() => r'10064a21e9417a84dce3c58ddf29421eeefda9bf';

/// Network Info provider
///
/// Copied from [networkInfo].
@ProviderFor(networkInfo)
final networkInfoProvider = Provider<NetworkInfo>.internal(
  networkInfo,
  name: r'networkInfoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$networkInfoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NetworkInfoRef = ProviderRef<NetworkInfo>;
String _$storageManagerHash() => r'9bb2167674767631a5835d85041dd0f68a48bdbc';

/// Storage Manager provider
///
/// Copied from [storageManager].
@ProviderFor(storageManager)
final storageManagerProvider = FutureProvider<StorageManager>.internal(
  storageManager,
  name: r'storageManagerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$storageManagerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef StorageManagerRef = FutureProviderRef<StorageManager>;
String _$cacheManagerHash() => r'15e771813acf6b619cc2340b3b2b5da1af49fe81';

/// Cache Manager provider
///
/// Copied from [cacheManager].
@ProviderFor(cacheManager)
final cacheManagerProvider = FutureProvider<AppCacheManager>.internal(
  cacheManager,
  name: r'cacheManagerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cacheManagerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CacheManagerRef = FutureProviderRef<AppCacheManager>;
String _$graphqlClientHash() => r'0f12b30a3c07a925cb383a046006151d75df7255';

/// GraphQL Client provider
///
/// Copied from [graphqlClient].
@ProviderFor(graphqlClient)
final graphqlClientProvider = FutureProvider<void>.internal(
  graphqlClient,
  name: r'graphqlClientProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$graphqlClientHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GraphqlClientRef = FutureProviderRef<void>;
String _$connectivityStreamHash() =>
    r'24437ac151a73b1470b9509029f9475bd787b2ba';

/// Connectivity Stream provider
///
/// Copied from [connectivityStream].
@ProviderFor(connectivityStream)
final connectivityStreamProvider =
    AutoDisposeStreamProvider<List<ConnectivityResult>>.internal(
  connectivityStream,
  name: r'connectivityStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$connectivityStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ConnectivityStreamRef
    = AutoDisposeStreamProviderRef<List<ConnectivityResult>>;
String _$networkStatusHash() => r'18531ee014ed65f695347879b7cbc7f4744585fb';

/// Network Status provider
///
/// Copied from [NetworkStatus].
@ProviderFor(NetworkStatus)
final networkStatusProvider =
    AutoDisposeAsyncNotifierProvider<NetworkStatus, NetworkDetails>.internal(
  NetworkStatus.new,
  name: r'networkStatusProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$networkStatusHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NetworkStatus = AutoDisposeAsyncNotifier<NetworkDetails>;
String _$appInitializationHash() => r'5b98ac4d64de6d92b6df3239f10d942450d7ab5b';

/// App Initialization provider
///
/// Copied from [AppInitialization].
@ProviderFor(AppInitialization)
final appInitializationProvider =
    AutoDisposeAsyncNotifierProvider<AppInitialization, bool>.internal(
  AppInitialization.new,
  name: r'appInitializationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appInitializationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AppInitialization = AutoDisposeAsyncNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
