import '../../domain/entities/club_amenity_entity.dart';

class ClubAmenityModel extends ClubAmenityEntity {
  const ClubAmenityModel({
    required super.id,
    required super.name,
    required super.type,
    super.description,
    super.icon,
    super.isAvailable = true,
  });

  factory ClubAmenityModel.fromJson(Map<String, dynamic> json) => ClubAmenityModel(
    id: json['id'] as String,
    name: json['name'] as String,
    type: json['type'] as String,
    description: json['description'] as String?,
    icon: json['icon'] as String?,
    isAvailable: json['isAvailable'] as bool? ?? true,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'type': type,
    if (description != null) 'description': description,
    if (icon != null) 'icon': icon,
    'isAvailable': isAvailable,
  };

  ClubAmenityModel copyWith({
    String? id,
    String? name,
    String? type,
    String? description,
    String? icon,
    bool? isAvailable,
  }) => ClubAmenityModel(
    id: id ?? this.id,
    name: name ?? this.name,
    type: type ?? this.type,
    description: description ?? this.description,
    icon: icon ?? this.icon,
    isAvailable: isAvailable ?? this.isAvailable,
  );
}