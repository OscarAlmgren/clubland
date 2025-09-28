// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Logger provider

@ProviderFor(logger)
const loggerProvider = LoggerProvider._();

/// Logger provider

final class LoggerProvider extends $FunctionalProvider<Logger, Logger, Logger>
    with $Provider<Logger> {
  /// Logger provider
  const LoggerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loggerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loggerHash();

  @$internal
  @override
  $ProviderElement<Logger> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Logger create(Ref ref) {
    return logger(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Logger value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Logger>(value),
    );
  }
}

String _$loggerHash() => r'b7ba73120c1546e652fcce65783a94907481969d';

/// Flutter Secure Storage provider

@ProviderFor(flutterSecureStorage)
const flutterSecureStorageProvider = FlutterSecureStorageProvider._();

/// Flutter Secure Storage provider

final class FlutterSecureStorageProvider
    extends
        $FunctionalProvider<
          FlutterSecureStorage,
          FlutterSecureStorage,
          FlutterSecureStorage
        >
    with $Provider<FlutterSecureStorage> {
  /// Flutter Secure Storage provider
  const FlutterSecureStorageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'flutterSecureStorageProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$flutterSecureStorageHash();

  @$internal
  @override
  $ProviderElement<FlutterSecureStorage> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FlutterSecureStorage create(Ref ref) {
    return flutterSecureStorage(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FlutterSecureStorage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FlutterSecureStorage>(value),
    );
  }
}

String _$flutterSecureStorageHash() =>
    r'eccec398e3b6173411085c9fca88fb0100aa6282';

/// Enhanced Secure Storage provider

@ProviderFor(secureStorage)
const secureStorageProvider = SecureStorageProvider._();

/// Enhanced Secure Storage provider

final class SecureStorageProvider
    extends
        $FunctionalProvider<
          EnhancedSecureStorage,
          EnhancedSecureStorage,
          EnhancedSecureStorage
        >
    with $Provider<EnhancedSecureStorage> {
  /// Enhanced Secure Storage provider
  const SecureStorageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'secureStorageProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$secureStorageHash();

  @$internal
  @override
  $ProviderElement<EnhancedSecureStorage> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  EnhancedSecureStorage create(Ref ref) {
    return secureStorage(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EnhancedSecureStorage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EnhancedSecureStorage>(value),
    );
  }
}

String _$secureStorageHash() => r'5e925588e2dc3fe0e73ef3ca4ac0feb898f1585d';

/// Secure Storage Service provider

@ProviderFor(secureStorageService)
const secureStorageServiceProvider = SecureStorageServiceProvider._();

/// Secure Storage Service provider

final class SecureStorageServiceProvider
    extends
        $FunctionalProvider<
          SecureStorageService,
          SecureStorageService,
          SecureStorageService
        >
    with $Provider<SecureStorageService> {
  /// Secure Storage Service provider
  const SecureStorageServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'secureStorageServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$secureStorageServiceHash();

  @$internal
  @override
  $ProviderElement<SecureStorageService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SecureStorageService create(Ref ref) {
    return secureStorageService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SecureStorageService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SecureStorageService>(value),
    );
  }
}

String _$secureStorageServiceHash() =>
    r'84a72a9551c06e6ca6ae0d8379bc858864569f98';

/// Connectivity provider

@ProviderFor(connectivity)
const connectivityProvider = ConnectivityProvider._();

/// Connectivity provider

final class ConnectivityProvider
    extends $FunctionalProvider<Connectivity, Connectivity, Connectivity>
    with $Provider<Connectivity> {
  /// Connectivity provider
  const ConnectivityProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'connectivityProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$connectivityHash();

  @$internal
  @override
  $ProviderElement<Connectivity> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Connectivity create(Ref ref) {
    return connectivity(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Connectivity value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Connectivity>(value),
    );
  }
}

String _$connectivityHash() => r'fd33e159c65466f0bf8ec37b98d05eba415da792';

/// Network Info provider

@ProviderFor(networkInfo)
const networkInfoProvider = NetworkInfoProvider._();

/// Network Info provider

final class NetworkInfoProvider
    extends $FunctionalProvider<NetworkInfo, NetworkInfo, NetworkInfo>
    with $Provider<NetworkInfo> {
  /// Network Info provider
  const NetworkInfoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'networkInfoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$networkInfoHash();

  @$internal
  @override
  $ProviderElement<NetworkInfo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  NetworkInfo create(Ref ref) {
    return networkInfo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NetworkInfo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NetworkInfo>(value),
    );
  }
}

