import '../../domain/entities/club_facility_entity.dart';

class ClubFacilityModel extends ClubFacilityEntity {
  const ClubFacilityModel({
    required super.id,
    required super.name,
    required super.type,
    super.description,
    super.capacity,
    super.isBookable = false,
    super.isAvailable = true,
  });

  factory ClubFacilityModel.fromJson(Map<String, dynamic> json) => ClubFacilityModel(
    id: json['id'] as String,
    name: json['name'] as String,
    type: json['type'] as String,
    description: json['description'] as String?,
    capacity: json['capacity'] as int?,
    isBookable: json['isBookable'] as bool? ?? false,
    isAvailable: json['isAvailable'] as bool? ?? true,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'type': type,
    if (description != null) 'description': description,
    if (capacity != null) 'capacity': capacity,
    'isBookable': isBookable,
    'isAvailable': isAvailable,
  };

  ClubFacilityModel copyWith({
    String? id,
    String? name,
    String? type,
    String? description,
    int? capacity,
    bool? isBookable,
    bool? isAvailable,
  }) => ClubFacilityModel(
    id: id ?? this.id,
    name: name ?? this.name,
    type: type ?? this.type,
    description: description ?? this.description,
    capacity: capacity ?? this.capacity,
    isBookable: isBookable ?? this.isBookable,
    isAvailable: isAvailable ?? this.isAvailable,
  );
}