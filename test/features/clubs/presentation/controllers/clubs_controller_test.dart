import 'package:clubland/core/services/location_service.dart';
import 'package:clubland/features/clubs/data/datasources/clubs_remote_datasource.dart';
import 'package:clubland/features/clubs/data/models/club_model.dart';
import 'package:clubland/features/clubs/presentation/controllers/clubs_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mocktail/mocktail.dart';

class MockClubsRemoteDataSource extends Mock implements ClubsRemoteDataSource {}

class MockLocationService extends Mock implements LocationService {}

void main() {
  late MockClubsRemoteDataSource mockDataSource;
  late MockLocationService mockLocationService;
  late ProviderContainer container;

  setUp(() {
    mockDataSource = MockClubsRemoteDataSource();
    mockLocationService = MockLocationService();

    container = ProviderContainer(
      overrides: [
        clubsRemoteDataSourceProvider.overrideWithValue(mockDataSource),
        locationServiceProvider.overrideWithValue(mockLocationService),
      ],
    );
  });

  group('nearbyClubsProvider', () {
    test('should return a list of SimpleClub when location is available', () async {
      // Arrange
      final position = Position(latitude: 1.0, longitude: 1.0, timestamp: DateTime.now(), accuracy: 1, altitude: 1, heading: 1, speed: 1, speedAccuracy: 1, altitudeAccuracy: 1.0, headingAccuracy: 1.0);
      final clubs = [ClubModel(id: '1', name: 'Test Club', slug: 'test-club')];

      when(() => mockLocationService.getCurrentLocation()).thenAnswer((_) async => position);
      when(() => mockDataSource.getNearbyClubs(latitude: 1.0, longitude: 1.0, limit: 20)).thenAnswer((_) async => clubs);

      // Act
      final result = await container.read(nearbyClubsProvider.future);

      // Assert
      expect(result, isA<List<SimpleClub>>());
      expect(result.first.name, 'Test Club');
      verify(() => mockLocationService.getCurrentLocation()).called(1);
      verify(() => mockDataSource.getNearbyClubs(latitude: 1.0, longitude: 1.0, limit: 20)).called(1);
    });
  });
}
