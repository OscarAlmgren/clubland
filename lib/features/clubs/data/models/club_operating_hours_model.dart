import '../../domain/entities/club_operating_hours_entity.dart';

class ClubOperatingHoursModel extends ClubOperatingHoursEntity {
  const ClubOperatingHoursModel({
    required super.dayOfWeek,
    required super.openTime,
    required super.closeTime,
    super.isOpen = true,
  });

  factory ClubOperatingHoursModel.fromJson(Map<String, dynamic> json) => ClubOperatingHoursModel(
    dayOfWeek: json['dayOfWeek'] as String,
    openTime: json['openTime'] as String,
    closeTime: json['closeTime'] as String,
    isOpen: json['isOpen'] as bool? ?? true,
  );

  Map<String, dynamic> toJson() => {
    'dayOfWeek': dayOfWeek,
    'openTime': openTime,
    'closeTime': closeTime,
    'isOpen': isOpen,
  };

  ClubOperatingHoursModel copyWith({
    String? dayOfWeek,
    String? openTime,
    String? closeTime,
    bool? isOpen,
  }) => ClubOperatingHoursModel(
    dayOfWeek: dayOfWeek ?? this.dayOfWeek,
    openTime: openTime ?? this.openTime,
    closeTime: closeTime ?? this.closeTime,
    isOpen: isOpen ?? this.isOpen,
  );
}