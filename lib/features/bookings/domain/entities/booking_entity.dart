import 'package:equatable/equatable.dart';

/// Booking status enumeration
enum BookingStatus {
  confirmed,
  pending,
  cancelled,
  completed,
  noShow,
}

/// Booking entity - represents a facility booking in the domain layer
class BookingEntity extends Equatable {
  const BookingEntity({
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.status,
    required this.club,
    required this.facility,
    required this.user,
    required this.createdAt,
    this.notes,
    this.participants = const [],
    this.payment,
    this.cancellation,
    this.updatedAt,
  });

  final String id;
  final DateTime startTime;
  final DateTime endTime;
  final BookingStatus status;
  final String? notes;
  final ClubSummaryEntity club;
  final FacilitySummaryEntity facility;
  final UserSummaryEntity user;
  final List<BookingParticipantEntity> participants;
  final BookingPaymentEntity? payment;
  final BookingCancellationEntity? cancellation;
  final DateTime createdAt;
  final DateTime? updatedAt;

  /// Whether this booking is upcoming
  bool get isUpcoming => DateTime.now().isBefore(startTime);

  /// Whether this booking is in the past
  bool get isPast => DateTime.now().isAfter(endTime);

  /// Whether this booking is currently active
  bool get isActive =>
      DateTime.now().isAfter(startTime) && DateTime.now().isBefore(endTime);

  /// Whether this booking can be cancelled
  bool get canBeCancelled =>
      status == BookingStatus.confirmed || status == BookingStatus.pending;

  /// Whether this booking can be modified
  bool get canBeModified =>
      status == BookingStatus.confirmed || status == BookingStatus.pending;

  /// Duration of the booking
  Duration get duration => endTime.difference(startTime);

  @override
  List<Object?> get props => [
        id,
        startTime,
        endTime,
        status,
        notes,
        club,
        facility,
        user,
        participants,
        payment,
        cancellation,
        createdAt,
        updatedAt,
      ];
}

/// Club summary entity for bookings
class ClubSummaryEntity extends Equatable {
  const ClubSummaryEntity({
    required this.id,
    required this.name,
    this.logo,
    this.address,
  });

  final String id;
  final String name;
  final String? logo;
  final String? address;

  @override
  List<Object?> get props => [id, name, logo, address];
}

/// Facility summary entity for bookings
class FacilitySummaryEntity extends Equatable {
  const FacilitySummaryEntity({
    required this.id,
    required this.name,
    this.description,
    this.capacity,
  });

  final String id;
  final String name;
  final String? description;
  final int? capacity;

  @override
  List<Object?> get props => [id, name, description, capacity];
}

/// User summary entity for bookings
class UserSummaryEntity extends Equatable {
  const UserSummaryEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.avatar,
  });

  final String id;
  final String firstName;
  final String lastName;
  final String? avatar;

  /// Full name of the user
  String get fullName => '$firstName $lastName';

  @override
  List<Object?> get props => [id, firstName, lastName, avatar];
}

/// Booking participant entity
class BookingParticipantEntity extends Equatable {
  const BookingParticipantEntity({
    required this.id,
    required this.user,
    required this.role,
    required this.status,
  });

  final String id;
  final UserSummaryEntity user;
  final String role;
  final String status;

  @override
  List<Object?> get props => [id, user, role, status];
}

/// Booking payment entity
class BookingPaymentEntity extends Equatable {
  const BookingPaymentEntity({
    required this.amount,
    required this.currency,
    required this.status,
    required this.method,
  });

  final double amount;
  final String currency;
  final String status;
  final String method;

  @override
  List<Object?> get props => [amount, currency, status, method];
}

/// Booking cancellation entity
class BookingCancellationEntity extends Equatable {
  const BookingCancellationEntity({
    required this.reason,
    required this.cancelledAt,
    this.refundAmount,
  });

  final String reason;
  final DateTime cancelledAt;
  final double? refundAmount;

  @override
  List<Object?> get props => [reason, cancelledAt, refundAmount];
}
