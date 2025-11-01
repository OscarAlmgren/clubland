import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mocktail/mocktail.dart';

import 'package:clubland/features/clubs/data/datasources/clubs_remote_datasource.dart';
import 'package:clubland/core/errors/exceptions.dart' as app_exceptions;

class MockGraphQLClient extends Mock implements GraphQLClient {}

void main() {
  late ClubsRemoteDataSource dataSource;
  late MockGraphQLClient mockClient;

  setUp(() {
    mockClient = MockGraphQLClient();
    dataSource = ClubsRemoteDataSourceImpl(client: mockClient);
    registerFallbackValue(QueryOptions(document: gql('')));
    registerFallbackValue(MutationOptions(document: gql('')));
  });

  group('getClubs', () {
    test('should return a list of ClubModel when the call is successful', () async {
      // Arrange
      final mockData = {
        'clubs': [
          {
            'id': '1',
            'name': 'Test Club 1',
            'slug': 'test-club-1',
            'description': 'Description 1',
            'location': 'Test Location',
            'address': {
              'street': '123 Test St',
              'city': 'Test City',
              'state': 'TS',
              'postalCode': '12345',
              'country': 'Test Country',
            },
            'website': 'https://test.com',
            'status': 'ACTIVE',
            'createdAt': '2024-01-01T00:00:00Z',
            'updatedAt': '2024-01-01T00:00:00Z',
          },
        ],
      };

      when(() => mockClient.query<Map<String, dynamic>>(any()))
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
      when(() => mockClient.query<Map<String, dynamic>>(any()))
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
      final mockData = {
        'clubs': [
          {
            'id': '1',
            'name': 'Test Club',
            'slug': 'test-club',
            'description': 'A test club',
            'location': 'Test Location',
            'address': {
              'street': '123 Test St',
              'city': 'Test City',
              'state': 'TS',
              'postalCode': '12345',
              'country': 'Test Country',
            },
            'website': 'https://test.com',
            'status': 'ACTIVE',
            'createdAt': '2024-01-01T00:00:00Z',
            'updatedAt': '2024-01-01T00:00:00Z',
          },
        ],
      };

      when(() => mockClient.query<Map<String, dynamic>>(any()))
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
          'location': 'Test Location',
          'address': {
            'street': '123 Test St',
            'city': 'Test City',
            'state': 'TS',
            'postalCode': '12345',
            'country': 'Test Country',
          },
          'website': 'https://test.com',
          'status': 'ACTIVE',
          'createdAt': '2024-01-01T00:00:00Z',
          'updatedAt': '2024-01-01T00:00:00Z',
        },
      };

      when(() => mockClient.query<Map<String, dynamic>>(any()))
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
    test('should return empty list (not yet implemented)', () async {
      // Act
      final result = await dataSource.getClubReviews('1');

      // Assert
      expect(result, isEmpty);
    });
  });
}
