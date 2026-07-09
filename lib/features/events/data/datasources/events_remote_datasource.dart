import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:logger/logger.dart';

import '../../../../core/errors/exceptions.dart' as app_exceptions;
import '../../../../core/graphql/graphql_api.dart';
import '../models/cancel_rsvp_response_model.dart';
import '../models/event_model.dart';
import '../models/event_rsvp_model.dart';
import '../models/finding_friends_subgroup_model.dart';
import '../models/rsvp_eligibility_model.dart';

/// Abstract interface for events remote data source
abstract class EventsRemoteDataSource {
  /// Get all events with optional filtering and pagination
  Future<Map<String, dynamic>> getEvents({
    required String clubId,
    Map<String, dynamic>? filters,
    int page = 1,
    int pageSize = 20,
  });

  /// Get a single event by ID
  Future<EventModel> getEventById(String eventId);

  /// Check if a member is eligible to RSVP to an event
  Future<RSVPEligibilityModel> checkRSVPEligibility({
    required String eventId,
    required String memberId,
  });

  /// Create a new RSVP
  Future<EventRSVPModel> createRSVP(Map<String, dynamic> input);

  /// Update an existing RSVP
  Future<EventRSVPModel> updateRSVP({
    required String rsvpId,
    required Map<String, dynamic> input,
  });

  /// Cancel an RSVP
  Future<CancelRSVPResponseModel> cancelRSVP({
    required String rsvpId,
    String? reason,
  });

  /// Get all RSVPs for the current member
  Future<Map<String, dynamic>> getMyRSVPs({
    required String clubId,
    List<String>? statusFilter,
    int page = 1,
    int pageSize = 20,
  });

  /// Get Finding Friends subgroups for a club
  Future<List<FindingFriendsSubgroupModel>> getFindingFriendsSubgroups({
    required String clubId,
  });
}

/// Implementation of events remote data source using GraphQL
class EventsRemoteDataSourceImpl implements EventsRemoteDataSource {
  EventsRemoteDataSourceImpl({required GraphQLClient client, Logger? logger})
    : _client = client,
      _logger = logger ?? Logger();

  final GraphQLClient _client;
  final Logger _logger;

  @override
  Future<Map<String, dynamic>> getEvents({
    required String clubId,
    Map<String, dynamic>? filters,
    int page = 1,
    int pageSize = 20,
  }) async {
    _logger.d('Fetching events for club: $clubId, page: $page');

    try {
      // Schema: events(pagination, status, type, startDate, endDate) —
      // club scoping comes from the auth context, not an argument.
      final variables = <String, dynamic>{
        'pagination': {'page': page, 'pageSize': pageSize},
        if (filters?['status'] != null) 'status': filters!['status'],
        if (filters?['type'] != null) 'type': filters!['type'],
        if (filters?['startDate'] != null) 'startDate': filters!['startDate'],
        if (filters?['endDate'] != null) 'endDate': filters!['endDate'],
      };

      final result = await _client.query(
        QueryOptions(
          document: documentNodeQueryGetEvents,
          variables: variables,
          fetchPolicy: FetchPolicy.cacheAndNetwork,
        ),
      );

      if (result.hasException) {
        _logger.e('GraphQL error fetching events', error: result.exception);
        throw _handleGraphQLException(result.exception!);
      }

      final data = result.data?['events'];
      if (data == null) {
        throw const app_exceptions.NetworkException(
          'No events data received',
          'NO_DATA',
        );
      }

      return _toLegacyConnection(data as Map<String, dynamic>);
    } on app_exceptions.NetworkException {
      rethrow;
    } on Exception catch (e) {
      _logger.e('Error fetching events', error: e);
      throw app_exceptions.NetworkException.serverError(
        500,
        'Failed to fetch events: $e',
      );
    }
  }

  @override
  Future<EventModel> getEventById(String eventId) async {
    _logger.d('Fetching event by ID: $eventId');

    try {
      final result = await _client.query(
        QueryOptions(
          document: documentNodeQueryGetEvent,
          variables: {'id': eventId},
          fetchPolicy: FetchPolicy.cacheFirst,
        ),
      );

      if (result.hasException) {
        _logger.e('GraphQL error fetching event', error: result.exception);
        throw _handleGraphQLException(result.exception!);
      }

      final data = result.data?['event'];
      if (data == null) {
        throw app_exceptions.NetworkException.notFound(
          // 'Event not found: $eventId',
        );
      }

      return EventModel.fromJson(data as Map<String, dynamic>);
    } on app_exceptions.NetworkException {
      rethrow;
    } on Exception catch (e) {
      _logger.e('Error fetching event by ID', error: e);
      throw app_exceptions.NetworkException.serverError(
        500,
        'Failed to fetch event: $e',
      );
    }
  }

