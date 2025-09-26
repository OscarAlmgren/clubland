import 'package:equatable/equatable.dart';

class ClubContactEntity extends Equatable {
  const ClubContactEntity({
    this.phone,
    this.email,
    this.website,
    this.socialMedia,
  });

  final String? phone;
  final String? email;
  final String? website;
  final Map<String, String>? socialMedia;

  @override
  List<Object?> get props => [
    phone,
    email,
    website,
    socialMedia,
  ];

  @override
  String toString() => 'ClubContactEntity($email, $phone)';
}