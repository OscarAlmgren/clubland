// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clubs_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for all clubs

@ProviderFor(allClubs)
const allClubsProvider = AllClubsProvider._();

/// Provider for all clubs

final class AllClubsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<SimpleClub>>,
          List<SimpleClub>,
          FutureOr<List<SimpleClub>>
        >
    with $FutureModifier<List<SimpleClub>>, $FutureProvider<List<SimpleClub>> {
  /// Provider for all clubs
  const AllClubsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allClubsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allClubsHash();

  @$internal
  @override
  $FutureProviderElement<List<SimpleClub>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<SimpleClub>> create(Ref ref) {
    return allClubs(ref);
  }
}

String _$allClubsHash() => r'87ec568600bda400c4ba1da38f68789e1c207100';

/// Provider for featured clubs

@ProviderFor(featuredClubs)
const featuredClubsProvider = FeaturedClubsProvider._();

/// Provider for featured clubs

final class FeaturedClubsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<SimpleClub>>,
          List<SimpleClub>,
          FutureOr<List<SimpleClub>>
        >
    with $FutureModifier<List<SimpleClub>>, $FutureProvider<List<SimpleClub>> {
  /// Provider for featured clubs
  const FeaturedClubsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'featuredClubsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$featuredClubsHash();

  @$internal
  @override
  $FutureProviderElement<List<SimpleClub>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<SimpleClub>> create(Ref ref) {
    return featuredClubs(ref);
  }
}

String _$featuredClubsHash() => r'45710ccc742906c7583f9057090ede4652980b88';

/// Provider for nearby clubs

@ProviderFor(nearbyClubs)
const nearbyClubsProvider = NearbyClubsProvider._();

/// Provider for nearby clubs

final class NearbyClubsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<SimpleClub>>,
          List<SimpleClub>,
          FutureOr<List<SimpleClub>>
        >
    with $FutureModifier<List<SimpleClub>>, $FutureProvider<List<SimpleClub>> {
  /// Provider for nearby clubs
  const NearbyClubsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'nearbyClubsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$nearbyClubsHash();

  @$internal
  @override
  $FutureProviderElement<List<SimpleClub>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<SimpleClub>> create(Ref ref) {
    return nearbyClubs(ref);
  }
}

String _$nearbyClubsHash() => r'1059c3fb9c0f1fdb4c6a25a3a4dc0e596bb532c2';

/// Provider for user favorite clubs

@ProviderFor(favoriteClubs)
const favoriteClubsProvider = FavoriteClubsProvider._();

/// Provider for user favorite clubs

final class FavoriteClubsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<SimpleClub>>,
          List<SimpleClub>,
          FutureOr<List<SimpleClub>>
        >
    with $FutureModifier<List<SimpleClub>>, $FutureProvider<List<SimpleClub>> {
  /// Provider for user favorite clubs
  const FavoriteClubsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoriteClubsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoriteClubsHash();

  @$internal
  @override
  $FutureProviderElement<List<SimpleClub>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<SimpleClub>> create(Ref ref) {
    return favoriteClubs(ref);
  }
}

String _$favoriteClubsHash() => r'f98e722f2b97b16da3e673870ac131f460303901';

/// Main clubs controller for managing club state and actions

@ProviderFor(ClubsController)
const clubsControllerProvider = ClubsControllerProvider._();

/// Main clubs controller for managing club state and actions
final class ClubsControllerProvider
    extends $AsyncNotifierProvider<ClubsController, List<SimpleClub>> {
  /// Main clubs controller for managing club state and actions
  const ClubsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'clubsControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$clubsControllerHash();

  @$internal
  @override
  ClubsController create() => ClubsController();
}

String _$clubsControllerHash() => r'595ab9b6c3c5c1690b2ed85cc6dfaf8d297a8ddf';

/// Main clubs controller for managing club state and actions

abstract class _$ClubsController extends $AsyncNotifier<List<SimpleClub>> {
  FutureOr<List<SimpleClub>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<SimpleClub>>, List<SimpleClub>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<SimpleClub>>, List<SimpleClub>>,
              AsyncValue<List<SimpleClub>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Location permission provider

@ProviderFor(locationPermission)
const locationPermissionProvider = LocationPermissionProvider._();

/// Location permission provider

final class LocationPermissionProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  /// Location permission provider
  const LocationPermissionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'locationPermissionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$locationPermissionHash();

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    return locationPermission(ref);
  }
}

String _$locationPermissionHash() =>
    r'b66a9085abf655fe3228256060223e9728a4d9e2';
