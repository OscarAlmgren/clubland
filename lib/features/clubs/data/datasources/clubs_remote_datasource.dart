import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:logger/logger.dart';

import '../../../../core/errors/exceptions.dart' as app_exceptions;
import '../../../../core/graphql/graphql_api.dart';
import '../models/club_model.dart';
import '../models/club_search_result_model.dart';

abstract class ClubsRemoteDataSource {
  Future<List<ClubModel>> getClubs({
    ClubFilter? filter,
    ClubSort? sort,
    int? limit,
    String? cursor,
  });

  Future<ClubModel> getClubById(String clubId);

  Future<List<ClubSearchResultModel>> searchClubs({
    required String query,
    LocationInput? location,
    double? radius,
    List<String>? amenities,
    int? limit,
    String? cursor,
  });

  Future<List<ClubModel>> getNearbyClubs({
    required double latitude,
    required double longitude,
    double? radius,
    int? limit,
  });

  Future<List<ClubModel>> getFeaturedClubs();

  Future<List<ClubModel>> getUserFavoriteClubs();

  Future<ClubModel> toggleFavoriteClub(String clubId);

  Future<void> checkInToClub(String clubId);

  Future<List<ClubReviewModel>> getClubReviews(
    String clubId, {
    int? limit,
    String? cursor,
  });
}

class ClubReviewModel {
  const ClubReviewModel({
    required this.id,
    required this.rating,
    required this.comment,
    required this.author,
    required this.createdAt,
  });

  factory ClubReviewModel.fromJson(Map<String, dynamic> json) => ClubReviewModel(
    id: json['id'] as String,
    rating: (json['rating'] as num).toDouble(),
    comment: json['comment'] as String,
    author: json['author'] as String,
    createdAt: DateTime.parse(json['createdAt'] as String),
  );

  final String id;
  final double rating;
  final String comment;
  final String author;
  final DateTime createdAt;
}

class ClubsRemoteDataSourceImpl implements ClubsRemoteDataSource {
  ClubsRemoteDataSourceImpl({
    required GraphQLClient client,
    Logger? logger,
  })  : _client = client,
        _logger = logger ?? Logger();

  final GraphQLClient _client;
  final Logger _logger;

  @override
  Future<List<ClubModel>> getClubs({
    ClubFilter? filter,
    ClubSort? sort,
    int? limit,
    String? cursor,
  }) async {
    try {
      _logger.d('Fetching clubs with filter: $filter');

      final variables = <String, dynamic>{
        if (filter != null) 'filter': filter.toJson(),
        if (sort != null) 'sort': sort.toJson(),
        'pagination': {
          if (limit != null) 'first': limit,
          if (cursor != null) 'after': cursor,
        },
      };

      final result = await _client.query(
        QueryOptions(
          document: documentNodeQueryClubs,
          variables: variables,
          fetchPolicy: FetchPolicy.cacheAndNetwork,
        ),
      );

      if (result.hasException) {
        throw app_exceptions.NetworkException.serverError(
          500,
          result.exception?.graphqlErrors.firstOrNull?.message ?? 'Failed to fetch clubs',
        );
      }

      final data = result.data?['clubs'];
      if (data == null) {
        throw const app_exceptions.NetworkException( 'No clubs data received', 'NO_DATA');
      }

      final nodes = data['nodes'] as List<dynamic>?;
      if (nodes == null) {
        return [];
      }

      return nodes
          .map((node) => ClubModel.fromJson(node as Map<String, dynamic>))
          .toList();
    } on app_exceptions.GraphQLException catch (e) {
      _logger.e('GraphQL error fetching clubs', error: e);
      throw app_exceptions.NetworkException.serverError(500, e.toString());
    } on Exception catch (e) {
      _logger.e('Error fetching clubs', error: e);
      throw app_exceptions.NetworkException.serverError(500, 'Failed to fetch clubs: $e');
    }
  }

