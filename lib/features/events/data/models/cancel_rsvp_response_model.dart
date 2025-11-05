import '../../domain/entities/cancel_rsvp_response_entity.dart';

/// Cancel RSVP response model - data layer representation with JSON serialization
class CancelRSVPResponseModel extends CancelRSVPResponseEntity {
  const CancelRSVPResponseModel({
    required super.success,
    required super.message,
    super.cancellationFee,
    super.refundAmount,
    required super.feeWaived,
  });

  /// Create CancelRSVPResponseModel from JSON
  factory CancelRSVPResponseModel.fromJson(Map<String, dynamic> json) {
    return CancelRSVPResponseModel(
      success: json['success'] as bool,
      message: json['message'] as String,
      cancellationFee: (json['cancellationFee'] as num?)?.toDouble(),
      refundAmount: (json['refundAmount'] as num?)?.toDouble(),
      feeWaived: json['feeWaived'] as bool? ?? false,
    );
  }

  /// Convert CancelRSVPResponseModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'cancellationFee': cancellationFee,
      'refundAmount': refundAmount,
      'feeWaived': feeWaived,
    };
  }
}
