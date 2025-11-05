import '../../../../core/errors/exceptions.dart';
import '../../domain/repositories/bookings_repository.dart';
import '../datasources/bookings_remote_datasource.dart';
import '../models/booking_model.dart';
import '../models/facility_availability_model.dart';

/// Implementation of [BookingsRepository] that fetches data from remote API.
class BookingsRepositoryImpl implements BookingsRepository {
  /// Creates a new [BookingsRepositoryImpl] with the given remote data source.
  const BookingsRepositoryImpl({required BookingsRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  final BookingsRemoteDataSource _remoteDataSource;

  @override
  Future<List<BookingModel>> getUserBookings({
    BookingStatus? status,
    DateTime? startDate,
    DateTime? endDate,
    int? limit,
    String? cursor,
  }) async {
    try {
      return await _remoteDataSource.getUserBookings(
        status: status,
        startDate: startDate,
        endDate: endDate,
        limit: limit,
        cursor: cursor,
      );
    } on NetworkException {
      rethrow;
    } on Exception catch (e) {
      throw NetworkException('Failed to fetch user bookings: $e', 'FETCH_ERROR');
    }
  }

  @override
  Future<BookingModel> getBookingById(String bookingId) async {
    try {
      return await _remoteDataSource.getBookingById(bookingId);
    } on NetworkException {
      rethrow;
    } on Exception catch (e) {
      throw NetworkException('Failed to fetch booking: $e', 'FETCH_ERROR');
    }
  }

  @override
  Future<FacilityAvailabilityModel> getFacilityAvailability({
    required String facilityId,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    try {
      return await _remoteDataSource.getFacilityAvailability(
        facilityId: facilityId,
        startDate: startDate,
        endDate: endDate,
      );
    } on NetworkException {
      rethrow;
    } on Exception catch (e) {
      throw NetworkException(
        'Failed to fetch facility availability: $e',
        'FETCH_ERROR',
      );
    }
  }

  @override
  Future<BookingModel> createBooking({
    required String facilityId,
    required DateTime startTime,
    required DateTime endTime,
    String? notes,
    List<String>? participantIds,
  }) async {
    try {
      return await _remoteDataSource.createBooking(
        facilityId: facilityId,
        startTime: startTime,
        endTime: endTime,
        notes: notes,
        participantIds: participantIds,
      );
    } on NetworkException {
      rethrow;
    } on Exception catch (e) {
      throw NetworkException('Failed to create booking: $e', 'CREATE_ERROR');
    }
  }

  @override
  Future<BookingModel> updateBooking({
    required String bookingId,
    DateTime? startTime,
    DateTime? endTime,
    String? notes,
    List<String>? participantIds,
  }) async {
    try {
      return await _remoteDataSource.updateBooking(
        bookingId: bookingId,
        startTime: startTime,
        endTime: endTime,
        notes: notes,
        participantIds: participantIds,
      );
    } on NetworkException {
      rethrow;
    } on Exception catch (e) {
      throw NetworkException('Failed to update booking: $e', 'UPDATE_ERROR');
    }
  }

  @override
  Future<BookingModel> cancelBooking({
    required String bookingId,
    String? reason,
  }) async {
    try {
      return await _remoteDataSource.cancelBooking(
        bookingId: bookingId,
        reason: reason,
      );
    } on NetworkException {
      rethrow;
    } on Exception catch (e) {
      throw NetworkException('Failed to cancel booking: $e', 'CANCEL_ERROR');
    }
  }

  @override
  Stream<BookingUpdateEvent> subscribeToBookingUpdates(String userId) {
    try {
      return _remoteDataSource.subscribeToBookingUpdates(userId);
    } on NetworkException {
      rethrow;
    } on Exception catch (e) {
      throw NetworkException(
        'Failed to subscribe to booking updates: $e',
        'SUBSCRIPTION_ERROR',
      );
    }
  }
}