  @override
  Future<ClubModel> getClubById(String clubId) async {
    try {
      _logger.d('Fetching club details for ID: $clubId');

      final result = await _client.query(
        QueryOptions(
          document: documentNodeQueryClub,
          variables: {'id': clubId},
          fetchPolicy: FetchPolicy.cacheAndNetwork,
        ),
      );

      if (result.hasException) {
        throw app_exceptions.NetworkException.serverError(
          500,
          result.exception?.graphqlErrors.firstOrNull?.message ?? 'Failed to fetch club details',
        );
      }

      final clubData = result.data?['club'];
      if (clubData == null) {
        throw const app_exceptions.NetworkException( 'Club not found', 'NOT_FOUND');
      }

      return ClubModel.fromJson(clubData as Map<String, dynamic>);
    } on app_exceptions.GraphQLException catch (e) {
      _logger.e('GraphQL error fetching club details', error: e);
      throw app_exceptions.NetworkException.serverError(500, e.toString());
    } on Exception catch (e) {
      _logger.e('Error fetching club details', error: e);
      throw app_exceptions.NetworkException.serverError(500, 'Failed to fetch club details: $e');
    }
  }

  @override
  Future<List<ClubSearchResultModel>> searchClubs({
    required String query,
    LocationInput? location,
    double? radius,
    List<String>? amenities,
    int? limit,
    String? cursor,
  }) async {
    try {
      _logger.d('Searching clubs with query: $query');

      final variables = <String, dynamic>{
        'query': query,
        if (location != null) 'location': location.toJson(),
        if (radius != null) 'radius': radius,
        if (amenities != null) 'amenities': amenities,
        'pagination': {
          if (limit != null) 'first': limit,
          if (cursor != null) 'after': cursor,
        },
      };

      // TODO: Add searchClubsQuery to GraphQLDocuments
      const searchClubsQuery = '''
        query SearchClubs(
          \$query: String!
          \$location: LocationInput
          \$radius: Float
          \$amenities: [String!]
          \$pagination: PaginationInput
        ) {
          searchClubs(
            query: \$query
            location: \$location
            radius: \$radius
            amenities: \$amenities
            pagination: \$pagination
          ) {
            nodes {
              id
              name
              description
              location
              distance
              relevanceScore
            }
            pageInfo {
              hasNextPage
              totalCount
            }
          }
        }
      ''';

      final result = await _client.query(
        QueryOptions(
          document: gql(searchClubsQuery),
          variables: variables,
          fetchPolicy: FetchPolicy.networkOnly,
        ),
      );

      if (result.hasException) {
        throw app_exceptions.NetworkException.serverError(
          500,
          result.exception?.graphqlErrors.firstOrNull?.message ?? 'Failed to search clubs',
        );
      }

      final data = result.data?['searchClubs'];
      if (data == null) {
        throw const app_exceptions.NetworkException( 'No search results received', 'NO_DATA');
      }

      final nodes = data['nodes'] as List<dynamic>?;
      if (nodes == null) {
        return [];
      }

      return nodes
          .map(
            (node) =>
                ClubSearchResultModel.fromJson(node as Map<String, dynamic>),
          )
          .toList();
    } on app_exceptions.GraphQLException catch (e) {
      _logger.e('GraphQL error searching clubs', error: e);
      throw app_exceptions.NetworkException.serverError(500, e.toString());
    } on Exception catch (e) {
      _logger.e('Error searching clubs', error: e);
      throw app_exceptions.NetworkException.serverError(500, 'Failed to search clubs: $e');
    }
  }

  @override
  Future<List<ClubModel>> getNearbyClubs({
    required double latitude,
    required double longitude,
    double? radius,
    int? limit,
  }) async {
    try {
      _logger.d('Fetching nearby clubs at ($latitude, $longitude)');

      final location = LocationInput(latitude: latitude, longitude: longitude);

      final filter = ClubFilter(
        location: location,
        radius: radius ?? 10.0, // Default 10km radius
      );

      return getClubs(
        filter: filter,
        sort: const ClubSort(field: ClubSortField.distance),
        limit: limit ?? 20,
      );
    } on Exception catch (e) {
      _logger.e('Error fetching nearby clubs', error: e);
      throw app_exceptions.NetworkException.serverError(500, 'Failed to fetch nearby clubs: $e');
    }
  }

