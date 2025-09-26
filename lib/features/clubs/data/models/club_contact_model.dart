import '../../domain/entities/club_contact_entity.dart';

class ClubContactModel extends ClubContactEntity {
  const ClubContactModel({
    super.phone,
    super.email,
    super.website,
    super.socialMedia,
  });

  factory ClubContactModel.fromJson(Map<String, dynamic> json) => ClubContactModel(
    phone: json['phone'] as String?,
    email: json['email'] as String?,
    website: json['website'] as String?,
    socialMedia: json['socialMedia'] != null
        ? Map<String, String>.from(json['socialMedia'] as Map)
        : null,
  );

  Map<String, dynamic> toJson() => {
    if (phone != null) 'phone': phone,
    if (email != null) 'email': email,
    if (website != null) 'website': website,
    if (socialMedia != null) 'socialMedia': socialMedia,
  };

  ClubContactModel copyWith({
    String? phone,
    String? email,
    String? website,
    Map<String, String>? socialMedia,
  }) => ClubContactModel(
    phone: phone ?? this.phone,
    email: email ?? this.email,
    website: website ?? this.website,
    socialMedia: socialMedia ?? this.socialMedia,
  );
}