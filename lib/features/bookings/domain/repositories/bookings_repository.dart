import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/booking_entity.dart';
import '../entities/facility_entity.dart';
import '../entities/visit_entity.dart';

/// Repository interface for booking-related operations
///
/// This repository follows Clean Architecture principles and provides
/// an abstraction layer between the domain and data layers.
///
/// All methods return [Either<Failure, T>] to handle errors gracefully
/// without throwing exceptions.
abstract class BookingsRepository {
  /// Get all bookings for the current user
  ///
  /// Parameters:
  /// - [status]: Optional filter by booking status
  /// - [startDate]: Optional filter for bookings starting after this date
  /// - [endDate]: Optional filter for bookings ending before this date
  /// - [limit]: Optional limit on number of results
  /// - [cursor]: Optional pagination cursor
  ///
  /// Returns:
  /// - [Right<List<BookingEntity>>]: List of user's bookings on success
  /// - [Left<Failure>]: Failure object on error
  Future<Either<Failure, List<BookingEntity>>> getUserBookings({
    BookingStatus? status,
    DateTime? startDate,
    DateTime? endDate,
    int? limit,
    String? cursor,
  });

  /// Get upcoming bookings for the current user
  ///
  /// Returns:
  /// - [Right<List<BookingEntity>>]: List of upcoming bookings on success
  /// - [Left<Failure>]: Failure object on error
  Future<Either<Failure, List<BookingEntity>>> getUpcomingBookings();

  /// Get past bookings for the current user
  ///
  /// Returns:
  /// - [Right<List<BookingEntity>>]: List of past bookings on success
  /// - [Left<Failure>]: Failure object on error
  Future<Either<Failure, List<BookingEntity>>> getPastBookings();

  /// Get a single booking by ID
  ///
  /// Parameters:
  /// - [bookingId]: Unique identifier of the booking
  ///
  /// Returns:
  /// - [Right<BookingEntity>]: Booking entity on success
  /// - [Left<Failure>]: Failure object if booking not found or error occurs
  Future<Either<Failure, BookingEntity>> getBookingById(String bookingId);

  /// Create a new booking
  ///
  /// Parameters:
  /// - [facilityId]: ID of the facility to book
  /// - [startTime]: Start time of the booking
  /// - [endTime]: End time of the booking
  /// - [notes]: Optional notes for the booking
  /// - [participantIds]: Optional list of participant user IDs
  ///
  /// Returns:
  /// - [Right<BookingEntity>]: Created booking entity on success
  /// - [Left<Failure>]: Failure object on error
  Future<Either<Failure, BookingEntity>> createBooking({
    required String facilityId,
    required DateTime startTime,
    required DateTime endTime,
    String? notes,
    List<String>? participantIds,
  });

  /// Update an existing booking
  ///
  /// Parameters:
  /// - [bookingId]: ID of the booking to update
  /// - [startTime]: New start time (optional)
  /// - [endTime]: New end time (optional)
  /// - [notes]: Updated notes (optional)
  /// - [participantIds]: Updated participant list (optional)
  ///
  /// Returns:
  /// - [Right<BookingEntity>]: Updated booking entity on success
  /// - [Left<Failure>]: Failure object on error
  Future<Either<Failure, BookingEntity>> updateBooking({
    required String bookingId,
    DateTime? startTime,
    DateTime? endTime,
    String? notes,
    List<String>? participantIds,
  });

  /// Cancel a booking
  ///
  /// Parameters:
  /// - [bookingId]: ID of the booking to cancel
  /// - [reason]: Optional cancellation reason
  ///
  /// Returns:
  /// - [Right<BookingEntity>]: Cancelled booking entity on success
  /// - [Left<Failure>]: Failure object on error
  Future<Either<Failure, BookingEntity>> cancelBooking({
    required String bookingId,
    String? reason,
  });

  /// Confirm a booking
  ///
  /// Parameters:
  /// - [bookingId]: ID of the booking to confirm
  ///
  /// Returns:
  /// - [Right<BookingEntity>]: Confirmed booking entity on success
  /// - [Left<Failure>]: Failure object on error
  Future<Either<Failure, BookingEntity>> confirmBooking(String bookingId);

