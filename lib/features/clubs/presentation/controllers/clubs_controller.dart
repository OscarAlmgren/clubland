import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/errors/error_handler.dart';
import '../../../../core/services/location_service.dart';
import '../../domain/entities/club_entity.dart';
import '../../domain/usecases/get_clubs_usecase.dart';
import '../../domain/usecases/get_nearby_clubs_usecase.dart';
import '../../domain/usecases/get_featured_clubs_usecase.dart';
import '../../domain/usecases/search_clubs_usecase.dart';
import '../../domain/usecases/toggle_favorite_club_usecase.dart';
import '../providers/clubs_providers.dart';

part 'clubs_controller.g.dart';

@riverpod
class ClubsController extends _$ClubsController {
  static const int _pageSize = 20;

  List<ClubEntity> _allClubs = [];
  String? _currentCursor;
  bool _hasMoreData = true;
  bool _isLoadingMore = false;
  ClubFilters? _currentFilters;

  @override
  Future<List<ClubEntity>> build() async {
    // Initialize with featured and popular clubs
    await _loadInitialClubs();
    return _allClubs;
  }

  /// Load initial set of clubs (featured + popular)
  Future<void> _loadInitialClubs() async {
    try {
      final getClubsUsecase = ref.read(getClubsUsecaseProvider);

      // Get a mix of featured and popular clubs for initial load
      final result = await getClubsUsecase(
        filters: const ClubFilters(featured: true),
        limit: _pageSize ~/ 2,
      );

      result.fold(
        (failure) {
          ErrorHandler.logWarning('Failed to load initial clubs: ${failure.message}');
          // Try to load without featured filter as fallback
          _loadRegularClubs();
        },
        (clubsResponse) {
          _allClubs = clubsResponse.clubs;
          _currentCursor = clubsResponse.nextCursor;
          _hasMoreData = clubsResponse.hasMore;

          // Load additional popular clubs to fill the initial page
          if (_allClubs.length < _pageSize) {
            _loadMoreRegularClubs();
          }
        },
      );
    } on Exception catch (e) {
      ErrorHandler.logError('Error loading initial clubs', error: e);
      rethrow;
    }
  }

  /// Load regular (non-featured) clubs
  Future<void> _loadRegularClubs() async {
    try {
      final getClubsUsecase = ref.read(getClubsUsecaseProvider);

      final result = await getClubsUsecase(
        filters: _currentFilters,
        limit: _pageSize,
      );

      result.fold(
        (failure) => throw Exception(failure.message),
        (clubsResponse) {
          _allClubs = clubsResponse.clubs;
          _currentCursor = clubsResponse.nextCursor;
          _hasMoreData = clubsResponse.hasMore;
        },
      );
    } on Exception catch (e) {
      ErrorHandler.logError('Error loading clubs', error: e);
      rethrow;
    }
  }

  /// Load more regular clubs to complement featured ones
  Future<void> _loadMoreRegularClubs() async {
    try {
      final getClubsUsecase = ref.read(getClubsUsecaseProvider);

      final result = await getClubsUsecase(
        filters: _currentFilters,
        limit: _pageSize - _allClubs.length,
        cursor: _currentCursor,
      );

      result.fold(
        (failure) => ErrorHandler.logWarning('Failed to load more clubs: ${failure.message}'),
        (clubsResponse) {
          _allClubs.addAll(clubsResponse.clubs);
          _currentCursor = clubsResponse.nextCursor;
          _hasMoreData = clubsResponse.hasMore;
        },
      );
    } on Exception catch (e) {
      ErrorHandler.logError('Error loading more clubs', error: e);
    }
  }

  /// Load more clubs (pagination)
  Future<void> loadMoreClubs() async {
    if (_isLoadingMore || !_hasMoreData) return;

    _isLoadingMore = true;

    try {
      final getClubsUsecase = ref.read(getClubsUsecaseProvider);

      final result = await getClubsUsecase(
        filters: _currentFilters,
        limit: _pageSize,
        cursor: _currentCursor,
      );

      result.fold(
        (failure) {
          ErrorHandler.showErrorToUser(failure);
        },
        (clubsResponse) {
          _allClubs.addAll(clubsResponse.clubs);
          _currentCursor = clubsResponse.nextCursor;
          _hasMoreData = clubsResponse.hasMore;

          // Update state to trigger UI rebuild
          state = AsyncData(_allClubs);
        },
      );
    } on Exception catch (e) {
      final failure = ErrorHandler.handleException(e);
      ErrorHandler.showErrorToUser(failure);
    } finally {
      _isLoadingMore = false;
    }
  }

