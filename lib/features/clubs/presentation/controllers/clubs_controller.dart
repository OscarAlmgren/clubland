import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/graphql_client.dart';
import '../../../../core/services/location_service.dart';
import '../../data/datasources/clubs_remote_datasource.dart';
import '../../domain/entities/simple_club.dart';

part 'clubs_controller.g.dart';

/// Provider for all clubs
@riverpod
Future<List<SimpleClub>> allClubs(Ref ref) async {
  final datasource = ref.read(clubsRemoteDataSourceProvider);
  final clubs = await datasource.getClubs();
  return clubs
      .map(
        (club) => SimpleClub(
          id: club.id,
          name: club.name,
          slug: club.slug,
          description: club.description,
          logo: club.logo,
          coverImage: club.coverImage,
        ),
      )
      .toList();
}

/// Provider for featured clubs
@riverpod
Future<List<SimpleClub>> featuredClubs(Ref ref, {int limit = 10}) async {
  final datasource = ref.read(clubsRemoteDataSourceProvider);
  final clubs = await datasource.getFeaturedClubs(limit: limit);
  return clubs
      .map(
        (club) => SimpleClub(
          id: club.id,
          name: club.name,
          slug: club.slug,
          description: club.description,
          logo: club.logo,
          coverImage: club.coverImage,
        ),
      )
      .toList();
}

/// Provider for nearby clubs
@riverpod
Future<List<SimpleClub>> nearbyClubs(
  Ref ref, {
  int limit = 20,
}) async {
  final locationService = ref.read(locationServiceProvider);
  final position = await locationService.getCurrentLocation();
  final datasource = ref.read(clubsRemoteDataSourceProvider);
  final clubs = await datasource.getNearbyClubs(
    latitude: position.latitude,
    longitude: position.longitude,
    limit: limit,
  );
  return clubs
      .map(
        (club) => SimpleClub(
          id: club.id,
          name: club.name,
          slug: club.slug,
          description: club.description,
          logo: club.logo,
          coverImage: club.coverImage,
        ),
      )
      .toList();
}

/// Provider for user favorite clubs
@riverpod
Future<List<SimpleClub>> favoriteClubs(Ref ref) async {
  final datasource = ref.read(clubsRemoteDataSourceProvider);
  final clubs = await datasource.getUserFavoriteClubs();
  return clubs
      .map(
        (club) => SimpleClub(
          id: club.id,
          name: club.name,
          slug: club.slug,
          description: club.description,
          logo: club.logo,
          coverImage: club.coverImage,
        ),
      )
      .toList();
}

/// Main clubs controller for managing club state and actions
@riverpod
class ClubsController extends _$ClubsController {
  static const int _pageSize = 20;

  List<SimpleClub> _allClubs = [];
  String? _currentCursor;
  bool _hasMoreData = true;
  bool _isLoadingMore = false;
  ClubFilter? _currentFilters;

  @override
  Future<List<SimpleClub>> build() async {
    final datasource = ref.read(clubsRemoteDataSourceProvider);
    final clubs = await datasource.getClubs();
    return _allClubs = clubs
        .map(
          (club) => SimpleClub(
            id: club.id,
            name: club.name,
            slug: club.slug,
            description: club.description,
            logo: club.logo,
            coverImage: club.coverImage,
          ),
        )
        .toList();
  }

  /// Load more clubs (pagination)
  Future<void> loadMoreClubs() async {
    if (_isLoadingMore || !_hasMoreData) return;

    _isLoadingMore = true;

    try {
      final datasource = ref.read(clubsRemoteDataSourceProvider);

      final newClubs = await datasource.getClubs(
        filter: _currentFilters,
        limit: _pageSize,
        cursor: _currentCursor,
      );

      final simpleClubs = newClubs
          .map(
            (club) => SimpleClub(
              id: club.id,
              name: club.name,
              slug: club.slug,
              description: club.description,
              logo: club.logo,
              coverImage: club.coverImage,
            ),
          )
          .toList();

      _allClubs.addAll(simpleClubs);
      _hasMoreData = newClubs.length == _pageSize;

      // Update state to trigger UI rebuild
      state = AsyncData(_allClubs);
    } on Exception {
      // Handle error
      rethrow;
    } finally {
      _isLoadingMore = false;
    }
  }