  @override
  Future<RSVPEligibilityModel> checkRSVPEligibility({
    required String eventId,
    required String memberId,
  }) async {
    _logger.d(
      'Checking RSVP eligibility for event: $eventId, member: $memberId',
    );

    try {
      // Execute query with direct client call
      final result = await _client.query(
        QueryOptions(
          document: documentNodeQueryCheckRSVPEligibility,
          variables: {'eventId': eventId, 'memberId': memberId},
          fetchPolicy: FetchPolicy.networkOnly,
        ),
      );

      if (result.hasException) {
        _logger.e(
          'GraphQL error checking eligibility',
          error: result.exception,
        );
        throw _handleGraphQLException(result.exception!);
      }

      final data = result.data?['checkRSVPEligibility'];
      if (data == null) {
        throw const app_exceptions.NetworkException(
          'No eligibility data received',
          'NO_DATA',
        );
      }

      return RSVPEligibilityModel.fromJson(data as Map<String, dynamic>);
    } on app_exceptions.NetworkException {
      rethrow;
    } on Exception catch (e) {
      _logger.e('Error checking RSVP eligibility', error: e);
      throw app_exceptions.NetworkException.serverError(
        500,
        'Failed to check eligibility: $e',
      );
    }
  }

  @override
  Future<EventRSVPModel> createRSVP(Map<String, dynamic> input) async {
    _logger.d('Creating RSVP with input: $input');

    try {
      final result = await _client.mutate(
        MutationOptions(
          document: documentNodeMutationCreateRSVP,
          variables: {'input': input},
        ),
      );

      if (result.hasException) {
        _logger.e('GraphQL error creating RSVP', error: result.exception);
        throw _handleGraphQLException(result.exception!);
      }

      final data = result.data?['createEventRSVP'];
      if (data == null) {
        throw const app_exceptions.NetworkException(
          'No RSVP data received',
          'NO_DATA',
        );
      }

      return EventRSVPModel.fromJson(data as Map<String, dynamic>);
    } on app_exceptions.NetworkException {
      rethrow;
    } on Exception catch (e) {
      _logger.e('Error creating RSVP', error: e);
      throw app_exceptions.NetworkException.serverError(
        500,
        'Failed to create RSVP: $e',
      );
    }
  }

  @override
  Future<EventRSVPModel> updateRSVP({
    required String rsvpId,
    required Map<String, dynamic> input,
  }) async {
    _logger.d('Updating RSVP: $rsvpId with input: $input');

    try {
      final result = await _client.mutate(
        MutationOptions(
          document: documentNodeMutationUpdateRSVP,
          variables: {'id': rsvpId, 'input': input},
        ),
      );

      if (result.hasException) {
        _logger.e('GraphQL error updating RSVP', error: result.exception);
        throw _handleGraphQLException(result.exception!);
      }

      final data = result.data?['updateEventRSVP'];
      if (data == null) {
        throw const app_exceptions.NetworkException(
          'No RSVP data received',
          'NO_DATA',
        );
      }

      return EventRSVPModel.fromJson(data as Map<String, dynamic>);
    } on app_exceptions.NetworkException {
      rethrow;
    } on Exception catch (e) {
      _logger.e('Error updating RSVP', error: e);
      throw app_exceptions.NetworkException.serverError(
        500,
        'Failed to update RSVP: $e',
      );
    }
  }

  @override
  Future<CancelRSVPResponseModel> cancelRSVP({
    required String rsvpId,
    String? reason,
  }) async {
    _logger.d('Cancelling RSVP: $rsvpId, reason: $reason');

    try {
      final result = await _client.mutate(
        MutationOptions(
          document: documentNodeMutationCancelRSVP,
          variables: {
            'id': rsvpId,
            'reason': reason ?? 'Cancelled by member',
          },
        ),
      );

      if (result.hasException) {
        _logger.e('GraphQL error cancelling RSVP', error: result.exception);
        throw _handleGraphQLException(result.exception!);
      }

      final data = result.data?['cancelEventRSVP'];
      if (data == null) {
        throw const app_exceptions.NetworkException(
          'No cancellation response received',
          'NO_DATA',
        );
      }

      // cancelEventRSVP returns the cancelled EventRSVP, not a
      // success/message wrapper — derive the response from its status.
      final rsvp = data as Map<String, dynamic>;
      return CancelRSVPResponseModel(
        success: (rsvp['status'] as String?)?.toUpperCase() == 'CANCELLED',
        message: rsvp['cancellationReason'] as String? ?? '',
        cancellationFee: (rsvp['cancellationFee'] as num?)?.toDouble(),
        feeWaived: rsvp['feeWaived'] as bool? ?? false,
      );
    } on app_exceptions.NetworkException {
      rethrow;
    } on Exception catch (e) {
      _logger.e('Error cancelling RSVP', error: e);
      throw app_exceptions.NetworkException.serverError(
        500,
        'Failed to cancel RSVP: $e',
      );
    }
  }

