import 'package:equatable/equatable.dart';

enum BookingStatus {
  confirmed,
  pending,
  cancelled,
  completed,
  noShow,
}

enum BookingUpdateType {
  confirmed,
  cancelled,
  modified,
  reminder,
}

class BookingModel extends Equatable {
  const BookingModel({
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
  final ClubSummary club;
  final FacilitySummary facility;
  final UserSummary user;
  final List<BookingParticipant> participants;
  final BookingPayment? payment;
  final BookingCancellation? cancellation;
  final DateTime createdAt;
  final DateTime? updatedAt;

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      id: json['id'] as String,
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      status: BookingStatus.values.firstWhere(
        (status) => status.name == json['status'],
        orElse: () => BookingStatus.pending,
      ),
      notes: json['notes'] as String?,
      club: ClubSummary.fromJson(json['club'] as Map<String, dynamic>),
      facility: FacilitySummary.fromJson(json['facility'] as Map<String, dynamic>),
      user: UserSummary.fromJson(json['user'] as Map<String, dynamic>),
      participants: (json['participants'] as List<dynamic>?)
              ?.map((p) => BookingParticipant.fromJson(p as Map<String, dynamic>))
              .toList() ??
          [],
      payment: json['payment'] != null
          ? BookingPayment.fromJson(json['payment'] as Map<String, dynamic>)
          : null,
      cancellation: json['cancellation'] != null
          ? BookingCancellation.fromJson(json['cancellation'] as Map<String, dynamic>)
          : null,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
      'status': status.name,
      'notes': notes,
      'club': club.toJson(),
      'facility': facility.toJson(),
      'user': user.toJson(),
      'participants': participants.map((p) => p.toJson()).toList(),
      'payment': payment?.toJson(),
      'cancellation': cancellation?.toJson(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  bool get isUpcoming => DateTime.now().isBefore(startTime);
  bool get isPast => DateTime.now().isAfter(endTime);
  bool get isActive => DateTime.now().isAfter(startTime) && DateTime.now().isBefore(endTime);

  /// Whether this booking can be cancelled
  bool get canBeCancelled => status == BookingStatus.confirmed || status == BookingStatus.pending;

  /// Whether this booking can be modified
  bool get canBeModified => status == BookingStatus.confirmed || status == BookingStatus.pending;

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

class BookingUpdate {
  const BookingUpdate({
    required this.type,
    required this.booking,
    required this.message,
    required this.timestamp,
  });

  final BookingUpdateType type;
  final BookingModel booking;
  final String message;
  final DateTime timestamp;

  factory BookingUpdate.fromJson(Map<String, dynamic> json) {
    return BookingUpdate(
      type: BookingUpdateType.values.firstWhere(
        (type) => type.name == json['type'],
        orElse: () => BookingUpdateType.modified,
      ),
      booking: BookingModel.fromJson(json['booking'] as Map<String, dynamic>),
      message: json['message'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );
  }
}

class ClubSummary extends Equatable {
  const ClubSummary({
    required this.id,
    required this.name,
    this.logo,
    this.address,
  });

  final String id;
  final String name;
  final String? logo;
  final String? address;

  factory ClubSummary.fromJson(Map<String, dynamic> json) {
    return ClubSummary(
      id: json['id'] as String,
      name: json['name'] as String,
      logo: json['logo'] as String?,
      address: json['address'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'logo': logo,
      'address': address,
    };
  }

  @override
  List<Object?> get props => [id, name, logo, address];
}

class FacilitySummary extends Equatable {
  const FacilitySummary({
    required this.id,
    required this.name,
    this.description,
    this.capacity,
  });

  final String id;
  final String name;
  final String? description;
  final int? capacity;

  factory FacilitySummary.fromJson(Map<String, dynamic> json) {
    return FacilitySummary(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      capacity: json['capacity'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'capacity': capacity,
    };
  }

  @override
  List<Object?> get props => [id, name, description, capacity];
}

class UserSummary extends Equatable {
  const UserSummary({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.avatar,
  });

  final String id;
  final String firstName;
  final String lastName;
  final String? avatar;

  factory UserSummary.fromJson(Map<String, dynamic> json) {
    return UserSummary(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      avatar: json['avatar'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'avatar': avatar,
    };
  }

  String get fullName => '$firstName $lastName';

  @override
  List<Object?> get props => [id, firstName, lastName, avatar];
}

class BookingParticipant extends Equatable {
  const BookingParticipant({
    required this.id,
    required this.user,
    required this.role,
    required this.status,
  });

  final String id;
  final UserSummary user;
  final String role;
  final String status;

  factory BookingParticipant.fromJson(Map<String, dynamic> json) {
    return BookingParticipant(
      id: json['id'] as String,
      user: UserSummary.fromJson(json['user'] as Map<String, dynamic>),
      role: json['role'] as String,
      status: json['status'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user.toJson(),
      'role': role,
      'status': status,
    };
  }

  @override
  List<Object?> get props => [id, user, role, status];
}

class BookingPayment extends Equatable {
  const BookingPayment({
    required this.amount,
    required this.currency,
    required this.status,
    required this.method,
  });

  final double amount;
  final String currency;
  final String status;
  final String method;

  factory BookingPayment.fromJson(Map<String, dynamic> json) {
    return BookingPayment(
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String,
      status: json['status'] as String,
      method: json['method'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'currency': currency,
      'status': status,
      'method': method,
    };
  }

  @override
  List<Object?> get props => [amount, currency, status, method];
}

class BookingCancellation extends Equatable {
  const BookingCancellation({
    required this.reason,
    required this.cancelledAt,
    this.refundAmount,
  });

  final String reason;
  final DateTime cancelledAt;
  final double? refundAmount;

  factory BookingCancellation.fromJson(Map<String, dynamic> json) {
    return BookingCancellation(
      reason: json['reason'] as String,
      cancelledAt: DateTime.parse(json['cancelledAt'] as String),
      refundAmount: (json['refundAmount'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'reason': reason,
      'cancelledAt': cancelledAt.toIso8601String(),
      'refundAmount': refundAmount,
    };
  }

  @override
  List<Object?> get props => [reason, cancelledAt, refundAmount];
}