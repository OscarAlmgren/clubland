import 'package:equatable/equatable.dart';

import '../../../../core/graphql/graphql_api.dart';

/// Event entity - represents a club event in the domain layer
class EventEntity extends Equatable {
  const EventEntity({
    required this.id,
    required this.clubId,
    required this.title,
    required this.description,
    required this.eventType,
    required this.startTime,
    required this.endTime,
    required this.availableSpots,
    required this.guestPolicy,
    required this.fullHouseExclusive,
    required this.createdAt,
    required this.updatedAt,
    this.location,
    this.imageUrl,
    this.capacity,
    this.currentAttendees,
    this.maxGuestsPerMember,
    this.requiresApproval,
    this.requiresPayment,
    this.price,
    this.cancellationDeadline,
    this.freeCancellationDays,
    this.cancellationFeePercentage,
    this.allowsSubgroupPriority,
    this.rsvpDeadline,
    this.subgroupId,
    this.organizerName,
    this.contactEmail,
    this.contactPhone,
    this.paymentInstructions,
    this.tentativeCount,
    this.waitlistCount,
    this.tags = const [],
  });

  final String id;
  final String clubId;
  final String title;
  final String description;
  final Enum$ClubEventType eventType;
  final DateTime startTime;
  final DateTime endTime;
  final String? location;
  final String? imageUrl;

  // Capacity
  final int? capacity;
  final int? currentAttendees;
  final int availableSpots;
  final int? tentativeCount;
  final int? waitlistCount;

  // Guest policy
  final Enum$GuestPolicy guestPolicy;
  final int? maxGuestsPerMember;

  // RSVP settings
  final bool? requiresApproval;
  final bool? requiresPayment;
  final double? price;
  final DateTime? rsvpDeadline;

  // Cancellation
  final DateTime? cancellationDeadline;
  final int? freeCancellationDays;
  final double? cancellationFeePercentage;

  // Settings
  final bool? allowsSubgroupPriority;
  final bool fullHouseExclusive;

  // Subgroup
  final String? subgroupId;

  // Organizer
  final String? organizerName;
  final String? contactEmail;
  final String? contactPhone;

  // Payment
  final String? paymentInstructions;

  // Tags
  final List<String> tags;

  // Timestamps
  final DateTime createdAt;
  final DateTime updatedAt;

  /// Whether this event is full
  bool get isFull => availableSpots <= 0;

  /// Whether this event accepts guests
  bool get acceptsGuests => guestPolicy != Enum$GuestPolicy.NO_GUESTS;

  /// Whether this event is paid
  bool get isPaid => (requiresPayment ?? false) && price != null && price! > 0;

  /// Whether this event is upcoming
  bool get isUpcoming => DateTime.now().isBefore(startTime);

  /// Whether this event is past
  bool get isPast => DateTime.now().isAfter(endTime);

  /// Whether RSVP is still open
  bool get canRSVP {
    if (rsvpDeadline == null) return isUpcoming;
    return DateTime.now().isBefore(rsvpDeadline!) && isUpcoming;
  }

  /// Capacity utilization percentage (0.0 to 1.0)
  double get capacityUtilization {
    if (capacity == null || capacity == 0 || currentAttendees == null) {
      return 0.0;
    }
    return currentAttendees! / capacity!;
  }

  /// Whether event is nearly full (>= 90%)
  bool get isNearlyFull => capacityUtilization >= 0.9;

  @override
  List<Object?> get props => [
    id,
    clubId,
    title,
    description,
    eventType,
    startTime,
    endTime,
    location,
    imageUrl,
    capacity,
    currentAttendees,
    availableSpots,
    guestPolicy,
    maxGuestsPerMember,
    requiresApproval,
    requiresPayment,
    price,
    cancellationDeadline,
    freeCancellationDays,
    cancellationFeePercentage,
    allowsSubgroupPriority,
    fullHouseExclusive,
    rsvpDeadline,
    createdAt,
    updatedAt,
    subgroupId,
    organizerName,
    contactEmail,
    contactPhone,
    paymentInstructions,
    tentativeCount,
    waitlistCount,
    tags,
  ];
}
