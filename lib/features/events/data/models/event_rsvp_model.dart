import '../../domain/entities/event_rsvp_entity.dart';

/// Event RSVP model - data layer representation with JSON serialization
class EventRSVPModel extends EventRSVPEntity {
  const EventRSVPModel({
    required super.id,
    required super.eventId,
    required super.memberId,
    required super.clubId,
    required super.response,
    required super.rsvpType,
    required super.priority,
    required super.attendanceCount,
    super.guestNames,
    super.dietaryRestrictions,
    super.seatingPreferences,
    super.specialRequests,
    required super.status,
    required super.paymentRequired,
    required super.paymentVerified,
    super.paymentAmount,
    super.cancellationFee,
    required super.feeWaived,
    super.waitlistPosition,
    required super.rsvpedAt,
    required super.updatedAt,
    super.cancelledAt,
    super.cancellationReason,
    super.approvedBy,
    super.approvedAt,
    super.declineReason,
  });

  /// Create EventRSVPModel from JSON
  factory EventRSVPModel.fromJson(Map<String, dynamic> json) {
    return EventRSVPModel(
      id: json['id'] as String,
      eventId: json['eventId'] as String,
      memberId: json['memberId'] as String,
      clubId: json['clubId'] as String,
      response: RSVPResponse.fromString(json['response'] as String),
      rsvpType: RSVPType.fromString(json['rsvpType'] as String),
      priority: json['priority'] as int? ?? 2,
      attendanceCount: json['attendanceCount'] as int? ?? 1,
      guestNames: (json['guestNames'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      dietaryRestrictions: (json['dietaryRestrictions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      seatingPreferences: json['seatingPreferences'] as String?,
      specialRequests: json['specialRequests'] as String?,
      status: RSVPStatus.fromString(json['status'] as String),
      paymentRequired: json['paymentRequired'] as bool? ?? false,
      paymentVerified: json['paymentVerified'] as bool? ?? false,
      paymentAmount: (json['paymentAmount'] as num?)?.toDouble(),
      cancellationFee: (json['cancellationFee'] as num?)?.toDouble(),
      feeWaived: json['feeWaived'] as bool? ?? false,
      waitlistPosition: json['waitlistPosition'] as int?,
      rsvpedAt: DateTime.parse(json['rsvpedAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      cancelledAt: json['cancelledAt'] != null
          ? DateTime.parse(json['cancelledAt'] as String)
          : null,
      cancellationReason: json['cancellationReason'] as String?,
      approvedBy: json['approvedBy'] as String?,
      approvedAt: json['approvedAt'] != null
          ? DateTime.parse(json['approvedAt'] as String)
          : null,
      declineReason: json['declineReason'] as String?,
    );
  }

  /// Convert EventRSVPModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'eventId': eventId,
      'memberId': memberId,
      'clubId': clubId,
      'response': response.toGraphQL(),
      'rsvpType': rsvpType.toGraphQL(),
      'priority': priority,
      'attendanceCount': attendanceCount,
      'guestNames': guestNames,
      'dietaryRestrictions': dietaryRestrictions,
      'seatingPreferences': seatingPreferences,
      'specialRequests': specialRequests,
      'status': status.toGraphQL(),
      'paymentRequired': paymentRequired,
      'paymentVerified': paymentVerified,
      'paymentAmount': paymentAmount,
      'cancellationFee': cancellationFee,
      'feeWaived': feeWaived,
      'waitlistPosition': waitlistPosition,
      'rsvpedAt': rsvpedAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'cancelledAt': cancelledAt?.toIso8601String(),
      'cancellationReason': cancellationReason,
      'approvedBy': approvedBy,
      'approvedAt': approvedAt?.toIso8601String(),
      'declineReason': declineReason,
    };
  }

  /// Convert entity to model
  factory EventRSVPModel.fromEntity(EventRSVPEntity entity) {
    return EventRSVPModel(
      id: entity.id,
      eventId: entity.eventId,
      memberId: entity.memberId,
      clubId: entity.clubId,
      response: entity.response,
      rsvpType: entity.rsvpType,
      priority: entity.priority,
      attendanceCount: entity.attendanceCount,
      guestNames: entity.guestNames,
      dietaryRestrictions: entity.dietaryRestrictions,
      seatingPreferences: entity.seatingPreferences,
      specialRequests: entity.specialRequests,
      status: entity.status,
      paymentRequired: entity.paymentRequired,
      paymentVerified: entity.paymentVerified,
      paymentAmount: entity.paymentAmount,
      cancellationFee: entity.cancellationFee,
      feeWaived: entity.feeWaived,
      waitlistPosition: entity.waitlistPosition,
      rsvpedAt: entity.rsvpedAt,
      updatedAt: entity.updatedAt,
      cancelledAt: entity.cancelledAt,
      cancellationReason: entity.cancellationReason,
      approvedBy: entity.approvedBy,
      approvedAt: entity.approvedAt,
      declineReason: entity.declineReason,
    );
  }
}
