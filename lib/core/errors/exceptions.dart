/// Base exception class for all app-specific exceptions.
///
/// All custom application exceptions should extend this class to provide
/// consistent structure, including a message and an optional, standard code.
abstract class AppException implements Exception {
  /// Constructs an [AppException].
  const AppException(this.message, [this.code]);

  /// A human-readable description of the error.
  final String message;

  /// An optional machine-readable error code for standardized handling.
  final String? code;

  /// Returns a string representation of the exception, including the code if present.
  @override
  String toString() =>
      'AppException: $message${code != null ? ' (Code: $code)' : ''}';
}

/// Authentication related exceptions.
class AuthException extends AppException {
  /// Constructs an [AuthException].
  const AuthException(super.message, [super.code]);

  /// Creates an exception for when the provided username/password is incorrect.
  factory AuthException.invalidCredentials() => const AuthException(
    'Invalid credentials provided',
    'INVALID_CREDENTIALS',
  );

  /// Creates an exception when the user's session token has expired.
  factory AuthException.sessionExpired() =>
      const AuthException('Session has expired', 'SESSION_EXPIRED');

  /// Creates an exception for accessing a resource without proper authorization.
  factory AuthException.unauthorized() =>
      const AuthException('Unauthorized access', 'UNAUTHORIZED');

  /// Creates an exception when the device hardware does not support biometrics.
  factory AuthException.biometricNotAvailable() => const AuthException(
    'Biometric authentication not available',
    'BIOMETRIC_UNAVAILABLE',
  );

  /// Creates an exception when biometrics are supported but no credentials have been set up by the user.
  factory AuthException.biometricNotEnrolled() => const AuthException(
    'No biometric credentials enrolled',
    'BIOMETRIC_NOT_ENROLLED',
  );

  /// Creates an exception wrapping a specific error message from the Hanko authentication service.
  factory AuthException.hankoError(String message) =>
      AuthException('Hanko authentication error: $message', 'HANKO_ERROR');
}

/// Network related exceptions.
class NetworkException extends AppException {
  /// Constructs a [NetworkException].
  const NetworkException(super.message, [super.code]);

  /// Creates an exception for when the device lacks a network connection.
  factory NetworkException.noConnection() => const NetworkException(
    'No internet connection available',
    'NO_CONNECTION',
  );

  /// Creates an exception when a request fails to complete within the allotted time.
  factory NetworkException.timeout() =>
      const NetworkException('Request timed out', 'TIMEOUT');

  /// Creates an exception for errors originating from the server (e.g., 5xx status codes).
  factory NetworkException.serverError(int statusCode, String message) =>
      NetworkException('Server error: $message', 'SERVER_ERROR_$statusCode');

  /// Creates an exception for invalid requests sent to the server (e.g., malformed data, 400 status code).
  factory NetworkException.badRequest(String message) =>
      NetworkException('Bad request: $message', 'BAD_REQUEST');

  /// Creates an exception for resources that cannot be found (404 status code).
  factory NetworkException.notFound() =>
      const NetworkException('Resource not found', 'NOT_FOUND');

  /// Creates an exception for actions that are forbidden due to user role or policy (403 status code).
  factory NetworkException.forbidden() =>
      const NetworkException('Access forbidden', 'FORBIDDEN');
}

/// GraphQL specific exceptions.
class GraphQLException extends AppException {
  /// Constructs a [GraphQLException].
  const GraphQLException(super.message, [super.code, this.extensions]);

  /// Creates an exception for GraphQL errors related to input validation.
  factory GraphQLException.validationError(
    String message,
    Map<String, dynamic>? extensions,
  ) => GraphQLException(
    'Validation error: $message',
    'VALIDATION_ERROR',
    extensions,
  );

  /// Creates an exception for errors stemming from custom business logic in the GraphQL resolver.
  factory GraphQLException.businessLogicError(String message) =>
      GraphQLException(
        'Business logic error: $message',
        'BUSINESS_LOGIC_ERROR',
      );

  /// Creates an exception when the client has exceeded API rate limits.
  factory GraphQLException.rateLimited() =>
      const GraphQLException('Rate limit exceeded', 'RATE_LIMITED');

  /// Creates an exception for failures during blockchain or Web3 operations.
  factory GraphQLException.blockchainError(String message) => GraphQLException(
    'Blockchain operation failed: $message',
    'BLOCKCHAIN_ERROR',
  );

