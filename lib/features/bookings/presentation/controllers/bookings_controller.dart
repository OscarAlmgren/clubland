import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/graphql_client.dart';
import '../../data/datasources/bookings_remote_datasource.dart';
import '../../data/models/booking_model.dart';
import '../../data/repositories/bookings_repository_impl.dart';
import '../../domain/entities/booking_entity.dart';
import '../../domain/repositories/bookings_repository.dart';

part 'bookings_controller.g.dart';

/// Provider for the bookings repository
@riverpod
BookingsRepository bookingsRepository(Ref ref) {
  final datasource = ref.read(bookingsRemoteDataSourceProvider);
  return BookingsRepositoryImpl(remoteDataSource: datasource);
}

/// Provider for all bookings
@riverpod
Future<List<BookingEntity>> allBookings(Ref ref) async {
  final repository = ref.read(bookingsRepositoryProvider);
  final result = await repository.getUserBookings();

  return result.fold(
    (failure) => throw Exception(failure.message),
    (bookings) => bookings,
  );
}

/// Provider for upcoming bookings only
@riverpod
Future<List<BookingEntity>> upcomingBookings(Ref ref) async {
  final repository = ref.read(bookingsRepositoryProvider);
  final result = await repository.getUpcomingBookings();

  return result.fold(
    (failure) => throw Exception(failure.message),
    (bookings) => bookings,
  );
}

/// Provider for past bookings only
@riverpod
Future<List<BookingEntity>> pastBookings(Ref ref) async {
  final repository = ref.read(bookingsRepositoryProvider);
  final result = await repository.getPastBookings();

  return result.fold(
    (failure) => throw Exception(failure.message),
    (bookings) => bookings,
  );
}

/// Provider for real-time booking updates
@riverpod
Stream<List<BookingUpdate>> bookingUpdates(Ref ref) async* {
  // This would connect to a WebSocket or SSE stream in a real implementation
  // For now, return an empty stream
  yield* const Stream.empty();
}

/// Main bookings controller for managing booking state and actions
@riverpod
class BookingsController extends _$BookingsController {
  @override
  Future<List<BookingEntity>> build() async =>
      await ref.read(allBookingsProvider.future);

  /// Apply filter to bookings
  Future<void> applyFilter(BookingStatus? status) async {
    if (status == null) {
      // Show all bookings
      state = await AsyncValue.guard(
        () async => await ref.read(allBookingsProvider.future),
      );
    } else {
      // Filter by status
      state = await AsyncValue.guard(() async {
        final allBookings = await ref.read(allBookingsProvider.future);
        return allBookings
            .where((booking) => booking.status == status)
            .toList();
      });
    }
  }

  /// Cancel a booking
  Future<void> cancelBooking(String bookingId, {String? reason}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(bookingsRepositoryProvider);
      final result = await repository.cancelBooking(
        bookingId: bookingId,
        reason: reason,
      );

      result.fold(
        (failure) => throw Exception(failure.message),
        (_) {
          // Refresh all bookings after cancellation
          ref.invalidate(allBookingsProvider);
        },
      );

      return await ref.read(allBookingsProvider.future);
    });
  }

  /// Create a new booking
  Future<void> createBooking(CreateBookingRequest request) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(bookingsRepositoryProvider);
      final result = await repository.createBooking(
        facilityId: request.facilityId,
        startTime: request.startTime,
        endTime: request.endTime,
        notes: request.notes,
        participantIds: request.participants,
      );

      result.fold(
        (failure) => throw Exception(failure.message),
        (_) {
          // Refresh all bookings after creation
          ref.invalidate(allBookingsProvider);
        },
      );

      return await ref.read(allBookingsProvider.future);
    });
  }

  /// Modify an existing booking
  Future<void> modifyBooking(
    String bookingId,
    ModifyBookingRequest request,
  ) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(bookingsRepositoryProvider);
      final result = await repository.updateBooking(
        bookingId: bookingId,
        startTime: request.startTime,
        endTime: request.endTime,
        notes: request.notes,
        participantIds: request.participants,
      );

      result.fold(
        (failure) => throw Exception(failure.message),
        (_) {
          // Refresh all bookings after modification
          ref.invalidate(allBookingsProvider);
        },
      );

      return await ref.read(allBookingsProvider.future);
    });
  }

  /// Refresh all bookings
  Future<void> refresh() async {
    ref.invalidate(allBookingsProvider);
    state = await AsyncValue.guard(
      () async => await ref.read(allBookingsProvider.future),
    );
  }
}

/// Placeholder classes for request types - these should be defined properly
class CreateBookingRequest {
  const CreateBookingRequest({
    required this.clubId,
    required this.facilityId,
    required this.startTime,
    required this.endTime,
    this.notes,
    this.participants = const [],
  });

  final String clubId;
  final String facilityId;
  final DateTime startTime;
  final DateTime endTime;
  final String? notes;
  final List<String> participants;
}

class ModifyBookingRequest {
  const ModifyBookingRequest({
    this.startTime,
    this.endTime,
    this.notes,
    this.participants,
  });

  final DateTime? startTime;
  final DateTime? endTime;
  final String? notes;
  final List<String>? participants;
}

/// Provider for the remote datasource
final bookingsRemoteDataSourceProvider = Provider<BookingsRemoteDataSource>(
  (ref) => BookingsRemoteDataSourceImpl(
    client: GraphQLClientConfig.client,
  ),
);
