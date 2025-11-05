import '../../domain/entities/finding_friends_subgroup_entity.dart';

/// Finding Friends subgroup model - data layer representation with JSON serialization
class FindingFriendsSubgroupModel extends FindingFriendsSubgroupEntity {
  const FindingFriendsSubgroupModel({
    required super.id,
    required super.clubId,
    required super.name,
    super.description,
    required super.memberCount,
    required super.isActive,
    super.organizerId,
    super.organizerName,
  });

  /// Create FindingFriendsSubgroupModel from JSON
  factory FindingFriendsSubgroupModel.fromJson(Map<String, dynamic> json) {
    return FindingFriendsSubgroupModel(
      id: json['id'] as String,
      clubId: json['clubId'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      memberCount: json['memberCount'] as int? ?? 0,
      isActive: json['isActive'] as bool? ?? true,
      organizerId: json['organizerId'] as String?,
      organizerName: json['organizerName'] as String?,
    );
  }

  /// Convert FindingFriendsSubgroupModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'clubId': clubId,
      'name': name,
      'description': description,
      'memberCount': memberCount,
      'isActive': isActive,
      'organizerId': organizerId,
      'organizerName': organizerName,
    };
  }
}
