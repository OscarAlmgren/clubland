/// Base exception class for all app-specific exceptions
abstract class AppException implements Exception {
  const AppException(this.message, [this.code]);

  final String message;
  final String? code;

  @override
  String toString() => 'AppException: $message${code != null ? ' (Code: $code)' : ''}';
}

/// Authentication related exceptions
class AuthException extends AppException {
  const AuthException(String message, [String? code]) : super(message, code);

  factory AuthException.invalidCredentials() =>
      const AuthException('Invalid credentials provided', 'INVALID_CREDENTIALS');

  factory AuthException.sessionExpired() =>
      const AuthException('Session has expired', 'SESSION_EXPIRED');

  factory AuthException.unauthorized() =>
      const AuthException('Unauthorized access', 'UNAUTHORIZED');

  factory AuthException.biometricNotAvailable() =>
      const AuthException('Biometric authentication not available', 'BIOMETRIC_UNAVAILABLE');

  factory AuthException.biometricNotEnrolled() =>
      const AuthException('No biometric credentials enrolled', 'BIOMETRIC_NOT_ENROLLED');

  factory AuthException.hankoError(String message) =>
      AuthException('Hanko authentication error: $message', 'HANKO_ERROR');
}

/// Network related exceptions
class NetworkException extends AppException {
  const NetworkException(String message, [String? code]) : super(message, code);

  factory NetworkException.noConnection() =>
      const NetworkException('No internet connection available', 'NO_CONNECTION');

  factory NetworkException.timeout() =>
      const NetworkException('Request timed out', 'TIMEOUT');

  factory NetworkException.serverError(int statusCode, String message) =>
      NetworkException('Server error: $message', 'SERVER_ERROR_$statusCode');

  factory NetworkException.badRequest(String message) =>
      NetworkException('Bad request: $message', 'BAD_REQUEST');

  factory NetworkException.notFound() =>
      const NetworkException('Resource not found', 'NOT_FOUND');

  factory NetworkException.forbidden() =>
      const NetworkException('Access forbidden', 'FORBIDDEN');
}

/// GraphQL specific exceptions
class GraphQLException extends AppException {
  const GraphQLException(String message, [String? code, this.extensions]) : super(message, code);

  final Map<String, dynamic>? extensions;

  factory GraphQLException.validationError(String message, Map<String, dynamic>? extensions) =>
      GraphQLException('Validation error: $message', 'VALIDATION_ERROR', extensions);

  factory GraphQLException.businessLogicError(String message) =>
      GraphQLException('Business logic error: $message', 'BUSINESS_LOGIC_ERROR');

  factory GraphQLException.rateLimited() =>
      const GraphQLException('Rate limit exceeded', 'RATE_LIMITED');

  factory GraphQLException.blockchainError(String message) =>
      GraphQLException('Blockchain operation failed: $message', 'BLOCKCHAIN_ERROR');

  @override
  String toString() => 'GraphQLException: $message${code != null ? ' (Code: $code)' : ''}';
}

/// Local storage exceptions
class StorageException extends AppException {
  const StorageException(String message, [String? code]) : super(message, code);

  factory StorageException.encryptionFailed() =>
      const StorageException('Failed to encrypt data', 'ENCRYPTION_FAILED');

  factory StorageException.decryptionFailed() =>
      const StorageException('Failed to decrypt data', 'DECRYPTION_FAILED');

  factory StorageException.writeError() =>
      const StorageException('Failed to write to storage', 'WRITE_ERROR');

  factory StorageException.readError() =>
      const StorageException('Failed to read from storage', 'READ_ERROR');

  factory StorageException.storageCorrupted() =>
      const StorageException('Storage is corrupted', 'STORAGE_CORRUPTED');

  factory StorageException.secureStorageUnavailable() =>
      const StorageException('Secure storage unavailable', 'SECURE_STORAGE_UNAVAILABLE');
}

/// Location and maps exceptions
class LocationException extends AppException {
  const LocationException(String message, [String? code]) : super(message, code);

  factory LocationException.permissionDenied() =>
      const LocationException('Location permission denied', 'PERMISSION_DENIED');

  factory LocationException.serviceDisabled() =>
      const LocationException('Location service disabled', 'SERVICE_DISABLED');

  factory LocationException.timeout() =>
      const LocationException('Location request timed out', 'LOCATION_TIMEOUT');

