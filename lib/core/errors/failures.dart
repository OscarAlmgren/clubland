import 'package:equatable/equatable.dart';

/// Severity level for failures to enable better error handling and user feedback
enum FailureSeverity {
  /// Low severity - informational, no user action needed
  info,

  /// Medium severity - warning, user should be aware
  warning,

  /// High severity - error, user action may be needed
  error,

  /// Critical severity - critical error, immediate user action required
  critical,
}

/// Base failure class for error handling in the Either pattern
abstract class Failure extends Equatable {
  /// Creates a new [Failure] instance.
  const Failure(
    this.message, [
    this.code,
    this.severity = FailureSeverity.error,
  ]);

  /// A human-readable message describing the failure.
  final String message;

  /// An optional unique code to identify the type of failure.
  final String? code;

  /// The severity level of this failure
  final FailureSeverity severity;

  /// Whether this failure can be retried
  bool get isRetryable => false;

  /// Whether this failure requires user action
  bool get requiresUserAction => severity == FailureSeverity.critical;

  @override
  List<Object?> get props => [message, code, severity];

  @override
  String toString() =>
      'Failure: $message${code != null ? ' (Code: $code)' : ''} [${severity.name}]';
}

/// Authentication related failures
class AuthFailure extends Failure {
  /// Creates an authentication failure with a message and optional code.
  const AuthFailure(
    super.message, [
    super.code,
    super.severity = FailureSeverity.error,
  ]);

  @override
  bool get isRetryable =>
      code == 'TOKEN_REFRESH_FAILED' || code == 'SESSION_EXPIRED';

  /// Factory constructor for invalid credentials error.
  factory AuthFailure.invalidCredentials() =>
      const AuthFailure('Invalid credentials provided', 'INVALID_CREDENTIALS');

  /// Factory constructor for session expiration error.
  factory AuthFailure.sessionExpired() =>
      const AuthFailure('Session has expired', 'SESSION_EXPIRED');

  /// Factory constructor for unauthorized access error.
  factory AuthFailure.unauthorized() =>
      const AuthFailure('Unauthorized access', 'UNAUTHORIZED');

  /// Factory constructor for biometric hardware not being available.
  factory AuthFailure.biometricNotAvailable() => const AuthFailure(
    'Biometric authentication not available',
    'BIOMETRIC_UNAVAILABLE',
  );

  /// Factory constructor for no biometric credentials being enrolled.
  factory AuthFailure.biometricNotEnrolled() => const AuthFailure(
    'No biometric credentials enrolled',
    'BIOMETRIC_NOT_ENROLLED',
  );

  /// Factory constructor for errors originating from the Hanko authentication service.
  factory AuthFailure.hankoError(String message) =>
      AuthFailure('Hanko authentication error: $message', 'HANKO_ERROR');

  /// Factory constructor for token refresh failure.
  factory AuthFailure.tokenRefreshFailed() => const AuthFailure(
    'Failed to refresh authentication token',
    'TOKEN_REFRESH_FAILED',
  );

  /// Factory constructor for unexpected authentication errors.
  factory AuthFailure.unexpected(String message) => AuthFailure(
    'Unexpected authentication error: $message',
    'UNEXPECTED_ERROR',
  );

  /// Factory constructor for an unimplemented authentication feature.
  factory AuthFailure.notImplemented() => const AuthFailure(
    'Authentication feature not implemented',
    'NOT_IMPLEMENTED',
  );
}

/// Network related failures
class NetworkFailure extends Failure {
  /// Creates a network failure with a message and optional code.
  const NetworkFailure(super.message, [super.code]);

  /// Factory constructor for no internet connection.
  factory NetworkFailure.noConnection() =>
      const NetworkFailure('No internet connection available', 'NO_CONNECTION');

  /// Factory constructor for request timeout.
  factory NetworkFailure.timeout() =>
      const NetworkFailure('Request timed out', 'TIMEOUT');

  /// Factory constructor for HTTP server errors (5xx status codes).
  factory NetworkFailure.serverError(int statusCode, String message) =>
      NetworkFailure('Server error: $message', 'SERVER_ERROR_$statusCode');

  /// Factory constructor for bad HTTP requests (4xx status codes).
  factory NetworkFailure.badRequest(String message) =>
      NetworkFailure('Bad request: $message', 'BAD_REQUEST');

  /// Factory constructor for resource not found error (404).
  factory NetworkFailure.notFound() =>
      const NetworkFailure('Resource not found', 'NOT_FOUND');

  /// Factory constructor for access forbidden error (403).
  factory NetworkFailure.forbidden() =>
      const NetworkFailure('Access forbidden', 'FORBIDDEN');

