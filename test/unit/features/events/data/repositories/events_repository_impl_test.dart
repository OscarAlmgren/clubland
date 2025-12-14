import 'package:clubland/core/errors/exceptions.dart' as app_exceptions;
import 'package:clubland/core/errors/failures.dart';
import 'package:clubland/features/events/data/datasources/events_remote_datasource.dart';
import 'package:clubland/features/events/data/models/cancel_rsvp_response_model.dart';
import 'package:clubland/features/events/data/models/event_model.dart';
import 'package:clubland/features/events/data/models/event_rsvp_model.dart';
import 'package:clubland/features/events/data/models/finding_friends_subgroup_model.dart';
import 'package:clubland/features/events/data/models/rsvp_eligibility_model.dart';
import 'package:clubland/features/events/data/repositories/events_repository_impl.dart';
import 'package:clubland/features/events/domain/entities/event_entity.dart';
import 'package:clubland/features/events/domain/entities/event_rsvp_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockEventsRemoteDataSource extends Mock
    implements EventsRemoteDataSource {}

void main() {
  late MockEventsRemoteDataSource mockRemoteDataSource;
  late EventsRepositoryImpl repository;

  setUp(() {
    mockRemoteDataSource = MockEventsRemoteDataSource();
    repository = EventsRepositoryImpl(remoteDataSource: mockRemoteDataSource);
  });

  group('getEvents', () {
    const clubId = 'club123';

    final mockEventModel = EventModel(
      id: 'event1',
      clubId: clubId,
      title: 'Summer Gala',
      description: 'Annual summer event',
      eventType: EventType.social,
      startTime: DateTime(2024, 7, 1, 18),
      endTime: DateTime(2024, 7, 1, 23),
      location: 'Main Hall',
      capacity: 100,
      currentAttendees: 50,
      availableSpots: 50,
      guestPolicy: GuestPolicy.friendsAndFamily,
      requiresApproval: false,
      requiresPayment: true,
      price: 50.0,
      allowsSubgroupPriority: false,
      fullHouseExclusive: false,
      createdAt: DateTime(2024, 6, 1, 10),
      updatedAt: DateTime(2024, 6, 1, 10),
    );

    final mockData = {
      'edges': [
        {'node': mockEventModel.toJson()},
      ],
      'pageInfo': {
        'hasNextPage': true,
        'hasPreviousPage': false,
        'startCursor': 'cursor1',
        'endCursor': 'cursor2',
      },
      'totalCount': 10,
    };

    test('should return EventsConnectionEntity on success', () async {
      // Arrange
      when(
        () => mockRemoteDataSource.getEvents(
          clubId: clubId,
          filters: any(named: 'filters'),
        ),
      ).thenAnswer((_) async => mockData);

      // Act
      final result = await repository.getEvents(clubId: clubId);

      // Assert
      expect(result.isRight(), true);
      result.fold((failure) => fail('Should return Right'), (connection) {
        expect(connection.events.length, 1);
        expect(connection.events.first.title, 'Summer Gala');
        expect(connection.pageInfo.hasNextPage, true);
        expect(connection.totalCount, 10);
      });
      verify(
        () => mockRemoteDataSource.getEvents(
          clubId: clubId,
          filters: any(named: 'filters'),
        ),
      ).called(1);
    });

    test('should return NetworkFailure on NetworkException', () async {
      // Arrange
      when(
        () => mockRemoteDataSource.getEvents(
          clubId: clubId,
          filters: any(named: 'filters'),
        ),
      ).thenThrow(
        const app_exceptions.NetworkException('Network error', 'NETWORK_ERROR'),
      );

      // Act
      final result = await repository.getEvents(clubId: clubId);

      // Assert
      expect(result.isLeft(), true);
      result.fold((failure) {
        expect(failure, isA<NetworkFailure>());
        expect(failure.message, 'Network error');
      }, (connection) => fail('Should return Left'));
    });

    test(
      'should return AuthenticationFailure on UNAUTHENTICATED error',
      () async {
        // Arrange
        when(
          () => mockRemoteDataSource.getEvents(
            clubId: clubId,
            filters: any(named: 'filters'),
          ),
        ).thenThrow(
          const app_exceptions.NetworkException(
            'Not authenticated',
            'UNAUTHENTICATED',
          ),
        );

        // Act
        final result = await repository.getEvents(clubId: clubId);

        // Assert
        expect(result.isLeft(), true);
        result.fold((failure) {
          expect(failure, isA<AuthFailure>());
        }, (connection) => fail('Should return Left'));
      },
    );
  });

  group('getEventById', () {
    const eventId = 'event123';

    final mockEventModel = EventModel(
      id: eventId,
      clubId: 'club123',
      title: 'Summer Gala',
      description: 'Annual summer event',
      eventType: EventType.social,
      startTime: DateTime(2024, 7, 1, 18),
      endTime: DateTime(2024, 7, 1, 23),
      location: 'Main Hall',
      capacity: 100,
      currentAttendees: 50,
      availableSpots: 50,
      guestPolicy: GuestPolicy.friendsAndFamily,
      requiresApproval: false,
      requiresPayment: true,
      allowsSubgroupPriority: false,
      fullHouseExclusive: false,
      createdAt: DateTime(2024, 6, 1, 10),
      updatedAt: DateTime(2024, 6, 1, 10),
    );

    test('should return EventEntity on success', () async {
      // Arrange
      when(
        () => mockRemoteDataSource.getEventById(eventId),
      ).thenAnswer((_) async => mockEventModel);

      // Act
      final result = await repository.getEventById(eventId);

      // Assert
      expect(result.isRight(), true);
      result.fold((failure) => fail('Should return Right'), (event) {
        expect(event, isA<EventEntity>());
        expect(event.id, eventId);
        expect(event.title, 'Summer Gala');
      });
      verify(() => mockRemoteDataSource.getEventById(eventId)).called(1);
    });

    test('should return NotFoundFailure when event not found', () async {
      // Arrange
      when(() => mockRemoteDataSource.getEventById(eventId)).thenThrow(
        app_exceptions
            .NetworkException.notFound(), // 'Event not found: $eventId'
      );

      // Act
      final result = await repository.getEventById(eventId);

      // Assert
      expect(result.isLeft(), true);
      result.fold((failure) {
        expect(failure, isA<NetworkFailure>());
        expect((failure as NetworkFailure).code, 'NOT_FOUND');
      }, (event) => fail('Should return Left'));
    });
  });

  group('checkRSVPEligibility', () {
    const eventId = 'event123';
    const memberId = 'member123';

    const mockEligibility = RSVPEligibilityModel(
      eligible: true,
      memberInGoodStanding: true,
      hasOutstandingDebt: false,
      wouldBeWaitlisted: false,
      availableSpots: 50,
      priority: 2,
    );

    test('should return RSVPEligibilityEntity on success', () async {
      // Arrange
      when(
        () => mockRemoteDataSource.checkRSVPEligibility(
          eventId: eventId,
          memberId: memberId,
        ),
      ).thenAnswer((_) async => mockEligibility);

      // Act
      final result = await repository.checkRSVPEligibility(
        eventId: eventId,
        memberId: memberId,
      );

      // Assert
      expect(result.isRight(), true);
      result.fold((failure) => fail('Should return Right'), (eligibility) {
        expect(eligibility.eligible, true);
        expect(eligibility.availableSpots, 50);
      });
    });

    test('should return ineligible when member has debt', () async {
      // Arrange
      const ineligibleModel = RSVPEligibilityModel(
        eligible: false,
        reason: 'Outstanding debt',
        memberInGoodStanding: false,
        hasOutstandingDebt: true,
        debtAmount: 150.0,
        wouldBeWaitlisted: false,
        availableSpots: 50,
        priority: 2,
      );

      when(
        () => mockRemoteDataSource.checkRSVPEligibility(
          eventId: eventId,
          memberId: memberId,
        ),
      ).thenAnswer((_) async => ineligibleModel);

      // Act
      final result = await repository.checkRSVPEligibility(
        eventId: eventId,
        memberId: memberId,
      );

      // Assert
      expect(result.isRight(), true);
      result.fold((failure) => fail('Should return Right'), (eligibility) {
        expect(eligibility.eligible, false);
        expect(eligibility.hasOutstandingDebt, true);
        expect(eligibility.debtAmount, 150.0);
      });
    });
  });

  group('createRSVP', () {
    final input = {
      'eventId': 'event123',
      'memberId': 'member123',
      'clubId': 'club123',
      'response': 'YES',
      'attendanceCount': 2,
    };

    final mockRSVP = EventRSVPModel(
      id: 'rsvp123',
      eventId: 'event123',
      memberId: 'member123',
      clubId: 'club123',
      response: RSVPResponse.yes,
      rsvpType: RSVPType.primary,
      priority: 2,
      attendanceCount: 2,
      status: RSVPStatus.confirmed,
      paymentRequired: false,
      paymentVerified: false,
      feeWaived: false,
      rsvpedAt: DateTime(2024, 6, 15, 10),
      updatedAt: DateTime(2024, 6, 15, 10),
    );

    test('should return EventRSVPEntity on success', () async {
      // Arrange
      when(
        () => mockRemoteDataSource.createRSVP(input),
      ).thenAnswer((_) async => mockRSVP);

      // Act
      final result = await repository.createRSVP(input);

      // Assert
      expect(result.isRight(), true);
      result.fold((failure) => fail('Should return Right'), (rsvp) {
        expect(rsvp, isA<EventRSVPEntity>());
        expect(rsvp.id, 'rsvp123');
        expect(rsvp.status, RSVPStatus.confirmed);
      });
      verify(() => mockRemoteDataSource.createRSVP(input)).called(1);
    });

    test('should return ValidationFailure on validation error', () async {
      // Arrange
      when(() => mockRemoteDataSource.createRSVP(input)).thenThrow(
        const app_exceptions.NetworkException(
          'Validation error',
          'VALIDATION_ERROR',
        ),
      );

      // Act
      final result = await repository.createRSVP(input);

      // Assert
      expect(result.isLeft(), true);
      result.fold((failure) {
        expect(failure, isA<ValidationFailure>());
      }, (rsvp) => fail('Should return Left'));
    });
  });

  group('cancelRSVP', () {
    const rsvpId = 'rsvp123';

    const mockCancelResponse = CancelRSVPResponseModel(
      success: true,
      message: 'RSVP cancelled successfully',
      cancellationFee: 25.0,
      feeWaived: false,
    );

    test('should return CancelRSVPResponseEntity on success', () async {
      // Arrange
      when(
        () => mockRemoteDataSource.cancelRSVP(
          rsvpId: rsvpId,
          reason: any(named: 'reason'),
        ),
      ).thenAnswer((_) async => mockCancelResponse);

      // Act
      final result = await repository.cancelRSVP(rsvpId: rsvpId);

      // Assert
      expect(result.isRight(), true);
      result.fold((failure) => fail('Should return Right'), (response) {
        expect(response.success, true);
        expect(response.cancellationFee, 25.0);
      });
      verify(
        () => mockRemoteDataSource.cancelRSVP(
          rsvpId: rsvpId,
          reason: any(named: 'reason'),
        ),
      ).called(1);
    });

    test('should return NotFoundFailure when RSVP not found', () async {
      // Arrange
      when(
        () => mockRemoteDataSource.cancelRSVP(
          rsvpId: rsvpId,
          reason: any(named: 'reason'),
        ),
      ).thenThrow(
        app_exceptions.NetworkException.notFound(), // 'RSVP not found: $rsvpId'
      );

      // Act
      final result = await repository.cancelRSVP(rsvpId: rsvpId);

      // Assert
      expect(result.isLeft(), true);
      result.fold((failure) {
        expect(failure, isA<NetworkFailure>());
        expect((failure as NetworkFailure).code, 'NOT_FOUND');
      }, (response) => fail('Should return Left'));
    });
  });

  group('getFindingFriendsSubgroups', () {
    const clubId = 'club123';

    final mockSubgroups = [
      const FindingFriendsSubgroupModel(
        id: 'subgroup1',
        clubId: clubId,
        name: 'Vinna Vänner',
        memberCount: 25,
        isActive: true,
      ),
      const FindingFriendsSubgroupModel(
        id: 'subgroup2',
        clubId: clubId,
        name: 'Book Club',
        memberCount: 15,
        isActive: true,
      ),
    ];

    test('should return list of subgroups on success', () async {
      // Arrange
      when(
        () => mockRemoteDataSource.getFindingFriendsSubgroups(clubId: clubId),
      ).thenAnswer((_) async => mockSubgroups);

      // Act
      final result = await repository.getFindingFriendsSubgroups(
        clubId: clubId,
      );

      // Assert
      expect(result.isRight(), true);
      result.fold((failure) => fail('Should return Right'), (subgroups) {
        expect(subgroups.length, 2);
        expect(subgroups.first.name, 'Vinna Vänner');
        expect(subgroups.first.memberCount, 25);
      });
      verify(
        () => mockRemoteDataSource.getFindingFriendsSubgroups(clubId: clubId),
      ).called(1);
    });

    test('should return empty list when no subgroups exist', () async {
      // Arrange
      when(
        () => mockRemoteDataSource.getFindingFriendsSubgroups(clubId: clubId),
      ).thenAnswer((_) async => []);

      // Act
      final result = await repository.getFindingFriendsSubgroups(
        clubId: clubId,
      );

      // Assert
      expect(result.isRight(), true);
      result.fold((failure) => fail('Should return Right'), (subgroups) {
        expect(subgroups, isEmpty);
      });
    });
  });
}
