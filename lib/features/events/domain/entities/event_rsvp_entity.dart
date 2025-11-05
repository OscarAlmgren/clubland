import 'package:equatable/equatable.dart';

/// RSVP response enumeration
enum RSVPResponse {
  yes,
  maybe,
  no;

  /// Convert from GraphQL string
  static RSVPResponse fromString(String value) {
    return RSVPResponse.values.firstWhere(
      (e) => e.name.toLowerCase() == value.toLowerCase(),
      orElse: () => RSVPResponse.no,
    );
  }

  /// Convert to GraphQL string
  String toGraphQL() {
    return name.toUpperCase();
  }
}

/// RSVP type enumeration
enum RSVPType {
  primary, // Home club member
  reciprocal, // Visiting reciprocal member
  subgroup; // Finding Friends subgroup member

  /// Convert from GraphQL string
  static RSVPType fromString(String value) {
    return RSVPType.values.firstWhere(
      (e) => e.name.toLowerCase() == value.toLowerCase(),
      orElse: () => RSVPType.primary,
    );
  }

  /// Convert to GraphQL string
  String toGraphQL() {
    return name.toUpperCase();
  }
}

/// RSVP status enumeration
enum RSVPStatus {
  confirmed,
  tentative,
  pendingApproval,
  waitlist,
  cancelled,
  declined;

  /// Convert from GraphQL string
  static RSVPStatus fromString(String value) {
    switch (value.toUpperCase()) {
      case 'CONFIRMED':
        return RSVPStatus.confirmed;
      case 'TENTATIVE':
        return RSVPStatus.tentative;
      case 'PENDING_APPROVAL':
        return RSVPStatus.pendingApproval;
      case 'WAITLIST':
        return RSVPStatus.waitlist;
      case 'CANCELLED':
        return RSVPStatus.cancelled;
      case 'DECLINED':
        return RSVPStatus.declined;
      default:
        return RSVPStatus.confirmed;
    }
  }

  /// Convert to GraphQL string
  String toGraphQL() {
    switch (this) {
      case RSVPStatus.confirmed:
        return 'CONFIRMED';
      case RSVPStatus.tentative:
        return 'TENTATIVE';
      case RSVPStatus.pendingApproval:
        return 'PENDING_APPROVAL';
      case RSVPStatus.waitlist:
        return 'WAITLIST';
      case RSVPStatus.cancelled:
        return 'CANCELLED';
      case RSVPStatus.declined:
        return 'DECLINED';
    }
  }
}

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
    this.guestNames = const [],
    this.dietaryRestrictions = const [],
    this.seatingPreferences,
    this.specialRequests,
    required this.status,
    required this.paymentRequired,
    required this.paymentVerified,
    this.paymentAmount,
    this.cancellationFee,
    required this.feeWaived,
    this.waitlistPosition,
    required this.rsvpedAt,
    required this.updatedAt,
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
  final RSVPResponse response;
  final RSVPType rsvpType;
  final int priority;

  // Attendance
  final int attendanceCount;
  final List<String> guestNames;
  final List<String> dietaryRestrictions;
  final String? seatingPreferences;
  final String? specialRequests;

  // Status
  final RSVPStatus status;

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
  bool get isConfirmed => status == RSVPStatus.confirmed;

  /// Whether this RSVP is on waitlist
  bool get isOnWaitlist => status == RSVPStatus.waitlist;

  /// Whether this RSVP is pending approval
  bool get isPendingApproval => status == RSVPStatus.pendingApproval;

  /// Whether this RSVP is tentative (Maybe)
  bool get isTentative => status == RSVPStatus.tentative;

  /// Whether this RSVP is cancelled
  bool get isCancelled => status == RSVPStatus.cancelled;

  /// Whether this RSVP can be cancelled
  bool get canCancel {
    return status == RSVPStatus.confirmed ||
        status == RSVPStatus.tentative ||
        status == RSVPStatus.pendingApproval;
  }

  /// Whether this RSVP can be modified
  bool get canModify {
    return status == RSVPStatus.confirmed ||
        status == RSVPStatus.tentative ||
        status == RSVPStatus.pendingApproval;
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
