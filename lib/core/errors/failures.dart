import 'package:equatable/equatable.dart';

/// Base failure class for error handling in the Either pattern
abstract class Failure extends Equatable {
  const Failure(this.message, [this.code]);

  final String message;
  final String? code;

  @override
  List<Object?> get props => [message, code];

  @override
  String toString() =>
      'Failure: $message${code != null ? ' (Code: $code)' : ''}';
}

/// Authentication related failures
class AuthFailure extends Failure {
  const AuthFailure(super.message, [super.code]);

  factory AuthFailure.invalidCredentials() =>
      const AuthFailure('Invalid credentials provided', 'INVALID_CREDENTIALS');

  factory AuthFailure.sessionExpired() =>
      const AuthFailure('Session has expired', 'SESSION_EXPIRED');

  factory AuthFailure.unauthorized() =>
      const AuthFailure('Unauthorized access', 'UNAUTHORIZED');

  factory AuthFailure.biometricNotAvailable() => const AuthFailure(
    'Biometric authentication not available',
    'BIOMETRIC_UNAVAILABLE',
  );

  factory AuthFailure.biometricNotEnrolled() => const AuthFailure(
    'No biometric credentials enrolled',
    'BIOMETRIC_NOT_ENROLLED',
  );

  factory AuthFailure.hankoError(String message) =>
      AuthFailure('Hanko authentication error: $message', 'HANKO_ERROR');

  factory AuthFailure.tokenRefreshFailed() => const AuthFailure(
    'Failed to refresh authentication token',
    'TOKEN_REFRESH_FAILED',
  );

  factory AuthFailure.unexpected(String message) =>
      AuthFailure('Unexpected authentication error: $message', 'UNEXPECTED_ERROR');

  factory AuthFailure.notImplemented() =>
      const AuthFailure('Authentication feature not implemented', 'NOT_IMPLEMENTED');
}

/// Network related failures
class NetworkFailure extends Failure {
  const NetworkFailure(super.message, [super.code]);

  factory NetworkFailure.noConnection() =>
      const NetworkFailure('No internet connection available', 'NO_CONNECTION');

  factory NetworkFailure.timeout() =>
      const NetworkFailure('Request timed out', 'TIMEOUT');

  factory NetworkFailure.serverError(int statusCode, String message) =>
      NetworkFailure('Server error: $message', 'SERVER_ERROR_$statusCode');

  factory NetworkFailure.badRequest(String message) =>
      NetworkFailure('Bad request: $message', 'BAD_REQUEST');

  factory NetworkFailure.notFound() =>
      const NetworkFailure('Resource not found', 'NOT_FOUND');

  factory NetworkFailure.forbidden() =>
      const NetworkFailure('Access forbidden', 'FORBIDDEN');

  factory NetworkFailure.rateLimited() =>
      const NetworkFailure('Rate limit exceeded', 'RATE_LIMITED');
}

/// GraphQL specific failures
class GraphQLFailure extends Failure {
  const GraphQLFailure(super.message, [super.code, this.extensions]);

  final Map<String, dynamic>? extensions;

  factory GraphQLFailure.validationError(
    String message, [
    Map<String, dynamic>? extensions,
  ]) => GraphQLFailure(
    'Validation error: $message',
    'VALIDATION_ERROR',
    extensions,
  );

  factory GraphQLFailure.businessLogicError(String message) =>
      GraphQLFailure('Business logic error: $message', 'BUSINESS_LOGIC_ERROR');

  factory GraphQLFailure.subscriptionFailed() => const GraphQLFailure(
    'GraphQL subscription failed',
    'SUBSCRIPTION_FAILED',
  );

  factory GraphQLFailure.queryFailed(String query) =>
      GraphQLFailure('GraphQL query failed: $query', 'QUERY_FAILED');

  factory GraphQLFailure.mutationFailed(String mutation) =>
      GraphQLFailure('GraphQL mutation failed: $mutation', 'MUTATION_FAILED');

  @override
  List<Object?> get props => [message, code, extensions];

  @override
  String toString() =>
      'GraphQLFailure: $message${code != null ? ' (Code: $code)' : ''}';
}

/// Local storage failures
class StorageFailure extends Failure {
  const StorageFailure(super.message, [super.code]);

  factory StorageFailure.encryptionFailed() =>
      const StorageFailure('Failed to encrypt data', 'ENCRYPTION_FAILED');

