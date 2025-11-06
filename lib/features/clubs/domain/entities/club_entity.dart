import 'package:equatable/equatable.dart';

import 'club_address_entity.dart';
import 'club_amenity_entity.dart';
import 'club_contact_entity.dart';
import 'club_facility_entity.dart';
import 'club_membership_entity.dart';
import 'club_operating_hours_entity.dart';
import 'club_stats_entity.dart';
import 'club_user_relation_entity.dart';

class ClubEntity extends Equatable {
  const ClubEntity({
    required this.id,
    required this.name,
    required this.slug,
    required this.description,
    required this.address,
    this.logo,
    this.coverImage,
    this.images,
    this.amenities,
    this.facilities,
    this.operatingHours,
    this.contact,
    this.membership,
    this.stats,
    this.userRelation,
    this.createdAt,
    this.updatedAt,
    required location,
  });

  final String id;
  final String name;
  final String slug;
  final String description;
  final ClubAddressEntity address;
  final String? logo;
  final String? coverImage;
  final List<String>? images;
  final List<ClubAmenityEntity>? amenities;
  final List<ClubFacilityEntity>? facilities;
  final List<ClubOperatingHoursEntity>? operatingHours;
  final ClubContactEntity? contact;
  final ClubMembershipEntity? membership;
  final ClubStatsEntity? stats;
  final ClubUserRelationEntity? userRelation;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  @override
  List<Object?> get props => [
    id,
    name,
    slug,
    description,
    address,
    logo,
    coverImage,
    images,
    amenities,
    facilities,
    operatingHours,
    contact,
    membership,
    stats,
    userRelation,
    createdAt,
    updatedAt,
  ];

  @override
  String toString() => 'ClubEntity(id: $id, name: $name, slug: $slug)';
}
