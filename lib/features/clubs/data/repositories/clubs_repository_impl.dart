import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/club_entity.dart';
import '../../domain/entities/club_search_result_entity.dart';
import '../../domain/repositories/clubs_repository.dart' as domain;
import '../datasources/clubs_remote_datasource.dart' as datasource;
import '../models/club_model.dart';

/// Implementation of [domain.ClubsRepository]
///
/// This class implements the repository interface and handles the conversion
/// between data models and domain entities. It also handles error mapping
/// from exceptions to failures.
class ClubsRepositoryImpl implements domain.ClubsRepository {
  const ClubsRepositoryImpl({required datasource.ClubsRemoteDataSource remoteDataSource})
    : _remoteDataSource = remoteDataSource;

  final datasource.ClubsRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, List<ClubEntity>>> getClubs({
    domain.ClubFilterCriteria? filter,
    domain.ClubSortCriteria? sort,
    int? limit,
    String? cursor,
  }) async {
    try {
      // Convert domain filter to data layer filter
      final dataFilter = filter != null
          ? datasource.ClubFilter(
              city: filter.city,
              state: filter.state,
              amenities: filter.amenities,
              featured: filter.featured,
              favorited: filter.favorited,
              location: filter.latitude != null && filter.longitude != null
                  ? datasource.LocationInput(
                      latitude: filter.latitude!,
                      longitude: filter.longitude!,
                    )
                  : null,
              radius: filter.radius,
              minRating: filter.minRating,
              isPublic: filter.isPublic,
            )
          : null;

      // Convert domain sort to data layer sort
      final dataSort = sort != null
          ? datasource.ClubSort(
              field: _convertSortField(sort.field),
              direction: sort.direction == domain.SortDirection.asc
                  ? datasource.SortDirection.asc
                  : datasource.SortDirection.desc,
            )
          : null;

      final clubs = await _remoteDataSource.getClubs(
        filter: dataFilter,
        sort: dataSort,
        limit: limit,
        cursor: cursor,
      );

      return Right(_convertModelsToEntities(clubs));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message, e.code));
    } on GraphQLException catch (e) {
      return Left(ServerFailure(e.message, e.code));
    } on Exception catch (e) {
      return Left(ServerFailure('Unexpected error: ${e}'));
    }
  }

  @override
  Future<Either<Failure, ClubEntity>> getClubById(String clubId) async {
    try {
      final club = await _remoteDataSource.getClubById(clubId);
      return Right(_convertModelToEntity(club));
    } on NetworkException catch (e) {
      if (e.code == 'NOT_FOUND') {
        return Left(NotFoundFailure('Club not found', e.code));
      }
      return Left(NetworkFailure(e.message, e.code));
    } on GraphQLException catch (e) {
      return Left(ServerFailure(e.message, e.code));
    } on Exception catch (e) {
      return Left(ServerFailure('Unexpected error: ${e}'));
    }
  }

  @override
  Future<Either<Failure, List<ClubSearchResultEntity>>> searchClubs({
    required String query,
    double? latitude,
    double? longitude,
    double? radius,
    List<String>? amenities,
    int? limit,
    String? cursor,
  }) async {
    try {
      final location = latitude != null && longitude != null
          ? datasource.LocationInput(latitude: latitude, longitude: longitude)
          : null;

      final results = await _remoteDataSource.searchClubs(
        query: query,
        location: location,
        radius: radius,
        amenities: amenities,
        limit: limit,
        cursor: cursor,
      );

      return Right(
        results
            .map(
              (result) => ClubSearchResultEntity(
                id: result.id,
                name: result.name,
                slug: result.slug,
                address: result.address,
                description: result.description,
                logo: result.logo,
                coverImage: result.coverImage,
                distance: result.distance,
                relevanceScore: result.relevanceScore,
              ),
            )
            .toList(),
      );
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message, e.code));
    } on GraphQLException catch (e) {
      return Left(ServerFailure(e.message, e.code));
    } on Exception catch (e) {
      return Left(ServerFailure('Unexpected error: ${e}'));
    }
  }

  @override
  Future<Either<Failure, List<ClubEntity>>> getNearbyClubs({
    required double latitude,
    required double longitude,
    double? radius,
    int? limit,
  }) async {
    try {
      final clubs = await _remoteDataSource.getNearbyClubs(
        latitude: latitude,
        longitude: longitude,
        radius: radius,
        limit: limit,
      );

      return Right(_convertModelsToEntities(clubs));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message, e.code));
    } on GraphQLException catch (e) {
      return Left(ServerFailure(e.message, e.code));
    } on Exception catch (e) {
      return Left(ServerFailure('Unexpected error: ${e}'));
    }
  }

  @override
  Future<Either<Failure, List<ClubEntity>>> getFeaturedClubs({
    int? limit,
  }) async {
    try {
      final clubs = await _remoteDataSource.getFeaturedClubs(limit: limit);
      return Right(_convertModelsToEntities(clubs));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message, e.code));
    } on GraphQLException catch (e) {
      return Left(ServerFailure(e.message, e.code));
    } on Exception catch (e) {
      return Left(ServerFailure('Unexpected error: ${e}'));
    }
  }

  @override
  Future<Either<Failure, List<ClubEntity>>> getFavoriteClubs() async {
    try {
      final clubs = await _remoteDataSource.getUserFavoriteClubs();
      return Right(_convertModelsToEntities(clubs));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message, e.code));
    } on GraphQLException catch (e) {
      return Left(ServerFailure(e.message, e.code));
    } on Exception catch (e) {
      return Left(ServerFailure('Unexpected error: ${e}'));
    }
  }

  @override
  Future<Either<Failure, ClubEntity>> toggleFavoriteClub(String clubId) async {
    try {
      final club = await _remoteDataSource.toggleFavoriteClub(clubId);
      return Right(_convertModelToEntity(club));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message, e.code));
    } on GraphQLException catch (e) {
      return Left(ServerFailure(e.message, e.code));
    } on Exception catch (e) {
      return Left(ServerFailure('Unexpected error: ${e}'));
    }
  }

  @override
  Future<Either<Failure, void>> checkInToClub(String clubId) async {
    try {
      await _remoteDataSource.checkInToClub(clubId);
      return const Right(null);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message, e.code));
    } on GraphQLException catch (e) {
      return Left(ServerFailure(e.message, e.code));
    } on Exception catch (e) {
      return Left(ServerFailure('Unexpected error: ${e}'));
    }
  }

  @override
  Future<Either<Failure, List<domain.ClubReview>>> getClubReviews(
    String clubId, {
    int? limit,
    String? cursor,
  }) async {
    try {
      final reviews = await _remoteDataSource.getClubReviews(
        clubId,
        limit: limit,
        cursor: cursor,
      );

      return Right(
        reviews
            .map(
              (review) => domain.ClubReview(
                id: review.id,
                rating: review.rating,
                comment: review.comment,
                author: review.author,
                createdAt: review.createdAt,
              ),
            )
            .toList(),
      );
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message, e.code));
    } on GraphQLException catch (e) {
      return Left(ServerFailure(e.message, e.code));
    } on Exception catch (e) {
      return Left(ServerFailure('Unexpected error: ${e}'));
    }
  }

  // Helper methods for conversion

  ClubEntity _convertModelToEntity(ClubModel model) {
    return ClubEntity(
      id: model.id,
      name: model.name,
      slug: model.slug,
      description: model.description,
      location: model.location,
      address: model.address,
      website: model.website,
      logo: model.logo,
      coverImage: model.coverImage,
      status: model.status,
      settings: model.settings,
      facilities: model.facilities,
      amenities: model.amenities,
      operatingHours: model.operatingHours,
      contact: model.contact,
      stats: model.stats,
      membership: model.membership,
      userRelation: model.userRelation,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  List<ClubEntity> _convertModelsToEntities(List<ClubModel> models) {
    return models.map(_convertModelToEntity).toList();
  }

  /// Convert domain ClubSortField to datasource ClubSortField
  datasource.ClubSortField _convertSortField(domain.ClubSortField field) {
    switch (field) {
      case domain.ClubSortField.name:
        return datasource.ClubSortField.name;
      case domain.ClubSortField.rating:
        return datasource.ClubSortField.rating;
      case domain.ClubSortField.distance:
        return datasource.ClubSortField.distance;
      case domain.ClubSortField.memberCount:
        return datasource.ClubSortField.memberCount;
      case domain.ClubSortField.createdAt:
        return datasource.ClubSortField.createdAt;
    }
  }
}
