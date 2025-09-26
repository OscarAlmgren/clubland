import 'package:equatable/equatable.dart';

class ClubUserRelationEntity extends Equatable {
  const ClubUserRelationEntity({
    this.isMember = false,
    this.membershipType,
    this.joinDate,
    this.isFavorite = false,
  });

  final bool isMember;
  final String? membershipType;
  final DateTime? joinDate;
  final bool isFavorite;

  @override
  List<Object?> get props => [
    isMember,
    membershipType,
    joinDate,
    isFavorite,
  ];

  @override
  String toString() => 'ClubUserRelationEntity(member: $isMember, favorite: $isFavorite)';
}