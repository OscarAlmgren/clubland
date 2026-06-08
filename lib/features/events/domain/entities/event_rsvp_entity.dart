import 'package:equatable/equatable.dart';

import '../../../../core/graphql/graphql_api.dart';

/// Event RSVP entity - represents a member's RSVP to an event
class EventRSVPEntity extends Equatable {
  const EventRSVPEntity({
    required this.id,
    required this.eventId,
    required this.memberId,
    required this.clubId,
    required this.response,
    required this.rsvpType,
    required this.priority,
    required this.attendanceCount,
    required this.status,
    required this.paymentRequired,
    required this.paymentVerified,
    required this.feeWaived,
    required this.rsvpedAt,
    required this.updatedAt,
    this.guestNames = const [],
    this.dietaryRestrictions = const [],
    this.seatingPreferences,
    this.specialRequests,
    this.paymentAmount,
    this.cancellationFee,
    this.waitlistPosition,
    this.cancelledAt,
    this.cancellationReason,
    this.approvedBy,
    this.approvedAt,
    this.declineReason,
  });

  final String id;
  final String eventId;
  final String memberId;
  final String clubId;

  // RSVP details
  final Enum$RSVPResponse response;
  final Enum$RSVPType rsvpType;
  final int priority;

  // Attendance
  final int attendanceCount;
  final List<String> guestNames;
  final List<String> dietaryRestrictions;
  final String? seatingPreferences;
  final String? specialRequests;

  // Status
  final Enum$RSVPStatus status;

  // Payment
  final bool paymentRequired;
  final bool paymentVerified;
  final double? paymentAmount;

  // Cancellation
  final double? cancellationFee;
  final bool feeWaived;
  final DateTime? cancelledAt;
  final String? cancellationReason;

  // Waitlist
  final int? waitlistPosition;

  // Approval
  final String? approvedBy;
  final DateTime? approvedAt;
  final String? declineReason;

  // Timestamps
  final DateTime rsvpedAt;
  final DateTime updatedAt;

  /// Whether this RSVP is confirmed
  bool get isConfirmed => status == Enum$RSVPStatus.CONFIRMED;

  /// Whether this RSVP is on waitlist
  bool get isOnWaitlist => status == Enum$RSVPStatus.WAITLISTED;

  /// Whether this RSVP is pending approval
  bool get isPendingApproval => status == Enum$RSVPStatus.PENDING;

  /// Whether this RSVP is cancelled
  bool get isCancelled => status == Enum$RSVPStatus.CANCELLED;

  /// Whether this RSVP can be cancelled
  bool get canCancel {
    return status == Enum$RSVPStatus.CONFIRMED ||
        status == Enum$RSVPStatus.PENDING ||
        status == Enum$RSVPStatus.WAITLISTED;
  }

  /// Whether this RSVP can be modified
  bool get canModify {
    return status == Enum$RSVPStatus.CONFIRMED ||
        status == Enum$RSVPStatus.PENDING ||
        status == Enum$RSVPStatus.WAITLISTED;
  }

  /// Whether payment is pending
  bool get isPaymentPending => paymentRequired && !paymentVerified;

  /// Total number of attendees (self + guests)
  int get totalAttendees => attendanceCount;

  /// Number of guests (attendanceCount - 1, minimum 0)
  int get guestCount => attendanceCount > 0 ? attendanceCount - 1 : 0;

  @override
  List<Object?> get props => [
    id,
    eventId,
    memberId,
    clubId,
    response,
    rsvpType,
    priority,
    attendanceCount,
    guestNames,
    dietaryRestrictions,
    seatingPreferences,
    specialRequests,
    status,
    paymentRequired,
    paymentVerified,
    paymentAmount,
    cancellationFee,
    feeWaived,
    waitlistPosition,
    rsvpedAt,
    updatedAt,
    cancelledAt,
    cancellationReason,
    approvedBy,
    approvedAt,
    declineReason,
  ];
}