  /// Apply filters and reload clubs
  Future<void> applyFilters(ClubFilters filters) async {
    _currentFilters = filters;
    _currentCursor = null;
    _hasMoreData = true;
    _allClubs.clear();

    state = const AsyncLoading();

    try {
      final getClubsUsecase = ref.read(getClubsUsecaseProvider);

      final result = await getClubsUsecase(
        filters: filters,
        limit: _pageSize,
      );

      result.fold(
        (failure) {
          state = AsyncError(failure, StackTrace.current);
          ErrorHandler.showErrorToUser(failure);
        },
        (clubsResponse) {
          _allClubs = clubsResponse.clubs;
          _currentCursor = clubsResponse.nextCursor;
          _hasMoreData = clubsResponse.hasMore;
          state = AsyncData(_allClubs);
        },
      );
    } on Exception catch (e) {
      state = AsyncError(e, StackTrace.current);
      final failure = ErrorHandler.handleException(e);
      ErrorHandler.showErrorToUser(failure);
    }
  }

  /// Clear filters and reload
  Future<void> clearFilters() async {
    _currentFilters = null;
    await refresh();
  }

  /// Find nearby clubs based on current location
  Future<void> findNearbyClubs() async {
    try {
      final locationService = ref.read(locationServiceProvider);
      final currentLocation = await locationService.getCurrentLocation();

      if (currentLocation == null) {
        ErrorHandler.showErrorMessage('Unable to get your current location');
        return;
      }

      final getNearbyClubsUsecase = ref.read(getNearbyClubsUsecaseProvider);

      state = const AsyncLoading();

      final result = await getNearbyClubsUsecase(
        latitude: currentLocation.latitude,
        longitude: currentLocation.longitude,
        radius: 25.0, // 25km radius
        limit: _pageSize,
      );

      result.fold(
        (failure) {
          state = AsyncError(failure, StackTrace.current);
          ErrorHandler.showErrorToUser(failure);
        },
        (clubs) {
          _allClubs = clubs;
          _currentCursor = null;
          _hasMoreData = false; // Nearby results typically don't paginate
          state = AsyncData(_allClubs);
        },
      );
    } on Exception catch (e) {
      state = AsyncError(e, StackTrace.current);
      final failure = ErrorHandler.handleException(e);
      ErrorHandler.showErrorToUser(failure);
    }
  }

