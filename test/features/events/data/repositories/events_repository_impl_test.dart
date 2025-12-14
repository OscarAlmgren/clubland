import 'package:clubland/core/errors/exceptions.dart';
import 'package:clubland/core/errors/failures.dart';
import 'package:clubland/features/events/data/datasources/events_remote_datasource.dart';
import 'package:clubland/features/events/data/repositories/events_repository_impl.dart';
import 'package:clubland/features/events/domain/entities/event_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockEventsRemoteDataSource extends Mock
    implements EventsRemoteDataSource {}

void main() {
  late EventsRepositoryImpl repository;
  late MockEventsRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockEventsRemoteDataSource();
    repository =
        EventsRepositoryImpl(remoteDataSource: mockRemoteDataSource);
  });

  group('EventsRepositoryImpl -', () {
    const clubId = 'club123';

    group('getEvents', () {
      test('should return EventsConnectionEntity when API call succeeds',
          () async {
        // arrange
        final mockResponse = {
          'edges': [
            {
              'node': {
                'id': 'event1',
                'clubId': clubId,
                'title': 'Test Event',
                'description': 'Test Description',
                'eventType': 'dining',
                'startTime': DateTime(2025, 12, 1, 18).toIso8601String(),
                'endTime': DateTime(2025, 12, 1, 21).toIso8601String(),
                'location': 'Main Hall',
                'capacity': 50,
                'currentAttendees': 20,
                'availableSpots': 30,
                'guestPolicy': 'membersOnly',
                'requiresApproval': false,
                'requiresPayment': false,
                'allowsSubgroupPriority': false,
                'fullHouseExclusive': false,
                'createdAt': DateTime.now().toIso8601String(),
                'updatedAt': DateTime.now().toIso8601String(),
              },
            },
          ],
          'pageInfo': {
            'hasNextPage': true,
            'hasPreviousPage': false,
            'startCursor': 'cursor1',
            'endCursor': 'cursor2',
          },
          'totalCount': 1,
        };

        when(() => mockRemoteDataSource.getEvents(
              clubId: clubId,
              filters: any(named: 'filters'),
              page: any(named: 'page'),
              pageSize: any(named: 'pageSize'),
            )).thenAnswer((_) async => mockResponse);

        // act
        final result = await repository.getEvents(clubId: clubId);

        // assert
        expect(result.isRight(), true);
        result.fold(
          (failure) => fail('Should return Right'),
          (connection) {
            expect(connection.events.length, 1);
            expect(connection.events.first.id, 'event1');
            expect(connection.events.first.title, 'Test Event');
            expect(connection.totalCount, 1);
            expect(connection.pageInfo.hasNextPage, true);
            expect(connection.pageInfo.hasPreviousPage, false);
          },
        );
        verify(() => mockRemoteDataSource.getEvents(
              clubId: clubId,
              filters: null,
              page: 1,
              pageSize: 20,
            )).called(1);
      });

      test('should return empty list when no events exist', () async {
        // arrange
        final mockResponse = <String, dynamic>{
          'edges': <Map<String, dynamic>>[],
          'pageInfo': <String, dynamic>{
            'hasNextPage': false,
            'hasPreviousPage': false,
          },
          'totalCount': 0,
        };

        when(() => mockRemoteDataSource.getEvents(
              clubId: clubId,
              filters: any(named: 'filters'),
              page: any(named: 'page'),
              pageSize: any(named: 'pageSize'),
            )).thenAnswer((_) async => mockResponse);

        // act
        final result = await repository.getEvents(clubId: clubId);

        // assert
        expect(result.isRight(), true);
        result.fold(
          (failure) => fail('Should return Right'),
          (connection) {
            expect(connection.events, isEmpty);
            expect(connection.totalCount, 0);
          },
        );
      });

      test('should return AuthFailure when unauthenticated', () async {
        // arrange
        when(() => mockRemoteDataSource.getEvents(
              clubId: clubId,
              filters: any(named: 'filters'),
              page: any(named: 'page'),
              pageSize: any(named: 'pageSize'),
            )).thenThrow(
          const NetworkException('Not authenticated', 'UNAUTHENTICATED'),
        );

        // act
        final result = await repository.getEvents(clubId: clubId);

        // assert
        expect(result.isLeft(), true);
        result.fold(
          (failure) {
            expect(failure, isA<AuthFailure>());
            expect(failure.code, 'UNAUTHENTICATED');
          },
          (_) => fail('Should return Left'),
        );
      });

      test('should return NetworkFailure on network error', () async {
        // arrange
        when(() => mockRemoteDataSource.getEvents(
              clubId: clubId,
              filters: any(named: 'filters'),
              page: any(named: 'page'),
              pageSize: any(named: 'pageSize'),
            )).thenThrow(
          const NetworkException('Network error', 'NETWORK_ERROR'),
        );

        // act
        final result = await repository.getEvents(clubId: clubId);

        // assert
        expect(result.isLeft(), true);
        result.fold(
          (failure) {
            expect(failure, isA<NetworkFailure>());
            expect(failure.message, contains('Network error'));
          },
          (_) => fail('Should return Left'),
        );
      });

      test('should return GraphQLFailure on GraphQL error', () async {
        // arrange
        when(() => mockRemoteDataSource.getEvents(
              clubId: clubId,
              filters: any(named: 'filters'),
              page: any(named: 'page'),
              pageSize: any(named: 'pageSize'),
            )).thenThrow(
          const GraphQLException('GraphQL error', 'GRAPHQL_ERROR'),
        );

        // act
        final result = await repository.getEvents(clubId: clubId);

        // assert
        expect(result.isLeft(), true);
        result.fold(
          (failure) {
            expect(failure, isA<GraphQLFailure>());
            expect(failure.message, contains('GraphQL error'));
          },
          (_) => fail('Should return Left'),
        );
      });

      test('should handle filters and pagination parameters', () async {
        // arrange
        final filters = <String, dynamic>{'eventType': 'dining'};
        final mockResponse = <String, dynamic>{
          'edges': <Map<String, dynamic>>[],
          'pageInfo': <String, dynamic>{
            'hasNextPage': false,
            'hasPreviousPage': false,
          },
          'totalCount': 0,
        };

        when(() => mockRemoteDataSource.getEvents(
              clubId: clubId,
              filters: filters,
              page: 2,
              pageSize: 10,
            )).thenAnswer((_) async => mockResponse);

        // act
        final result = await repository.getEvents(
          clubId: clubId,
          filters: filters,
          page: 2,
          pageSize: 10,
        );

        // assert
        expect(result.isRight(), true);
        verify(() => mockRemoteDataSource.getEvents(
              clubId: clubId,
              filters: filters,
              page: 2,
              pageSize: 10,
            )).called(1);
      });
    });

    group('getUpcomingEvents', () {
      test('should return list of upcoming events', () async {
        // arrange
        final mockResponse = {
          'edges': [
            {
              'node': {
                'id': 'event1',
                'clubId': clubId,
                'title': 'Upcoming Event',
                'description': 'Description',
                'eventType': 'sports',
                'startTime': DateTime.now()
                    .add(const Duration(days: 1))
                    .toIso8601String(),
                'endTime': DateTime.now()
                    .add(const Duration(days: 1, hours: 2))
                    .toIso8601String(),
                'location': 'Sports Hall',
                'capacity': 30,
                'currentAttendees': 10,
                'availableSpots': 20,
                'guestPolicy': 'membersOnly',
                'requiresApproval': false,
                'requiresPayment': true,
                'price': 50.0,
                'allowsSubgroupPriority': false,
                'fullHouseExclusive': false,
                'createdAt': DateTime.now().toIso8601String(),
                'updatedAt': DateTime.now().toIso8601String(),
              },
            },
          ],
          'pageInfo': <String, dynamic>{},
          'totalCount': 1,
        };

        when(() => mockRemoteDataSource.getEvents(
              clubId: clubId,
              filters: any(named: 'filters'),
              pageSize: any(named: 'pageSize'),
            )).thenAnswer((_) async => mockResponse);

        // act
        final result = await repository.getUpcomingEvents(clubId: clubId);

        // assert
        expect(result.isRight(), true);
        result.fold(
          (failure) => fail('Should return Right'),
          (events) {
            expect(events.length, 1);
            expect(events.first.id, 'event1');
            expect(events.first.title, 'Upcoming Event');
            expect(events.first.eventType, EventType.sports);
          },
        );
      });

      test('should use default limit when not provided', () async {
        // arrange
        final mockResponse = <String, dynamic>{
          'edges': <Map<String, dynamic>>[],
          'pageInfo': <String, dynamic>{},
          'totalCount': 0,
        };

        when(() => mockRemoteDataSource.getEvents(
              clubId: clubId,
              filters: any(named: 'filters'),
              pageSize: 20,
            )).thenAnswer((_) async => mockResponse);

        // act
        await repository.getUpcomingEvents(clubId: clubId);

        // assert
        verify(() => mockRemoteDataSource.getEvents(
              clubId: clubId,
              filters: any(named: 'filters'),
              pageSize: 20,
            )).called(1);
      });

      test('should use custom limit when provided', () async {
        // arrange
        final mockResponse = <String, dynamic>{
          'edges': <Map<String, dynamic>>[],
          'pageInfo': <String, dynamic>{},
          'totalCount': 0,
        };

        when(() => mockRemoteDataSource.getEvents(
              clubId: clubId,
              filters: any(named: 'filters'),
              pageSize: 5,
            )).thenAnswer((_) async => mockResponse);

        // act
        await repository.getUpcomingEvents(clubId: clubId, limit: 5);

        // assert
        verify(() => mockRemoteDataSource.getEvents(
              clubId: clubId,
              filters: any(named: 'filters'),
              pageSize: 5,
            )).called(1);
      });

      test('should filter events by start date (upcoming)', () async {
        // arrange
        final mockResponse = <String, dynamic>{
          'edges': <Map<String, dynamic>>[],
          'pageInfo': <String, dynamic>{},
          'totalCount': 0,
        };

        when(() => mockRemoteDataSource.getEvents(
              clubId: clubId,
              filters: any(named: 'filters'),
              pageSize: any(named: 'pageSize'),
            )).thenAnswer((_) async => mockResponse);

        // act
        await repository.getUpcomingEvents(clubId: clubId);

        // assert
        final captured = verify(() => mockRemoteDataSource.getEvents(
              clubId: clubId,
              filters: captureAny(named: 'filters'),
              pageSize: any(named: 'pageSize'),
            )).captured;

        final filters = captured.first as Map<String, dynamic>;
        expect(filters.containsKey('startDate'), true);
      });
    });
  });
}
