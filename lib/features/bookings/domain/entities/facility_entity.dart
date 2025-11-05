import 'package:equatable/equatable.dart';

/// Facility type enumeration
enum FacilityType {
  diningRoom,
  meetingRoom,
  library,
  gym,
  pool,
  tennisPort,
  golfCourse,
  sportsField,
  eventSpace,
  lounge,
  other,
}

/// Facility entity - represents a bookable facility in a club
class FacilityEntity extends Equatable {
  const FacilityEntity({
    required this.id,
    required this.clubId,
    required this.name,
    required this.type,
    required this.capacity,
    required this.isActive,
    required this.createdAt,
    this.description,
    this.location,
    this.amenities = const [],
    this.images = const [],
    this.pricePerHour,
    this.minimumBookingDuration,
    this.maximumBookingDuration,
    this.advanceBookingDays,
    this.cancellationPolicy,
    this.updatedAt,
  });

  final String id;
  final String clubId;
  final String name;
  final FacilityType type;
  final String? description;
  final String? location;
  final int capacity;
  final List<String> amenities;
  final List<String> images;
  final double? pricePerHour;
  final int? minimumBookingDuration; // in minutes
  final int? maximumBookingDuration; // in minutes
  final int? advanceBookingDays; // how many days in advance can book
  final String? cancellationPolicy;
  final bool isActive;
  final DateTime createdAt;
  final DateTime? updatedAt;

  /// Whether this facility requires payment
  bool get requiresPayment => pricePerHour != null && pricePerHour! > 0;

  /// Whether this facility has a minimum booking duration
  bool get hasMinimumDuration =>
      minimumBookingDuration != null && minimumBookingDuration! > 0;

  /// Whether this facility has a maximum booking duration
  bool get hasMaximumDuration =>
      maximumBookingDuration != null && maximumBookingDuration! > 0;

  @override
  List<Object?> get props => [
        id,
        clubId,
        name,
        type,
        description,
        location,
        capacity,
        amenities,
        images,
        pricePerHour,
        minimumBookingDuration,
        maximumBookingDuration,
        advanceBookingDays,
        cancellationPolicy,
        isActive,
        createdAt,
        updatedAt,
      ];
}

/// Facility availability slot
class FacilityAvailabilitySlot extends Equatable {
  const FacilityAvailabilitySlot({
    required this.startTime,
    required this.endTime,
    required this.isAvailable,
    this.bookingId,
  });

  final DateTime startTime;
  final DateTime endTime;
  final bool isAvailable;
  final String? bookingId; // If not available, which booking occupies this slot

  /// Duration of the slot
  Duration get duration => endTime.difference(startTime);

  @override
  List<Object?> get props => [startTime, endTime, isAvailable, bookingId];
}