  /// Toggle favorite status for a club
  Future<void> toggleFavoriteClub(String clubId) async {
    try {
      final toggleFavoriteUsecase = ref.read(toggleFavoriteClubUsecaseProvider);

      final result = await toggleFavoriteUsecase(clubId: clubId);

      result.fold(
        (failure) => ErrorHandler.showErrorToUser(failure),
        (updatedClub) {
          // Update the club in the current list
          final index = _allClubs.indexWhere((club) => club.id == clubId);
          if (index != -1) {
            _allClubs[index] = updatedClub;
            state = AsyncData(_allClubs);
          }

          // Invalidate related providers
          ref.invalidate(favoriteClubsProvider);

          final isFavorited = updatedClub.userRelation?.favorited ?? false;
          ErrorHandler.showSuccessMessage(
            isFavorited ? 'Added to favorites' : 'Removed from favorites',
          );
        },
      );
    } on Exception catch (e) {
      final failure = ErrorHandler.handleException(e);
      ErrorHandler.showErrorToUser(failure);
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
  Future<List<ClubEntity>> searchClubs(String query) async {
    try {
      final searchClubsUsecase = ref.read(searchClubsUsecaseProvider);

      final result = await searchClubsUsecase(
        query: query,
        limit: 50, // Higher limit for search results
      );

      return result.fold(
        (failure) {
          ErrorHandler.showErrorToUser(failure);
          return [];
        },
        (searchResults) => searchResults.map((result) => ClubEntity(
          id: result.id,
          name: result.name,
          slug: result.slug,
          description: result.description ?? '',
          address: result.address,
          logo: result.logo,
          coverImage: result.coverImage,
          amenities: result.amenities,
          stats: result.stats,
          userRelation: result.userRelation,
        )).toList(),
      );
    } on Exception catch (e) {
      final failure = ErrorHandler.handleException(e);
      ErrorHandler.showErrorToUser(failure);
      return [];
    }
  }

  /// Get current filters
  ClubFilters? get currentFilters => _currentFilters;

  /// Check if currently loading more data
  bool get isLoadingMore => _isLoadingMore;

  /// Check if has more data to load
  bool get hasMoreData => _hasMoreData;

  /// Get total clubs count
  int get totalClubs => _allClubs.length;
}

/// Featured clubs provider
@riverpod
Future<List<ClubEntity>> featuredClubs(FeaturedClubsRef ref) async {
  final getFeaturedClubsUsecase = ref.read(getFeaturedClubsUsecaseProvider);

  final result = await getFeaturedClubsUsecase();

  return result.fold(
    (failure) {
      ErrorHandler.logWarning('Failed to load featured clubs: ${failure.message}');
      return [];
    },
    (clubs) => clubs,
  );
}

/// Nearby clubs provider
@riverpod
Future<List<ClubEntity>> nearbyClubs(NearbyClubsRef ref) async {
  final locationService = ref.read(locationServiceProvider);
  final currentLocation = await locationService.getCurrentLocation();

  if (currentLocation == null) {
    return [];
  }

  final getNearbyClubsUsecase = ref.read(getNearbyClubsUsecaseProvider);

  final result = await getNearbyClubsUsecase(
    latitude: currentLocation.latitude,
    longitude: currentLocation.longitude,
    radius: 15.0, // 15km radius
    limit: 20,
  );

  return result.fold(
    (failure) {
      ErrorHandler.logWarning('Failed to load nearby clubs: ${failure.message}');
      return [];
    },
    (clubs) => clubs,
  );
}

/// Favorite clubs provider
@riverpod
Future<List<ClubEntity>> favoriteClubs(FavoriteClubsRef ref) async {
  final getClubsUsecase = ref.read(getClubsUsecaseProvider);

  final result = await getClubsUsecase(
    filters: const ClubFilters(favorited: true),
    limit: 100, // Load all favorites
  );

  return result.fold(
    (failure) {
      ErrorHandler.logWarning('Failed to load favorite clubs: ${failure.message}');
      return [];
    },
    (clubsResponse) => clubsResponse.clubs,
  );
}

/// Location permission provider
@riverpod
Future<bool> locationPermission(LocationPermissionRef ref) async {
  final locationService = ref.read(locationServiceProvider);
  return locationService.hasLocationPermission();
}

// Supporting classes
class ClubFilters {
  final String? city;
  final String? state;
  final List<String>? amenities;
  final bool? featured;
  final bool? favorited;
  final double? minRating;
  final bool? isPublic;
  final double? maxDistance;
  final double? latitude;
  final double? longitude;

  const ClubFilters({
    this.city,
    this.state,
    this.amenities,
    this.featured,
    this.favorited,
    this.minRating,
    this.isPublic,
    this.maxDistance,
    this.latitude,
    this.longitude,
  });

  ClubFilters copyWith({
    String? city,
    String? state,
    List<String>? amenities,
    bool? featured,
    bool? favorited,
    double? minRating,
    bool? isPublic,
    double? maxDistance,
    double? latitude,
    double? longitude,
  }) {
    return ClubFilters(
      city: city ?? this.city,
      state: state ?? this.state,
      amenities: amenities ?? this.amenities,
      featured: featured ?? this.featured,
      favorited: favorited ?? this.favorited,
      minRating: minRating ?? this.minRating,
      isPublic: isPublic ?? this.isPublic,
      maxDistance: maxDistance ?? this.maxDistance,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  bool get isEmpty =>
      city == null &&
      state == null &&
      (amenities?.isEmpty ?? true) &&
      featured == null &&
      favorited == null &&
      minRating == null &&
      isPublic == null &&
      maxDistance == null;

  @override
  String toString() => 'ClubFilters('
      'city: $city, '
      'state: $state, '
      'amenities: $amenities, '
      'featured: $featured, '
      'favorited: $favorited, '
      'minRating: $minRating, '
      'isPublic: $isPublic, '
      'maxDistance: $maxDistance'
      ')';
}

class ClubsResponse {
  final List<ClubEntity> clubs;
  final String? nextCursor;
  final bool hasMore;
  final int totalCount;

  const ClubsResponse({
    required this.clubs,
    this.nextCursor,
    required this.hasMore,
    required this.totalCount,
  });
}