  /// Apply filters and reload clubs
  Future<void> applyFilters(ClubFilter? filters) async {
    _currentFilters = filters;
    _currentCursor = null;
    _hasMoreData = true;
    _allClubs.clear();

    state = const AsyncLoading();

    try {
      final datasource = ref.read(clubsRemoteDataSourceProvider);

      final clubs = await datasource.getClubs(
        filter: filters,
        limit: _pageSize,
      );

      _allClubs = clubs
          .map(
            (club) => SimpleClub(
              id: club.id,
              name: club.name,
              slug: club.slug,
              description: club.description,
              logo: club.logo,
              coverImage: club.coverImage,
            ),
          )
          .toList();

      _hasMoreData = clubs.length == _pageSize;
      state = AsyncData(_allClubs);
    } on Exception catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }

  /// Clear filters and reload
  Future<void> clearFilters() async {
    _currentFilters = null;
    await refresh();
  }

  /// Find nearby clubs based on current location
  Future<void> findNearbyClubs() async {
    state = const AsyncLoading();

    try {
      final locationService = ref.read(locationServiceProvider);
      final position = await locationService.getCurrentLocation();
      final datasource = ref.read(clubsRemoteDataSourceProvider);

      final clubs = await datasource.getNearbyClubs(
        latitude: position.latitude,
        longitude: position.longitude,
        radius: 25.0,
        limit: _pageSize,
      );

      _allClubs = clubs
          .map(
            (club) => SimpleClub(
              id: club.id,
              name: club.name,
              slug: club.slug,
              description: club.description,
              logo: club.logo,
              coverImage: club.coverImage,
            ),
          )
          .toList();

      _currentCursor = null;
      _hasMoreData = false; // Nearby results typically don't paginate
      state = AsyncData(_allClubs);
    } on Exception catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }

  /// Toggle favorite status for a club
  Future<void> toggleFavoriteClub(String clubId) async {
    try {
      final datasource = ref.read(clubsRemoteDataSourceProvider);

      await datasource.toggleFavoriteClub(clubId);

      // Invalidate related providers to refresh data
      ref.invalidate(favoriteClubsProvider);
    } on Exception {
      // Handle error
      rethrow;
    }
  }

  /// Refresh clubs list
  Future<void> refresh() async {
    _currentCursor = null;
    _hasMoreData = true;
    _allClubs.clear();

    ref.invalidateSelf();
  }

  /// Search for clubs
  Future<List<SimpleClub>> searchClubs(String query) async {
    try {
      final datasource = ref.read(clubsRemoteDataSourceProvider);

      final searchResults = await datasource.searchClubs(
        query: query,
        limit: 50,
      );

      return searchResults
          .map(
            (result) => SimpleClub(
              id: result.id,
              name: result.name,
              slug: result.slug,
              description: result.description ?? '',
              logo: result.logo,
              coverImage: result.coverImage,
            ),
          )
          .toList();
    } on Exception {
      return [];
    }
  }

  /// Get current filters
  ClubFilter? get currentFilters => _currentFilters;

  /// Check if currently loading more data
  bool get isLoadingMore => _isLoadingMore;

  /// Check if has more data to load
  bool get hasMoreData => _hasMoreData;

  /// Get total clubs count
  int get totalClubs => _allClubs.length;
}

/// Location permission provider
@riverpod
Future<bool> locationPermission(Ref ref) async {
  final locationService = ref.read(locationServiceProvider);
  try {
    await locationService.getCurrentLocation();
    return true;
  } catch (e) {
    return false;
  }
}

/// Provider for the remote datasource
final clubsRemoteDataSourceProvider = Provider<ClubsRemoteDataSource>(
  (ref) => ClubsRemoteDataSourceImpl(
    client: GraphQLClientConfig.client,
  ),
);
