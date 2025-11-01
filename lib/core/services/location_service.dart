import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

/// A service class to handle location-related functionalities.
class LocationService {
  /// Get the current device location.
  ///
  /// Throws a [LocationServiceDisabledException] if location services are disabled.
  /// Throws a [LocationPermissionDeniedException] if location permission is denied.
  Future<Position> getCurrentLocation() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw const LocationServiceDisabledException();
    }

    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      final newPermission = await Geolocator.requestPermission();
      if (newPermission == LocationPermission.denied) {
        throw const LocationPermissionDeniedException();
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw const LocationPermissionDeniedException();
    }

    return Geolocator.getCurrentPosition();
  }

  /// Opens the app settings for the user to manually enable location permission.
  Future<void> openAppSettings() async {
    await openAppSettings();
  }
}
