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

  Future<List<ClubModel>> getFeaturedClubs({int? limit});

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

      const clubsQuery = r'''
        query Clubs {
          clubs {
            id
            name
            slug
            description
            location
            address
            website
            status
            createdAt
            updatedAt
          }
        }
      ''';

      final result = await _client.query(
        QueryOptions(
          document: gql(clubsQuery),
          fetchPolicy: FetchPolicy.cacheAndNetwork,
        ),
      );

      if (result.hasException) {
        throw app_exceptions.NetworkException.serverError(
          500,
          result.exception?.graphqlErrors.firstOrNull?.message ??
              'Failed to fetch clubs',
        );
      }

      final data = result.data?['clubs'] as List<dynamic>?;
      if (data == null) {
        throw const app_exceptions.NetworkException(
            'No clubs data received', 'NO_DATA');
      }

      return data
          .map((node) => ClubModel.fromJson(node as Map<String, dynamic>))
          .toList();
    } on app_exceptions.GraphQLException catch (e) {
      _logger.e('GraphQL error fetching clubs', error: e);
      throw app_exceptions.NetworkException.serverError(500, e.toString());
    } on Exception catch (e) {
      _logger.e('Error fetching clubs', error: e);
      throw app_exceptions.NetworkException.serverError(
          500, 'Failed to fetch clubs: $e');
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
          result.exception?.graphqlErrors.firstOrNull?.message ??
              'Failed to fetch club details',
        );
      }

      final clubData = result.data?['club'];
      if (clubData == null) {
        throw const app_exceptions.NetworkException('Club not found', 'NOT_FOUND');
      }

      return ClubModel.fromJson(clubData as Map<String, dynamic>);
    } on app_exceptions.GraphQLException catch (e) {
      _logger.e('GraphQL error fetching club details', error: e);
      throw app_exceptions.NetworkException.serverError(500, e.toString());
    } on Exception catch (e) {
      _logger.e('Error fetching club details', error: e);
      throw app_exceptions.NetworkException.serverError(
          500, 'Failed to fetch club details: $e');
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

      // TODO: Implement searchClubs GraphQL operation when backend is ready
      // For now, fetch all clubs and filter locally
      final clubs = await getClubs(limit: limit, cursor: cursor);

      final searchResults = clubs
          .where((club) =>
              club.name.toLowerCase().contains(query.toLowerCase()) ||
              club.description.toLowerCase().contains(query.toLowerCase()))
          .map((club) => ClubSearchResultModel(
                id: club.id,
                name: club.name,
                slug: club.slug,
                address: club.address,
                description: club.description,
                logo: club.logo,
                coverImage: club.coverImage,
              ))
          .toList();

      return searchResults;
    } on app_exceptions.GraphQLException catch (e) {
      _logger.e('GraphQL error searching clubs', error: e);
      throw app_exceptions.NetworkException.serverError(500, e.toString());
    } on Exception catch (e) {
      _logger.e('Error searching clubs', error: e);
      throw app_exceptions.NetworkException.serverError(
          500, 'Failed to search clubs: $e');
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

      const nearbyClubsQuery = r'''
        query NearbyClubs($latitude: Float!, $longitude: Float!, $radius: Float, $pagination: PaginationInput) {
          nearbyClubs(latitude: $latitude, longitude: $longitude, radius: $radius, pagination: $pagination) {
            nodes {
              id
              name
              description
              location
              website
              status
              settings {
                allowReciprocal
                requireApproval
                maxVisitsPerMonth
              }
              createdAt
              updatedAt
            }
            pageInfo {
              hasNextPage
            }
          }
        }
      ''';

      final variables = <String, dynamic>{
        'latitude': latitude,
        'longitude': longitude,
        if (radius != null) 'radius': radius,
        'pagination': {
          'first': limit ?? 20,
        },
      };

      final result = await _client.query(
        QueryOptions(
          document: gql(nearbyClubsQuery),
          variables: variables,
          fetchPolicy: FetchPolicy.cacheAndNetwork,
        ),
      );

      if (result.hasException) {
        throw app_exceptions.NetworkException.serverError(
          500,
          result.exception?.graphqlErrors.firstOrNull?.message ??
              'Failed to fetch nearby clubs',
        );
      }

      final data = result.data?['nearbyClubs'];
      if (data == null) {
        _logger.w('nearbyClubs data is null from API');
        return [];
      }

      final nodes = data['nodes'] as List<dynamic>?;
      if (nodes == null) {
        return [];
      }

      return nodes
          .map((node) => ClubModel.fromJson(node as Map<String, dynamic>))
          .toList();
    } on app_exceptions.GraphQLException catch (e) {
      _logger.e('GraphQL error fetching nearby clubs', error: e);
      throw app_exceptions.NetworkException.serverError(500, e.toString());
    } on Exception catch (e) {
      _logger.e('Error fetching nearby clubs', error: e);
      throw app_exceptions.NetworkException.serverError(
          500, 'Failed to fetch nearby clubs: $e');
    }
  }

  @override
  Future<List<ClubModel>> getFeaturedClubs({int? limit}) async {
    try {
      _logger.d('Fetching featured clubs');

      const featuredClubsQuery = r'''
        query FeaturedClubs($pagination: PaginationInput) {
          featuredClubs(pagination: $pagination) {
            nodes {
              id
              name
              description
              location
              website
              logo
              coverImage
              status
              settings {
                allowReciprocal
                reciprocalFee
              }
              facilities {
                id
                name
                type
                capacity
              }
              createdAt
              updatedAt
            }
            pageInfo {
              hasNextPage
            }
          }
        }
      ''';

      final variables = <String, dynamic>{
        'pagination': {
          'first': limit ?? 10,
        },
      };

      final result = await _client.query(
        QueryOptions(
          document: gql(featuredClubsQuery),
          variables: variables,
          fetchPolicy: FetchPolicy.cacheAndNetwork,
        ),
      );

      if (result.hasException) {
        throw app_exceptions.NetworkException.serverError(
          500,
          result.exception?.graphqlErrors.firstOrNull?.message ??
              'Failed to fetch featured clubs',
        );
      }

      final data = result.data?['featuredClubs'];
      if (data == null) {
        _logger.w('featuredClubs data is null from API');
        return [];
      }

      final nodes = data['nodes'] as List<dynamic>?;
      if (nodes == null) {
        return [];
      }

      return nodes
          .map((node) => ClubModel.fromJson(node as Map<String, dynamic>))
          .toList();
    } on app_exceptions.GraphQLException catch (e) {
      _logger.e('GraphQL error fetching featured clubs', error: e);
      throw app_exceptions.NetworkException.serverError(500, e.toString());
    } on Exception catch (e) {
      _logger.e('Error fetching featured clubs', error: e);
      throw app_exceptions.NetworkException.serverError(
          500, 'Failed to fetch featured clubs: $e');
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
      throw app_exceptions.NetworkException.serverError(
          500, 'Failed to fetch favorite clubs: $e');
    }
  }

  @override
  Future<ClubModel> toggleFavoriteClub(String clubId) async {
    try {
      _logger.d('Toggling favorite for club: $clubId');

      // TODO: Implement toggleFavoriteClub mutation when backend is ready
      // For now, just return the club without modification
      _logger.w('toggleFavoriteClub not yet implemented in backend - returning club');
      return getClubById(clubId);
    } on app_exceptions.GraphQLException catch (e) {
      _logger.e('GraphQL error toggling favorite', error: e);
      throw app_exceptions.NetworkException.serverError(500, e.toString());
    } on Exception catch (e) {
      _logger.e('Error toggling favorite', error: e);
      throw app_exceptions.NetworkException.serverError(
          500, 'Failed to toggle favorite: $e');
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
          result.exception?.graphqlErrors.firstOrNull?.message ??
              'Failed to check in',
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
      throw app_exceptions.NetworkException.serverError(
          500, 'Failed to check in: $e');
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

      // TODO: Implement getClubReviews query when backend is ready
      // For now, return empty list
      _logger.w('getClubReviews not yet implemented in backend - returning empty list');
      return [];
    } on app_exceptions.GraphQLException catch (e) {
      _logger.e('GraphQL error fetching reviews', error: e);
      throw app_exceptions.NetworkException.serverError(500, e.toString());
    } on Exception catch (e) {
      _logger.e('Error fetching reviews', error: e);
      throw app_exceptions.NetworkException.serverError(
          500, 'Failed to fetch reviews: $e');
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
