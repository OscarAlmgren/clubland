// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clubs_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for the clubs repository

@ProviderFor(clubsRepository)
const clubsRepositoryProvider = ClubsRepositoryProvider._();

/// Provider for the clubs repository

final class ClubsRepositoryProvider
    extends
        $FunctionalProvider<ClubsRepository, ClubsRepository, ClubsRepository>
    with $Provider<ClubsRepository> {
  /// Provider for the clubs repository
  const ClubsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'clubsRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$clubsRepositoryHash();

  @$internal
  @override
  $ProviderElement<ClubsRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ClubsRepository create(Ref ref) {
    return clubsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ClubsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ClubsRepository>(value),
    );
  }
}

String _$clubsRepositoryHash() => r'3f9e714d0f585b42501c7f7fbaa982c83e3f90ad';

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

String _$allClubsHash() => r'f40db27feab91cca58a8499560568b0b47a2c67d';

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

String _$featuredClubsHash() => r'f14d69116e594e73a59ded175e7073264912d0d7';

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

String _$nearbyClubsHash() => r'e946906c8cd82d84c4c42073eacc20010e7d4f24';

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

String _$favoriteClubsHash() => r'd2da3c2bd562ac93aa20d251c3acd0c2d4877737';

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

String _$clubsControllerHash() => r'3f10db887d0b1be1829bfefe11bd110dd27d641a';

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