  factory LocationException.unknown() =>
      const LocationException('Unknown location error', 'UNKNOWN_ERROR');
}

/// Cache related exceptions
class CacheException extends AppException {
  const CacheException(String message, [String? code]) : super(message, code);

  factory CacheException.notFound() =>
      const CacheException('Cache entry not found', 'CACHE_NOT_FOUND');

  factory CacheException.expired() =>
      const CacheException('Cache entry expired', 'CACHE_EXPIRED');

  factory CacheException.corruptedData() =>
      const CacheException('Cache data corrupted', 'CACHE_CORRUPTED');

  factory CacheException.writeFailed() =>
      const CacheException('Failed to write to cache', 'CACHE_WRITE_FAILED');

  factory CacheException.readFailed() =>
      const CacheException('Failed to read from cache', 'CACHE_READ_FAILED');
}

/// Validation exceptions
class ValidationException extends AppException {
  const ValidationException(String message, [String? code, this.errors]) : super(message, code);

  final Map<String, List<String>>? errors;

  factory ValidationException.invalidEmail() =>
      const ValidationException('Invalid email format', 'INVALID_EMAIL');

  factory ValidationException.invalidPhoneNumber() =>
      const ValidationException('Invalid phone number format', 'INVALID_PHONE');

  factory ValidationException.passwordTooWeak() =>
      const ValidationException('Password does not meet requirements', 'WEAK_PASSWORD');

  factory ValidationException.fieldRequired(String fieldName) =>
      ValidationException('$fieldName is required', 'FIELD_REQUIRED');

  factory ValidationException.formErrors(Map<String, List<String>> errors) =>
      ValidationException('Form validation failed', 'FORM_VALIDATION_FAILED', errors);

  @override
  String toString() {
    var result = 'ValidationException: $message${code != null ? ' (Code: $code)' : ''}';
    if (errors != null && errors!.isNotEmpty) {
      result += '\nErrors: ${errors.toString()}';
    }
    return result;
  }
}

/// Business logic exceptions
class BusinessLogicException extends AppException {
  const BusinessLogicException(String message, [String? code]) : super(message, code);

  factory BusinessLogicException.bookingConflict() =>
      const BusinessLogicException('Booking time conflict', 'BOOKING_CONFLICT');

  factory BusinessLogicException.insufficientPermissions() =>
      const BusinessLogicException('Insufficient permissions', 'INSUFFICIENT_PERMISSIONS');

  factory BusinessLogicException.quotaExceeded() =>
      const BusinessLogicException('Usage quota exceeded', 'QUOTA_EXCEEDED');

  factory BusinessLogicException.invalidOperation() =>
      const BusinessLogicException('Invalid operation for current state', 'INVALID_OPERATION');

  factory BusinessLogicException.membershipRequired() =>
      const BusinessLogicException('Valid membership required', 'MEMBERSHIP_REQUIRED');

  factory BusinessLogicException.clubNotAvailable() =>
      const BusinessLogicException('Club not available for reciprocal visits', 'CLUB_NOT_AVAILABLE');
}

/// File and media exceptions
class MediaException extends AppException {
  const MediaException(String message, [String? code]) : super(message, code);

  factory MediaException.unsupportedFormat() =>
      const MediaException('Unsupported file format', 'UNSUPPORTED_FORMAT');

  factory MediaException.fileTooLarge() =>
      const MediaException('File size exceeds limit', 'FILE_TOO_LARGE');

  factory MediaException.uploadFailed() =>
      const MediaException('File upload failed', 'UPLOAD_FAILED');

  factory MediaException.corruptedFile() =>
      const MediaException('File is corrupted', 'CORRUPTED_FILE');

  factory MediaException.permissionDenied() =>
      const MediaException('Media access permission denied', 'MEDIA_PERMISSION_DENIED');
}

/// Platform specific exceptions
class PlatformException extends AppException {
  const PlatformException(String message, [String? code]) : super(message, code);

  factory PlatformException.unsupportedPlatform() =>
      const PlatformException('Platform not supported', 'UNSUPPORTED_PLATFORM');

  factory PlatformException.featureUnavailable() =>
      const PlatformException('Feature not available on this platform', 'FEATURE_UNAVAILABLE');

  factory PlatformException.nativeError(String error) =>
      PlatformException('Native platform error: $error', 'NATIVE_ERROR');
}