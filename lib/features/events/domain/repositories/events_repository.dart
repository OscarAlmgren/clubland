import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/cancel_rsvp_response_entity.dart';
import '../entities/event_entity.dart';
import '../entities/event_rsvp_entity.dart';
import '../entities/events_connection_entity.dart';
import '../entities/finding_friends_subgroup_entity.dart';
import '../entities/rsvp_eligibility_entity.dart';

/// Repository interface for event and RSVP-related operations
///
/// This repository follows Clean Architecture principles and provides
/// an abstraction layer between the domain and data layers.
///
/// All methods return [Either<Failure, T>] to handle errors gracefully
/// without throwing exceptions.
abstract class EventsRepository {
  /// Get all events with optional filtering and pagination
  ///
  /// Parameters:
  /// - [clubId]: ID of the club to get events for
  /// - [filters]: Optional filters (event type, date range, etc.)
  /// - [page]: Page number for pagination (default: 1)
  /// - [pageSize]: Number of items per page (default: 20)
  ///
  /// Returns:
  /// - [Right<EventsConnectionEntity>]: Paginated list of events on success
  /// - [Left<Failure>]: Failure object on error
  Future<Either<Failure, EventsConnectionEntity>> getEvents({
    required String clubId,
    Map<String, dynamic>? filters,
    int page = 1,
    int pageSize = 20,
  });

  /// Get upcoming events for a club
  ///
  /// Parameters:
  /// - [clubId]: ID of the club
  /// - [limit]: Maximum number of events to return
  ///
  /// Returns:
  /// - [Right<List<EventEntity>>]: List of upcoming events on success
  /// - [Left<Failure>]: Failure object on error
  Future<Either<Failure, List<EventEntity>>> getUpcomingEvents({
    required String clubId,
    int? limit,
  });

  /// Get a single event by ID
  ///
  /// Parameters:
  /// - [eventId]: Unique identifier of the event
  ///
  /// Returns:
  /// - [Right<EventEntity>]: Event entity on success
  /// - [Left<Failure>]: Failure object if event not found or error occurs
  Future<Either<Failure, EventEntity>> getEventById(String eventId);

  /// Check if a member is eligible to RSVP to an event
  ///
  /// Parameters:
  /// - [eventId]: ID of the event
  /// - [memberId]: ID of the member
  ///
  /// Returns:
  /// - [Right<RSVPEligibilityEntity>]: Eligibility information on success
  /// - [Left<Failure>]: Failure object on error
  Future<Either<Failure, RSVPEligibilityEntity>> checkRSVPEligibility({
    required String eventId,
    required String memberId,
  });

  /// Create a new RSVP for an event
  ///
  /// Parameters:
  /// - [input]: Map containing RSVP data (eventId, response, attendanceCount, etc.)
  ///
  /// Returns:
  /// - [Right<EventRSVPEntity>]: Created RSVP entity on success
  /// - [Left<Failure>]: Failure object on error
  Future<Either<Failure, EventRSVPEntity>> createRSVP(
    Map<String, dynamic> input,
  );

  /// Update an existing RSVP
  ///
  /// Parameters:
  /// - [rsvpId]: ID of the RSVP to update
  /// - [input]: Map containing updated RSVP data
  ///
  /// Returns:
  /// - [Right<EventRSVPEntity>]: Updated RSVP entity on success
  /// - [Left<Failure>]: Failure object on error
  Future<Either<Failure, EventRSVPEntity>> updateRSVP({
    required String rsvpId,
    required Map<String, dynamic> input,
  });

  /// Cancel an RSVP
  ///
  /// Parameters:
  /// - [rsvpId]: ID of the RSVP to cancel
  /// - [reason]: Optional cancellation reason
  ///
  /// Returns:
  /// - [Right<CancelRSVPResponseEntity>]: Cancellation response on success
  /// - [Left<Failure>]: Failure object on error
  Future<Either<Failure, CancelRSVPResponseEntity>> cancelRSVP({
    required String rsvpId,
    String? reason,
  });

  /// Get all RSVPs for the current member
  ///
  /// Parameters:
  /// - [clubId]: ID of the club
  /// - [statusFilter]: Optional list of status filters
  /// - [page]: Page number for pagination (default: 1)
  /// - [pageSize]: Number of items per page (default: 20)
  ///
  /// Returns:
  /// - [Right<RSVPsConnectionEntity>]: Paginated list of RSVPs on success
  /// - [Left<Failure>]: Failure object on error
  Future<Either<Failure, RSVPsConnectionEntity>> getMyRSVPs({
    required String clubId,
    List<String>? statusFilter,
    int page = 1,
    int pageSize = 20,
  });

  /// Get upcoming events that the member has RSVP'd to
  ///
  /// Returns:
  /// - [Right<List<EventEntity>>]: List of upcoming events on success
  /// - [Left<Failure>]: Failure object on error
  Future<Either<Failure, List<EventEntity>>> getMyUpcomingEvents();

  /// Get all Finding Friends subgroups for a club
  ///
  /// Parameters:
  /// - [clubId]: ID of the club
  ///
  /// Returns:
  /// - [Right<List<FindingFriendsSubgroupEntity>>]: List of subgroups on success
  /// - [Left<Failure>]: Failure object on error
  Future<Either<Failure, List<FindingFriendsSubgroupEntity>>>
      getFindingFriendsSubgroups({
    required String clubId,
  });

  /// Get a specific RSVP by ID
  ///
  /// Parameters:
  /// - [rsvpId]: ID of the RSVP
  ///
  /// Returns:
  /// - [Right<EventRSVPEntity>]: RSVP entity on success
  /// - [Left<Failure>]: Failure object on error
  Future<Either<Failure, EventRSVPEntity>> getRSVPById(String rsvpId);

  /// Get all RSVPs for a specific event (for organizers)
  ///
  /// Parameters:
  /// - [eventId]: ID of the event
  /// - [statusFilter]: Optional list of status filters
  ///
  /// Returns:
  /// - [Right<List<EventRSVPEntity>>]: List of RSVPs on success
  /// - [Left<Failure>]: Failure object on error
  Future<Either<Failure, List<EventRSVPEntity>>> getEventRSVPs({
    required String eventId,
    List<String>? statusFilter,
  });
}