  factory StorageFailure.decryptionFailed() =>
      const StorageFailure('Failed to decrypt data', 'DECRYPTION_FAILED');

  factory StorageFailure.writeError() =>
      const StorageFailure('Failed to write to storage', 'WRITE_ERROR');

  factory StorageFailure.readError() =>
      const StorageFailure('Failed to read from storage', 'READ_ERROR');

  factory StorageFailure.storageCorrupted() =>
      const StorageFailure('Storage is corrupted', 'STORAGE_CORRUPTED');

  factory StorageFailure.secureStorageUnavailable() => const StorageFailure(
    'Secure storage unavailable',
    'SECURE_STORAGE_UNAVAILABLE',
  );

  factory StorageFailure.quotaExceeded() =>
      const StorageFailure('Storage quota exceeded', 'QUOTA_EXCEEDED');
}

/// Cache related failures
class CacheFailure extends Failure {
  const CacheFailure(super.message, [super.code]);

  factory CacheFailure.notFound() =>
      const CacheFailure('Cache entry not found', 'CACHE_NOT_FOUND');

  factory CacheFailure.expired() =>
      const CacheFailure('Cache entry expired', 'CACHE_EXPIRED');

  factory CacheFailure.corruptedData() =>
      const CacheFailure('Cache data corrupted', 'CACHE_CORRUPTED');

  factory CacheFailure.writeFailed() =>
      const CacheFailure('Failed to write to cache', 'CACHE_WRITE_FAILED');

  factory CacheFailure.readFailed() =>
      const CacheFailure('Failed to read from cache', 'CACHE_READ_FAILED');

  factory CacheFailure.invalidationFailed() => const CacheFailure(
    'Failed to invalidate cache',
    'CACHE_INVALIDATION_FAILED',
  );

  factory CacheFailure.retrievalFailed(String error) =>
      CacheFailure('Failed to retrieve from cache: $error', 'CACHE_RETRIEVAL_FAILED');

  factory CacheFailure.storageFailed(String error) =>
      CacheFailure('Failed to store in cache: $error', 'CACHE_STORAGE_FAILED');

  factory CacheFailure.deletionFailed(String error) =>
      CacheFailure('Failed to delete from cache: $error', 'CACHE_DELETION_FAILED');
}

/// Location and maps failures
class LocationFailure extends Failure {
  const LocationFailure(super.message, [super.code]);

  factory LocationFailure.permissionDenied() =>
      const LocationFailure('Location permission denied', 'PERMISSION_DENIED');

  factory LocationFailure.serviceDisabled() =>
      const LocationFailure('Location service disabled', 'SERVICE_DISABLED');

  factory LocationFailure.timeout() =>
      const LocationFailure('Location request timed out', 'LOCATION_TIMEOUT');

  factory LocationFailure.accuracyTooLow() =>
      const LocationFailure('Location accuracy too low', 'ACCURACY_TOO_LOW');

  factory LocationFailure.geocodingFailed() =>
      const LocationFailure('Failed to geocode address', 'GEOCODING_FAILED');

  factory LocationFailure.unknown() =>
      const LocationFailure('Unknown location error', 'UNKNOWN_ERROR');
}

/// Validation failures
class ValidationFailure extends Failure {
  const ValidationFailure(super.message, [super.code, this.errors]);

  final Map<String, List<String>>? errors;

  factory ValidationFailure.invalidEmail() =>
      const ValidationFailure('Invalid email format', 'INVALID_EMAIL');

  factory ValidationFailure.invalidPhoneNumber() =>
      const ValidationFailure('Invalid phone number format', 'INVALID_PHONE');

  factory ValidationFailure.passwordTooWeak() => const ValidationFailure(
    'Password does not meet requirements',
    'WEAK_PASSWORD',
  );

  factory ValidationFailure.fieldRequired(String fieldName) =>
      ValidationFailure('$fieldName is required', 'FIELD_REQUIRED');

  factory ValidationFailure.formErrors(Map<String, List<String>> errors) =>
      ValidationFailure(
        'Form validation failed',
        'FORM_VALIDATION_FAILED',
        errors,
      );

  factory ValidationFailure.invalidInput(String field, String value) =>
      ValidationFailure('Invalid input for $field: $value', 'INVALID_INPUT');

  @override
  List<Object?> get props => [message, code, errors];

  @override
  String toString() {
    var result =
        'ValidationFailure: $message${code != null ? ' (Code: $code)' : ''}';
    if (errors != null && errors!.isNotEmpty) {
      result += '\nErrors: ${errors.toString()}';
    }
    return result;
  }
}

