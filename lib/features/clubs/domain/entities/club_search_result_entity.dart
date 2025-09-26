import 'package:equatable/equatable.dart';

import 'club_address_entity.dart';
import 'club_amenity_entity.dart';
import 'club_stats_entity.dart';
import 'club_user_relation_entity.dart';

class ClubSearchResultEntity extends Equatable {
  const ClubSearchResultEntity({
    required this.id,
    required this.name,
    required this.slug,
    required this.address,
    this.description,
    this.logo,
    this.coverImage,
    this.amenities,
    this.stats,
    this.userRelation,
    this.distance,
    this.relevanceScore,
  });

  final String id;
  final String name;
  final String slug;
  final ClubAddressEntity address;
  final String? description;
  final String? logo;
  final String? coverImage;
  final List<ClubAmenityEntity>? amenities;
  final ClubStatsEntity? stats;
  final ClubUserRelationEntity? userRelation;
  final double? distance;
  final double? relevanceScore;

  @override
  List<Object?> get props => [
    id,
    name,
    slug,
    address,
    description,
    logo,
    coverImage,
    amenities,
    stats,
    userRelation,
    distance,
    relevanceScore,
  ];

  @override
  String toString() => 'ClubSearchResultEntity(id: $id, name: $name, distance: $distance)';
}