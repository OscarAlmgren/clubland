import 'package:equatable/equatable.dart';

/// Cancel RSVP response entity - represents the result of cancelling an RSVP
class CancelRSVPResponseEntity extends Equatable {
  const CancelRSVPResponseEntity({
    required this.success,
    required this.message,
    this.cancellationFee,
    this.refundAmount,
    required this.feeWaived,
  });

  /// Whether the cancellation was successful
  final bool success;

  /// Message describing the cancellation result
  final String message;

  /// Cancellation fee charged (if any)
  final double? cancellationFee;

  /// Refund amount (if any)
  final double? refundAmount;

  /// Whether the cancellation fee was waived
  final bool feeWaived;

  /// Whether there is a cancellation fee
  bool get hasCancellationFee {
    return cancellationFee != null && cancellationFee! > 0 && !feeWaived;
  }

  /// Whether there is a refund
  bool get hasRefund {
    return refundAmount != null && refundAmount! > 0;
  }

  /// Whether cancellation is free
  bool get isFreeCancellation {
    return !hasCancellationFee;
  }

  @override
  List<Object?> get props => [
        success,
        message,
        cancellationFee,
        refundAmount,
        feeWaived,
      ];
}
