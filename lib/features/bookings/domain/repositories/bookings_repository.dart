import '../../data/datasources/bookings_remote_datasource.dart';
import '../../data/models/booking_model.dart';
import '../../data/models/facility_availability_model.dart';

/// Repository interface for bookings operations following Clean Architecture.
///
/// This interface defines the contract for booking data operations,
/// allowing the presentation layer to interact with booking data
/// without knowing the implementation details.
abstract class BookingsRepository {
  /// Fetches all bookings for the current user.
  ///
  /// Returns a list of [BookingModel] objects. Can be filtered by:
  /// - [status]: Filter by booking status (confirmed, pending, cancelled, etc.)
  /// - [startDate]: Only include bookings starting after this date
  /// - [endDate]: Only include bookings ending before this date
  /// - [limit]: Maximum number of bookings to return
  /// - [cursor]: Pagination cursor for fetching next page
  Future<List<BookingModel>> getUserBookings({
    BookingStatus? status,
    DateTime? startDate,
    DateTime? endDate,
    int? limit,
    String? cursor,
  });

  /// Fetches a single booking by its ID.
  ///
  /// Throws [NetworkException.notFound] if the booking doesn't exist.
  Future<BookingModel> getBookingById(String bookingId);

  /// Checks availability for a specific facility.
  ///
  /// Returns a [FacilityAvailabilityModel] containing available time slots
  /// for the specified facility between [startDate] and [endDate].
  Future<FacilityAvailabilityModel> getFacilityAvailability({
    required String facilityId,
    required DateTime startDate,
    required DateTime endDate,
  });

  /// Creates a new booking for a facility.
  ///
  /// Returns the created [BookingModel] with server-assigned ID and timestamps.
  /// Throws [NetworkException] if the booking cannot be created
  /// (e.g., facility unavailable, invalid time slot).
  Future<BookingModel> createBooking({
    required String facilityId,
    required DateTime startTime,
    required DateTime endTime,
    String? notes,
    List<String>? participantIds,
  });

  /// Updates an existing booking.
  ///
  /// Only the provided parameters will be updated. Returns the updated
  /// [BookingModel]. Throws [NetworkException.notFound] if booking doesn't exist.
  Future<BookingModel> updateBooking({
    required String bookingId,
    DateTime? startTime,
    DateTime? endTime,
    String? notes,
    List<String>? participantIds,
  });

  /// Cancels an existing booking.
  ///
  /// Returns the cancelled [BookingModel] with updated status and cancellation details.
  /// Optionally provide a [reason] for cancellation (for customer service tracking).
  Future<BookingModel> cancelBooking({
    required String bookingId,
    String? reason,
  });

  /// Subscribes to real-time booking updates for the current user.
  ///
  /// Returns a Stream of booking update events (confirmations, cancellations, etc.)
  /// via WebSocket subscription.
  Stream<BookingUpdateEvent> subscribeToBookingUpdates(String userId);
}
