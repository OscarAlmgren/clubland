import 'package:equatable/equatable.dart';

/// A data entity representing the relationship between a user and a club.
///
/// This includes whether the user is a member, their membership details,
/// and if the club is marked as a favorite.
class ClubUserRelationEntity extends Equatable {
  /// Creates a [ClubUserRelationEntity].
  const ClubUserRelationEntity({
    this.isMember = false,
    this.membershipType,
    this.joinDate,
    this.isFavorite = false,
  });

  /// Indicates whether the user is currently a member of the club. Defaults to false.
  final bool isMember;

  /// The type or tier of membership, if the user is a member (e.g., 'Gold', 'Standard').
  final String? membershipType;

  /// The date the user joined the club.
  final DateTime? joinDate;

  /// Indicates whether the user has marked this club as a favorite. Defaults to false.
  final bool isFavorite;

  @override
  List<Object?> get props => [isMember, membershipType, joinDate, isFavorite];

  @override
  String toString() =>
      'ClubUserRelationEntity(member: $isMember, favorite: $isFavorite)';
}
