// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clubs_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$featuredClubsHash() => r'eaccd970b4d03f67ad14449c9d49e7ed5eead2ea';

/// Featured clubs provider
///
/// Copied from [featuredClubs].
@ProviderFor(featuredClubs)
final featuredClubsProvider =
    AutoDisposeFutureProvider<List<ClubEntity>>.internal(
  featuredClubs,
  name: r'featuredClubsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$featuredClubsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FeaturedClubsRef = AutoDisposeFutureProviderRef<List<ClubEntity>>;
String _$nearbyClubsHash() => r'ec36b78e6a9e418e7ef6d7dee00f6f8c7f78b66d';

/// Nearby clubs provider
///
/// Copied from [nearbyClubs].
@ProviderFor(nearbyClubs)
final nearbyClubsProvider =
    AutoDisposeFutureProvider<List<ClubEntity>>.internal(
  nearbyClubs,
  name: r'nearbyClubsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$nearbyClubsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NearbyClubsRef = AutoDisposeFutureProviderRef<List<ClubEntity>>;
String _$favoriteClubsHash() => r'58d7f851ad16de36b8337fd90caf28b3222f7c7f';

/// Favorite clubs provider
///
/// Copied from [favoriteClubs].
@ProviderFor(favoriteClubs)
final favoriteClubsProvider =
    AutoDisposeFutureProvider<List<ClubEntity>>.internal(
  favoriteClubs,
  name: r'favoriteClubsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$favoriteClubsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FavoriteClubsRef = AutoDisposeFutureProviderRef<List<ClubEntity>>;
String _$locationPermissionHash() =>
    r'3f3e2830c8ec8fd6da04964655209594a8fbc7e9';

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
String _$clubsControllerHash() => r'51b3e120f3b172783952cd20cc56072c77488a89';

/// See also [ClubsController].
@ProviderFor(ClubsController)
final clubsControllerProvider = AutoDisposeAsyncNotifierProvider<
    ClubsController, List<ClubEntity>>.internal(
  ClubsController.new,
  name: r'clubsControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$clubsControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ClubsController = AutoDisposeAsyncNotifier<List<ClubEntity>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
