import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/cancel_rsvp_response_entity.dart';
import '../../domain/entities/event_entity.dart';
import '../../domain/entities/event_rsvp_entity.dart';
import '../../domain/entities/events_connection_entity.dart';
import '../../domain/entities/finding_friends_subgroup_entity.dart';
import '../../domain/entities/rsvp_eligibility_entity.dart';
import '../../domain/repositories/events_repository.dart';
import '../datasources/events_remote_datasource.dart';
import '../models/event_model.dart';
import '../models/event_rsvp_model.dart';

/// Implementation of [EventsRepository]
///
/// This class implements the repository interface and handles the conversion
/// between data models and domain entities. It also handles error mapping
/// from exceptions to failures.
class EventsRepositoryImpl implements EventsRepository {
  const EventsRepositoryImpl({
    required EventsRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  final EventsRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, EventsConnectionEntity>> getEvents({
    required String clubId,
    Map<String, dynamic>? filters,
    int page = 1,
    int pageSize = 20,
  }) async {
    try {
      final data = await _remoteDataSource.getEvents(
        clubId: clubId,
        filters: filters,
        page: page,
        pageSize: pageSize,
      );

      // Parse events from edges
      final edges = data['edges'] as List<dynamic>? ?? [];
      final events = edges.map((edge) {
        final edgeMap = edge as Map<String, dynamic>;
        return EventModel.fromJson(edgeMap['node'] as Map<String, dynamic>);
      }).toList();

      // Parse page info
      final pageInfoData = data['pageInfo'] as Map<String, dynamic>? ?? {};
      final pageInfo = PageInfoEntity(
        hasNextPage: pageInfoData['hasNextPage'] as bool? ?? false,
        hasPreviousPage: pageInfoData['hasPreviousPage'] as bool? ?? false,
        startCursor: pageInfoData['startCursor'] as String?,
        endCursor: pageInfoData['endCursor'] as String?,
      );

      final totalCount = data['totalCount'] as int? ?? 0;

      return Right(
        EventsConnectionEntity(
          events: events,
          pageInfo: pageInfo,
          totalCount: totalCount,
        ),
      );
    } on NetworkException catch (e) {
      if (e.code == 'UNAUTHENTICATED') {
        return Left(AuthFailure(e.message, e.code));
      }
      return Left(NetworkFailure(e.message, e.code));
    } on GraphQLException catch (e) {
      return Left(GraphQLFailure(e.message, e.code));
    } on Exception catch (e) {
      return Left(UnknownFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<EventEntity>>> getUpcomingEvents({
    required String clubId,
    int? limit,
  }) async {
    try {
      final filters = {
        'startDate': DateTime.now().toIso8601String(),
      };

      final data = await _remoteDataSource.getEvents(
        clubId: clubId,
        filters: filters,
        pageSize: limit ?? 20,
      );

      final edges = data['edges'] as List<dynamic>? ?? [];
      final events = edges.map((edge) {
        final edgeMap = edge as Map<String, dynamic>;
        return EventModel.fromJson(edgeMap['node'] as Map<String, dynamic>);
      }).toList();

      return Right(events);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message, e.code));
    } on GraphQLException catch (e) {
      return Left(GraphQLFailure(e.message, e.code));
    } on Exception catch (e) {
      return Left(UnknownFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, EventEntity>> getEventById(String eventId) async {
    try {
      final event = await _remoteDataSource.getEventById(eventId);
      return Right(event);
    } on NetworkException catch (e) {
      if (e.code == 'NOT_FOUND') {
        return Left(NetworkFailure.notFound());
      }
      if (e.code == 'UNAUTHENTICATED') {
        return Left(AuthFailure(e.message, e.code));
      }
      return Left(NetworkFailure(e.message, e.code));
    } on GraphQLException catch (e) {
      return Left(GraphQLFailure(e.message, e.code));
    } on Exception catch (e) {
      return Left(UnknownFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, RSVPEligibilityEntity>> checkRSVPEligibility({
    required String eventId,
    required String memberId,
  }) async {
    try {
      final eligibility = await _remoteDataSource.checkRSVPEligibility(
        eventId: eventId,
        memberId: memberId,
      );
      return Right(eligibility);
    } on NetworkException catch (e) {
      if (e.code == 'UNAUTHENTICATED') {
        return Left(AuthFailure(e.message, e.code));
      }
      return Left(NetworkFailure(e.message, e.code));
    } on GraphQLException catch (e) {
      return Left(GraphQLFailure(e.message, e.code));
    } on Exception catch (e) {
      return Left(UnknownFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, EventRSVPEntity>> createRSVP(
    Map<String, dynamic> input,
  ) async {
    try {
      final rsvp = await _remoteDataSource.createRSVP(input);
      return Right(rsvp);
    } on NetworkException catch (e) {
      if (e.code == 'VALIDATION_ERROR') {
        return Left(ValidationFailure(e.message, e.code));
      }
      if (e.code == 'UNAUTHENTICATED') {
        return Left(AuthFailure(e.message, e.code));
      }
      return Left(NetworkFailure(e.message, e.code));
    } on GraphQLException catch (e) {
      return Left(GraphQLFailure(e.message, e.code));
    } on ValidationException catch (e) {
      return Left(ValidationFailure(e.message, e.code));
    } on Exception catch (e) {
      return Left(UnknownFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, EventRSVPEntity>> updateRSVP({
    required String rsvpId,
    required Map<String, dynamic> input,
  }) async {
    try {
      final rsvp = await _remoteDataSource.updateRSVP(
        rsvpId: rsvpId,
        input: input,
      );
      return Right(rsvp);
    } on NetworkException catch (e) {
      if (e.code == 'VALIDATION_ERROR') {
        return Left(ValidationFailure(e.message, e.code));
      }
      if (e.code == 'NOT_FOUND') {
        return Left(NetworkFailure.notFound());
      }
      if (e.code == 'UNAUTHENTICATED') {
        return Left(AuthFailure(e.message, e.code));
      }
      return Left(NetworkFailure(e.message, e.code));
    } on GraphQLException catch (e) {
      return Left(GraphQLFailure(e.message, e.code));
    } on ValidationException catch (e) {
      return Left(ValidationFailure(e.message, e.code));
    } on Exception catch (e) {
      return Left(UnknownFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CancelRSVPResponseEntity>> cancelRSVP({
    required String rsvpId,
    String? reason,
  }) async {
    try {
      final response = await _remoteDataSource.cancelRSVP(
        rsvpId: rsvpId,
        reason: reason,
      );
      return Right(response);
    } on NetworkException catch (e) {
      if (e.code == 'NOT_FOUND') {
        return Left(NetworkFailure.notFound());
      }
      if (e.code == 'UNAUTHENTICATED') {
        return Left(AuthFailure(e.message, e.code));
      }
      return Left(NetworkFailure(e.message, e.code));
    } on GraphQLException catch (e) {
      return Left(GraphQLFailure(e.message, e.code));
    } on Exception catch (e) {
      return Left(UnknownFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, RSVPsConnectionEntity>> getMyRSVPs({
    required String clubId,
    List<String>? statusFilter,
    int page = 1,
    int pageSize = 20,
  }) async {
    try {
      final data = await _remoteDataSource.getMyRSVPs(
        clubId: clubId,
        statusFilter: statusFilter,
        page: page,
        pageSize: pageSize,
      );

      // Parse RSVPs from edges
      final edges = data['edges'] as List<dynamic>? ?? [];
      final rsvps = edges.map((edge) {
        final edgeMap = edge as Map<String, dynamic>;
        return EventRSVPModel.fromJson(edgeMap['node'] as Map<String, dynamic>);
      }).toList();

      // Parse page info
      final pageInfoData = data['pageInfo'] as Map<String, dynamic>? ?? {};
      final pageInfo = PageInfoEntity(
        hasNextPage: pageInfoData['hasNextPage'] as bool? ?? false,
        hasPreviousPage: pageInfoData['hasPreviousPage'] as bool? ?? false,
        startCursor: pageInfoData['startCursor'] as String?,
        endCursor: pageInfoData['endCursor'] as String?,
      );

      final totalCount = data['totalCount'] as int? ?? 0;

      return Right(
        RSVPsConnectionEntity(
          rsvps: rsvps,
          pageInfo: pageInfo,
          totalCount: totalCount,
        ),
      );
    } on NetworkException catch (e) {
      if (e.code == 'UNAUTHENTICATED') {
        return Left(AuthFailure(e.message, e.code));
      }
      return Left(NetworkFailure(e.message, e.code));
    } on GraphQLException catch (e) {
      return Left(GraphQLFailure(e.message, e.code));
    } on Exception catch (e) {
      return Left(UnknownFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<EventEntity>>> getMyUpcomingEvents() async {
    try {
      // This would require a backend query for events where member has RSVPs
      // For now, return empty list - to be implemented with backend support
      return const Right([]);
    } on Exception catch (e) {
      return Left(UnknownFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<FindingFriendsSubgroupEntity>>>
      getFindingFriendsSubgroups({
    required String clubId,
  }) async {
    try {
      final subgroups =
          await _remoteDataSource.getFindingFriendsSubgroups(clubId: clubId);
      return Right(subgroups);
    } on NetworkException catch (e) {
      if (e.code == 'UNAUTHENTICATED') {
        return Left(AuthFailure(e.message, e.code));
      }
      return Left(NetworkFailure(e.message, e.code));
    } on GraphQLException catch (e) {
      return Left(GraphQLFailure(e.message, e.code));
    } on Exception catch (e) {
      return Left(UnknownFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, EventRSVPEntity>> getRSVPById(String rsvpId) async {
    try {
      // This would require a backend query for single RSVP
      // For now, return UnknownFailure.notImplemented() - to be implemented with backend support
      return Left(UnknownFailure.notImplemented());
    } on Exception catch (e) {
      return Left(UnknownFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<EventRSVPEntity>>> getEventRSVPs({
    required String eventId,
    List<String>? statusFilter,
  }) async {
    try {
      // This would require a backend query for event RSVPs (organizer view)
      // For now, return empty list - to be implemented with backend support
      return const Right([]);
    } on Exception catch (e) {
      return Left(UnknownFailure.unexpected(e.toString()));
    }
  }
}
