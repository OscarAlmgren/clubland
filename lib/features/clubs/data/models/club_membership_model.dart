import '../../domain/entities/club_membership_entity.dart';

class ClubMembershipModel extends ClubMembershipEntity {
  const ClubMembershipModel({
    required super.type,
    required super.price,
    required super.currency,
    super.duration,
    super.benefits,
    super.isAvailable = true,
  });

  factory ClubMembershipModel.fromJson(Map<String, dynamic> json) => ClubMembershipModel(
    type: json['type'] as String,
    price: (json['price'] as num).toDouble(),
    currency: json['currency'] as String,
    duration: json['duration'] as String?,
    benefits: (json['benefits'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    isAvailable: json['isAvailable'] as bool? ?? true,
  );

  Map<String, dynamic> toJson() => {
    'type': type,
    'price': price,
    'currency': currency,
    if (duration != null) 'duration': duration,
    if (benefits != null) 'benefits': benefits,
    'isAvailable': isAvailable,
  };

  ClubMembershipModel copyWith({
    String? type,
    double? price,
    String? currency,
    String? duration,
    List<String>? benefits,
    bool? isAvailable,
  }) => ClubMembershipModel(
    type: type ?? this.type,
    price: price ?? this.price,
    currency: currency ?? this.currency,
    duration: duration ?? this.duration,
    benefits: benefits ?? this.benefits,
    isAvailable: isAvailable ?? this.isAvailable,
  );
}