/// Business logic failures
class BusinessLogicFailure extends Failure {
  const BusinessLogicFailure(super.message, [super.code]);

  factory BusinessLogicFailure.bookingConflict() =>
      const BusinessLogicFailure('Booking time conflict', 'BOOKING_CONFLICT');

  factory BusinessLogicFailure.insufficientPermissions() =>
      const BusinessLogicFailure(
        'Insufficient permissions',
        'INSUFFICIENT_PERMISSIONS',
      );

  factory BusinessLogicFailure.quotaExceeded() =>
      const BusinessLogicFailure('Usage quota exceeded', 'QUOTA_EXCEEDED');

  factory BusinessLogicFailure.invalidOperation() => const BusinessLogicFailure(
    'Invalid operation for current state',
    'INVALID_OPERATION',
  );

  factory BusinessLogicFailure.membershipRequired() =>
      const BusinessLogicFailure(
        'Valid membership required',
        'MEMBERSHIP_REQUIRED',
      );

  factory BusinessLogicFailure.clubNotAvailable() => const BusinessLogicFailure(
    'Club not available for reciprocal visits',
    'CLUB_NOT_AVAILABLE',
  );

  factory BusinessLogicFailure.visitAlreadyActive() =>
      const BusinessLogicFailure(
        'A visit is already active',
        'VISIT_ALREADY_ACTIVE',
      );

  factory BusinessLogicFailure.reservationNotFound() =>
      const BusinessLogicFailure(
        'Reservation not found',
        'RESERVATION_NOT_FOUND',
      );

  factory BusinessLogicFailure.checkInTooEarly() =>
      const BusinessLogicFailure('Check-in is too early', 'CHECK_IN_TOO_EARLY');

  factory BusinessLogicFailure.checkInTooLate() =>
      const BusinessLogicFailure('Check-in is too late', 'CHECK_IN_TOO_LATE');
}

/// File and media failures
class MediaFailure extends Failure {
  const MediaFailure(super.message, [super.code]);

  factory MediaFailure.unsupportedFormat() =>
      const MediaFailure('Unsupported file format', 'UNSUPPORTED_FORMAT');

  factory MediaFailure.fileTooLarge() =>
      const MediaFailure('File size exceeds limit', 'FILE_TOO_LARGE');

  factory MediaFailure.uploadFailed() =>
      const MediaFailure('File upload failed', 'UPLOAD_FAILED');

  factory MediaFailure.corruptedFile() =>
      const MediaFailure('File is corrupted', 'CORRUPTED_FILE');

  factory MediaFailure.permissionDenied() => const MediaFailure(
    'Media access permission denied',
    'MEDIA_PERMISSION_DENIED',
  );

  factory MediaFailure.compressionFailed() =>
      const MediaFailure('Image compression failed', 'COMPRESSION_FAILED');

  factory MediaFailure.downloadFailed() =>
      const MediaFailure('File download failed', 'DOWNLOAD_FAILED');
}

/// Platform specific failures
class PlatformFailure extends Failure {
  const PlatformFailure(super.message, [super.code]);

  factory PlatformFailure.unsupportedPlatform() =>
      const PlatformFailure('Platform not supported', 'UNSUPPORTED_PLATFORM');

  factory PlatformFailure.featureUnavailable() => const PlatformFailure(
    'Feature not available on this platform',
    'FEATURE_UNAVAILABLE',
  );

  factory PlatformFailure.nativeError(String error) =>
      PlatformFailure('Native platform error: $error', 'NATIVE_ERROR');

  factory PlatformFailure.permissionDenied(String permission) =>
      PlatformFailure('Permission denied: $permission', 'PERMISSION_DENIED');

  factory PlatformFailure.serviceUnavailable(String service) =>
      PlatformFailure('Service unavailable: $service', 'SERVICE_UNAVAILABLE');
}

/// Unknown or unexpected failures
class UnknownFailure extends Failure {
  const UnknownFailure(super.message, [super.code]);

  factory UnknownFailure.unexpected(String error) =>
      UnknownFailure('Unexpected error: $error', 'UNEXPECTED_ERROR');

  factory UnknownFailure.notImplemented() =>
      const UnknownFailure('Feature not implemented', 'NOT_IMPLEMENTED');

  factory UnknownFailure.generic() =>
      const UnknownFailure('An unexpected error occurred', 'GENERIC_ERROR');
}
