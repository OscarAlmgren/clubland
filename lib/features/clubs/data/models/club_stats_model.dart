import '../../domain/entities/club_stats_entity.dart';

class ClubStatsModel extends ClubStatsEntity {
  const ClubStatsModel({
    super.memberCount,
    super.averageRating,
    super.reviewCount,
    super.establishedYear,
  });

  factory ClubStatsModel.fromJson(Map<String, dynamic> json) => ClubStatsModel(
    memberCount: json['memberCount'] as int?,
    averageRating: (json['averageRating'] as num?)?.toDouble(),
    reviewCount: json['reviewCount'] as int?,
    establishedYear: json['establishedYear'] as int?,
  );

  Map<String, dynamic> toJson() => {
    if (memberCount != null) 'memberCount': memberCount,
    if (averageRating != null) 'averageRating': averageRating,
    if (reviewCount != null) 'reviewCount': reviewCount,
    if (establishedYear != null) 'establishedYear': establishedYear,
  };

  ClubStatsModel copyWith({
    int? memberCount,
    double? averageRating,
    int? reviewCount,
    int? establishedYear,
  }) => ClubStatsModel(
    memberCount: memberCount ?? this.memberCount,
    averageRating: averageRating ?? this.averageRating,
    reviewCount: reviewCount ?? this.reviewCount,
    establishedYear: establishedYear ?? this.establishedYear,
  );
}