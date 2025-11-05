import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/graphql_client.dart';
import '../../../../core/services/location_service.dart';
import '../../data/datasources/clubs_remote_datasource.dart';
import '../../data/repositories/clubs_repository_impl.dart';
import '../../domain/entities/simple_club.dart';
import '../../domain/repositories/clubs_repository.dart';

part 'clubs_controller.g.dart';

/// Provider for the clubs repository
@riverpod
ClubsRepository clubsRepository(Ref ref) {
  final datasource = ref.read(clubsRemoteDataSourceProvider);
  return ClubsRepositoryImpl(remoteDataSource: datasource);
}

/// Provider for all clubs
@riverpod
Future<List<SimpleClub>> allClubs(Ref ref) async {
  final repository = ref.read(clubsRepositoryProvider);
  final result = await repository.getClubs();

  return result.fold(
    (failure) => throw Exception(failure.message),
    (clubs) => clubs
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
        .toList(),
  );
}

/// Provider for featured clubs
@riverpod
Future<List<SimpleClub>> featuredClubs(Ref ref, {int limit = 10}) async {
  final repository = ref.read(clubsRepositoryProvider);
  final result = await repository.getFeaturedClubs(limit: limit);

  return result.fold(
    (failure) => throw Exception(failure.message),
    (clubs) => clubs
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
        .toList(),
  );
}

/// Provider for nearby clubs
@riverpod
Future<List<SimpleClub>> nearbyClubs(
  Ref ref, {
  int limit = 20,
}) async {
  final locationService = ref.read(locationServiceProvider);
  final position = await locationService.getCurrentLocation();
  final repository = ref.read(clubsRepositoryProvider);

  final result = await repository.getNearbyClubs(
    latitude: position.latitude,
    longitude: position.longitude,
    limit: limit,
  );

  return result.fold(
    (failure) => throw Exception(failure.message),
    (clubs) => clubs
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
        .toList(),
  );
}

/// Provider for user favorite clubs
@riverpod
Future<List<SimpleClub>> favoriteClubs(Ref ref) async {
  final repository = ref.read(clubsRepositoryProvider);
  final result = await repository.getFavoriteClubs();

  return result.fold(
    (failure) => throw Exception(failure.message),
    (clubs) => clubs
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
        .toList(),
  );
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
    final repository = ref.read(clubsRepositoryProvider);
    final result = await repository.getClubs();

    return result.fold(
      (failure) => throw Exception(failure.message),
      (clubs) {
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
        return _allClubs;
      },
    );
  }

  /// Load more clubs (pagination)
  Future<void> loadMoreClubs() async {
    if (_isLoadingMore || !_hasMoreData) return;

    _isLoadingMore = true;

    try {
      final repository = ref.read(clubsRepositoryProvider);

      // Convert ClubFilter to ClubFilterCriteria
      final filterCriteria = _currentFilters != null
          ? ClubFilterCriteria(
              city: _currentFilters!.city,
              state: _currentFilters!.state,
              amenities: _currentFilters!.amenities,
              featured: _currentFilters!.featured,
              favorited: _currentFilters!.favorited,
              latitude: _currentFilters!.location?.latitude,
              longitude: _currentFilters!.location?.longitude,
              radius: _currentFilters!.radius,
              minRating: _currentFilters!.minRating,
              isPublic: _currentFilters!.isPublic,
            )
          : null;

      final result = await repository.getClubs(
        filter: filterCriteria,
        limit: _pageSize,
        cursor: _currentCursor,
      );

      result.fold(
        (failure) => throw Exception(failure.message),
        (clubs) {
          final simpleClubs = clubs
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
          _hasMoreData = clubs.length == _pageSize;

          // Update state to trigger UI rebuild
          state = AsyncData(_allClubs);
        },
      );
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
      final repository = ref.read(clubsRepositoryProvider);

      // Convert ClubFilter to ClubFilterCriteria
      final filterCriteria = filters != null
          ? ClubFilterCriteria(
              city: filters.city,
              state: filters.state,
              amenities: filters.amenities,
              featured: filters.featured,
              favorited: filters.favorited,
              latitude: filters.location?.latitude,
              longitude: filters.location?.longitude,
              radius: filters.radius,
              minRating: filters.minRating,
              isPublic: filters.isPublic,
            )
          : null;

      final result = await repository.getClubs(
        filter: filterCriteria,
        limit: _pageSize,
      );

      result.fold(
        (failure) => state = AsyncError(Exception(failure.message), StackTrace.current),
        (clubs) {
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
        },
      );
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
      final repository = ref.read(clubsRepositoryProvider);

      final result = await repository.getNearbyClubs(
        latitude: position.latitude,
        longitude: position.longitude,
        radius: 25.0,
        limit: _pageSize,
      );

      result.fold(
        (failure) => state = AsyncError(Exception(failure.message), StackTrace.current),
        (clubs) {
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
        },
      );
    } on Exception catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }

  /// Toggle favorite status for a club
  Future<void> toggleFavoriteClub(String clubId) async {
    try {
      final repository = ref.read(clubsRepositoryProvider);

      final result = await repository.toggleFavoriteClub(clubId);

      result.fold(
        (failure) => throw Exception(failure.message),
        (_) {
          // Invalidate related providers to refresh data
          ref.invalidate(favoriteClubsProvider);
        },
      );
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
      final repository = ref.read(clubsRepositoryProvider);

      final result = await repository.searchClubs(
        query: query,
        limit: 50,
      );

      return result.fold(
        (failure) => [],
        (searchResults) => searchResults
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
            .toList(),
      );
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
