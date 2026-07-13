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

  factory ClubAddressModel.fromJson(Map<String, dynamic> json) =>
      ClubAddressModel(
        street: json['street'] as String? ?? '',
        city: json['city'] as String? ?? '',
        state: json['state'] as String? ?? '',
        // GraphQL Address uses postalCode; older payloads used zipCode.
        zipCode: (json['zipCode'] ?? json['postalCode']) as String? ?? '',
        country: json['country'] as String? ?? '',
        latitude: (json['latitude'] as num?)?.toDouble(),
        longitude: (json['longitude'] as num?)?.toDouble(),
      );

  /// Placeholder for clubs whose address is not set (Club.address is
  /// nullable in the schema, but the domain entity requires one).
  static const empty = ClubAddressModel(
    street: '',
    city: '',
    state: '',
    zipCode: '',
    country: '',
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
