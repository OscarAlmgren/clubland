import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mocktail/mocktail.dart';

import 'package:clubland/features/clubs/data/datasources/clubs_remote_datasource.dart';
import 'package:clubland/core/errors/exceptions.dart' as app_exceptions;

class MockGraphQLClient extends Mock implements GraphQLClient {}

void main() {
  late ClubsRemoteDataSource dataSource;
  late MockGraphQLClient mockClient;

  setUpAll(() {
    // Register fallback values for mocktail
    registerFallbackValue(QueryOptions<Map<String, dynamic>>(document: gql('')));
    registerFallbackValue(MutationOptions<Map<String, dynamic>>(document: gql('')));
  });

  setUp(() {
    mockClient = MockGraphQLClient();
    dataSource = ClubsRemoteDataSourceImpl(client: mockClient);
  });

  group('getClubs', () {
    test('should return a list of ClubModel when the call is successful', () async {
      // Arrange
      final mockData = {
        'clubs': {
          'nodes': [
            {
              'id': '1',
              'name': 'Test Club 1',
              'slug': 'test-club-1',
              'description': 'Description 1',
              'address': {
                'street': '123 Test St',
                'city': 'Test City',
                'state': 'TS',
                'zipCode': '12345',
                'country': 'Test Country',
              },
              'website': 'https://test.com',
              'status': 'ACTIVE',
              'createdAt': '2024-01-01T00:00:00Z',
              'updatedAt': '2024-01-01T00:00:00Z',
            },
          ],
        },
      };

      when(() => mockClient.query(any()))
          .thenAnswer((_) async => QueryResult(
                source: QueryResultSource.network,
                data: mockData,
                options: QueryOptions(document: gql('')),
              ));

      // Act
      final result = await dataSource.getClubs();

      // Assert
      expect(result.length, 1);
      expect(result.first.name, 'Test Club 1');
    });

    test('should throw NetworkException when the call fails', () async {
      // Arrange
      when(() => mockClient.query(any()))
          .thenAnswer((_) async => QueryResult(
                source: QueryResultSource.network,
                options: QueryOptions(document: gql('')),
                exception: OperationException(),
              ));

      // Act & Assert
      expect(
        () => dataSource.getClubs(),
        throwsA(isA<app_exceptions.NetworkException>()),
      );
    });
  });

  group('searchClubs', () {
    test('should return filtered clubs based on query', () async {
      // Arrange
      // datasource reads data['searchClubs']['nodes'] and builds each node from
      // m['id'], m['name'], m['slug'], m['description'], m['location'] (flat string)
      final mockData = {
        'searchClubs': {
          'nodes': [
            {
              'id': '1',
              'name': 'Test Club',
              'slug': 'test-club',
              'description': 'A test club',
              'location': 'Test City',
            },
          ],
        },
      };

      when(() => mockClient.query(any()))
          .thenAnswer((_) async => QueryResult(
                source: QueryResultSource.network,
                data: mockData,
                options: QueryOptions(document: gql('')),
              ));

      // Act
      final result = await dataSource.searchClubs(query: 'test');

      // Assert
      expect(result.length, 1);
      expect(result.first.name, 'Test Club');
    });
  });

  group('toggleFavoriteClub', () {
    test('should return club when toggling favorite', () async {
      // Arrange
      const clubId = '1';
      final mockClubData = {
        'club': {
          'id': clubId,
          'name': 'Test Club',
          'slug': 'test-club',
          'description': 'A test club',
          'address': {
            'street': '123 Test St',
            'city': 'Test City',
            'state': 'TS',
            'zipCode': '12345',
            'country': 'Test Country',
          },
          'website': 'https://test.com',
          'status': 'ACTIVE',
          'createdAt': '2024-01-01T00:00:00Z',
          'updatedAt': '2024-01-01T00:00:00Z',
        },
      };

      // toggleFavoriteClub calls mutate; stub it with null data (= no failure)
      when(() => mockClient.mutate(any()))
          .thenAnswer((_) async => QueryResult(
                source: QueryResultSource.network,
                options: MutationOptions(document: gql('')),
              ));
      // After mutate it calls getClubById, which calls query and reads data['club']
      when(() => mockClient.query(any()))
          .thenAnswer((_) async => QueryResult(
                source: QueryResultSource.network,
                data: mockClubData,
                options: QueryOptions(document: gql('')),
              ));

      // Act
      final result = await dataSource.toggleFavoriteClub(clubId);

      // Assert
      expect(result.id, clubId);
      expect(result.name, 'Test Club');
    });
  });

  group('getClubReviews', () {
    test('should return empty list when club has no reviews', () async {
      // Arrange - stub query to return empty nodes
      when(() => mockClient.query(any()))
          .thenAnswer((_) async => QueryResult(
                source: QueryResultSource.network,
                data: {'clubReviews': {'nodes': <dynamic>[]}},
                options: QueryOptions(document: gql('')),
              ));

      // Act
      final result = await dataSource.getClubReviews('1');

      // Assert
      expect(result, isEmpty);
    });
  });
}
