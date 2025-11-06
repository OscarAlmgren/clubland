import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:logger/logger.dart';

import '../../../../core/errors/exceptions.dart' as app_exceptions;
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

  /// Subscribe to RSVP updates for an event
  Stream<EventRSVPModel> subscribeToRSVPUpdates(String eventId);

  /// Subscribe to event capacity updates
  Stream<Map<String, dynamic>> subscribeToEventCapacity(String eventId);
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
      const query = r'''
        query GetEvents($clubId: ID!, $filters: EventFilters, $pagination: PaginationInput!) {
          events(clubId: $clubId, filters: $filters, pagination: $pagination) {
            edges {
              node {
                id
                clubId
                title
                description
                eventType
                startTime
                endTime
                location
                imageUrl
                capacity
                currentAttendees
                availableSpots
                tentativeCount
                waitlistCount
                guestPolicy
                maxGuestsPerMember
                requiresApproval
                requiresPayment
                price
                cancellationDeadline
                freeCancellationDays
                cancellationFeePercentage
                allowsSubgroupPriority
                fullHouseExclusive
                rsvpDeadline
                subgroupId
                organizerName
                contactEmail
                contactPhone
                paymentInstructions
                createdAt
                updatedAt
              }
            }
            pageInfo {
              hasNextPage
              hasPreviousPage
              startCursor
              endCursor
            }
            totalCount
          }
        }
      ''';

      final variables = {
        'clubId': clubId,
        'filters': filters,
        'pagination': {'page': page, 'pageSize': pageSize},
      };

      final result = await _client.query(
        QueryOptions(
          document: gql(query),
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

      return data as Map<String, dynamic>;
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
      const query = r'''
        query GetEvent($id: ID!) {
          event(id: $id) {
            id
            clubId
            title
            description
            eventType
            startTime
            endTime
            location
            imageUrl
            capacity
            currentAttendees
            availableSpots
            tentativeCount
            waitlistCount
            guestPolicy
            maxGuestsPerMember
            requiresApproval
            requiresPayment
            price
            cancellationDeadline
            freeCancellationDays
            cancellationFeePercentage
            allowsSubgroupPriority
            fullHouseExclusive
            rsvpDeadline
            subgroupId
            organizerName
            contactEmail
            contactPhone
            paymentInstructions
            createdAt
            updatedAt
          }
        }
      ''';

      final result = await _client.query(
        QueryOptions(
          document: gql(query),
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
          'Event not found',
          eventId,
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
      const query = r'''
        query CheckRSVPEligibility($eventId: ID!, $memberId: ID!) {
          checkRSVPEligibility(eventId: $eventId, memberId: $memberId) {
            eligible
            reason
            memberInGoodStanding
            hasOutstandingDebt
            debtAmount
            wouldBeWaitlisted
            estimatedWaitlistPosition
            availableSpots
            priority
            requiresApproval
            isSubgroupMember
          }
        }
      ''';

      final result = await _client.query(
        QueryOptions(
          document: gql(query),
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
      const mutation = r'''
        mutation CreateRSVP($input: CreateRSVPInput!) {
          createRSVP(input: $input) {
            id
            eventId
            memberId
            clubId
            response
            rsvpType
            priority
            attendanceCount
            guestNames
            dietaryRestrictions
            seatingPreferences
            specialRequests
            status
            paymentRequired
            paymentVerified
            paymentAmount
            cancellationFee
            feeWaived
            waitlistPosition
            rsvpedAt
            updatedAt
            cancelledAt
            cancellationReason
            approvedBy
            approvedAt
            declineReason
          }
        }
      ''';

      final result = await _client.mutate(
        MutationOptions(document: gql(mutation), variables: {'input': input}),
      );

      if (result.hasException) {
        _logger.e('GraphQL error creating RSVP', error: result.exception);
        throw _handleGraphQLException(result.exception!);
      }

      final data = result.data?['createRSVP'];
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
      const mutation = r'''
        mutation UpdateRSVP($id: ID!, $input: UpdateRSVPInput!) {
          updateRSVP(id: $id, input: $input) {
            id
            eventId
            memberId
            clubId
            response
            rsvpType
            priority
            attendanceCount
            guestNames
            dietaryRestrictions
            seatingPreferences
            specialRequests
            status
            paymentRequired
            paymentVerified
            paymentAmount
            cancellationFee
            feeWaived
            waitlistPosition
            rsvpedAt
            updatedAt
            cancelledAt
            cancellationReason
            approvedBy
            approvedAt
            declineReason
          }
        }
      ''';

      final result = await _client.mutate(
        MutationOptions(
          document: gql(mutation),
          variables: {'id': rsvpId, 'input': input},
        ),
      );

      if (result.hasException) {
        _logger.e('GraphQL error updating RSVP', error: result.exception);
        throw _handleGraphQLException(result.exception!);
      }

      final data = result.data?['updateRSVP'];
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
      const mutation = r'''
        mutation CancelRSVP($id: ID!) {
          cancelRSVP(id: $id) {
            success
            message
            cancellationFee
            refundAmount
            feeWaived
          }
        }
      ''';

      final result = await _client.mutate(
        MutationOptions(document: gql(mutation), variables: {'id': rsvpId}),
      );

      if (result.hasException) {
        _logger.e('GraphQL error cancelling RSVP', error: result.exception);
        throw _handleGraphQLException(result.exception!);
      }

      final data = result.data?['cancelRSVP'];
      if (data == null) {
        throw const app_exceptions.NetworkException(
          'No cancellation response received',
          'NO_DATA',
        );
      }

      return CancelRSVPResponseModel.fromJson(data as Map<String, dynamic>);
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
      const query = r'''
        query MyRSVPs($clubId: ID!, $status: [RSVPStatus!], $pagination: PaginationInput!) {
          myRSVPs(clubId: $clubId, status: $status, pagination: $pagination) {
            edges {
              node {
                id
                eventId
                memberId
                clubId
                response
                rsvpType
                priority
                attendanceCount
                guestNames
                dietaryRestrictions
                seatingPreferences
                specialRequests
                status
                paymentRequired
                paymentVerified
                paymentAmount
                cancellationFee
                feeWaived
                waitlistPosition
                rsvpedAt
                updatedAt
                cancelledAt
                cancellationReason
              }
            }
            pageInfo {
              hasNextPage
              hasPreviousPage
              startCursor
              endCursor
            }
            totalCount
          }
        }
      ''';

      final variables = {
        'clubId': clubId,
        'status': statusFilter,
        'pagination': {'page': page, 'pageSize': pageSize},
      };

      final result = await _client.query(
        QueryOptions(
          document: gql(query),
          variables: variables,
          fetchPolicy: FetchPolicy.cacheAndNetwork,
        ),
      );

      if (result.hasException) {
        _logger.e('GraphQL error fetching my RSVPs', error: result.exception);
        throw _handleGraphQLException(result.exception!);
      }

      final data = result.data?['myRSVPs'];
      if (data == null) {
        throw const app_exceptions.NetworkException(
          'No RSVPs data received',
          'NO_DATA',
        );
      }

      return data as Map<String, dynamic>;
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
      const query = r'''
        query FindingFriendsSubgroups($clubId: ID!) {
          findingFriendsSubgroups(clubId: $clubId) {
            id
            clubId
            name
            description
            memberCount
            isActive
            organizerId
            organizerName
          }
        }
      ''';

      final result = await _client.query(
        QueryOptions(
          document: gql(query),
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

  @override
  Stream<EventRSVPModel> subscribeToRSVPUpdates(String eventId) {
    _logger.d('Subscribing to RSVP updates for event: $eventId');

    const subscription = r'''
      subscription RSVPUpdated($eventId: ID!) {
        rsvpUpdated(eventId: $eventId) {
          id
          eventId
          memberId
          clubId
          response
          rsvpType
          priority
          attendanceCount
          status
          rsvpedAt
          updatedAt
        }
      }
    ''';

    return _client
        .subscribe(
          SubscriptionOptions(
            document: gql(subscription),
            variables: {'eventId': eventId},
          ),
        )
        .map((result) {
          if (result.hasException) {
            _logger.e('GraphQL subscription error', error: result.exception);
            throw _handleGraphQLException(result.exception!);
          }

          final data = result.data?['rsvpUpdated'];
          if (data == null) {
            throw const app_exceptions.NetworkException(
              'No RSVP update data received',
              'NO_DATA',
            );
          }

          return EventRSVPModel.fromJson(data as Map<String, dynamic>);
        });
  }

  @override
  Stream<Map<String, dynamic>> subscribeToEventCapacity(String eventId) {
    _logger.d('Subscribing to capacity updates for event: $eventId');

    const subscription = r'''
      subscription EventCapacityUpdated($eventId: ID!) {
        eventCapacityUpdated(eventId: $eventId) {
          eventId
          availableSpots
          currentAttendees
          waitlistCount
        }
      }
    ''';

    return _client
        .subscribe(
          SubscriptionOptions(
            document: gql(subscription),
            variables: {'eventId': eventId},
          ),
        )
        .map((result) {
          if (result.hasException) {
            _logger.e('GraphQL subscription error', error: result.exception);
            throw _handleGraphQLException(result.exception!);
          }

          final data = result.data?['eventCapacityUpdated'];
          if (data == null) {
            throw const app_exceptions.NetworkException(
              'No capacity update data received',
              'NO_DATA',
            );
          }

          return data as Map<String, dynamic>;
        });
  }

  /// Handle GraphQL exceptions and convert to NetworkException
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
            error.message,
            extensions['resourceId'] as String?,
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
