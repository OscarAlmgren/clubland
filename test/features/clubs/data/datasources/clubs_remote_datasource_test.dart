import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mocktail/mocktail.dart';

import 'package:clubland/features/clubs/data/datasources/clubs_remote_datasource.dart';

class MockGraphQLClient extends Mock implements GraphQLClient {}

void main() {
  late ClubsRemoteDataSource dataSource;
  late MockGraphQLClient mockClient;

  setUp(() {
    mockClient = MockGraphQLClient();
    dataSource = ClubsRemoteDataSourceImpl(client: mockClient);
  });

  group('getClubs', () {
    test('should return a list of ClubModel when the call is successful', () async {
      // Arrange
      final queryResult = QueryResult(
        source: QueryResultSource.network,
        data: {
          'clubs': {
            'nodes': [
              {
                'id': '1',
                'name': 'Test Club 1',
                'slug': 'test-club-1',
                'description': 'Description 1',
              },
            ],
          },
        },
      );

      when(() => mockClient.query(any())).thenAnswer((_) async => queryResult);

      // Act
      final result = await dataSource.getClubs();

      // Assert
      expect(result.length, 1);
      expect(result.first.name, 'Test Club 1');
    });
  });
}
