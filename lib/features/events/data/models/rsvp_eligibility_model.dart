import '../../domain/entities/rsvp_eligibility_entity.dart';

/// RSVP eligibility model - data layer representation with JSON serialization
class RSVPEligibilityModel extends RSVPEligibilityEntity {
  const RSVPEligibilityModel({
    required super.eligible,
    required super.memberInGoodStanding,
    required super.hasOutstandingDebt,
    required super.wouldBeWaitlisted,
    required super.availableSpots,
    required super.priority,
    super.reason,
    super.debtAmount,
    super.estimatedWaitlistPosition,
    super.requiresApproval,
    super.isSubgroupMember,
  });

  /// Create RSVPEligibilityModel from JSON
  factory RSVPEligibilityModel.fromJson(Map<String, dynamic> json) {
    return RSVPEligibilityModel(
      eligible: json['eligible'] as bool,
      reason: json['reason'] as String?,
      memberInGoodStanding: json['memberInGoodStanding'] as bool? ?? true,
      hasOutstandingDebt: json['hasOutstandingDebt'] as bool? ?? false,
      debtAmount: (json['debtAmount'] as num?)?.toDouble(),
      wouldBeWaitlisted: json['wouldBeWaitlisted'] as bool? ?? false,
      estimatedWaitlistPosition: json['estimatedWaitlistPosition'] as int?,
      availableSpots: json['availableSpots'] as int? ?? 0,
      priority: json['priority'] as int? ?? 2,
      requiresApproval: json['requiresApproval'] as bool? ?? false,
      isSubgroupMember: json['isSubgroupMember'] as bool? ?? false,
    );
  }

  /// Convert RSVPEligibilityModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'eligible': eligible,
      'reason': reason,
      'memberInGoodStanding': memberInGoodStanding,
      'hasOutstandingDebt': hasOutstandingDebt,
      'debtAmount': debtAmount,
      'wouldBeWaitlisted': wouldBeWaitlisted,
      'estimatedWaitlistPosition': estimatedWaitlistPosition,
      'availableSpots': availableSpots,
      'priority': priority,
      'requiresApproval': requiresApproval,
      'isSubgroupMember': isSubgroupMember,
    };
  }
}
