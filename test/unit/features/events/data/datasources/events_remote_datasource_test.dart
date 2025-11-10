import 'package:clubland/core/errors/exceptions.dart' as app_exceptions;
import 'package:clubland/features/events/data/datasources/events_remote_datasource.dart';
import 'package:clubland/features/events/data/models/cancel_rsvp_response_model.dart';
import 'package:clubland/features/events/data/models/event_model.dart';
import 'package:clubland/features/events/data/models/event_rsvp_model.dart';
import 'package:clubland/features/events/data/models/finding_friends_subgroup_model.dart';
import 'package:clubland/features/events/data/models/rsvp_eligibility_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:logger/logger.dart';
import 'package:mocktail/mocktail.dart';

class MockGraphQLClient extends Mock implements GraphQLClient {}

class MockLogger extends Mock implements Logger {}

class FakeQueryOptions extends Fake implements QueryOptions {}

class FakeMutationOptions extends Fake implements MutationOptions {}

class FakeSubscriptionOptions extends Fake implements SubscriptionOptions {}

void main() {
  late MockGraphQLClient mockClient;
  late MockLogger mockLogger;
  late EventsRemoteDataSourceImpl dataSource;

  setUpAll(() {
    // Register fallback values for mocktail
    registerFallbackValue(FakeQueryOptions());
    registerFallbackValue(FakeMutationOptions());
    registerFallbackValue(FakeSubscriptionOptions());
  });

  setUp(() {
    mockClient = MockGraphQLClient();
    mockLogger = MockLogger();
    dataSource = EventsRemoteDataSourceImpl(
      client: mockClient,
      logger: mockLogger,
    );
  });

  group('getEvents', () {
    const clubId = 'club123';
    const page = 1;
    const pageSize = 20;

    final mockEventsData = {
      'events': {
        'edges': [
          {
            'node': {
              'id': 'event1',
              'clubId': clubId,
              'title': 'Summer Gala',
              'description': 'Annual summer event',
              'eventType': 'SOCIAL',
              'startTime': '2024-07-01T18:00:00Z',
              'endTime': '2024-07-01T23:00:00Z',
              'location': 'Main Hall',
              'imageUrl': null,
              'capacity': 100,
              'currentAttendees': 50,
              'availableSpots': 50,
              'tentativeCount': 10,
              'waitlistCount': 0,
              'guestPolicy': 'FRIENDS_AND_FAMILY',
              'maxGuestsPerMember': 2,
              'requiresApproval': false,
              'requiresPayment': true,
              'price': 50.0,
              'cancellationDeadline': null,
              'freeCancellationDays': 3,
              'cancellationFeePercentage': 100.0,
              'allowsSubgroupPriority': false,
              'fullHouseExclusive': false,
              'rsvpDeadline': '2024-06-30T23:59:59Z',
              'subgroupId': null,
              'organizerName': 'John Doe',
              'contactEmail': 'john@club.com',
              'contactPhone': '+1234567890',
              'paymentInstructions': 'Pay at the door',
              'createdAt': '2024-06-01T10:00:00Z',
              'updatedAt': '2024-06-01T10:00:00Z',
            },
          },
        ],
        'pageInfo': {
          'hasNextPage': true,
          'hasPreviousPage': false,
          'startCursor': 'cursor1',
          'endCursor': 'cursor2',
        },
        'totalCount': 10,
      },
    };

    test('should return events data successfully', () async {
      // Arrange
      when(() => mockClient.query(any())).thenAnswer(
        (_) async => QueryResult(
          source: QueryResultSource.network,
          data: mockEventsData,
          options: QueryOptions(document: gql('')),
        ),
      );

      // Act
      final result = await dataSource.getEvents(clubId: clubId);

      // Assert
      expect(result, isA<Map<String, dynamic>>());
      expect(result['edges'], isA<List>());
      expect(result['totalCount'], 10);
      verify(() => mockClient.query(any())).called(1);
    });

    test('should throw NetworkException when GraphQL error occurs', () async {
      // Arrange
      when(() => mockClient.query(any())).thenAnswer(
        (_) async => QueryResult(
          source: QueryResultSource.network,
          options: QueryOptions(document: gql('')),
          exception: OperationException(
            graphqlErrors: [GraphQLError(message: 'Server error')],
          ),
        ),
      );

      // Act & Assert
      expect(
        () => dataSource.getEvents(clubId: clubId),
        throwsA(isA<app_exceptions.NetworkException>()),
      );
    });

    test('should throw NetworkException when no data received', () async {
      // Arrange
      when(() => mockClient.query(any())).thenAnswer(
        (_) async => QueryResult(
          source: QueryResultSource.network,
          data: {},
          options: QueryOptions(document: gql('')),
        ),
      );

      // Act & Assert
      expect(
        () => dataSource.getEvents(clubId: clubId),
        throwsA(isA<app_exceptions.NetworkException>()),
      );
    });
  });

  group('getEventById', () {
    const eventId = 'event123';

    final mockEventData = {
      'event': {
        'id': eventId,
        'clubId': 'club123',
        'title': 'Summer Gala',
        'description': 'Annual summer event',
        'eventType': 'SOCIAL',
        'startTime': '2024-07-01T18:00:00Z',
        'endTime': '2024-07-01T23:00:00Z',
        'location': 'Main Hall',
        'imageUrl': null,
        'capacity': 100,
        'currentAttendees': 50,
        'availableSpots': 50,
        'tentativeCount': 10,
        'waitlistCount': 0,
        'guestPolicy': 'FRIENDS_AND_FAMILY',
        'maxGuestsPerMember': 2,
        'requiresApproval': false,
        'requiresPayment': true,
        'price': 50.0,
        'cancellationDeadline': null,
        'freeCancellationDays': 3,
        'cancellationFeePercentage': 100.0,
        'allowsSubgroupPriority': false,
        'fullHouseExclusive': false,
        'rsvpDeadline': '2024-06-30T23:59:59Z',
        'subgroupId': null,
        'organizerName': 'John Doe',
        'contactEmail': 'john@club.com',
        'contactPhone': '+1234567890',
        'paymentInstructions': 'Pay at the door',
        'createdAt': '2024-06-01T10:00:00Z',
        'updatedAt': '2024-06-01T10:00:00Z',
      },
    };

    test('should return event model successfully', () async {
      // Arrange
      when(() => mockClient.query(any())).thenAnswer(
        (_) async => QueryResult(
          source: QueryResultSource.network,
          data: mockEventData,
          options: QueryOptions(document: gql('')),
        ),
      );

      // Act
      final result = await dataSource.getEventById(eventId);

      // Assert
      expect(result, isA<EventModel>());
      expect(result.id, eventId);
      expect(result.title, 'Summer Gala');
      verify(() => mockClient.query(any())).called(1);
    });

    test('should throw NetworkException when event not found', () async {
      // Arrange
      when(() => mockClient.query(any())).thenAnswer(
        (_) async => QueryResult(
          source: QueryResultSource.network,
          data: {'event': null},
          options: QueryOptions(document: gql('')),
        ),
      );

      // Act & Assert
      expect(
        () => dataSource.getEventById(eventId),
        throwsA(isA<app_exceptions.NetworkException>()),
      );
    });
  });

  group('checkRSVPEligibility', () {
    const eventId = 'event123';
    const memberId = 'member123';

    final mockEligibilityData = {
      'checkRSVPEligibility': {
        'eligible': true,
        'reason': null,
        'memberInGoodStanding': true,
        'hasOutstandingDebt': false,
        'debtAmount': null,
        'wouldBeWaitlisted': false,
        'estimatedWaitlistPosition': null,
        'availableSpots': 50,
        'priority': 2,
        'requiresApproval': false,
        'isSubgroupMember': false,
      },
    };

    test('should return eligibility model successfully', () async {
      // Arrange
      when(() => mockClient.query(any())).thenAnswer(
        (_) async => QueryResult(
          source: QueryResultSource.network,
          data: mockEligibilityData,
          options: QueryOptions(document: gql('')),
        ),
      );

      // Act
      final result = await dataSource.checkRSVPEligibility(
        eventId: eventId,
        memberId: memberId,
      );

      // Assert
      expect(result, isA<RSVPEligibilityModel>());
      expect(result.eligible, true);
      expect(result.availableSpots, 50);
      verify(() => mockClient.query(any())).called(1);
    });

    test('should return ineligible when member has debt', () async {
      // Arrange
      final ineligibleData = {
        'checkRSVPEligibility': {
          'eligible': false,
          'reason': 'Outstanding debt exceeds threshold',
          'memberInGoodStanding': false,
          'hasOutstandingDebt': true,
          'debtAmount': 150.0,
          'wouldBeWaitlisted': false,
          'estimatedWaitlistPosition': null,
          'availableSpots': 50,
          'priority': 2,
          'requiresApproval': false,
          'isSubgroupMember': false,
        },
      };

      when(() => mockClient.query(any())).thenAnswer(
        (_) async => QueryResult(
          source: QueryResultSource.network,
          data: ineligibleData,
          options: QueryOptions(document: gql('')),
        ),
      );

      // Act
      final result = await dataSource.checkRSVPEligibility(
        eventId: eventId,
        memberId: memberId,
      );

      // Assert
      expect(result.eligible, false);
      expect(result.hasOutstandingDebt, true);
      expect(result.debtAmount, 150.0);
    });
  });

  group('createRSVP', () {
    final input = {
      'eventId': 'event123',
      'memberId': 'member123',
      'clubId': 'club123',
      'response': 'YES',
      'attendanceCount': 2,
      'guestNames': ['Guest 1'],
      'dietaryRestrictions': ['Vegetarian'],
    };

    final mockRSVPData = {
      'createRSVP': {
        'id': 'rsvp123',
        'eventId': 'event123',
        'memberId': 'member123',
        'clubId': 'club123',
        'response': 'YES',
        'rsvpType': 'PRIMARY',
        'priority': 2,
        'attendanceCount': 2,
        'guestNames': ['Guest 1'],
        'dietaryRestrictions': ['Vegetarian'],
        'seatingPreferences': null,
        'specialRequests': null,
        'status': 'CONFIRMED',
        'paymentRequired': false,
        'paymentVerified': false,
        'paymentAmount': null,
        'cancellationFee': null,
        'feeWaived': false,
        'waitlistPosition': null,
        'rsvpedAt': '2024-06-15T10:00:00Z',
        'updatedAt': '2024-06-15T10:00:00Z',
        'cancelledAt': null,
        'cancellationReason': null,
        'approvedBy': null,
        'approvedAt': null,
        'declineReason': null,
      },
    };

    test('should create RSVP successfully', () async {
      // Arrange
      when(() => mockClient.mutate(any())).thenAnswer(
        (_) async => QueryResult(
          source: QueryResultSource.network,
          data: mockRSVPData,
          options: MutationOptions(document: gql('')),
        ),
      );

      // Act
      final result = await dataSource.createRSVP(input);

      // Assert
      expect(result, isA<EventRSVPModel>());
      expect(result.id, 'rsvp123');
      expect(result.status.name, 'confirmed');
      expect(result.attendanceCount, 2);
      verify(() => mockClient.mutate(any())).called(1);
    });

    test('should throw NetworkException on mutation error', () async {
      // Arrange
      when(() => mockClient.mutate(any())).thenAnswer(
        (_) async => QueryResult(
          source: QueryResultSource.network,
          options: MutationOptions(document: gql('')),
          exception: OperationException(
            graphqlErrors: [
              GraphQLError(
                message: 'Event is full',
                extensions: const {'code': 'VALIDATION_ERROR'},
              ),
            ],
          ),
        ),
      );

      // Act & Assert
      expect(
        () => dataSource.createRSVP(input),
        throwsA(isA<app_exceptions.NetworkException>()),
      );
    });
  });

  group('cancelRSVP', () {
    const rsvpId = 'rsvp123';

    final mockCancelData = {
      'cancelRSVP': {
        'success': true,
        'message': 'RSVP cancelled successfully',
        'cancellationFee': 25.0,
        'refundAmount': null,
        'feeWaived': false,
      },
    };

    test('should cancel RSVP successfully', () async {
      // Arrange
      when(() => mockClient.mutate(any())).thenAnswer(
        (_) async => QueryResult(
          source: QueryResultSource.network,
          data: mockCancelData,
          options: MutationOptions(document: gql('')),
        ),
      );

      // Act
      final result = await dataSource.cancelRSVP(rsvpId: rsvpId);

      // Assert
      expect(result, isA<CancelRSVPResponseModel>());
      expect(result.success, true);
      expect(result.cancellationFee, 25.0);
      verify(() => mockClient.mutate(any())).called(1);
    });

    test('should return free cancellation when within deadline', () async {
      // Arrange
      final freeCancelData = {
        'cancelRSVP': {
          'success': true,
          'message': 'RSVP cancelled successfully - no fee',
          'cancellationFee': 0.0,
          'refundAmount': null,
          'feeWaived': true,
        },
      };

      when(() => mockClient.mutate(any())).thenAnswer(
        (_) async => QueryResult(
          source: QueryResultSource.network,
          data: freeCancelData,
          options: MutationOptions(document: gql('')),
        ),
      );

      // Act
      final result = await dataSource.cancelRSVP(rsvpId: rsvpId);

      // Assert
      expect(result.cancellationFee, 0.0);
      expect(result.feeWaived, true);
    });
  });

  group('getFindingFriendsSubgroups', () {
    const clubId = 'club123';

    final mockSubgroupsData = {
      'findingFriendsSubgroups': [
        {
          'id': 'subgroup1',
          'clubId': clubId,
          'name': 'Vinna Vänner',
          'description': 'Finding friends social group',
          'memberCount': 25,
          'isActive': true,
          'organizerId': 'organizer1',
          'organizerName': 'Jane Doe',
        },
        {
          'id': 'subgroup2',
          'clubId': clubId,
          'name': 'Book Club',
          'description': 'Monthly book discussions',
          'memberCount': 15,
          'isActive': true,
          'organizerId': 'organizer2',
          'organizerName': 'John Smith',
        },
      ],
    };

    test('should return list of subgroups successfully', () async {
      // Arrange
      when(() => mockClient.query(any())).thenAnswer(
        (_) async => QueryResult(
          source: QueryResultSource.network,
          data: mockSubgroupsData,
          options: QueryOptions(document: gql('')),
        ),
      );

      // Act
      final result = await dataSource.getFindingFriendsSubgroups(
        clubId: clubId,
      );

      // Assert
      expect(result, isA<List<FindingFriendsSubgroupModel>>());
      expect(result.length, 2);
      expect(result.first.name, 'Vinna Vänner');
      expect(result.first.memberCount, 25);
      verify(() => mockClient.query(any())).called(1);
    });

    test('should return empty list when no subgroups exist', () async {
      // Arrange
      when(() => mockClient.query(any())).thenAnswer(
        (_) async => QueryResult(
          source: QueryResultSource.network,
          data: {'findingFriendsSubgroups': []},
          options: QueryOptions(document: gql('')),
        ),
      );

      // Act
      final result = await dataSource.getFindingFriendsSubgroups(
        clubId: clubId,
      );

      // Assert
      expect(result, isEmpty);
    });
  });

  group('error handling', () {
    test('should handle UNAUTHENTICATED error', () async {
      // Arrange
      when(() => mockClient.query(any())).thenAnswer(
        (_) async => QueryResult(
          source: QueryResultSource.network,
          options: QueryOptions(document: gql('')),
          exception: OperationException(
            graphqlErrors: [
              GraphQLError(
                message: 'Not authenticated',
                extensions: const {'code': 'UNAUTHENTICATED'},
              ),
            ],
          ),
        ),
      );

      // Act & Assert
      expect(
        () => dataSource.getEvents(clubId: 'test'),
        throwsA(
          isA<app_exceptions.NetworkException>().having(
            (e) => e.code,
            'code',
            'UNAUTHENTICATED',
          ),
        ),
      );
    });

    test('should handle NOT_FOUND error', () async {
      // Arrange
      when(() => mockClient.query(any())).thenAnswer(
        (_) async => QueryResult(
          source: QueryResultSource.network,
          options: QueryOptions(document: gql('')),
          exception: OperationException(
            graphqlErrors: [
              GraphQLError(
                message: 'Resource not found',
                extensions: const {
                  'code': 'NOT_FOUND',
                  'resourceId': 'event123',
                },
              ),
            ],
          ),
        ),
      );

      // Act & Assert
      expect(
        () => dataSource.getEventById('event123'),
        throwsA(isA<app_exceptions.NetworkException>()),
      );
    });

    test('should handle network connection error', () async {
      // Arrange
      when(() => mockClient.query(any())).thenAnswer(
        (_) async => QueryResult(
          source: QueryResultSource.network,
          options: QueryOptions(document: gql('')),
          exception: OperationException(
            linkException: const ServerException(
              parsedResponse: null,
            ),
          ),
        ),
      );

      // Act & Assert
      expect(
        () => dataSource.getEvents(clubId: 'test'),
        throwsA(isA<app_exceptions.NetworkException>()),
      );
    });
  });
}
