import 'package:equatable/equatable.dart';

/// Response from Hanko authentication API
class HankoAuthResponse extends Equatable {
  /// Constructs a [HankoAuthResponse]
  const HankoAuthResponse({
    required this.sessionId,
    required this.status,
    this.challenge,
    this.message,
  });

  /// Session ID for the authentication flow
  final String sessionId;

  /// Status of the authentication request
  final String status;

  /// Authentication challenge (for WebAuthn)
  final String? challenge;

  /// Optional message from the server
  final String? message;

  /// Create from JSON
  factory HankoAuthResponse.fromJson(Map<String, dynamic> json) {
    return HankoAuthResponse(
      sessionId: json['sessionId'] as String,
      status: json['status'] as String,
      challenge: json['challenge'] as String?,
      message: json['message'] as String?,
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'sessionId': sessionId,
      'status': status,
      if (challenge != null) 'challenge': challenge,
      if (message != null) 'message': message,
    };
  }

  @override
  List<Object?> get props => [sessionId, status, challenge, message];

  @override
  String toString() => 'HankoAuthResponse('
      'sessionId: $sessionId, '
      'status: $status, '
      'challenge: $challenge, '
      'message: $message'
      ')';
}