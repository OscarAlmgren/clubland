import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/booking_entity.dart';
import '../../domain/entities/facility_entity.dart';
import '../../domain/entities/visit_entity.dart';
import '../../domain/repositories/bookings_repository.dart';
import '../datasources/bookings_remote_datasource.dart';
import '../models/booking_model.dart';

/// Implementation of [BookingsRepository]
///
/// This class implements the repository interface and handles the conversion
/// between data models and domain entities. It also handles error mapping
/// from exceptions to failures.
class BookingsRepositoryImpl implements BookingsRepository {
  const BookingsRepositoryImpl({
    required BookingsRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  final BookingsRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, List<BookingEntity>>> getUserBookings() async {
    try {
      final bookings = await _remoteDataSource.getUserBookings();
      return Right(_convertModelsToEntities(bookings));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message, e.code));
    } on GraphQLException catch (e) {
      return Left(ServerFailure(e.message, e.code));
    } on Exception catch (e) {
      return Left(ServerFailure('Unexpected error: ${e}'));
    }
  }

  @override
  Future<Either<Failure, List<BookingEntity>>> getUpcomingBookings() async {
    try {
      final bookings = await _remoteDataSource.getUserBookings(
        startDate: DateTime.now(),
      );
      final upcomingBookings = bookings.where((b) => b.isUpcoming).toList();
      return Right(_convertModelsToEntities(upcomingBookings));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message, e.code));
    } on GraphQLException catch (e) {
      return Left(ServerFailure(e.message, e.code));
    } on Exception catch (e) {
      return Left(ServerFailure('Unexpected error: ${e}'));
    }
  }

  @override
  Future<Either<Failure, List<BookingEntity>>> getPastBookings() async {
    try {
      final bookings = await _remoteDataSource.getUserBookings(
        endDate: DateTime.now(),
      );
      final pastBookings = bookings.where((b) => b.isPast).toList();
      return Right(_convertModelsToEntities(pastBookings));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message, e.code));
    } on GraphQLException catch (e) {
      return Left(ServerFailure(e.message, e.code));
    } on Exception catch (e) {
      return Left(ServerFailure('Unexpected error: ${e}'));
    }
  }

  @override
  Future<Either<Failure, BookingEntity>> getBookingById(
    String bookingId,
  ) async {
    try {
      final booking = await _remoteDataSource.getBookingById(bookingId);
      return Right(_convertModelToEntity(booking));
    } on NetworkException catch (e) {
      if (e.code == 'NOT_FOUND') {
        return Left(NotFoundFailure('Booking not found', e.code));
      }
      return Left(NetworkFailure(e.message, e.code));
    } on GraphQLException catch (e) {
      return Left(ServerFailure(e.message, e.code));
    } on Exception catch (e) {
      return Left(ServerFailure('Unexpected error: ${e}'));
    }
  }

  @override
  Future<Either<Failure, BookingEntity>> createBooking({
    required String facilityId,
    required DateTime startTime,
    required DateTime endTime,
    String? notes,
    List<String>? participantIds,
  }) async {
    try {
      final booking = await _remoteDataSource.createBooking(
        facilityId: facilityId,
        startTime: startTime,
        endTime: endTime,
        notes: notes,
        participantIds: participantIds,
      );
      return Right(_convertModelToEntity(booking));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message, e.code));
    } on GraphQLException catch (e) {
      return Left(ServerFailure(e.message, e.code));
    } on ValidationException catch (e) {
      return Left(ValidationFailure(e.message, e.code));
    } on Exception catch (e) {
      return Left(ServerFailure('Unexpected error: ${e}'));
    }
  }

  @override
  Future<Either<Failure, BookingEntity>> updateBooking({
    required String bookingId,
    DateTime? startTime,
    DateTime? endTime,
    String? notes,
    List<String>? participantIds,
  }) async {
    try {
      final booking = await _remoteDataSource.updateBooking(
        bookingId: bookingId,
        startTime: startTime,
        endTime: endTime,
        notes: notes,
        participantIds: participantIds,
      );
      return Right(_convertModelToEntity(booking));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message, e.code));
    } on GraphQLException catch (e) {
      return Left(ServerFailure(e.message, e.code));
    } on ValidationException catch (e) {
      return Left(ValidationFailure(e.message, e.code));
    } on Exception catch (e) {
      return Left(ServerFailure('Unexpected error: ${e}'));
    }
  }

  @override
  Future<Either<Failure, BookingEntity>> cancelBooking({
    required String bookingId,
    String? reason,
  }) async {
    try {
      final booking = await _remoteDataSource.cancelBooking(
        bookingId: bookingId,
        reason: reason,
      );
      return Right(_convertModelToEntity(booking));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message, e.code));
    } on GraphQLException catch (e) {
      return Left(ServerFailure(e.message, e.code));
    } on Exception catch (e) {
      return Left(ServerFailure('Unexpected error: ${e}'));
    }
  }

  @override
  Future<Either<Failure, BookingEntity>> confirmBooking(
    String bookingId,
  ) async {
    // Note: This would need to be implemented in the datasource
    // For now, return a NotImplementedFailure
    return const Left(
      ServerFailure('Confirm booking not yet implemented', 'NOT_IMPLEMENTED'),
    );
  }

  @override
  Future<Either<Failure, BookingEntity>> checkInBooking(
    String bookingId,
  ) async {
    // Note: This would need to be implemented in the datasource
    // For now, return a NotImplementedFailure
    return const Left(
      ServerFailure('Check in booking not yet implemented', 'NOT_IMPLEMENTED'),
    );
  }

  @override
  Future<Either<Failure, BookingEntity>> checkOutBooking(
    String bookingId,
  ) async {
    // Note: This would need to be implemented in the datasource
    // For now, return a NotImplementedFailure
    return const Left(
      ServerFailure('Check out booking not yet implemented', 'NOT_IMPLEMENTED'),
    );
  }

  @override
  Future<Either<Failure, List<FacilityAvailabilitySlot>>> getAvailableSlots({
    required String facilityId,
    required DateTime date,
    int? duration,
  }) async {
    try {
      final availability = await _remoteDataSource.getFacilityAvailability(
        facilityId: facilityId,
        startDate: date,
        endDate: date.add(const Duration(days: 1)),
      );

      // Convert availability model to slots
      final slots = availability.slots
          .map(
            (slot) => FacilityAvailabilitySlot(
              startTime: slot.startTime,
              endTime: slot.endTime,
              isAvailable: slot.isAvailable,
              bookingId: slot.bookingId,
            ),
          )
          .toList();

      return Right(slots);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message, e.code));
    } on GraphQLException catch (e) {
      return Left(ServerFailure(e.message, e.code));
    } on Exception catch (e) {
      return Left(ServerFailure('Unexpected error: ${e}'));
    }
  }

  @override
  Future<Either<Failure, bool>> checkAvailability({
    required String facilityId,
    required DateTime startTime,
    required DateTime endTime,
  }) async {
    try {
      final availability = await _remoteDataSource.getFacilityAvailability(
        facilityId: facilityId,
        startDate: startTime,
        endDate: endTime,
      );

      // Check if the requested time slot is available
      final isAvailable = availability.slots.any(
        (slot) =>
            slot.startTime.isBefore(startTime) &&
            slot.endTime.isAfter(endTime) &&
            slot.isAvailable,
      );

      return Right(isAvailable);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message, e.code));
    } on GraphQLException catch (e) {
      return Left(ServerFailure(e.message, e.code));
    } on Exception catch (e) {
      return Left(ServerFailure('Unexpected error: ${e}'));
    }
  }

  @override
  Future<Either<Failure, List<VisitEntity>>> getUserVisits() async {
    // Note: This would need to be implemented in the datasource
    // For now, return an empty list
    return const Right([]);
  }

  @override
  Future<Either<Failure, VisitEntity>> recordVisit({
    required String clubId,
    String? purpose,
    int? guestCount,
  }) async {
    // Note: This would need to be implemented in the datasource
    // For now, return a NotImplementedFailure
    return const Left(
      ServerFailure('Record visit not yet implemented', 'NOT_IMPLEMENTED'),
    );
  }

  @override
  Future<Either<Failure, VisitEntity>> checkoutVisit({
    required String visitId,
    double? rating,
    String? review,
  }) async {
    // Note: This would need to be implemented in the datasource
    // For now, return a NotImplementedFailure
    return const Left(
      ServerFailure('Checkout visit not yet implemented', 'NOT_IMPLEMENTED'),
    );
  }

  @override
  Future<Either<Failure, BookingStatistics>> getBookingStatistics() async {
    try {
      final bookings = await _remoteDataSource.getUserBookings();

      // Calculate statistics from bookings
      final stats = BookingStatistics(
        totalBookings: bookings.length,
        upcomingBookings: bookings.where((b) => b.isUpcoming).length,
        completedBookings: bookings
            .where((b) => b.status == BookingStatus.completed)
            .length,
        cancelledBookings: bookings
            .where((b) => b.status == BookingStatus.cancelled)
            .length,
        noShowBookings: bookings
            .where((b) => b.status == BookingStatus.noShow)
            .length,
      );

      return Right(stats);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message, e.code));
    } on GraphQLException catch (e) {
      return Left(ServerFailure(e.message, e.code));
    } on Exception catch (e) {
      return Left(ServerFailure('Unexpected error: ${e}'));
    }
  }

  // Helper methods for conversion

  BookingEntity _convertModelToEntity(BookingModel model) {
    return BookingEntity(
      id: model.id,
      startTime: model.startTime,
      endTime: model.endTime,
      status: model.status,
      notes: model.notes,
      club: ClubSummaryEntity(
        id: model.club.id,
        name: model.club.name,
        logo: model.club.logo,
        address: model.club.address,
      ),
      facility: FacilitySummaryEntity(
        id: model.facility.id,
        name: model.facility.name,
        description: model.facility.description,
        capacity: model.facility.capacity,
      ),
      user: UserSummaryEntity(
        id: model.user.id,
        firstName: model.user.firstName,
        lastName: model.user.lastName,
        avatar: model.user.avatar,
      ),
      participants: model.participants
          .map(
            (p) => BookingParticipantEntity(
              id: p.id,
              user: UserSummaryEntity(
                id: p.user.id,
                firstName: p.user.firstName,
                lastName: p.user.lastName,
                avatar: p.user.avatar,
              ),
              role: p.role,
              status: p.status,
            ),
          )
          .toList(),
      payment: model.payment != null
          ? BookingPaymentEntity(
              amount: model.payment!.amount,
              currency: model.payment!.currency,
              status: model.payment!.status,
              method: model.payment!.method,
            )
          : null,
      cancellation: model.cancellation != null
          ? BookingCancellationEntity(
              reason: model.cancellation!.reason,
              cancelledAt: model.cancellation!.cancelledAt,
              refundAmount: model.cancellation!.refundAmount,
            )
          : null,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  List<BookingEntity> _convertModelsToEntities(List<BookingModel> models) {
    return models.map(_convertModelToEntity).toList();
  }
}