  /// Check in to a booking
  ///
  /// Parameters:
  /// - [bookingId]: ID of the booking to check in
  ///
  /// Returns:
  /// - [Right<BookingEntity>]: Updated booking entity on success
  /// - [Left<Failure>]: Failure object on error
  Future<Either<Failure, BookingEntity>> checkInBooking(String bookingId);

  /// Check out from a booking
  ///
  /// Parameters:
  /// - [bookingId]: ID of the booking to check out
  ///
  /// Returns:
  /// - [Right<BookingEntity>]: Updated booking entity on success
  /// - [Left<Failure>]: Failure object on error
  Future<Either<Failure, BookingEntity>> checkOutBooking(String bookingId);

  /// Get available time slots for a facility
  ///
  /// Parameters:
  /// - [facilityId]: ID of the facility
  /// - [date]: Date to check availability
  /// - [duration]: Desired booking duration in minutes
  ///
  /// Returns:
  /// - [Right<List<FacilityAvailabilitySlot>>]: Available slots on success
  /// - [Left<Failure>]: Failure object on error
  Future<Either<Failure, List<FacilityAvailabilitySlot>>> getAvailableSlots({
    required String facilityId,
    required DateTime date,
    int? duration,
  });

  /// Check if a specific time slot is available
  ///
  /// Parameters:
  /// - [facilityId]: ID of the facility
  /// - [startTime]: Start time to check
  /// - [endTime]: End time to check
  ///
  /// Returns:
  /// - [Right<bool>]: true if available, false otherwise
  /// - [Left<Failure>]: Failure object on error
  Future<Either<Failure, bool>> checkAvailability({
    required String facilityId,
    required DateTime startTime,
    required DateTime endTime,
  });

  /// Get all visits for the current user
  ///
  /// Returns:
  /// - [Right<List<VisitEntity>>]: List of user's visits on success
  /// - [Left<Failure>]: Failure object on error
  Future<Either<Failure, List<VisitEntity>>> getUserVisits();

  /// Record a new visit (check-in to a club)
  ///
  /// Parameters:
  /// - [clubId]: ID of the club to visit
  /// - [purpose]: Optional purpose of visit
  /// - [guestCount]: Optional number of guests
  ///
  /// Returns:
  /// - [Right<VisitEntity>]: Created visit entity on success
  /// - [Left<Failure>]: Failure object on error
  Future<Either<Failure, VisitEntity>> recordVisit({
    required String clubId,
    String? purpose,
    int? guestCount,
  });

  /// Check out from a visit
  ///
  /// Parameters:
  /// - [visitId]: ID of the visit to checkout
  /// - [rating]: Optional rating for the visit
  /// - [review]: Optional review text
  ///
  /// Returns:
  /// - [Right<VisitEntity>]: Updated visit entity on success
  /// - [Left<Failure>]: Failure object on error
  Future<Either<Failure, VisitEntity>> checkoutVisit({
    required String visitId,
    double? rating,
    String? review,
  });

  /// Get booking statistics for the user
  ///
  /// Returns:
  /// - [Right<BookingStatistics>]: Booking statistics on success
  /// - [Left<Failure>]: Failure object on error
  Future<Either<Failure, BookingStatistics>> getBookingStatistics();
}

/// Booking statistics entity
class BookingStatistics {
  const BookingStatistics({
    required this.totalBookings,
    required this.upcomingBookings,
    required this.completedBookings,
    required this.cancelledBookings,
    required this.noShowBookings,
  });

  final int totalBookings;
  final int upcomingBookings;
  final int completedBookings;
  final int cancelledBookings;
  final int noShowBookings;

  /// Completion rate (completed / total)
  double get completionRate {
    if (totalBookings == 0) return 0.0;
    return completedBookings / totalBookings;
  }

  /// Cancellation rate (cancelled / total)
  double get cancellationRate {
    if (totalBookings == 0) return 0.0;
    return cancelledBookings / totalBookings;
  }
}