  @override
  Future<List<ClubModel>> getFeaturedClubs() async {
    try {
      _logger.d('Fetching featured clubs');

      final filter = ClubFilter(featured: true);
      final sort = ClubSort(
        field: ClubSortField.rating,
        direction: SortDirection.desc,
      );

      return getClubs(filter: filter, sort: sort, limit: 10);
    } on Exception catch (e) {
      _logger.e('Error fetching featured clubs', error: e);
      throw app_exceptions.NetworkException.serverError(500, 'Failed to fetch featured clubs: $e');
    }
  }

  @override
  Future<List<ClubModel>> getUserFavoriteClubs() async {
    try {
      _logger.d('Fetching user favorite clubs');

      final filter = ClubFilter(favorited: true);

      return getClubs(filter: filter, limit: 50);
    } on Exception catch (e) {
      _logger.e('Error fetching favorite clubs', error: e);
      throw app_exceptions.NetworkException.serverError(500, 'Failed to fetch favorite clubs: $e');
    }
  }

  @override
  Future<ClubModel> toggleFavoriteClub(String clubId) async {
    try {
      _logger.d('Toggling favorite for club: $clubId');

      // TODO: Add toggleFavoriteClubMutation to GraphQLDocuments
      const mutation = '''
        mutation ToggleFavoriteClub(\$clubId: ID!) {
          toggleFavoriteClub(clubId: \$clubId) {
            club {
              id
              name
              slug
              logo
              userRelation {
                favorited
              }
            }
            success
            message
          }
        }
      ''';

      final result = await _client.mutate(
        MutationOptions(document: gql(mutation), variables: {'clubId': clubId}),
      );

      if (result.hasException) {
        throw app_exceptions.NetworkException.serverError(
          500,
          result.exception?.graphqlErrors.firstOrNull?.message ?? 'Failed to toggle favorite',
        );
      }

      final data = result.data?['toggleFavoriteClub'];
      if (data == null || data['success'] != true) {
        throw app_exceptions.NetworkException(
          (data?['message'] as String?) ?? 'Failed to toggle favorite',
          'TOGGLE_FAILED',
        );
      }

      final clubData = data['club'];
      if (clubData == null) {
        throw const app_exceptions.NetworkException( 'No club data received', 'NO_DATA');
      }

      // Return updated club with minimal data
      return ClubModel.fromJson(clubData as Map<String, dynamic>);
    } on app_exceptions.GraphQLException catch (e) {
      _logger.e('GraphQL error toggling favorite', error: e);
      throw app_exceptions.NetworkException.serverError(500, e.toString());
    } on Exception catch (e) {
      _logger.e('Error toggling favorite', error: e);
      throw app_exceptions.NetworkException.serverError(500, 'Failed to toggle favorite: $e');
    }
  }

  @override
  Future<void> checkInToClub(String clubId) async {
    try {
      _logger.d('Checking in to club: $clubId');

      // TODO: Add checkInToClubMutation to GraphQLDocuments
      const mutation = '''
        mutation CheckInToClub(\$clubId: ID!) {
          checkInToClub(clubId: \$clubId) {
            success
            message
            visit {
              id
              checkedInAt
              club {
                id
                name
              }
            }
          }
        }
      ''';

      final result = await _client.mutate(
        MutationOptions(document: gql(mutation), variables: {'clubId': clubId}),
      );

      if (result.hasException) {
        throw app_exceptions.NetworkException.serverError(
          500,
          result.exception?.graphqlErrors.firstOrNull?.message ?? 'Failed to check in',
        );
      }

      final data = result.data?['checkInToClub'];
      if (data == null || data['success'] != true) {
        throw app_exceptions.NetworkException(
          (data?['message'] as String?) ?? 'Failed to check in',
          'CHECKIN_FAILED',
        );
      }

      _logger.i('Successfully checked in to club: $clubId');
    } on app_exceptions.GraphQLException catch (e) {
      _logger.e('GraphQL error checking in', error: e);
      throw app_exceptions.NetworkException.serverError(500, e.toString());
    } on Exception catch (e) {
      _logger.e('Error checking in to club', error: e);
      throw app_exceptions.NetworkException.serverError(500, 'Failed to check in: $e');
    }
  }

