import 'package:equatable/equatable.dart';

/// Visit status enumeration
enum VisitStatus {
  checkedIn,
  checkedOut,
  cancelled,
  noShow,
}

/// Visit entity - represents a member's visit to a club
class VisitEntity extends Equatable {
  const VisitEntity({
    required this.id,
    required this.clubId,
    required this.userId,
    required this.status,
    required this.checkedInAt,
    this.checkedOutAt,
    this.purpose,
    this.notes,
    this.guestCount,
    this.rating,
    this.review,
    this.blockchainTxId,
    this.createdAt,
    this.updatedAt,
  });

  final String id;
  final String clubId;
  final String userId;
  final VisitStatus status;
  final DateTime checkedInAt;
  final DateTime? checkedOutAt;
  final String? purpose;
  final String? notes;
  final int? guestCount;
  final double? rating;
  final String? review;
  final String? blockchainTxId; // Blockchain transaction ID for verification
  final DateTime? createdAt;
  final DateTime? updatedAt;

  /// Whether the visit is currently active (checked in but not checked out)
  bool get isActive => checkedOutAt == null && status == VisitStatus.checkedIn;

  /// Duration of the visit (if checked out)
  Duration? get duration {
    if (checkedOutAt == null) return null;
    return checkedOutAt!.difference(checkedInAt);
  }

  /// Whether the visit has been reviewed
  bool get hasReview => rating != null && review != null;

  /// Whether the visit is verified on blockchain
  bool get isBlockchainVerified => blockchainTxId != null;

  @override
  List<Object?> get props => [
        id,
        clubId,
        userId,
        status,
        checkedInAt,
        checkedOutAt,
        purpose,
        notes,
        guestCount,
        rating,
        review,
        blockchainTxId,
        createdAt,
        updatedAt,
      ];
}

/// Visit summary for display in lists
class VisitSummaryEntity extends Equatable {
  const VisitSummaryEntity({
    required this.id,
    required this.clubName,
    required this.clubLogo,
    required this.checkedInAt,
    this.checkedOutAt,
    this.status,
  });

  final String id;
  final String clubName;
  final String? clubLogo;
  final DateTime checkedInAt;
  final DateTime? checkedOutAt;
  final VisitStatus? status;

  @override
  List<Object?> get props => [
        id,
        clubName,
        clubLogo,
        checkedInAt,
        checkedOutAt,
        status,
      ];
}
