import '../../domain/entities/club_search_result_entity.dart';
import 'club_address_model.dart';
import 'club_amenity_model.dart';
import 'club_stats_model.dart';
import 'club_user_relation_model.dart';

class ClubSearchResultModel extends ClubSearchResultEntity {
  const ClubSearchResultModel({
    required super.id,
    required super.name,
    required super.slug,
    required super.address,
    super.description,
    super.logo,
    super.coverImage,
    super.amenities,
    super.stats,
    super.userRelation,
    super.distance,
    super.relevanceScore,
  });

  factory ClubSearchResultModel.fromJson(Map<String, dynamic> json) =>
      ClubSearchResultModel(
        id: json['id'] as String,
        name: json['name'] as String,
        slug: json['slug'] as String,
        description: json['description'] as String?,
        address: ClubAddressModel.fromJson(
          json['address'] as Map<String, dynamic>,
        ),
        logo: json['logo'] as String?,
        coverImage: json['coverImage'] as String?,
        amenities: (json['amenities'] as List<dynamic>?)
            ?.map((e) => ClubAmenityModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        stats: json['stats'] != null
            ? ClubStatsModel.fromJson(json['stats'] as Map<String, dynamic>)
            : null,
        userRelation: json['userRelation'] != null
            ? ClubUserRelationModel.fromJson(
                json['userRelation'] as Map<String, dynamic>,
              )
            : null,
        distance: (json['distance'] as num?)?.toDouble(),
        relevanceScore: (json['relevanceScore'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'slug': slug,
    if (description != null) 'description': description,
    'address': (address as ClubAddressModel).toJson(),
    if (logo != null) 'logo': logo,
    if (coverImage != null) 'coverImage': coverImage,
    if (amenities != null)
      'amenities': amenities!
          .map((e) => (e as ClubAmenityModel).toJson())
          .toList(),
    if (stats != null) 'stats': (stats as ClubStatsModel).toJson(),
    if (userRelation != null)
      'userRelation': (userRelation as ClubUserRelationModel).toJson(),
    if (distance != null) 'distance': distance,
    if (relevanceScore != null) 'relevanceScore': relevanceScore,
  };

  @override
  List<Object?> get props => [
    id,
    name,
    slug,
    description,
    address,
    logo,
    coverImage,
    amenities,
    stats,
    userRelation,
    distance,
    relevanceScore,
  ];
}
