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
const featuredClubsProvider = FeaturedClubsFamily._();

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
  const FeaturedClubsProvider._({
    required FeaturedClubsFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'featuredClubsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$featuredClubsHash();

  @override
  String toString() {
    return r'featuredClubsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<SimpleClub>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<SimpleClub>> create(Ref ref) {
    final argument = this.argument as int;
    return featuredClubs(ref, limit: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is FeaturedClubsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$featuredClubsHash() => r'1bd971ba016d00bcba7d91c9f6e08236f0ca9579';

/// Provider for featured clubs

final class FeaturedClubsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<SimpleClub>>, int> {
  const FeaturedClubsFamily._()
    : super(
        retry: null,
        name: r'featuredClubsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provider for featured clubs

  FeaturedClubsProvider call({int limit = 10}) =>
      FeaturedClubsProvider._(argument: limit, from: this);

  @override
  String toString() => r'featuredClubsProvider';
}

/// Provider for nearby clubs

@ProviderFor(nearbyClubs)
const nearbyClubsProvider = NearbyClubsFamily._();

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
  const NearbyClubsProvider._({
    required NearbyClubsFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'nearbyClubsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$nearbyClubsHash();

  @override
  String toString() {
    return r'nearbyClubsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<SimpleClub>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<SimpleClub>> create(Ref ref) {
    final argument = this.argument as int;
    return nearbyClubs(ref, limit: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is NearbyClubsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$nearbyClubsHash() => r'b647d7a426186173a6f5fe746e6e258109775bdc';

/// Provider for nearby clubs

final class NearbyClubsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<SimpleClub>>, int> {
  const NearbyClubsFamily._()
    : super(
        retry: null,
        name: r'nearbyClubsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provider for nearby clubs

  NearbyClubsProvider call({int limit = 20}) =>
      NearbyClubsProvider._(argument: limit, from: this);

  @override
  String toString() => r'nearbyClubsProvider';
}

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

String _$clubsControllerHash() => r'3332f036c39078fc0ebe54171faf9e1655f6b98f';

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
    r'2f478b7867836c6628beb7e665e00074cf5a7652';
