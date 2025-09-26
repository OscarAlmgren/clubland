import 'package:equatable/equatable.dart';

class ClubMembershipEntity extends Equatable {
  const ClubMembershipEntity({
    required this.type,
    required this.price,
    required this.currency,
    this.duration,
    this.benefits,
    this.isAvailable = true,
  });

  final String type;
  final double price;
  final String currency;
  final String? duration;
  final List<String>? benefits;
  final bool isAvailable;

  @override
  List<Object?> get props => [
    type,
    price,
    currency,
    duration,
    benefits,
    isAvailable,
  ];

  @override
  String toString() => 'ClubMembershipEntity($type, $price $currency)';
}