  /// Optional map of extensions provided by the GraphQL server, often containing specific error details.
  final Map<String, dynamic>? extensions;

  /// Returns a string representation of the exception.
  @override
  String toString() =>
      'GraphQLException: $message${code != null ? ' (Code: $code)' : ''}';
}

/// Local storage exceptions.
class StorageException extends AppException {
  /// Constructs a [StorageException].
  const StorageException(super.message, [super.code]);

  /// Creates an exception when data fails to be encrypted before storage.
  factory StorageException.encryptionFailed() =>
      const StorageException('Failed to encrypt data', 'ENCRYPTION_FAILED');

  /// Creates an exception when data fails to be decrypted upon retrieval.
  factory StorageException.decryptionFailed() =>
      const StorageException('Failed to decrypt data', 'DECRYPTION_FAILED');

  /// Creates an exception when an attempt to save data fails.
  factory StorageException.writeError() =>
      const StorageException('Failed to write to storage', 'WRITE_ERROR');

  /// Creates an exception when an attempt to load data fails.
  factory StorageException.readError() =>
      const StorageException('Failed to read from storage', 'READ_ERROR');

  /// Creates an exception indicating that the integrity of the stored data has been compromised.
  factory StorageException.storageCorrupted() =>
      const StorageException('Storage is corrupted', 'STORAGE_CORRUPTED');

  /// Creates an exception when platform-specific secure storage (e.g., iOS KeyChain, Android Keystore) is inaccessible.
  factory StorageException.secureStorageUnavailable() => const StorageException(
    'Secure storage unavailable',
    'SECURE_STORAGE_UNAVAILABLE',
  );
}

/// Location and maps exceptions.
class LocationException extends AppException {
  /// Constructs a [LocationException].
  const LocationException(super.message, [super.code]);

  /// Creates an exception when the app is denied permission to access the device's location.
  factory LocationException.permissionDenied() => const LocationException(
    'Location permission denied',
    'PERMISSION_DENIED',
  );

  /// Creates an exception when the device's location service (GPS) is turned off.
  factory LocationException.serviceDisabled() =>
      const LocationException('Location service disabled', 'SERVICE_DISABLED');

  /// Creates an exception when a location request fails to return a result within the allowed time.
  factory LocationException.timeout() =>
      const LocationException('Location request timed out', 'LOCATION_TIMEOUT');

  /// Creates a generic exception for location fetching failures not covered by other types.
  factory LocationException.unknown() =>
      const LocationException('Unknown location error', 'UNKNOWN_ERROR');
}

/// Cache related exceptions.
class CacheException extends AppException {
  /// Constructs a [CacheException].
  const CacheException(super.message, [super.code]);

  /// Creates an exception when a requested cache entry does not exist.
  factory CacheException.notFound() =>
      const CacheException('Cache entry not found', 'CACHE_NOT_FOUND');

  /// Creates an exception when a cache entry is found but its time-to-live (TTL) has been exceeded.
  factory CacheException.expired() =>
      const CacheException('Cache entry expired', 'CACHE_EXPIRED');

  /// Creates an exception when cache data is retrieved but cannot be deserialized or is invalid.
  factory CacheException.corruptedData() =>
      const CacheException('Cache data corrupted', 'CACHE_CORRUPTED');

  /// Creates an exception when saving data to the cache fails.
  factory CacheException.writeFailed() =>
      const CacheException('Failed to write to cache', 'CACHE_WRITE_FAILED');

  /// Creates an exception when retrieving data from the cache fails.
  factory CacheException.readFailed() =>
      const CacheException('Failed to read from cache', 'CACHE_READ_FAILED');
}

/// Validation exceptions, typically client-side.
class ValidationException extends AppException {
  /// Constructs a [ValidationException].
  const ValidationException(super.message, [super.code, this.errors]);

  /// Creates an exception for an invalid email format.
  factory ValidationException.invalidEmail() =>
      const ValidationException('Invalid email format', 'INVALID_EMAIL');

  /// Creates an exception for an invalid phone number format.
  factory ValidationException.invalidPhoneNumber() =>
      const ValidationException('Invalid phone number format', 'INVALID_PHONE');

  /// Creates an exception for a password that fails to meet complexity requirements.
  factory ValidationException.passwordTooWeak() => const ValidationException(
    'Password does not meet requirements',
    'WEAK_PASSWORD',
  );

  /// Creates an exception for a field that was left empty or null.
  factory ValidationException.fieldRequired(String fieldName) =>
      ValidationException('$fieldName is required', 'FIELD_REQUIRED');

