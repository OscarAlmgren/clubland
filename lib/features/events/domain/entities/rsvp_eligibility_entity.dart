import 'package:equatable/equatable.dart';

/// RSVP eligibility entity - represents whether a member can RSVP to an event
class RSVPEligibilityEntity extends Equatable {
  const RSVPEligibilityEntity({
    required this.eligible,
    required this.memberInGoodStanding,
    required this.hasOutstandingDebt,
    required this.wouldBeWaitlisted,
    required this.availableSpots,
    required this.priority,
    this.reason,
    this.debtAmount,
    this.estimatedWaitlistPosition,
    this.requiresApproval = false,
    this.isSubgroupMember = false,
    this.hasExistingRSVP = false,
    this.requiresPayment = false,
    this.paymentAmount,
  });

  /// Whether the member is eligible to RSVP
  final bool eligible;

  /// Reason for ineligibility (if not eligible)
  final String? reason;

  /// Whether member is in good standing (debt check passed)
  final bool memberInGoodStanding;

  /// Whether member has outstanding debt
  final bool hasOutstandingDebt;

  /// Amount of outstanding debt
  final double? debtAmount;

  /// Whether the RSVP would be placed on waitlist
  final bool wouldBeWaitlisted;

  /// Estimated waitlist position (if applicable)
  final int? estimatedWaitlistPosition;

  /// Number of available spots
  final int availableSpots;

  /// Member's priority level (1=highest, 3=lowest)
  final int priority;

  /// Whether the event requires approval
  final bool requiresApproval;

  /// Whether member is part of the subgroup
  final bool isSubgroupMember;

  /// Whether member has an existing RSVP for this event
  final bool hasExistingRSVP;

  /// Whether payment is required for this RSVP
  final bool requiresPayment;

  /// Payment amount required (if applicable)
  final double? paymentAmount;

  /// Whether member can RSVP (alias for eligible for backward compatibility)
  bool get canRSVP => eligible;

  /// Whether member would get immediate confirmation
  bool get wouldBeConfirmed {
    return eligible && !wouldBeWaitlisted && !requiresApproval;
  }

  /// Whether member needs to wait for approval
  bool get needsApproval {
    return eligible && requiresApproval && !wouldBeWaitlisted;
  }

  /// Priority level as a readable string
  String get priorityLevel {
    switch (priority) {
      case 1:
        return 'High (Subgroup Member)';
      case 2:
        return 'Normal (Home Club)';
      case 3:
        return 'Lower (Reciprocal)';
      default:
        return 'Unknown';
    }
  }

  /// Whether there are spots available
  bool get hasAvailableSpots => availableSpots > 0;

  /// Whether event is full
  bool get isFull => availableSpots <= 0;

  @override
  List<Object?> get props => [
    eligible,
    reason,
    memberInGoodStanding,
    hasOutstandingDebt,
    debtAmount,
    wouldBeWaitlisted,
    estimatedWaitlistPosition,
    availableSpots,
    priority,
    requiresApproval,
    isSubgroupMember,
    hasExistingRSVP,
    requiresPayment,
    paymentAmount,
  ];
}
