import 'package:clubland/core/errors/failures.dart';
import 'package:clubland/features/events/domain/entities/event_entity.dart';
import 'package:clubland/features/events/domain/entities/event_rsvp_entity.dart';
import 'package:clubland/features/events/domain/entities/events_connection_entity.dart';
import 'package:clubland/features/events/domain/entities/rsvp_eligibility_entity.dart';
import 'package:clubland/features/events/domain/entities/cancel_rsvp_response_entity.dart';
import 'package:clubland/features/events/domain/usecases/get_events.dart';
import 'package:clubland/features/events/domain/usecases/get_event_by_id.dart';
import 'package:clubland/features/events/domain/usecases/check_rsvp_eligibility.dart';
import 'package:clubland/features/events/domain/usecases/create_rsvp.dart';
import 'package:clubland/features/events/domain/usecases/update_rsvp.dart';
import 'package:clubland/features/events/domain/usecases/cancel_rsvp.dart';
import 'package:clubland/features/events/domain/usecases/get_my_rsvps.dart';
import 'package:clubland/features/events/presentation/controllers/events_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mock use cases
class MockGetEvents extends Mock implements GetEvents {}

class MockGetEventById extends Mock implements GetEventById {}

class MockCheckRSVPEligibility extends Mock implements CheckRSVPEligibility {}

class MockCreateRSVP extends Mock implements CreateRSVP {}

class MockUpdateRSVP extends Mock implements UpdateRSVP {}

class MockCancelRSVP extends Mock implements CancelRSVP {}

class MockGetMyRSVPs extends Mock implements GetMyRSVPs {}

