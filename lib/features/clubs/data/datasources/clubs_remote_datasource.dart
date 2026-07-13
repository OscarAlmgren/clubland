import 'dart:math' as math;

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:logger/logger.dart';

import '../../../../core/errors/exceptions.dart' as app_exceptions;
import '../../../../core/graphql/graphql_api.dart';
import '../../domain/repositories/clubs_repository.dart'
    show ClubSortField, SortDirection;
import '../models/club_address_model.dart';
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

  factory ClubReviewModel.fromJson(Map<String, dynamic> json) =>
      ClubReviewModel(
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
  ClubsRemoteDataSourceImpl({required GraphQLClient client, Logger? logger})
    : _client = client,
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

      final result = await _client.query(
        QueryOptions(
          document: documentNodeQueryClubs,
          variables: {
            if (limit != null) 'pagination': {'limit': limit},
          },
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

      // Access nodes from ClubConnection
      final clubsData = result.data?['clubs'] as Map<String, dynamic>?;
      final nodes = clubsData?['nodes'] as List<dynamic>?;

      if (nodes == null) {
        throw const app_exceptions.NetworkException(
          'No clubs data received',
          'NO_DATA',
        );
      }

      return nodes
          .map((node) => ClubModel.fromJson(node as Map<String, dynamic>))
          .toList();
    } on app_exceptions.GraphQLException catch (e) {
      _logger.e('GraphQL error fetching clubs', error: e);
      throw app_exceptions.NetworkException.serverError(500, e.toString());
    } on Exception catch (e) {
      _logger.e('Error fetching clubs', error: e);
      throw app_exceptions.NetworkException.serverError(
        500,
        'Failed to fetch clubs: $e',
      );
    }
  }

  @override
  Future<ClubModel> getClubById(String clubId) async {
    try {
      _logger.d('Fetching club details for ID: $clubId');

      // Execute query with direct client call
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
        throw const app_exceptions.NetworkException(
          'Club not found',
          'NOT_FOUND',
        );
      }

      return ClubModel.fromJson(clubData as Map<String, dynamic>);
    } on app_exceptions.GraphQLException catch (e) {
      _logger.e('GraphQL error fetching club details', error: e);
      throw app_exceptions.NetworkException.serverError(500, e.toString());
    } on Exception catch (e) {
      _logger.e('Error fetching club details', error: e);
      throw app_exceptions.NetworkException.serverError(
        500,
        'Failed to fetch club details: $e',
      );
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
    _logger.d('Searching clubs with query: $query');

    try {
      final result = await _client.query(
        QueryOptions(
          document: documentNodeQuerySearchClubs,
          variables: Variables$Query$SearchClubs(
            query: query,
            amenities: amenities,
            pagination: limit != null
                ? Input$PaginationInput(pageSize: limit)
                : null,
          ).toJson(),
          fetchPolicy: FetchPolicy.cacheAndNetwork,
        ),
      );

      if (result.hasException) {
        throw app_exceptions.NetworkException(
          result.exception?.graphqlErrors.firstOrNull?.message ??
              'Failed to search clubs',
          'SEARCH_FAILED',
        );
      }

      final data = result.data?['searchClubs'] as Map<String, dynamic>?;
      if (data == null) return [];

      final nodes = data['nodes'] as List<dynamic>? ?? [];
      return nodes.map((n) {
        final m = n as Map<String, dynamic>;
        // Backend Club.location is a flat String; build minimal address from it
        final location = m['location'] as String? ?? '';
        return ClubSearchResultModel(
          id: m['id'] as String,
          name: m['name'] as String,
          slug: m['slug'] as String? ?? '',
          description: m['description'] as String?,
          logo: m['logo'] as String?,
          address: ClubAddressModel(
            street: '',
            city: location,
            state: '',
            zipCode: '',
            country: '',
          ),
          distance: (m['distance'] as num?)?.toDouble(),
          relevanceScore: (m['relevanceScore'] as num?)?.toDouble(),
        );
      }).toList();
    } on app_exceptions.NetworkException {
      rethrow;
    } on Exception catch (e) {
      _logger.e('Error searching clubs', error: e);
      throw app_exceptions.NetworkException(
        'Failed to search clubs: $e',
        'UNKNOWN',
      );
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

      // The backend has no nearbyClubs query; fetch active clubs and rank
      // by distance client-side using Club.latitude/longitude.
      // TODO(backend): add a real nearbyClubs(latitude, longitude, radius)
      // query and switch to it here.
      final result = await _client.query(
        QueryOptions(
          document: documentNodeQueryClubs,
          variables: {
            'filter': const {'status': 'ACTIVE'},
            'pagination': {'limit': limit ?? 20},
          },
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

      final data = result.data?['clubs'] as Map<String, dynamic>?;
      if (data == null) {
        _logger.w('clubs data is null from API');
        return [];
      }

      final nodes = data['nodes'] as List<dynamic>?;
      if (nodes == null) {
        return [];
      }

      final maxDistanceKm = radius ?? 50;
      final ranked = <(double, Map<String, dynamic>)>[];
      for (final node in nodes.whereType<Map<String, dynamic>>()) {
        final lat = (node['latitude'] as num?)?.toDouble();
        final lon = (node['longitude'] as num?)?.toDouble();
        if (lat == null || lon == null) continue;
        final distance = _distanceKm(latitude, longitude, lat, lon);
        if (distance <= maxDistanceKm) {
          ranked.add((distance, node));
        }
      }
      ranked.sort((a, b) => a.$1.compareTo(b.$1));

      return ranked.map((entry) => ClubModel.fromJson(entry.$2)).toList();
    } on app_exceptions.GraphQLException catch (e) {
      _logger.e('GraphQL error fetching nearby clubs', error: e);
      throw app_exceptions.NetworkException.serverError(500, e.toString());
    } on Exception catch (e) {
      _logger.e('Error fetching nearby clubs', error: e);
      throw app_exceptions.NetworkException.serverError(
        500,
        'Failed to fetch nearby clubs: $e',
      );
    }
  }

  @override
  Future<List<ClubModel>> getFeaturedClubs({int? limit}) async {
    try {
      _logger.d('Fetching featured clubs');

      final result = await _client.query(
        QueryOptions(
          document: documentNodeQueryFeaturedClubs,
          variables: {
            'pagination': {'limit': limit ?? 10},
          },
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

      final data = result.data?['clubs'] as Map<String, dynamic>?;
      if (data == null) {
        _logger.w('featured clubs data is null from API');
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
        500,
        'Failed to fetch featured clubs: $e',
      );
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
        500,
        'Failed to fetch favorite clubs: $e',
      );
    }
  }

  @override
  Future<ClubModel> toggleFavoriteClub(String clubId) async {
    _logger.d('Toggling favorite for club: $clubId');

    try {
      final result = await _client.mutate(
        MutationOptions(
          document: documentNodeMutationToggleFavoriteClub,
          variables: Variables$Mutation$ToggleFavoriteClub(
            clubId: clubId,
          ).toJson(),
        ),
      );

      if (result.hasException) {
        throw app_exceptions.NetworkException(
          result.exception?.graphqlErrors.firstOrNull?.message ??
              'Failed to toggle favorite',
          'TOGGLE_FAILED',
        );
      }

      final data = result.data?['toggleFavoriteClub'] as Map<String, dynamic>?;
      if (data != null && data['success'] == false) {
        throw app_exceptions.NetworkException(
          (data['message'] as String?) ?? 'Failed to toggle favorite',
          'TOGGLE_FAILED',
        );
      }

      _logger.i('Successfully toggled favorite for club: $clubId');
      return getClubById(clubId);
    } on app_exceptions.NetworkException {
      rethrow;
    } on Exception catch (e) {
      _logger.e('Error toggling favorite', error: e);
      throw app_exceptions.NetworkException(
        'Failed to toggle favorite: $e',
        'UNKNOWN',
      );
    }
  }

  @override
  Future<void> checkInToClub(String clubId) async {
    try {
      _logger.d('Checking in to club: $clubId');

      // Execute mutation with direct client call
      final result = await _client.mutate(
        MutationOptions(
          document: documentNodeMutationCheckInToClub,
          variables: {'clubId': clubId},
        ),
      );

      if (result.hasException) {
        throw app_exceptions.NetworkException.serverError(
          500,
          result.exception?.graphqlErrors.firstOrNull?.message ??
              'Failed to check in',
        );
      }

      final data = result.data?['checkInToClub'] as Map<String, dynamic>?;
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
        500,
        'Failed to check in: $e',
      );
    }
  }

  @override
  Future<List<ClubReviewModel>> getClubReviews(
    String clubId, {
    int? limit,
    String? cursor,
  }) async {
    _logger.d('Fetching reviews for club: $clubId');

    try {
      final result = await _client.query(
        QueryOptions(
          document: documentNodeQueryClubReviews,
          variables: Variables$Query$ClubReviews(
            clubId: clubId,
            pagination: limit != null
                ? Input$PaginationInput(pageSize: limit)
                : null,
          ).toJson(),
          fetchPolicy: FetchPolicy.cacheAndNetwork,
        ),
      );

      if (result.hasException) {
        throw app_exceptions.NetworkException(
          result.exception?.graphqlErrors.firstOrNull?.message ??
              'Failed to fetch reviews',
          'FETCH_FAILED',
        );
      }

      final data = result.data?['clubReviews'] as Map<String, dynamic>?;
      if (data == null) return [];

      final nodes = data['nodes'] as List<dynamic>? ?? [];
      return nodes.map((n) {
        final m = n as Map<String, dynamic>;
        return ClubReviewModel(
          id: m['id'] as String,
          rating: (m['rating'] as num).toDouble(),
          comment: m['comment'] as String? ?? '',
          author: m['author'] as String? ?? '',
          createdAt: DateTime.parse(m['createdAt'] as String),
        );
      }).toList();
    } on app_exceptions.NetworkException {
      rethrow;
    } on Exception catch (e) {
      _logger.e('Error fetching reviews', error: e);
      throw app_exceptions.NetworkException(
        'Failed to fetch reviews: $e',
        'UNKNOWN',
      );
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

/// Great-circle distance in kilometres (haversine).
double _distanceKm(double lat1, double lon1, double lat2, double lon2) {
  const earthRadiusKm = 6371.0;
  final dLat = _radians(lat2 - lat1);
  final dLon = _radians(lon2 - lon1);
  final a =
      math.sin(dLat / 2) * math.sin(dLat / 2) +
      math.cos(_radians(lat1)) *
          math.cos(_radians(lat2)) *
          math.sin(dLon / 2) *
          math.sin(dLon / 2);
  return earthRadiusKm * 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
}

double _radians(double degrees) => degrees * math.pi / 180;
