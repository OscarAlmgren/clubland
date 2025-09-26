import 'package:equatable/equatable.dart';

class ClubAmenityEntity extends Equatable {
  const ClubAmenityEntity({
    required this.id,
    required this.name,
    required this.type,
    this.description,
    this.icon,
    this.isAvailable = true,
  });

  final String id;
  final String name;
  final String type;
  final String? description;
  final String? icon;
  final bool isAvailable;

  @override
  List<Object?> get props => [
    id,
    name,
    type,
    description,
    icon,
    isAvailable,
  ];

  @override
  String toString() => 'ClubAmenityEntity($name)';
}