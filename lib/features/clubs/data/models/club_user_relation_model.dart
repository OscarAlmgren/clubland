import '../../domain/entities/club_user_relation_entity.dart';

class ClubUserRelationModel extends ClubUserRelationEntity {
  const ClubUserRelationModel({
    super.isMember = false,
    super.membershipType,
    super.joinDate,
    super.isFavorite = false,
  });

  factory ClubUserRelationModel.fromJson(Map<String, dynamic> json) => ClubUserRelationModel(
    isMember: json['isMember'] as bool? ?? false,
    membershipType: json['membershipType'] as String?,
    joinDate: json['joinDate'] != null
        ? DateTime.parse(json['joinDate'] as String)
        : null,
    isFavorite: json['isFavorite'] as bool? ?? false,
  );

  Map<String, dynamic> toJson() => {
    'isMember': isMember,
    if (membershipType != null) 'membershipType': membershipType,
    if (joinDate != null) 'joinDate': joinDate!.toIso8601String(),
    'isFavorite': isFavorite,
  };

  ClubUserRelationModel copyWith({
    bool? isMember,
    String? membershipType,
    DateTime? joinDate,
    bool? isFavorite,
  }) => ClubUserRelationModel(
    isMember: isMember ?? this.isMember,
    membershipType: membershipType ?? this.membershipType,
    joinDate: joinDate ?? this.joinDate,
    isFavorite: isFavorite ?? this.isFavorite,
  );
}