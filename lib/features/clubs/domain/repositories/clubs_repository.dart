import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/club_entity.dart';
import '../entities/club_search_result_entity.dart';

/// Repository interface for club-related operations
///
/// This repository follows Clean Architecture principles and provides
/// an abstraction layer between the domain and data layers.
///
/// All methods return [Either<Failure, T>] to handle errors gracefully
/// without throwing exceptions.
abstract class ClubsRepository {
  /// Get a paginated list of clubs
  ///
  /// Parameters:
  /// - [filter]: Optional filter criteria for clubs
  /// - [sort]: Optional sorting configuration
  /// - [limit]: Maximum number of clubs to return
  /// - [cursor]: Pagination cursor for fetching next page
  ///
  /// Returns:
  /// - [Right<List<ClubEntity>>]: List of clubs on success
  /// - [Left<Failure>]: Failure object on error
  Future<Either<Failure, List<ClubEntity>>> getClubs({
    ClubFilterCriteria? filter,
    ClubSortCriteria? sort,
    int? limit,
    String? cursor,
  });

  /// Get a single club by ID
  ///
  /// Parameters:
  /// - [clubId]: Unique identifier of the club
  ///
  /// Returns:
  /// - [Right<ClubEntity>]: Club entity on success
  /// - [Left<Failure>]: Failure object if club not found or error occurs
  Future<Either<Failure, ClubEntity>> getClubById(String clubId);

  /// Search for clubs based on query and filters
  ///
  /// Parameters:
  /// - [query]: Search query string
  /// - [latitude]: Optional latitude for location-based search
  /// - [longitude]: Optional longitude for location-based search
  /// - [radius]: Optional search radius in kilometers
  /// - [amenities]: Optional list of required amenities
  /// - [limit]: Maximum number of results
  /// - [cursor]: Pagination cursor
  ///
  /// Returns:
  /// - [Right<List<ClubSearchResultEntity>>]: Search results on success
  /// - [Left<Failure>]: Failure object on error
  Future<Either<Failure, List<ClubSearchResultEntity>>> searchClubs({
    required String query,
    double? latitude,
    double? longitude,
    double? radius,
    List<String>? amenities,
    int? limit,
    String? cursor,
  });

  /// Get clubs near a specific location
  ///
  /// Parameters:
  /// - [latitude]: Latitude of the location
  /// - [longitude]: Longitude of the location
  /// - [radius]: Search radius in kilometers (default: 25km)
  /// - [limit]: Maximum number of results
  ///
  /// Returns:
  /// - [Right<List<ClubEntity>>]: Nearby clubs on success
  /// - [Left<Failure>]: Failure object on error
  Future<Either<Failure, List<ClubEntity>>> getNearbyClubs({
    required double latitude,
    required double longitude,
    double? radius,
    int? limit,
  });

  /// Get featured clubs (curated selection)
  ///
  /// Parameters:
  /// - [limit]: Maximum number of featured clubs to return
  ///
  /// Returns:
  /// - [Right<List<ClubEntity>>]: Featured clubs on success
  /// - [Left<Failure>]: Failure object on error
  Future<Either<Failure, List<ClubEntity>>> getFeaturedClubs({
    int? limit,
  });

  /// Get user's favorite clubs
  ///
  /// Returns:
  /// - [Right<List<ClubEntity>>]: User's favorite clubs on success
  /// - [Left<Failure>]: Failure object on error
  Future<Either<Failure, List<ClubEntity>>> getFavoriteClubs();

  /// Toggle favorite status for a club
  ///
  /// Parameters:
  /// - [clubId]: Unique identifier of the club
  ///
  /// Returns:
  /// - [Right<ClubEntity>]: Updated club entity on success
  /// - [Left<Failure>]: Failure object on error
  Future<Either<Failure, ClubEntity>> toggleFavoriteClub(String clubId);

  /// Check in to a club
  ///
  /// Parameters:
  /// - [clubId]: Unique identifier of the club
  ///
  /// Returns:
  /// - [Right<void>]: Success
  /// - [Left<Failure>]: Failure object on error
  Future<Either<Failure, void>> checkInToClub(String clubId);

  /// Get reviews for a specific club
  ///
  /// Parameters:
  /// - [clubId]: Unique identifier of the club
  /// - [limit]: Maximum number of reviews to return
  /// - [cursor]: Pagination cursor
  ///
  /// Returns:
  /// - [Right<List<ClubReview>>]: List of reviews on success
  /// - [Left<Failure>]: Failure object on error
  Future<Either<Failure, List<ClubReview>>> getClubReviews(
    String clubId, {
    int? limit,
    String? cursor,
  });
}

/// Filter criteria for clubs query
class ClubFilterCriteria {
  const ClubFilterCriteria({
    this.city,
    this.state,
    this.amenities,
    this.featured,
    this.favorited,
    this.latitude,
    this.longitude,
    this.radius,
    this.minRating,
    this.isPublic,
  });

  final String? city;
  final String? state;
  final List<String>? amenities;
  final bool? featured;
  final bool? favorited;
  final double? latitude;
  final double? longitude;
  final double? radius;
  final double? minRating;
  final bool? isPublic;

  Map<String, dynamic> toJson() => {
        if (city != null) 'city': city,
        if (state != null) 'state': state,
        if (amenities != null) 'amenities': amenities,
        if (featured != null) 'featured': featured,
        if (favorited != null) 'favorited': favorited,
        if (latitude != null && longitude != null)
          'location': {
            'latitude': latitude,
            'longitude': longitude,
          },
        if (radius != null) 'radius': radius,
        if (minRating != null) 'minRating': minRating,
        if (isPublic != null) 'isPublic': isPublic,
      };
}

/// Sort criteria for clubs query
enum ClubSortField { name, rating, distance, memberCount, createdAt }

enum SortDirection { asc, desc }

class ClubSortCriteria {
  const ClubSortCriteria({
    required this.field,
    this.direction = SortDirection.asc,
  });

  final ClubSortField field;
  final SortDirection direction;

  Map<String, dynamic> toJson() => {
        'field': field.name.toUpperCase(),
        'direction': direction.name.toUpperCase(),
      };
}

/// Club review entity
class ClubReview {
  const ClubReview({
    required this.id,
    required this.rating,
    required this.comment,
    required this.author,
    required this.createdAt,
  });

  final String id;
  final double rating;
  final String comment;
  final String author;
  final DateTime createdAt;
}
