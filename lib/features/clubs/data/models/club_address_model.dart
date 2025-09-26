import '../../domain/entities/club_address_entity.dart';

class ClubAddressModel extends ClubAddressEntity {
  const ClubAddressModel({
    required super.street,
    required super.city,
    required super.state,
    required super.zipCode,
    required super.country,
    super.latitude,
    super.longitude,
  });

  factory ClubAddressModel.fromJson(Map<String, dynamic> json) => ClubAddressModel(
    street: json['street'] as String,
    city: json['city'] as String,
    state: json['state'] as String,
    zipCode: json['zipCode'] as String,
    country: json['country'] as String,
    latitude: json['latitude'] as double?,
    longitude: json['longitude'] as double?,
  );

  Map<String, dynamic> toJson() => {
    'street': street,
    'city': city,
    'state': state,
    'zipCode': zipCode,
    'country': country,
    if (latitude != null) 'latitude': latitude,
    if (longitude != null) 'longitude': longitude,
  };

  ClubAddressModel copyWith({
    String? street,
    String? city,
    String? state,
    String? zipCode,
    String? country,
    double? latitude,
    double? longitude,
  }) => ClubAddressModel(
    street: street ?? this.street,
    city: city ?? this.city,
    state: state ?? this.state,
    zipCode: zipCode ?? this.zipCode,
    country: country ?? this.country,
    latitude: latitude ?? this.latitude,
    longitude: longitude ?? this.longitude,
  );
}