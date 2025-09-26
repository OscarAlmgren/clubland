import 'package:equatable/equatable.dart';

class ClubStatsEntity extends Equatable {
  const ClubStatsEntity({
    this.memberCount,
    this.averageRating,
    this.reviewCount,
    this.establishedYear,
  });

  final int? memberCount;
  final double? averageRating;
  final int? reviewCount;
  final int? establishedYear;

  @override
  List<Object?> get props => [
    memberCount,
    averageRating,
    reviewCount,
    establishedYear,
  ];

  @override
  String toString() => 'ClubStatsEntity(members: $memberCount, rating: $averageRating)';
}