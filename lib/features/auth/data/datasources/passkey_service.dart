import 'package:logger/logger.dart';
import 'package:passkeys/authenticator.dart';
import 'package:passkeys/exceptions.dart';
import 'package:passkeys_platform_interface/types/authenticate_request.dart';
import 'package:passkeys_platform_interface/types/register_request.dart';

import '../../../../core/errors/failures.dart';

/// Service that wraps the passkeys Flutter package to collect WebAuthn
/// credentials from the device platform (Face ID / fingerprint / security key).
class PasskeyService {
  PasskeyService({Logger? logger}) : _logger = logger ?? Logger();

  final Logger _logger;
  final PasskeyAuthenticator _authenticator = PasskeyAuthenticator();

  /// Triggers the platform WebAuthn login prompt.
  ///
  /// [options] is the raw `PublicKeyCredentialRequestOptions` JSON object
  /// returned by the backend `initiatePasskeyLogin` mutation.
  ///
  /// Returns a map matching `PasskeyCredentialInput` schema (id, rawId, type, response).
  /// Throws [AuthFailure] on cancellation or platform error.
  Future<Map<String, dynamic>> collectLoginCredential(
    Map<String, dynamic> options,
  ) async {
    try {
      _logger.d('Collecting passkey login credential from device');

      final request = AuthenticateRequestType.fromJson(
        options,
        preferImmediatelyAvailableCredentials: false,
      );

      final response = await _authenticator.authenticate(request);

      // response.toJson() returns the standard nested WebAuthn credential format
      return response.toJson();
    } on PasskeyAuthCancelledException {
      _logger.i('User cancelled passkey authentication');
      throw AuthFailure.passkeyCancelled();
    } catch (e, stackTrace) {
      _logger.e(
        'Passkey login credential collection failed',
        error: e,
        stackTrace: stackTrace,
      );
      throw AuthFailure.hankoError(e.toString());
    }
  }

  /// Triggers the platform WebAuthn registration prompt.
  ///
  /// [options] is the raw `PublicKeyCredentialCreationOptions` JSON object
  /// returned by the backend `initiatePasskeyRegistration` mutation.
  ///
  /// Returns a map matching `PasskeyCredentialInput` schema (id, rawId, type, response).
  /// Throws [AuthFailure] on cancellation or platform error.
  Future<Map<String, dynamic>> collectRegistrationCredential(
    Map<String, dynamic> options,
  ) async {
    try {
      _logger.d('Collecting passkey registration credential from device');

      final request = RegisterRequestType.fromJson(options);
      final response = await _authenticator.register(request);

      return response.toJson();
    } on PasskeyAuthCancelledException {
      _logger.i('User cancelled passkey registration');
      throw AuthFailure.passkeyCancelled();
    } catch (e, stackTrace) {
      _logger.e(
        'Passkey registration credential collection failed',
        error: e,
        stackTrace: stackTrace,
      );
      throw AuthFailure.hankoError(e.toString());
    }
  }
}