  @override
  Future<Map<String, dynamic>> getMyRSVPs({
    required String clubId,
    List<String>? statusFilter,
    int page = 1,
    int pageSize = 20,
  }) async {
    _logger.d('Fetching my RSVPs for club: $clubId, page: $page');

    try {
      // Schema: myEventRSVPs(pagination, status) — single status filter,
      // club scoping via auth context.
      final variables = <String, dynamic>{
        'pagination': {'page': page, 'pageSize': pageSize},
        if (statusFilter != null && statusFilter.isNotEmpty)
          'status': statusFilter.first,
      };

      final result = await _client.query(
        QueryOptions(
          document: documentNodeQueryMyRSVPs,
          variables: variables,
          fetchPolicy: FetchPolicy.cacheAndNetwork,
        ),
      );

      if (result.hasException) {
        _logger.e('GraphQL error fetching my RSVPs', error: result.exception);
        throw _handleGraphQLException(result.exception!);
      }

      final data = result.data?['myEventRSVPs'];
      if (data == null) {
        throw const app_exceptions.NetworkException(
          'No RSVPs data received',
          'NO_DATA',
        );
      }

      return _toLegacyConnection(data as Map<String, dynamic>);
    } on app_exceptions.NetworkException {
      rethrow;
    } on Exception catch (e) {
      _logger.e('Error fetching my RSVPs', error: e);
      throw app_exceptions.NetworkException.serverError(
        500,
        'Failed to fetch RSVPs: $e',
      );
    }
  }

  @override
  Future<List<FindingFriendsSubgroupModel>> getFindingFriendsSubgroups({
    required String clubId,
  }) async {
    _logger.d('Fetching Finding Friends subgroups for club: $clubId');

    try {
      // Execute query with direct client call
      final result = await _client.query(
        QueryOptions(
          document: documentNodeQueryFindingFriendsSubgroups,
          variables: {'clubId': clubId},
          fetchPolicy: FetchPolicy.cacheFirst,
        ),
      );

      if (result.hasException) {
        _logger.e('GraphQL error fetching subgroups', error: result.exception);
        throw _handleGraphQLException(result.exception!);
      }

      final data = result.data?['findingFriendsSubgroups'];
      if (data == null) {
        return [];
      }

      final subgroups = data as List<dynamic>;
      return subgroups
          .map(
            (json) => FindingFriendsSubgroupModel.fromJson(
              json as Map<String, dynamic>,
            ),
          )
          .toList();
    } on app_exceptions.NetworkException {
      rethrow;
    } on Exception catch (e) {
      _logger.e('Error fetching subgroups', error: e);
      throw app_exceptions.NetworkException.serverError(
        500,
        'Failed to fetch subgroups: $e',
      );
    }
  }


  /// Handle GraphQL exceptions and convert to NetworkException

  /// Adapts the schema's {nodes, pageInfo} connection to the legacy
  /// {edges: [{node}], pageInfo, totalCount} shape the repository parses.
  Map<String, dynamic> _toLegacyConnection(Map<String, dynamic> connection) {
    final nodes = connection['nodes'] as List<dynamic>? ?? [];
    final pageInfo = connection['pageInfo'] as Map<String, dynamic>? ?? {};
    return {
      'edges': [
        for (final node in nodes) {'node': node},
      ],
      'pageInfo': {
        'hasNextPage': pageInfo['hasNextPage'] as bool? ?? false,
        'hasPreviousPage': pageInfo['hasPrevPage'] as bool? ?? false,
        'startCursor': null,
        'endCursor': null,
      },
      'totalCount': pageInfo['total'] as int? ?? 0,
    };
  }

  app_exceptions.NetworkException _handleGraphQLException(
    OperationException exception,
  ) {
    if (exception.graphqlErrors.isNotEmpty) {
      final error = exception.graphqlErrors.first;
      final extensions = error.extensions;

      // Check for specific error codes
      if (extensions != null) {
        final code = extensions['code'] as String?;
        if (code == 'UNAUTHENTICATED' || code == 'UNAUTHORIZED') {
          return const app_exceptions.NetworkException(
            'Authentication required',
            'UNAUTHENTICATED',
          );
        }
        if (code == 'NOT_FOUND') {
          return app_exceptions.NetworkException.notFound(
            // '${error.message}:${extensions['resourceId']}',
          );
        }
        if (code == 'VALIDATION_ERROR') {
          return const app_exceptions.NetworkException(
            'Validation error',
            'VALIDATION_ERROR',
          );
        }
      }

      return app_exceptions.NetworkException.serverError(500, error.message);
    }

    if (exception.linkException != null) {
      return app_exceptions.NetworkException.serverError(
        503,
        'Network error: ${exception.linkException}',
      );
    }

    return app_exceptions.NetworkException.serverError(
      500,
      'Unknown GraphQL error',
    );
  }
}
