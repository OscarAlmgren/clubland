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

String _$loggerHash() => r'c340b6e69d941caf475e8aa9a9a605118ad998e5';

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
    r'8ad32ed5e475854f58f49f0b9a9588071dbe3fdb';

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

String _$secureStorageHash() => r'41024fd5110e3c4b0a060752e59b5e46455292a4';

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
    r'6b643ed72f15a6284347c9386abe10393d07faa5';

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

String _$connectivityHash() => r'e66720f09edf1a8b09e450e1eaedd51da9443f0e';

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

String _$networkInfoHash() => r'34bdf06abd83c5f0b0df927045d180949ce3ffca';

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

String _$storageManagerHash() => r'e8a6c3f3065b60410f9601787deaeeba04190105';

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

String _$cacheManagerHash() => r'707ae21ffa49764701a09ba9c68ce257eafcc598';

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

String _$graphqlClientHash() => r'7e12e71f7bbaf11572baeac97f681c701007c2b1';

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
    r'be8295cec56de59bedb540224e1afd408853faec';

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

/// Global navigator keys provider

@ProviderFor(navigatorKey)
const navigatorKeyProvider = NavigatorKeyProvider._();

/// Global navigator keys provider

final class NavigatorKeyProvider
    extends
        $FunctionalProvider<
          GlobalKey<NavigatorState>,
          GlobalKey<NavigatorState>,
          GlobalKey<NavigatorState>
        >
    with $Provider<GlobalKey<NavigatorState>> {
  /// Global navigator keys provider
  const NavigatorKeyProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'navigatorKeyProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$navigatorKeyHash();

  @$internal
  @override
  $ProviderElement<GlobalKey<NavigatorState>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GlobalKey<NavigatorState> create(Ref ref) {
    return navigatorKey(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GlobalKey<NavigatorState> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GlobalKey<NavigatorState>>(value),
    );
  }
}

String _$navigatorKeyHash() => r'a2c30a72f4d2942af27189331bdf6ca8a9fb9340';

/// Global scaffold messenger key provider

@ProviderFor(scaffoldMessengerKey)
const scaffoldMessengerKeyProvider = ScaffoldMessengerKeyProvider._();

/// Global scaffold messenger key provider

final class ScaffoldMessengerKeyProvider
    extends
        $FunctionalProvider<
          GlobalKey<ScaffoldMessengerState>,
          GlobalKey<ScaffoldMessengerState>,
          GlobalKey<ScaffoldMessengerState>
        >
    with $Provider<GlobalKey<ScaffoldMessengerState>> {
  /// Global scaffold messenger key provider
  const ScaffoldMessengerKeyProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'scaffoldMessengerKeyProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$scaffoldMessengerKeyHash();

  @$internal
  @override
  $ProviderElement<GlobalKey<ScaffoldMessengerState>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GlobalKey<ScaffoldMessengerState> create(Ref ref) {
    return scaffoldMessengerKey(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GlobalKey<ScaffoldMessengerState> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GlobalKey<ScaffoldMessengerState>>(
        value,
      ),
    );
  }
}

String _$scaffoldMessengerKeyHash() =>
    r'6fdcaf2dd3359a74fa6f6d7fbd0c67c54a8e600d';

/// Error Handler provider

@ProviderFor(errorHandlerInit)
const errorHandlerInitProvider = ErrorHandlerInitProvider._();

/// Error Handler provider

final class ErrorHandlerInitProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// Error Handler provider
  const ErrorHandlerInitProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'errorHandlerInitProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$errorHandlerInitHash();

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    return errorHandlerInit(ref);
  }
}

String _$errorHandlerInitHash() => r'6927b7fb40d901e4588e67642f1f345c1c5f5716';

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

String _$appInitializationHash() => r'1cdb403f6e1d90d3ea1aef16aa11036fa281cdb6';

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
