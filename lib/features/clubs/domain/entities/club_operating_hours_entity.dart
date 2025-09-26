import 'package:equatable/equatable.dart';

class ClubOperatingHoursEntity extends Equatable {
  const ClubOperatingHoursEntity({
    required this.dayOfWeek,
    required this.openTime,
    required this.closeTime,
    this.isOpen = true,
  });

  final String dayOfWeek;
  final String openTime;
  final String closeTime;
  final bool isOpen;

  @override
  List<Object?> get props => [
    dayOfWeek,
    openTime,
    closeTime,
    isOpen,
  ];

  @override
  String toString() => 'ClubOperatingHoursEntity($dayOfWeek: $openTime - $closeTime)';
}