  @override
  Future<List<ClubReviewModel>> getClubReviews(
    String clubId, {
    int? limit,
    String? cursor,
  }) async {
    try {
      _logger.d('Fetching reviews for club: $clubId');

      final variables = <String, dynamic>{
        'clubId': clubId,
        'pagination': {
          if (limit != null) 'first': limit,
          if (cursor != null) 'after': cursor,
        },
      };

      // TODO: Add clubReviewsQuery to GraphQLDocuments
      const clubReviewsQuery = '''
        query ClubReviews(\$clubId: ID!, \$pagination: PaginationInput) {
          clubReviews(clubId: \$clubId, pagination: \$pagination) {
            nodes {
              id
              rating
              comment
              author
              createdAt
            }
            pageInfo {
              hasNextPage
              totalCount
            }
          }
        }
      ''';

      final result = await _client.query(
        QueryOptions(
          document: gql(clubReviewsQuery),
          variables: variables,
          fetchPolicy: FetchPolicy.cacheAndNetwork,
        ),
      );

      if (result.hasException) {
        throw app_exceptions.NetworkException.serverError(
          500,
          result.exception?.graphqlErrors.firstOrNull?.message ?? 'Failed to fetch reviews',
        );
      }

      final data = result.data?['clubReviews'];
      if (data == null) {
        throw const app_exceptions.NetworkException( 'No reviews data received', 'NO_DATA');
      }

      final nodes = data['nodes'] as List<dynamic>?;
      if (nodes == null) {
        return [];
      }

      return nodes
          .map((node) => ClubReviewModel.fromJson(node as Map<String, dynamic>))
          .toList();
    } on app_exceptions.GraphQLException catch (e) {
      _logger.e('GraphQL error fetching reviews', error: e);
      throw app_exceptions.NetworkException.serverError(500, e.toString());
    } on Exception catch (e) {
      _logger.e('Error fetching reviews', error: e);
      throw app_exceptions.NetworkException.serverError(500, 'Failed to fetch reviews: $e');
    }
  }
}

// Supporting classes for type-safe operations
class ClubFilter {
  final String? city;
  final String? state;
  final List<String>? amenities;
  final bool? featured;
  final bool? favorited;
  final LocationInput? location;
  final double? radius;
  final double? minRating;
  final bool? isPublic;

  const ClubFilter({
    this.city,
    this.state,
    this.amenities,
    this.featured,
    this.favorited,
    this.location,
    this.radius,
    this.minRating,
    this.isPublic,
  });

  Map<String, dynamic> toJson() => {
    if (city != null) 'city': city,
    if (state != null) 'state': state,
    if (amenities != null) 'amenities': amenities,
    if (featured != null) 'featured': featured,
    if (favorited != null) 'favorited': favorited,
    if (location != null) 'location': location!.toJson(),
    if (radius != null) 'radius': radius,
    if (minRating != null) 'minRating': minRating,
    if (isPublic != null) 'isPublic': isPublic,
  };
}

enum ClubSortField { name, rating, distance, memberCount, createdAt }

enum SortDirection { asc, desc }

class ClubSort {
  final ClubSortField field;
  final SortDirection direction;

  const ClubSort({required this.field, this.direction = SortDirection.asc});

  Map<String, dynamic> toJson() => {
    'field': field.name.toUpperCase(),
    'direction': direction.name.toUpperCase(),
  };
}

class LocationInput {
  final double latitude;
  final double longitude;

  const LocationInput({required this.latitude, required this.longitude});

  Map<String, dynamic> toJson() => {
    'latitude': latitude,
    'longitude': longitude,
  };
}