void main() {
  // Test fixtures
  const clubId = 'club123';
  const eventId = 'event123';
  const memberId = 'member123';
  const rsvpId = 'rsvp123';

  final mockEvent = EventEntity(
    id: eventId,
    clubId: clubId,
    title: 'Wine Tasting Evening',
    description: 'Sample description',
    eventType: EventType.dining,
    startTime: DateTime.now().add(const Duration(days: 7)),
    endTime: DateTime.now().add(const Duration(days: 7, hours: 2)),
    location: 'Wine Cellar',
    capacity: 20,
    currentAttendees: 15,
    availableSpots: 5,
    guestPolicy: GuestPolicy.membersOnly,
    requiresApproval: false,
    requiresPayment: true,
    price: 50.0,
    rsvpDeadline: DateTime.now().add(const Duration(days: 6)),
    cancellationDeadline: DateTime.now().add(const Duration(days: 5)),
    tags: const ['wine', 'dining'],
    organizerName: 'John Doe',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    allowsSubgroupPriority: false,
    fullHouseExclusive: false,
  );

  final mockRSVP = EventRSVPEntity(
    id: rsvpId,
    eventId: eventId,
    memberId: memberId,
    clubId: clubId,
    response: RSVPResponse.yes,
    rsvpType: RSVPType.primary,
    priority: 1,
    attendanceCount: 1,
    guestNames: const [],
    dietaryRestrictions: const [],
    seatingPreferences: null,
    specialRequests: null,
    status: RSVPStatus.confirmed,
    paymentRequired: true,
    paymentVerified: true,
    paymentAmount: 50.0,
    feeWaived: false,
    rsvpedAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );

  final mockEligibility = RSVPEligibilityEntity(
    eligible: true,
    reason: 'Eligible',
    memberInGoodStanding: true,
    hasOutstandingDebt: false,
    wouldBeWaitlisted: false,
    availableSpots: 5,
    priority: 2,
    requiresPayment: true,
    paymentAmount: 50.0,
    hasExistingRSVP: false,
  );

  final mockPageInfo = PageInfoEntity(
    hasNextPage: true,
    hasPreviousPage: false,
    startCursor: 'cursor1',
    endCursor: 'cursor2',
  );

  final mockEventsConnection = EventsConnectionEntity(
    events: [mockEvent],
    pageInfo: mockPageInfo,
    totalCount: 10,
  );

  final mockCancelResponse = CancelRSVPResponseEntity(
    success: true,
    message: 'RSVP cancelled successfully',
    cancellationFee: 0.0,
    refundAmount: 50.0,
    feeWaived: true,
  );

  group('EventsListController', () {
    late MockGetEvents mockGetEvents;
    late ProviderContainer container;

    setUp(() {
      mockGetEvents = MockGetEvents();

      container = ProviderContainer(
        overrides: [getEventsUseCaseProvider.overrideWithValue(mockGetEvents)],
      );

      // Register fallback values
      registerFallbackValue(GetEventsParams(clubId: clubId));
    });

    tearDown(() {
      container.dispose();
    });

    test('should load events on initialization', () async {
      // Arrange
      when(
        () => mockGetEvents(any()),
      ).thenAnswer((_) async => Right(mockEventsConnection));

      // Act
      final controller = container.read(
        eventsListControllerProvider(clubId).future,
      );

      // Assert
      final state = await controller;
      expect(state.events, isNotEmpty);
      expect(state.events.first.id, eventId);
      expect(state.pageInfo.hasNextPage, true);
      expect(state.isLoadingMore, false);
      verify(() => mockGetEvents(any())).called(1);
    });

    test('should handle loading error', () async {
      // Arrange
      when(
        () => mockGetEvents(any()),
      ).thenAnswer((_) async => const Left(NetworkFailure('Server error')));

      // Act & Assert
      expect(
        () => container.read(eventsListControllerProvider(clubId).future),
        throwsA(isA<Exception>()),
      );
    });

    test('should apply filters and reload events', () async {
      // Arrange
      when(
        () => mockGetEvents(any()),
      ).thenAnswer((_) async => Right(mockEventsConnection));

      final controller = container.read(
        eventsListControllerProvider(clubId).notifier,
      );

      // Act
      await controller.applyFilters({'eventType': 'dining'});

      // Assert
      final state = await container.read(
        eventsListControllerProvider(clubId).future,
      );
      expect(state.filters, {'eventType': 'dining'});
      verify(() => mockGetEvents(any())).called(2); // Initial + applyFilters
    });

    test('should load more events on pagination', () async {
      // Arrange
      when(
        () => mockGetEvents(any()),
      ).thenAnswer((_) async => Right(mockEventsConnection));

      final controller = container.read(
        eventsListControllerProvider(clubId).notifier,
      );

      // Wait for initial load
      await container.read(eventsListControllerProvider(clubId).future);

      // Act
      await controller.loadMore();

      // Assert
      verify(() => mockGetEvents(any())).called(2); // Initial + loadMore
    });

    test('should not load more when already loading', () async {
      // Arrange
      when(
        () => mockGetEvents(any()),
      ).thenAnswer((_) async => Right(mockEventsConnection));

      final controller = container.read(
        eventsListControllerProvider(clubId).notifier,
      );

      // Wait for initial load
      await container.read(eventsListControllerProvider(clubId).future);

      // Act - Call loadMore multiple times quickly
      controller.loadMore();
      controller.loadMore();
      controller.loadMore();

      await Future.delayed(const Duration(milliseconds: 100));

      // Assert - Should only call once (second and third calls blocked)
      verify(() => mockGetEvents(any())).called(2); // Initial + one loadMore
    });

    test('should refresh events list', () async {
      // Arrange
      when(
        () => mockGetEvents(any()),
      ).thenAnswer((_) async => Right(mockEventsConnection));

      final controller = container.read(
        eventsListControllerProvider(clubId).notifier,
      );

      // Wait for initial load
      await container.read(eventsListControllerProvider(clubId).future);

      // Act
      await controller.refresh();

      // Assert
      verify(() => mockGetEvents(any())).called(2); // Initial + refresh
    });

    test('should search events', () async {
      // Arrange
      when(
        () => mockGetEvents(any()),
      ).thenAnswer((_) async => Right(mockEventsConnection));

      final controller = container.read(
        eventsListControllerProvider(clubId).notifier,
      );

      // Act
      await controller.search('wine');

      // Assert
      final state = await container.read(
        eventsListControllerProvider(clubId).future,
      );
      expect(state.filters?['search'], 'wine');
      verify(() => mockGetEvents(any())).called(2); // Initial + search
    });
  });

  group('EventDetailsController', () {
    late MockGetEventById mockGetEventById;
    late MockCheckRSVPEligibility mockCheckEligibility;
    late ProviderContainer container;

    setUp(() {
      mockGetEventById = MockGetEventById();
      mockCheckEligibility = MockCheckRSVPEligibility();

      container = ProviderContainer(
        overrides: [
          getEventByIdUseCaseProvider.overrideWithValue(mockGetEventById),
          checkRSVPEligibilityUseCaseProvider.overrideWithValue(
            mockCheckEligibility,
          ),
        ],
      );

      // Register fallback values
      registerFallbackValue(eventId);
      registerFallbackValue(
        CheckRSVPEligibilityParams(eventId: eventId, memberId: memberId),
      );
    });

    tearDown(() {
      container.dispose();
    });

    test(
      'should load event details and eligibility on initialization',
      () async {
        // Arrange
        when(
          () => mockGetEventById(any()),
        ).thenAnswer((_) async => Right(mockEvent));
        when(
          () => mockCheckEligibility(any()),
        ).thenAnswer((_) async => Right(mockEligibility));

        // Act
        final controller = container.read(
          eventDetailsControllerProvider(eventId, memberId).future,
        );

        // Assert
        final state = await controller;
        expect(state.event.id, eventId);
        expect(state.eligibility?.canRSVP, true);
        verify(() => mockGetEventById(any())).called(1);
        verify(() => mockCheckEligibility(any())).called(1);
      },
    );

    test('should handle event not found error', () async {
      // Arrange
      when(
        () => mockGetEventById(any()),
      ).thenAnswer((_) async => Left(NetworkFailure.notFound()));
      when(
        () => mockCheckEligibility(any()),
      ).thenAnswer((_) async => Right(mockEligibility));

      // Act & Assert
      expect(
        () => container.read(
          eventDetailsControllerProvider(eventId, memberId).future,
        ),
        throwsA(isA<Exception>()),
      );
    });

    test('should reload event details', () async {
      // Arrange
      when(
        () => mockGetEventById(any()),
      ).thenAnswer((_) async => Right(mockEvent));
      when(
        () => mockCheckEligibility(any()),
      ).thenAnswer((_) async => Right(mockEligibility));

      final controller = container.read(
        eventDetailsControllerProvider(eventId, memberId).notifier,
      );

      // Wait for initial load
      await container.read(
        eventDetailsControllerProvider(eventId, memberId).future,
      );

      // Act
      await controller.reload();

      // Assert
      verify(() => mockGetEventById(any())).called(2); // Initial + reload
      verify(() => mockCheckEligibility(any())).called(2); // Initial + reload
    });

    test('should refresh eligibility only', () async {
      // Arrange
      when(
        () => mockGetEventById(any()),
      ).thenAnswer((_) async => Right(mockEvent));
      when(
        () => mockCheckEligibility(any()),
      ).thenAnswer((_) async => Right(mockEligibility));

      final controller = container.read(
        eventDetailsControllerProvider(eventId, memberId).notifier,
      );

      // Wait for initial load
      await container.read(
        eventDetailsControllerProvider(eventId, memberId).future,
      );

      // Act
      await controller.refreshEligibility();

      // Assert
      verify(() => mockGetEventById(any())).called(1); // Only initial
      verify(() => mockCheckEligibility(any())).called(2); // Initial + refresh
    });
  });

  group('RSVPController', () {
    late MockCreateRSVP mockCreateRSVP;
    late MockUpdateRSVP mockUpdateRSVP;
    late MockCancelRSVP mockCancelRSVP;
    late ProviderContainer container;

    setUp(() {
      mockCreateRSVP = MockCreateRSVP();
      mockUpdateRSVP = MockUpdateRSVP();
      mockCancelRSVP = MockCancelRSVP();

      container = ProviderContainer(
        overrides: [
          createRSVPUseCaseProvider.overrideWithValue(mockCreateRSVP),
          updateRSVPUseCaseProvider.overrideWithValue(mockUpdateRSVP),
          cancelRSVPUseCaseProvider.overrideWithValue(mockCancelRSVP),
        ],
      );

      // Register fallback values
      registerFallbackValue(<String, dynamic>{});
      registerFallbackValue(CancelRSVPParams(rsvpId: rsvpId));
    });

    tearDown(() {
      container.dispose();
    });

    test('should create RSVP successfully', () async {
      // Arrange
      final input = {
        'eventId': eventId,
        'memberId': memberId,
        'response': 'yes',
        'attendanceCount': 1,
      };

      when(
        () => mockCreateRSVP(any()),
      ).thenAnswer((_) async => Right(mockRSVP));

      final controller = container.read(rSVPControllerProvider.notifier);

      // Act
      await controller.createRSVP(input);

      // Assert
      final state = container.read(rSVPControllerProvider);
      expect(state.value, isNotNull);
      expect(state.value!.id, rsvpId);
      verify(() => mockCreateRSVP(input)).called(1);
    });

    test('should handle create RSVP error', () async {
      // Arrange
      final input = {
        'eventId': eventId,
        'memberId': memberId,
        'response': 'yes',
      };

      when(
        () => mockCreateRSVP(any()),
      ).thenAnswer((_) async => Left(ValidationFailure('Invalid input')));

      final controller = container.read(rSVPControllerProvider.notifier);

      // Act
      await controller.createRSVP(input);

      // Assert
      final state = container.read(rSVPControllerProvider);
      expect(state.hasError, true);
      verify(() => mockCreateRSVP(input)).called(1);
    });

    test('should update RSVP successfully', () async {
      // Arrange
      final input = {'response': 'maybe', 'attendanceCount': 2};

      final updatedRSVP = EventRSVPEntity(
        id: mockRSVP.id,
        eventId: mockRSVP.eventId,
        memberId: mockRSVP.memberId,
        clubId: mockRSVP.clubId,
        response: RSVPResponse.maybe,
        rsvpType: mockRSVP.rsvpType,
        priority: mockRSVP.priority,
        attendanceCount: 2,
        guestNames: mockRSVP.guestNames,
        dietaryRestrictions: mockRSVP.dietaryRestrictions,
        status: mockRSVP.status,
        paymentRequired: mockRSVP.paymentRequired,
        paymentVerified: mockRSVP.paymentVerified,
        paymentAmount: mockRSVP.paymentAmount,
        feeWaived: mockRSVP.feeWaived,
        rsvpedAt: mockRSVP.rsvpedAt,
        updatedAt: DateTime.now(),
      );

      when(
        () => mockUpdateRSVP(any()),
      ).thenAnswer((_) async => Right(updatedRSVP));

      final controller = container.read(rSVPControllerProvider.notifier);

      // Act
      await controller.updateRSVP(rsvpId, input);

      // Assert
      final state = container.read(rSVPControllerProvider);
      expect(state.value, isNotNull);
      expect(state.value!.response, RSVPResponse.maybe);
      verify(
        () => mockUpdateRSVP(
          UpdateRSVPParams(rsvpId: rsvpId, input: input),
        ),
      ).called(1);
    });

    test('should cancel RSVP successfully', () async {
      // Arrange
      when(
        () => mockCancelRSVP(any()),
      ).thenAnswer((_) async => Right(mockCancelResponse));

      final controller = container.read(rSVPControllerProvider.notifier);

      // Act
      final result = await controller.cancelRSVP(
        rsvpId,
        reason: 'Schedule conflict',
      );

      // Assert
      expect(result.success, true);
      expect(result.refundAmount, 50.0);
      verify(() => mockCancelRSVP(any())).called(1);
    });

    test('should handle cancel RSVP error', () async {
      // Arrange
      when(
        () => mockCancelRSVP(any()),
      ).thenAnswer((_) async => const Left(NetworkFailure('Cancellation failed')));

      final controller = container.read(rSVPControllerProvider.notifier);

      // Act & Assert
      expect(() => controller.cancelRSVP(rsvpId), throwsA(isA<Exception>()));
    });
  });

  group('MyRSVPsController', () {
    late MockGetMyRSVPs mockGetMyRSVPs;
    late ProviderContainer container;

    final mockRSVPsConnection = RSVPsConnectionEntity(
      rsvps: [
        {
          'id': rsvpId,
          'eventId': eventId,
          'memberId': memberId,
          'clubId': clubId,
          'response': 'yes',
          'status': 'confirmed',
        },
      ],
      pageInfo: mockPageInfo,
      totalCount: 5,
    );

    setUp(() {
      mockGetMyRSVPs = MockGetMyRSVPs();

      container = ProviderContainer(
        overrides: [
          getMyRSVPsUseCaseProvider.overrideWithValue(mockGetMyRSVPs),
        ],
      );

      // Register fallback values
      registerFallbackValue(const GetMyRSVPsParams(clubId: clubId));
    });

    tearDown(() {
      container.dispose();
    });

    test('should load RSVPs on initialization', () async {
      // Arrange
      when(
        () => mockGetMyRSVPs(any()),
      ).thenAnswer((_) async => Right(mockRSVPsConnection));

      // Act
      final controller = container.read(
        myRSVPsControllerProvider(clubId).future,
      );

      // Assert
      final state = await controller;
      expect(state.rsvps, isNotEmpty);
      expect(state.pageInfo.hasNextPage, true);
      expect(state.isLoadingMore, false);
      verify(() => mockGetMyRSVPs(any())).called(1);
    });

    test('should handle loading error', () async {
      // Arrange
      when(
        () => mockGetMyRSVPs(any()),
      ).thenAnswer((_) async => Left(NetworkFailure('Network error')));

      // Act & Assert
      expect(
        () => container.read(myRSVPsControllerProvider(clubId).future),
        throwsA(isA<Exception>()),
      );
    });

    test('should apply status filter', () async {
      // Arrange
      when(
        () => mockGetMyRSVPs(any()),
      ).thenAnswer((_) async => Right(mockRSVPsConnection));

      final controller = container.read(
        myRSVPsControllerProvider(clubId).notifier,
      );

      // Act
      await controller.applyFilter(['confirmed', 'tentative']);

      // Assert
      final state = await container.read(
        myRSVPsControllerProvider(clubId).future,
      );
      expect(state.statusFilter, ['confirmed', 'tentative']);
      verify(() => mockGetMyRSVPs(any())).called(2); // Initial + applyFilter
    });

    test('should load more RSVPs on pagination', () async {
      // Arrange
      when(
        () => mockGetMyRSVPs(any()),
      ).thenAnswer((_) async => Right(mockRSVPsConnection));

      final controller = container.read(
        myRSVPsControllerProvider(clubId).notifier,
      );

      // Wait for initial load
      await container.read(myRSVPsControllerProvider(clubId).future);

      // Act
      await controller.loadMore();

      // Assert
      verify(() => mockGetMyRSVPs(any())).called(2); // Initial + loadMore
    });

    test('should refresh RSVPs list', () async {
      // Arrange
      when(
        () => mockGetMyRSVPs(any()),
      ).thenAnswer((_) async => Right(mockRSVPsConnection));

      final controller = container.read(
        myRSVPsControllerProvider(clubId).notifier,
      );

      // Wait for initial load
      await container.read(myRSVPsControllerProvider(clubId).future);

      // Act
      await controller.refresh();

      // Assert
      verify(() => mockGetMyRSVPs(any())).called(2); // Initial + refresh
    });
  });
}