String _$networkInfoHash() => r'10064a21e9417a84dce3c58ddf29421eeefda9bf';

/// Storage Manager provider

@ProviderFor(storageManager)
const storageManagerProvider = StorageManagerProvider._();

/// Storage Manager provider

final class StorageManagerProvider
    extends
        $FunctionalProvider<
          AsyncValue<StorageManager>,
          StorageManager,
          FutureOr<StorageManager>
        >
    with $FutureModifier<StorageManager>, $FutureProvider<StorageManager> {
  /// Storage Manager provider
  const StorageManagerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'storageManagerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$storageManagerHash();

  @$internal
  @override
  $FutureProviderElement<StorageManager> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<StorageManager> create(Ref ref) {
    return storageManager(ref);
  }
}

String _$storageManagerHash() => r'9bb2167674767631a5835d85041dd0f68a48bdbc';

/// Cache Manager provider

@ProviderFor(cacheManager)
const cacheManagerProvider = CacheManagerProvider._();

/// Cache Manager provider

final class CacheManagerProvider
    extends
        $FunctionalProvider<
          AsyncValue<AppCacheManager>,
          AppCacheManager,
          FutureOr<AppCacheManager>
        >
    with $FutureModifier<AppCacheManager>, $FutureProvider<AppCacheManager> {
  /// Cache Manager provider
  const CacheManagerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cacheManagerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cacheManagerHash();

  @$internal
  @override
  $FutureProviderElement<AppCacheManager> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AppCacheManager> create(Ref ref) {
    return cacheManager(ref);
  }
}

String _$cacheManagerHash() => r'15e771813acf6b619cc2340b3b2b5da1af49fe81';

/// GraphQL Client provider

@ProviderFor(graphqlClient)
const graphqlClientProvider = GraphqlClientProvider._();

/// GraphQL Client provider

final class GraphqlClientProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// GraphQL Client provider
  const GraphqlClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'graphqlClientProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$graphqlClientHash();

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    return graphqlClient(ref);
  }
}

String _$graphqlClientHash() => r'0f12b30a3c07a925cb383a046006151d75df7255';

/// Connectivity Stream provider

@ProviderFor(connectivityStream)
const connectivityStreamProvider = ConnectivityStreamProvider._();

/// Connectivity Stream provider

final class ConnectivityStreamProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ConnectivityResult>>,
          List<ConnectivityResult>,
          Stream<List<ConnectivityResult>>
        >
    with
        $FutureModifier<List<ConnectivityResult>>,
        $StreamProvider<List<ConnectivityResult>> {
  /// Connectivity Stream provider
  const ConnectivityStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'connectivityStreamProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$connectivityStreamHash();

  @$internal
  @override
  $StreamProviderElement<List<ConnectivityResult>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<ConnectivityResult>> create(Ref ref) {
    return connectivityStream(ref);
  }
}

String _$connectivityStreamHash() =>
    r'24437ac151a73b1470b9509029f9475bd787b2ba';

/// Network Status provider

@ProviderFor(NetworkStatus)
const networkStatusProvider = NetworkStatusProvider._();

/// Network Status provider
final class NetworkStatusProvider
    extends $AsyncNotifierProvider<NetworkStatus, NetworkDetails> {
  /// Network Status provider
  const NetworkStatusProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'networkStatusProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$networkStatusHash();

  @$internal
  @override
  NetworkStatus create() => NetworkStatus();
}

String _$networkStatusHash() => r'18531ee014ed65f695347879b7cbc7f4744585fb';

/// Network Status provider

abstract class _$NetworkStatus extends $AsyncNotifier<NetworkDetails> {
  FutureOr<NetworkDetails> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<NetworkDetails>, NetworkDetails>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<NetworkDetails>, NetworkDetails>,
              AsyncValue<NetworkDetails>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// App Initialization provider

@ProviderFor(AppInitialization)
const appInitializationProvider = AppInitializationProvider._();

/// App Initialization provider
final class AppInitializationProvider
    extends $AsyncNotifierProvider<AppInitialization, bool> {
  /// App Initialization provider
  const AppInitializationProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appInitializationProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appInitializationHash();

  @$internal
  @override
  AppInitialization create() => AppInitialization();
}

String _$appInitializationHash() => r'5b98ac4d64de6d92b6df3239f10d942450d7ab5b';

/// App Initialization provider

abstract class _$AppInitialization extends $AsyncNotifier<bool> {
  FutureOr<bool> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<bool>, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<bool>, bool>,
              AsyncValue<bool>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