  /// Factory constructor for rate limit exceeded error (429).
  factory NetworkFailure.rateLimited() =>
      const NetworkFailure('Rate limit exceeded', 'RATE_LIMITED');
}

/// GraphQL specific failures
class GraphQLFailure extends Failure {
  /// Creates a GraphQL failure with an optional extensions map.
  const GraphQLFailure(super.message, [super.code, this.extensions]);

  /// Factory constructor for GraphQL validation errors.
  factory GraphQLFailure.validationError(
    String message, [
    Map<String, dynamic>? extensions,
  ]) => GraphQLFailure(
    'Validation error: $message',
    'VALIDATION_ERROR',
    extensions,
  );

  /// Factory constructor for GraphQL errors caused by business logic.
  factory GraphQLFailure.businessLogicError(String message) =>
      GraphQLFailure('Business logic error: $message', 'BUSINESS_LOGIC_ERROR');

  /// Factory constructor for subscription failure.
  factory GraphQLFailure.subscriptionFailed() => const GraphQLFailure(
    'GraphQL subscription failed',
    'SUBSCRIPTION_FAILED',
  );

  /// Factory constructor for a failed GraphQL query.
  factory GraphQLFailure.queryFailed(String query) =>
      GraphQLFailure('GraphQL query failed: $query', 'QUERY_FAILED');

  /// Factory constructor for a failed GraphQL mutation.
  factory GraphQLFailure.mutationFailed(String mutation) =>
      GraphQLFailure('GraphQL mutation failed: $mutation', 'MUTATION_FAILED');

  /// Additional data provided by the GraphQL server regarding the error.
  final Map<String, dynamic>? extensions;

  @override
  List<Object?> get props => [message, code, extensions];

  @override
  String toString() =>
      'GraphQLFailure: $message${code != null ? ' (Code: $code)' : ''}';
}

/// Local storage failures
class StorageFailure extends Failure {
  /// Creates a storage failure with a message and optional code.
  const StorageFailure(super.message, [super.code]);

  /// Factory constructor for encryption failure.
  factory StorageFailure.encryptionFailed() =>
      const StorageFailure('Failed to encrypt data', 'ENCRYPTION_FAILED');

  /// Factory constructor for decryption failure.
  factory StorageFailure.decryptionFailed() =>
      const StorageFailure('Failed to decrypt data', 'DECRYPTION_FAILED');

  /// Factory constructor for write operation error.
  factory StorageFailure.writeError() =>
      const StorageFailure('Failed to write to storage', 'WRITE_ERROR');

  /// Factory constructor for read operation error.
  factory StorageFailure.readError() =>
      const StorageFailure('Failed to read from storage', 'READ_ERROR');

  /// Factory constructor for corrupted storage data.
  factory StorageFailure.storageCorrupted() =>
      const StorageFailure('Storage is corrupted', 'STORAGE_CORRUPTED');

  /// Factory constructor for when the secure storage service is unavailable.
  factory StorageFailure.secureStorageUnavailable() => const StorageFailure(
    'Secure storage unavailable',
    'SECURE_STORAGE_UNAVAILABLE',
  );

  /// Factory constructor for storage quota exceeded error.
  factory StorageFailure.quotaExceeded() =>
      const StorageFailure('Storage quota exceeded', 'QUOTA_EXCEEDED');
}

/// Cache related failures
class CacheFailure extends Failure {
  /// Creates a cache failure with a message and optional code.
  const CacheFailure(super.message, [super.code]);

  /// Factory constructor for cache entry not found error.
  factory CacheFailure.notFound() =>
      const CacheFailure('Cache entry not found', 'CACHE_NOT_FOUND');

  /// Factory constructor for cache entry expired error.
  factory CacheFailure.expired() =>
      const CacheFailure('Cache entry expired', 'CACHE_EXPIRED');

  /// Factory constructor for corrupted cache data.
  factory CacheFailure.corruptedData() =>
      const CacheFailure('Cache data corrupted', 'CACHE_CORRUPTED');

  /// Factory constructor for cache write failure.
  factory CacheFailure.writeFailed() =>
      const CacheFailure('Failed to write to cache', 'CACHE_WRITE_FAILED');

  /// Factory constructor for cache read failure.
  factory CacheFailure.readFailed() =>
      const CacheFailure('Failed to read from cache', 'CACHE_READ_FAILED');

  /// Factory constructor for cache invalidation failure.
  factory CacheFailure.invalidationFailed() => const CacheFailure(
    'Failed to invalidate cache',
    'CACHE_INVALIDATION_FAILED',
  );

  /// Factory constructor for cache retrieval failure with details.
  factory CacheFailure.retrievalFailed(String error) => CacheFailure(
    'Failed to retrieve from cache: $error',
    'CACHE_RETRIEVAL_FAILED',
  );

