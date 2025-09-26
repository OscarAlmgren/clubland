import 'package:equatable/equatable.dart';

class ClubFacilityEntity extends Equatable {
  const ClubFacilityEntity({
    required this.id,
    required this.name,
    required this.type,
    this.description,
    this.capacity,
    this.isBookable = false,
    this.isAvailable = true,
  });

  final String id;
  final String name;
  final String type;
  final String? description;
  final int? capacity;
  final bool isBookable;
  final bool isAvailable;

  @override
  List<Object?> get props => [
    id,
    name,
    type,
    description,
    capacity,
    isBookable,
    isAvailable,
  ];

  @override
  String toString() => 'ClubFacilityEntity($name)';
}