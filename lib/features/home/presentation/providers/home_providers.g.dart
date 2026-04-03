// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Home feed repository provider.

@ProviderFor(homeFeedRepository)
const homeFeedRepositoryProvider = HomeFeedRepositoryProvider._();

/// Home feed repository provider.

final class HomeFeedRepositoryProvider
    extends
        $FunctionalProvider<
          HomeFeedRepository,
          HomeFeedRepository,
          HomeFeedRepository
        >
    with $Provider<HomeFeedRepository> {
  /// Home feed repository provider.
  const HomeFeedRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeFeedRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeFeedRepositoryHash();

  @$internal
  @override
  $ProviderElement<HomeFeedRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  HomeFeedRepository create(Ref ref) {
    return homeFeedRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HomeFeedRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HomeFeedRepository>(value),
    );
  }
}

String _$homeFeedRepositoryHash() =>
    r'f71bf24d61659ac1d4e5932a98f86fec50e6495c';
