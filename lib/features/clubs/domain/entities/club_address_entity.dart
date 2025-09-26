import 'package:equatable/equatable.dart';

class ClubAddressEntity extends Equatable {
  const ClubAddressEntity({
    required this.street,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.country,
    this.latitude,
    this.longitude,
  });

  final String street;
  final String city;
  final String state;
  final String zipCode;
  final String country;
  final double? latitude;
  final double? longitude;

  @override
  List<Object?> get props => [
    street,
    city,
    state,
    zipCode,
    country,
    latitude,
    longitude,
  ];

  @override
  String toString() => 'ClubAddressEntity($street, $city, $state $zipCode)';
}