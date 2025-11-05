import 'package:equatable/equatable.dart';

/// Finding Friends subgroup entity - represents a social subgroup within a club
class FindingFriendsSubgroupEntity extends Equatable {
  const FindingFriendsSubgroupEntity({
    required this.id,
    required this.clubId,
    required this.name,
    this.description,
    required this.memberCount,
    required this.isActive,
    this.organizerId,
    this.organizerName,
  });

  final String id;
  final String clubId;
  final String name;
  final String? description;
  final int memberCount;
  final bool isActive;
  final String? organizerId;
  final String? organizerName;

  /// Whether this subgroup has members
  bool get hasMembers => memberCount > 0;

  /// Whether this subgroup is empty
  bool get isEmpty => memberCount == 0;

  @override
  List<Object?> get props => [
        id,
        clubId,
        name,
        description,
        memberCount,
        isActive,
        organizerId,
        organizerName,
      ];
}
