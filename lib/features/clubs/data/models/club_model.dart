import '../../domain/entities/club_entity.dart';
import '../../domain/entities/club_address_entity.dart';
import '../../domain/entities/club_amenity_entity.dart';
import '../../domain/entities/club_contact_entity.dart';
import '../../domain/entities/club_facility_entity.dart';
import '../../domain/entities/club_membership_entity.dart';
import '../../domain/entities/club_operating_hours_entity.dart';
import '../../domain/entities/club_stats_entity.dart';
import '../../domain/entities/club_user_relation_entity.dart';
import 'club_address_model.dart';
import 'club_amenity_model.dart';
import 'club_contact_model.dart';
import 'club_facility_model.dart';
import 'club_membership_model.dart';
import 'club_operating_hours_model.dart';
import 'club_stats_model.dart';
import 'club_user_relation_model.dart';

class ClubModel extends ClubEntity {
  const ClubModel({
    required super.id,
    required super.name,
    required super.slug,
    required super.description,
    required super.address,
    super.website,
    super.logo,
    super.coverImage,
    super.images,
    super.amenities,
    super.facilities,
    super.operatingHours,
    super.contact,
    super.membership,
    super.stats,
    super.userRelation,
    super.createdAt,
    super.updatedAt,
  });

  factory ClubModel.fromJson(Map<String, dynamic> json) => ClubModel(
    id: json['id'] as String,
    name: json['name'] as String,
    slug: json['slug'] as String,
    description: json['description'] as String? ?? '',
    address: ClubAddressModel.fromJson(json['address'] as Map<String, dynamic>),
    logo: json['logo'] as String?,
    coverImage: json['coverImage'] as String?,
    images: (json['images'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    amenities: (json['amenities'] as List<dynamic>?)
        ?.map((e) => ClubAmenityModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    facilities: (json['facilities'] as List<dynamic>?)
        ?.map((e) => ClubFacilityModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    operatingHours: (json['operatingHours'] as List<dynamic>?)
        ?.map(
          (e) => ClubOperatingHoursModel.fromJson(e as Map<String, dynamic>),
        )
        .toList(),
    contact: json['contact'] != null
        ? ClubContactModel.fromJson(json['contact'] as Map<String, dynamic>)
        : null,
    membership: json['membership'] != null
        ? ClubMembershipModel.fromJson(
            json['membership'] as Map<String, dynamic>,
          )
        : null,
    stats: json['stats'] != null
        ? ClubStatsModel.fromJson(json['stats'] as Map<String, dynamic>)
        : null,
    userRelation: json['userRelation'] != null
        ? ClubUserRelationModel.fromJson(
            json['userRelation'] as Map<String, dynamic>,
          )
        : null,
    createdAt: json['createdAt'] != null
        ? DateTime.parse(json['createdAt'] as String)
        : null,
    updatedAt: json['updatedAt'] != null
        ? DateTime.parse(json['updatedAt'] as String)
        : null,
    website: json['website'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'slug': slug,
    'description': description,
    'address': (address as ClubAddressModel).toJson(),
    if (logo != null) 'logo': logo,
    if (coverImage != null) 'coverImage': coverImage,
    if (images != null) 'images': images,
    if (amenities != null)
      'amenities': amenities!
          .map((e) => (e as ClubAmenityModel).toJson())
          .toList(),
    if (facilities != null)
      'facilities': facilities!
          .map((e) => (e as ClubFacilityModel).toJson())
          .toList(),
    if (operatingHours != null)
      'operatingHours': operatingHours!
          .map((e) => (e as ClubOperatingHoursModel).toJson())
          .toList(),
    if (contact != null) 'contact': (contact as ClubContactModel).toJson(),
    if (membership != null)
      'membership': (membership as ClubMembershipModel).toJson(),
    if (stats != null) 'stats': (stats as ClubStatsModel).toJson(),
    if (userRelation != null)
      'userRelation': (userRelation as ClubUserRelationModel).toJson(),
    if (createdAt != null) 'createdAt': createdAt!.toIso8601String(),
    if (updatedAt != null) 'updatedAt': updatedAt!.toIso8601String(),
    if (website != null) 'website': website,
  };

  ClubModel copyWith({
    String? id,
    String? name,
    String? slug,
    String? description,
    ClubAddressEntity? address,
    String? logo,
    String? coverImage,
    List<String>? images,
    List<ClubAmenityEntity>? amenities,
    List<ClubFacilityEntity>? facilities,
    List<ClubOperatingHoursEntity>? operatingHours,
    ClubContactEntity? contact,
    ClubMembershipEntity? membership,
    ClubStatsEntity? stats,
    ClubUserRelationEntity? userRelation,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? website,
  }) => ClubModel(
    id: id ?? this.id,
    name: name ?? this.name,
    slug: slug ?? this.slug,
    description: description ?? this.description,
    address: address ?? this.address,
    logo: logo ?? this.logo,
    coverImage: coverImage ?? this.coverImage,
    images: images ?? this.images,
    amenities: amenities ?? this.amenities,
    facilities: facilities ?? this.facilities,
    operatingHours: operatingHours ?? this.operatingHours,
    contact: contact ?? this.contact,
    membership: membership ?? this.membership,
    stats: stats ?? this.stats,
    userRelation: userRelation ?? this.userRelation,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    website: website ?? this.website,
  );

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
    website,
  ];

  @override
  String toString() => 'ClubModel(id: $id, name: $name, slug: $slug)';
}
