import 'package:equatable/equatable.dart';

class FacilityAvailabilityModel extends Equatable {
  const FacilityAvailabilityModel({
    required this.facility,
    required this.availableSlots,
    required this.bookedSlots,
  });

  final FacilityDetails facility;
  final List<AvailableSlot> availableSlots;
  final List<BookedSlot> bookedSlots;

  factory FacilityAvailabilityModel.fromJson(Map<String, dynamic> json) {
    return FacilityAvailabilityModel(
      facility: FacilityDetails.fromJson(json['facility'] as Map<String, dynamic>),
      availableSlots: (json['availableSlots'] as List<dynamic>)
          .map((slot) => AvailableSlot.fromJson(slot as Map<String, dynamic>))
          .toList(),
      bookedSlots: (json['bookedSlots'] as List<dynamic>)
          .map((slot) => BookedSlot.fromJson(slot as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'facility': facility.toJson(),
      'availableSlots': availableSlots.map((slot) => slot.toJson()).toList(),
      'bookedSlots': bookedSlots.map((slot) => slot.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [facility, availableSlots, bookedSlots];
}

class FacilityDetails extends Equatable {
  const FacilityDetails({
    required this.id,
    required this.name,
    required this.capacity,
    required this.bookingSettings,
  });

  final String id;
  final String name;
  final int capacity;
  final BookingSettings bookingSettings;

  factory FacilityDetails.fromJson(Map<String, dynamic> json) {
    return FacilityDetails(
      id: json['id'] as String,
      name: json['name'] as String,
      capacity: json['capacity'] as int,
      bookingSettings: BookingSettings.fromJson(
        json['bookingSettings'] as Map<String, dynamic>,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'capacity': capacity,
      'bookingSettings': bookingSettings.toJson(),
    };
  }

  @override
  List<Object?> get props => [id, name, capacity, bookingSettings];
}

class BookingSettings extends Equatable {
  const BookingSettings({
    required this.minBookingDuration,
    required this.maxBookingDuration,
    required this.advanceBookingLimit,
    required this.cancellationPolicy,
  });

  final Duration minBookingDuration;
  final Duration maxBookingDuration;
  final Duration advanceBookingLimit;
  final String cancellationPolicy;

  factory BookingSettings.fromJson(Map<String, dynamic> json) {
    return BookingSettings(
      minBookingDuration: Duration(minutes: json['minBookingDuration'] as int),
      maxBookingDuration: Duration(minutes: json['maxBookingDuration'] as int),
      advanceBookingLimit: Duration(hours: json['advanceBookingLimit'] as int),
      cancellationPolicy: json['cancellationPolicy'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'minBookingDuration': minBookingDuration.inMinutes,
      'maxBookingDuration': maxBookingDuration.inMinutes,
      'advanceBookingLimit': advanceBookingLimit.inHours,
      'cancellationPolicy': cancellationPolicy,
    };
  }

  @override
  List<Object?> get props => [
        minBookingDuration,
        maxBookingDuration,
        advanceBookingLimit,
        cancellationPolicy,
      ];
}

class AvailableSlot extends Equatable {
  const AvailableSlot({
    required this.startTime,
    required this.endTime,
    required this.available,
    required this.capacity,
    required this.remainingSpots,
    this.price,
  });

  final DateTime startTime;
  final DateTime endTime;
  final bool available;
  final int capacity;
  final int remainingSpots;
  final SlotPrice? price;

  factory AvailableSlot.fromJson(Map<String, dynamic> json) {
    return AvailableSlot(
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      available: json['available'] as bool,
      capacity: json['capacity'] as int,
      remainingSpots: json['remainingSpots'] as int,
      price: json['price'] != null
          ? SlotPrice.fromJson(json['price'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
      'available': available,
      'capacity': capacity,
      'remainingSpots': remainingSpots,
      'price': price?.toJson(),
    };
  }

  @override
  List<Object?> get props => [
        startTime,
        endTime,
        available,
        capacity,
        remainingSpots,
        price,
      ];
}

class BookedSlot extends Equatable {
  const BookedSlot({
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.participant,
  });

  final String id;
  final DateTime startTime;
  final DateTime endTime;
  final SlotParticipant participant;

  factory BookedSlot.fromJson(Map<String, dynamic> json) {
    return BookedSlot(
      id: json['id'] as String,
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      participant: SlotParticipant.fromJson(
        json['participant'] as Map<String, dynamic>,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
      'participant': participant.toJson(),
    };
  }

  @override
  List<Object?> get props => [id, startTime, endTime, participant];
}

class SlotPrice extends Equatable {
  const SlotPrice({
    required this.amount,
    required this.currency,
  });

  final double amount;
  final String currency;

  factory SlotPrice.fromJson(Map<String, dynamic> json) {
    return SlotPrice(
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'currency': currency,
    };
  }

  @override
  List<Object?> get props => [amount, currency];
}

class SlotParticipant extends Equatable {
  const SlotParticipant({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  final String id;
  final String firstName;
  final String lastName;

  factory SlotParticipant.fromJson(Map<String, dynamic> json) {
    return SlotParticipant(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
    };
  }

  String get fullName => '$firstName $lastName';

  @override
  List<Object?> get props => [id, firstName, lastName];
}