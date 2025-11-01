import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mocktail/mocktail.dart';
import 'package:clubland/core/services/location_service.dart';

class MockGeolocator extends Mock implements GeolocatorPlatform {}

void main() {
  late LocationService locationService;
  late MockGeolocator mockGeolocator;

  setUp(() {
    mockGeolocator = MockGeolocator();
    locationService = LocationService();
    Geolocator.instance = mockGeolocator;
  });

  group('getCurrentLocation', () {
    test('should return a Position when location services are enabled and permission is granted', () async {
      // Arrange
      when(() => mockGeolocator.isLocationServiceEnabled()).thenAnswer((_) async => true);
      when(() => mockGeolocator.checkPermission()).thenAnswer((_) async => LocationPermission.always);
      when(() => mockGeolocator.getCurrentPosition()).thenAnswer((_) async => Position(latitude: 1, longitude: 1, timestamp: DateTime.now(), accuracy: 1, altitude: 1, heading: 1, speed: 1, speedAccuracy: 1, altitudeAccuracy: 1.0, headingAccuracy: 1.0));

      // Act
      final result = await locationService.getCurrentLocation();

      // Assert
      expect(result, isA<Position>());
    });

    test('should throw a LocationServiceDisabledException when location services are disabled', () async {
      // Arrange
      when(() => mockGeolocator.isLocationServiceEnabled()).thenAnswer((_) async => false);

      // Act & Assert
      expect(() => locationService.getCurrentLocation(), throwsA(isA<LocationServiceDisabledException>()));
    });

    test('should throw a LocationPermissionDeniedException when permission is denied', () async {
      // Arrange
      when(() => mockGeolocator.isLocationServiceEnabled()).thenAnswer((_) async => true);
      when(() => mockGeolocator.checkPermission()).thenAnswer((_) async => LocationPermission.denied);
      when(() => mockGeolocator.requestPermission()).thenAnswer((_) async => LocationPermission.denied);

      // Act & Assert
      expect(() => locationService.getCurrentLocation(), throwsA(isA<LocationPermissionDeniedException>()));
    });
  });
}