  /// Creates an exception that aggregates multiple validation errors from a form submission.
  factory ValidationException.formErrors(Map<String, List<String>> errors) =>
      ValidationException(
        'Form validation failed',
        'FORM_VALIDATION_FAILED',
        errors,
      );

  /// A map detailing specific validation errors, where the key is the field name.
  final Map<String, List<String>>? errors;

  /// Returns a string representation of the exception, including detailed field errors if present.
  @override
  String toString() {
    var result =
        'ValidationException: $message${code != null ? ' (Code: $code)' : ''}';
    if (errors != null && errors!.isNotEmpty) {
      result += '\nErrors: $errors';
    }
    return result;
  }
}

/// Business logic exceptions, stemming from domain rules.
class BusinessLogicException extends AppException {
  /// Constructs a [BusinessLogicException].
  const BusinessLogicException(super.message, [super.code]);

  /// Creates an exception when an attempted booking overlaps with an existing one.
  factory BusinessLogicException.bookingConflict() =>
      const BusinessLogicException('Booking time conflict', 'BOOKING_CONFLICT');

  /// Creates an exception when the authenticated user attempts an action they are not permitted to do.
  factory BusinessLogicException.insufficientPermissions() =>
      const BusinessLogicException(
        'Insufficient permissions',
        'INSUFFICIENT_PERMISSIONS',
      );

  /// Creates an exception when a user attempts to exceed a defined usage limit (e.g., number of monthly bookings).
  factory BusinessLogicException.quotaExceeded() =>
      const BusinessLogicException('Usage quota exceeded', 'QUOTA_EXCEEDED');

  /// Creates an exception when an action is attempted that is not valid given the current state of the system or resource.
  factory BusinessLogicException.invalidOperation() =>
      const BusinessLogicException(
        'Invalid operation for current state',
        'INVALID_OPERATION',
      );

  /// Creates an exception when an action requires a specific membership status that the user lacks.
  factory BusinessLogicException.membershipRequired() =>
      const BusinessLogicException(
        'Valid membership required',
        'MEMBERSHIP_REQUIRED',
      );

  /// Creates an exception when a partner club cannot be booked due to policy or availability.
  factory BusinessLogicException.clubNotAvailable() =>
      const BusinessLogicException(
        'Club not available for reciprocal visits',
        'CLUB_NOT_AVAILABLE',
      );
}

/// File and media exceptions.
class MediaException extends AppException {
  /// Constructs a [MediaException].
  const MediaException(super.message, [super.code]);

  /// Creates an exception when a file or media stream is of an unsupported format (e.g., attempting to upload a .zip instead of .jpg).
  factory MediaException.unsupportedFormat() =>
      const MediaException('Unsupported file format', 'UNSUPPORTED_FORMAT');

  /// Creates an exception when a file exceeds the maximum allowed size.
  factory MediaException.fileTooLarge() =>
      const MediaException('File size exceeds limit', 'FILE_TOO_LARGE');

  /// Creates an exception when the process of uploading a file fails mid-transfer.
  factory MediaException.uploadFailed() =>
      const MediaException('File upload failed', 'UPLOAD_FAILED');

  /// Creates an exception when a file is found to be damaged or unreadable.
  factory MediaException.corruptedFile() =>
      const MediaException('File is corrupted', 'CORRUPTED_FILE');

  /// Creates an exception when the user denies permission to access the device's media library or camera.
  factory MediaException.permissionDenied() => const MediaException(
    'Media access permission denied',
    'MEDIA_PERMISSION_DENIED',
  );
}

/// Platform specific exceptions, usually related to native features.
class PlatformException extends AppException {
  /// Constructs a [PlatformException].
  const PlatformException(super.message, [super.code]);

  /// Creates an exception when the application is run on a platform that is explicitly not supported.
  factory PlatformException.unsupportedPlatform() =>
      const PlatformException('Platform not supported', 'UNSUPPORTED_PLATFORM');

  /// Creates an exception when a native feature (like NFC or a specific sensor) is unavailable on the current device.
  factory PlatformException.featureUnavailable() => const PlatformException(
    'Feature not available on this platform',
    'FEATURE_UNAVAILABLE',
  );

  /// Creates an exception that wraps a raw error message received from the native (Android/iOS) platform.
  factory PlatformException.nativeError(String error) =>
      PlatformException('Native platform error: $error', 'NATIVE_ERROR');
}