  /// Factory constructor for cache storage failure with details.
  factory CacheFailure.storageFailed(String error) =>
      CacheFailure('Failed to store in cache: $error', 'CACHE_STORAGE_FAILED');

  /// Factory constructor for cache deletion failure with details.
  factory CacheFailure.deletionFailed(String error) => CacheFailure(
    'Failed to delete from cache: $error',
    'CACHE_DELETION_FAILED',
  );
}

/// Location and maps failures
class LocationFailure extends Failure {
  /// Creates a location failure with a message and optional code.
  const LocationFailure(super.message, [super.code]);

  /// Factory constructor for location permission denied error.
  factory LocationFailure.permissionDenied() =>
      const LocationFailure('Location permission denied', 'PERMISSION_DENIED');

  /// Factory constructor for location service disabled error.
  factory LocationFailure.serviceDisabled() =>
      const LocationFailure('Location service disabled', 'SERVICE_DISABLED');

  /// Factory constructor for location request timeout.
  factory LocationFailure.timeout() =>
      const LocationFailure('Location request timed out', 'LOCATION_TIMEOUT');

  /// Factory constructor for low location accuracy error.
  factory LocationFailure.accuracyTooLow() =>
      const LocationFailure('Location accuracy too low', 'ACCURACY_TOO_LOW');

  /// Factory constructor for geocoding failure.
  factory LocationFailure.geocodingFailed() =>
      const LocationFailure('Failed to geocode address', 'GEOCODING_FAILED');

  /// Factory constructor for an unknown location error.
  factory LocationFailure.unknown() =>
      const LocationFailure('Unknown location error', 'UNKNOWN_ERROR');
}

/// Validation failures
class ValidationFailure extends Failure {
  /// Creates a validation failure with an optional map of field errors.
  const ValidationFailure(super.message, [super.code, this.errors]);

  /// Factory constructor for invalid email format error.
  factory ValidationFailure.invalidEmail() =>
      const ValidationFailure('Invalid email format', 'INVALID_EMAIL');

  /// Factory constructor for invalid phone number format error.
  factory ValidationFailure.invalidPhoneNumber() =>
      const ValidationFailure('Invalid phone number format', 'INVALID_PHONE');

  /// Factory constructor for password strength requirement failure.
  factory ValidationFailure.passwordTooWeak() => const ValidationFailure(
    'Password does not meet requirements',
    'WEAK_PASSWORD',
  );

  /// Factory constructor for a required field being missing.
  factory ValidationFailure.fieldRequired(String fieldName) =>
      ValidationFailure('$fieldName is required', 'FIELD_REQUIRED');

  /// Factory constructor for multiple form validation errors.
  factory ValidationFailure.formErrors(Map<String, List<String>> errors) =>
      ValidationFailure(
        'Form validation failed',
        'FORM_VALIDATION_FAILED',
        errors,
      );

  /// Factory constructor for a generic invalid input error.
  factory ValidationFailure.invalidInput(String field, String value) =>
      ValidationFailure('Invalid input for $field: $value', 'INVALID_INPUT');

  /// A map containing specific errors for individual form fields.
  final Map<String, List<String>>? errors;

  @override
  List<Object?> get props => [message, code, errors];

  @override
  String toString() {
    var result =
        'ValidationFailure: $message${code != null ? ' (Code: $code)' : ''}';
    if (errors != null && errors!.isNotEmpty) {
      result += '\nErrors: $errors';
    }
    return result;
  }
}

/// Business logic failures
class BusinessLogicFailure extends Failure {
  /// Creates a business logic failure with a message and optional code.
  const BusinessLogicFailure(super.message, [super.code]);

  /// Factory constructor for booking time conflicts.
  factory BusinessLogicFailure.bookingConflict() =>
      const BusinessLogicFailure('Booking time conflict', 'BOOKING_CONFLICT');

  /// Factory constructor for insufficient user permissions.
  factory BusinessLogicFailure.insufficientPermissions() =>
      const BusinessLogicFailure(
        'Insufficient permissions',
        'INSUFFICIENT_PERMISSIONS',
      );

  /// Factory constructor for exceeded usage quota.
  factory BusinessLogicFailure.quotaExceeded() =>
      const BusinessLogicFailure('Usage quota exceeded', 'QUOTA_EXCEEDED');

  /// Factory constructor for an invalid operation given the current state.
  factory BusinessLogicFailure.invalidOperation() => const BusinessLogicFailure(
    'Invalid operation for current state',
    'INVALID_OPERATION',
  );

