// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clubs_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$allClubsHash() => r'87ec568600bda400c4ba1da38f68789e1c207100';

/// Provider for all clubs
///
/// Copied from [allClubs].
@ProviderFor(allClubs)
final allClubsProvider = AutoDisposeFutureProvider<List<SimpleClub>>.internal(
  allClubs,
  name: r'allClubsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$allClubsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AllClubsRef = AutoDisposeFutureProviderRef<List<SimpleClub>>;
String _$featuredClubsHash() => r'45710ccc742906c7583f9057090ede4652980b88';

/// Provider for featured clubs
///
/// Copied from [featuredClubs].
@ProviderFor(featuredClubs)
final featuredClubsProvider =
    AutoDisposeFutureProvider<List<SimpleClub>>.internal(
  featuredClubs,
  name: r'featuredClubsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$featuredClubsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FeaturedClubsRef = AutoDisposeFutureProviderRef<List<SimpleClub>>;
String _$nearbyClubsHash() => r'1059c3fb9c0f1fdb4c6a25a3a4dc0e596bb532c2';

/// Provider for nearby clubs
///
/// Copied from [nearbyClubs].
@ProviderFor(nearbyClubs)
final nearbyClubsProvider =
    AutoDisposeFutureProvider<List<SimpleClub>>.internal(
  nearbyClubs,
  name: r'nearbyClubsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$nearbyClubsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NearbyClubsRef = AutoDisposeFutureProviderRef<List<SimpleClub>>;
String _$favoriteClubsHash() => r'f98e722f2b97b16da3e673870ac131f460303901';

/// Provider for user favorite clubs
///
/// Copied from [favoriteClubs].
@ProviderFor(favoriteClubs)
final favoriteClubsProvider =
    AutoDisposeFutureProvider<List<SimpleClub>>.internal(
  favoriteClubs,
  name: r'favoriteClubsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$favoriteClubsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FavoriteClubsRef = AutoDisposeFutureProviderRef<List<SimpleClub>>;
String _$locationPermissionHash() =>
    r'b66a9085abf655fe3228256060223e9728a4d9e2';

/// Location permission provider
///
/// Copied from [locationPermission].
@ProviderFor(locationPermission)
final locationPermissionProvider = AutoDisposeFutureProvider<bool>.internal(
  locationPermission,
  name: r'locationPermissionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$locationPermissionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LocationPermissionRef = AutoDisposeFutureProviderRef<bool>;
String _$clubsControllerHash() => r'9f154e2c29259327821f87e18b20cecaa45b0874';

/// Main clubs controller for managing club state and actions
///
/// Copied from [ClubsController].
@ProviderFor(ClubsController)
final clubsControllerProvider = AutoDisposeAsyncNotifierProvider<
    ClubsController, List<SimpleClub>>.internal(
  ClubsController.new,
  name: r'clubsControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$clubsControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ClubsController = AutoDisposeAsyncNotifier<List<SimpleClub>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