  /// Factory constructor for when a valid membership is required.
  factory BusinessLogicFailure.membershipRequired() =>
      const BusinessLogicFailure(
        'Valid membership required',
        'MEMBERSHIP_REQUIRED',
      );

  /// Factory constructor for when the club is not available for reciprocal visits.
  factory BusinessLogicFailure.clubNotAvailable() => const BusinessLogicFailure(
    'Club not available for reciprocal visits',
    'CLUB_NOT_AVAILABLE',
  );

  /// Factory constructor for when a user tries to start a visit while another is active.
  factory BusinessLogicFailure.visitAlreadyActive() =>
      const BusinessLogicFailure(
        'A visit is already active',
        'VISIT_ALREADY_ACTIVE',
      );

  /// Factory constructor for a missing reservation.
  factory BusinessLogicFailure.reservationNotFound() =>
      const BusinessLogicFailure(
        'Reservation not found',
        'RESERVATION_NOT_FOUND',
      );

  /// Factory constructor for checking in before the allowed time.
  factory BusinessLogicFailure.checkInTooEarly() =>
      const BusinessLogicFailure('Check-in is too early', 'CHECK_IN_TOO_EARLY');

  /// Factory constructor for checking in after the allowed time window.
  factory BusinessLogicFailure.checkInTooLate() =>
      const BusinessLogicFailure('Check-in is too late', 'CHECK_IN_TOO_LATE');
}

/// File and media failures
class MediaFailure extends Failure {
  /// Creates a media failure with a message and optional code.
  const MediaFailure(super.message, [super.code]);

  /// Factory constructor for unsupported file format error.
  factory MediaFailure.unsupportedFormat() =>
      const MediaFailure('Unsupported file format', 'UNSUPPORTED_FORMAT');

  /// Factory constructor for file size limit exceeded error.
  factory MediaFailure.fileTooLarge() =>
      const MediaFailure('File size exceeds limit', 'FILE_TOO_LARGE');

  /// Factory constructor for file upload failure.
  factory MediaFailure.uploadFailed() =>
      const MediaFailure('File upload failed', 'UPLOAD_FAILED');

  /// Factory constructor for corrupted file error.
  factory MediaFailure.corruptedFile() =>
      const MediaFailure('File is corrupted', 'CORRUPTED_FILE');

  /// Factory constructor for media access permission denied.
  factory MediaFailure.permissionDenied() => const MediaFailure(
    'Media access permission denied',
    'MEDIA_PERMISSION_DENIED',
  );

  /// Factory constructor for image compression failure.
  factory MediaFailure.compressionFailed() =>
      const MediaFailure('Image compression failed', 'COMPRESSION_FAILED');

  /// Factory constructor for file download failure.
  factory MediaFailure.downloadFailed() =>
      const MediaFailure('File download failed', 'DOWNLOAD_FAILED');
}

/// Platform specific failures
class PlatformFailure extends Failure {
  /// Creates a platform failure with a message and optional code.
  const PlatformFailure(super.message, [super.code]);

  /// Factory constructor for when the platform is not supported.
  factory PlatformFailure.unsupportedPlatform() =>
      const PlatformFailure('Platform not supported', 'UNSUPPORTED_PLATFORM');

  /// Factory constructor for when a feature is not available on the current platform.
  factory PlatformFailure.featureUnavailable() => const PlatformFailure(
    'Feature not available on this platform',
    'FEATURE_UNAVAILABLE',
  );

  /// Factory constructor for a generic native platform error.
  factory PlatformFailure.nativeError(String error) =>
      PlatformFailure('Native platform error: $error', 'NATIVE_ERROR');

  /// Factory constructor for a denied system permission.
  factory PlatformFailure.permissionDenied(String permission) =>
      PlatformFailure('Permission denied: $permission', 'PERMISSION_DENIED');

  /// Factory constructor for an unavailable platform service.
  factory PlatformFailure.serviceUnavailable(String service) =>
      PlatformFailure('Service unavailable: $service', 'SERVICE_UNAVAILABLE');
}

/// Unknown or unexpected failures
class UnknownFailure extends Failure {
  /// Creates an unknown failure with a message and optional code.
  const UnknownFailure(super.message, [super.code]);

  /// Factory constructor for a general unexpected error.
  factory UnknownFailure.unexpected(String error) =>
      UnknownFailure('Unexpected error: $error', 'UNEXPECTED_ERROR');

  /// Factory constructor for an unimplemented feature.
  factory UnknownFailure.notImplemented() =>
      const UnknownFailure('Feature not implemented', 'NOT_IMPLEMENTED');

  /// Factory constructor for a generic, uncategorized error.
  factory UnknownFailure.generic() =>
      const UnknownFailure('An unexpected error occurred', 'GENERIC_ERROR');
}
