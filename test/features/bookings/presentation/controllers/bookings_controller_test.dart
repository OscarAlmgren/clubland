import 'package:clubland/features/bookings/data/datasources/bookings_remote_datasource.dart';
import 'package:clubland/features/bookings/data/models/booking_model.dart';
import 'package:clubland/features/bookings/domain/entities/booking_entity.dart';
import 'package:clubland/features/bookings/domain/repositories/bookings_repository.dart';
import 'package:clubland/features/bookings/presentation/controllers/bookings_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockBookingsRepository extends Mock implements BookingsRepository {}

class MockBookingsRemoteDataSource extends Mock
    implements BookingsRemoteDataSource {}

void main() {
  late MockBookingsRepository mockRepository;
  late MockBookingsRemoteDataSource mockDataSource;

  setUp(() {
    mockRepository = MockBookingsRepository();
    mockDataSource = MockBookingsRemoteDataSource();
  });

  // Test data
  final tBooking1 = BookingModel(
    id: '1',
    startTime: DateTime.now().add(const Duration(days: 1)),
    endTime: DateTime.now().add(const Duration(days: 1, hours: 1)),
    status: BookingStatus.confirmed,
    club: const ClubSummary(id: 'club1', name: 'Test Club'),
    facility: const FacilitySummary(id: 'facility1', name: 'Tennis Court'),
    user: const UserSummary(id: 'user1', firstName: 'John', lastName: 'Doe'),
    createdAt: DateTime.now(),
  );

  final tBooking2 = BookingModel(
    id: '2',
    startTime: DateTime.now().subtract(const Duration(days: 1)),
    endTime: DateTime.now()
        .subtract(const Duration(days: 1))
        .add(const Duration(hours: 1)),
    status: BookingStatus.completed,
    club: const ClubSummary(id: 'club1', name: 'Test Club'),
    facility: const FacilitySummary(id: 'facility2', name: 'Pool'),
    user: const UserSummary(id: 'user1', firstName: 'John', lastName: 'Doe'),
    createdAt: DateTime.now().subtract(const Duration(days: 2)),
  );

  final tBookingsList = [tBooking1, tBooking2];

  group('allBookingsProvider -', () {
    test('should return all bookings from repository', () async {
      // arrange
      when(
        () => mockRepository.getUserBookings(
          status: any(named: 'status'),
          startDate: any(named: 'startDate'),
          endDate: any(named: 'endDate'),
          limit: any(named: 'limit'),
          cursor: any(named: 'cursor'),
        ),
      ).thenAnswer((_) async => tBookingsList);

      final container = ProviderContainer(
        overrides: [
          bookingsRepositoryProvider.overrideWithValue(mockRepository),
        ],
      );

      // act
      final result = await container.read(allBookingsProvider.future);

      // assert
      expect(result, equals(tBookingsList));
      verify(() => mockRepository.getUserBookings()).called(1);
    });
  });

  group('upcomingBookingsProvider -', () {
    test('should return only upcoming bookings', () async {
      // arrange
      when(
        () => mockRepository.getUserBookings(
          status: any(named: 'status'),
          startDate: any(named: 'startDate'),
          endDate: any(named: 'endDate'),
          limit: any(named: 'limit'),
          cursor: any(named: 'cursor'),
        ),
      ).thenAnswer((_) async => tBookingsList);

      final container = ProviderContainer(
        overrides: [
          bookingsRepositoryProvider.overrideWithValue(mockRepository),
        ],
      );

      // act
      final result = await container.read(upcomingBookingsProvider.future);

      // assert
      expect(result.length, equals(1));
      expect(result.first.id, equals('1'));
      expect(result.first.isUpcoming, isTrue);
    });
  });

  group('pastBookingsProvider -', () {
    test('should return only past bookings', () async {
      // arrange
      when(
        () => mockRepository.getUserBookings(
          status: any(named: 'status'),
          startDate: any(named: 'startDate'),
          endDate: any(named: 'endDate'),
          limit: any(named: 'limit'),
          cursor: any(named: 'cursor'),
        ),
      ).thenAnswer((_) async => tBookingsList);

      final container = ProviderContainer(
        overrides: [
          bookingsRepositoryProvider.overrideWithValue(mockRepository),
        ],
      );

      // act
      final result = await container.read(pastBookingsProvider.future);

      // assert
      expect(result.length, equals(1));
      expect(result.first.id, equals('2'));
      expect(result.first.isPast, isTrue);
    });
  });

  group('BookingsController -', () {
    test('should load all bookings on initialization', () async {
      // arrange
      when(
        () => mockRepository.getUserBookings(
          status: any(named: 'status'),
          startDate: any(named: 'startDate'),
          endDate: any(named: 'endDate'),
          limit: any(named: 'limit'),
          cursor: any(named: 'cursor'),
        ),
      ).thenAnswer((_) async => tBookingsList);

      final container = ProviderContainer(
        overrides: [
          bookingsRepositoryProvider.overrideWithValue(mockRepository),
        ],
      );

      // act
      final state = await container.read(bookingsControllerProvider.future);

      // assert
      expect(state, equals(tBookingsList));
    });

    test('should filter bookings by status', () async {
      // arrange
      final confirmedOnly = [tBooking1];
      when(
        () => mockRepository.getUserBookings(
          status: any(named: 'status'),
          startDate: any(named: 'startDate'),
          endDate: any(named: 'endDate'),
          limit: any(named: 'limit'),
          cursor: any(named: 'cursor'),
        ),
      ).thenAnswer((_) async => tBookingsList);

      final container = ProviderContainer(
        overrides: [
          bookingsRepositoryProvider.overrideWithValue(mockRepository),
        ],
      );

      // Wait for initial load
      await container.read(bookingsControllerProvider.future);

      final controller = container.read(bookingsControllerProvider.notifier);

      // act
      await controller.applyFilter(BookingStatus.confirmed);

      // assert
      final state = container.read(bookingsControllerProvider);
      expect(state.hasValue, isTrue);
      expect(state.value!.length, equals(1));
      expect(state.value!.first.status, equals(BookingStatus.confirmed));
    });

    test('should show all bookings when filter is null', () async {
      // arrange
      when(
        () => mockRepository.getUserBookings(
          status: any(named: 'status'),
          startDate: any(named: 'startDate'),
          endDate: any(named: 'endDate'),
          limit: any(named: 'limit'),
          cursor: any(named: 'cursor'),
        ),
      ).thenAnswer((_) async => tBookingsList);

      final container = ProviderContainer(
        overrides: [
          bookingsRepositoryProvider.overrideWithValue(mockRepository),
        ],
      );

      // Wait for initial load
      await container.read(bookingsControllerProvider.future);

      final controller = container.read(bookingsControllerProvider.notifier);

      // act
      await controller.applyFilter(null);

      // assert
      final state = container.read(bookingsControllerProvider);
      expect(state.hasValue, isTrue);
      expect(state.value!.length, equals(2));
    });

    test('should cancel booking successfully', () async {
      // arrange
      final cancelledBooking = BookingModel(
        id: '1',
        startTime: tBooking1.startTime,
        endTime: tBooking1.endTime,
        status: BookingStatus.cancelled,
        club: tBooking1.club,
        facility: tBooking1.facility,
        user: tBooking1.user,
        createdAt: tBooking1.createdAt,
        cancellation: BookingCancellation(
          reason: 'User cancelled',
          cancelledAt: DateTime.now(),
        ),
      );

      when(
        () => mockRepository.getUserBookings(
          status: any(named: 'status'),
          startDate: any(named: 'startDate'),
          endDate: any(named: 'endDate'),
          limit: any(named: 'limit'),
          cursor: any(named: 'cursor'),
        ),
      ).thenAnswer((_) async => tBookingsList);

      when(
        () => mockRepository.cancelBooking(
          bookingId: any(named: 'bookingId'),
          reason: any(named: 'reason'),
        ),
      ).thenAnswer((_) async => cancelledBooking);

      final container = ProviderContainer(
        overrides: [
          bookingsRepositoryProvider.overrideWithValue(mockRepository),
        ],
      );

      // Wait for initial load
      await container.read(bookingsControllerProvider.future);

      final controller = container.read(bookingsControllerProvider.notifier);

      // act
      await controller.cancelBooking('1', reason: 'User cancelled');

      // assert
      verify(
        () => mockRepository.cancelBooking(
          bookingId: '1',
          reason: 'User cancelled',
        ),
      ).called(1);
    });

    test('should create booking successfully', () async {
      // arrange
      final newBooking = BookingModel(
        id: 'new-booking',
        startTime: DateTime.now().add(const Duration(days: 2)),
        endTime: DateTime.now().add(const Duration(days: 2, hours: 1)),
        status: BookingStatus.pending,
        club: const ClubSummary(id: 'club1', name: 'Test Club'),
        facility: const FacilitySummary(id: 'facility1', name: 'Tennis Court'),
        user: const UserSummary(
          id: 'user1',
          firstName: 'John',
          lastName: 'Doe',
        ),
        createdAt: DateTime.now(),
      );

      when(
        () => mockRepository.getUserBookings(
          status: any(named: 'status'),
          startDate: any(named: 'startDate'),
          endDate: any(named: 'endDate'),
          limit: any(named: 'limit'),
          cursor: any(named: 'cursor'),
        ),
      ).thenAnswer((_) async => tBookingsList);

      when(
        () => mockRepository.createBooking(
          facilityId: any(named: 'facilityId'),
          startTime: any(named: 'startTime'),
          endTime: any(named: 'endTime'),
          notes: any(named: 'notes'),
          participantIds: any(named: 'participantIds'),
        ),
      ).thenAnswer((_) async => newBooking);

      final container = ProviderContainer(
        overrides: [
          bookingsRepositoryProvider.overrideWithValue(mockRepository),
        ],
      );

      // Wait for initial load
      await container.read(bookingsControllerProvider.future);

      final controller = container.read(bookingsControllerProvider.notifier);

      final request = CreateBookingRequest(
        clubId: 'club1',
        facilityId: 'facility1',
        startTime: DateTime.now().add(const Duration(days: 2)),
        endTime: DateTime.now().add(const Duration(days: 2, hours: 1)),
      );

      // act
      await controller.createBooking(request);

      // assert
      verify(
        () => mockRepository.createBooking(
          facilityId: 'facility1',
          startTime: any(named: 'startTime'),
          endTime: any(named: 'endTime'),
          notes: any(named: 'notes'),
          participantIds: any(named: 'participantIds'),
        ),
      ).called(1);
    });

    test('should update booking successfully', () async {
      // arrange
      final updatedBooking = BookingModel(
        id: '1',
        startTime: DateTime.now().add(const Duration(days: 2)),
        endTime: DateTime.now().add(const Duration(days: 2, hours: 1)),
        status: BookingStatus.confirmed,
        club: tBooking1.club,
        facility: tBooking1.facility,
        user: tBooking1.user,
        createdAt: tBooking1.createdAt,
        notes: 'Updated notes',
      );

      when(
        () => mockRepository.getUserBookings(
          status: any(named: 'status'),
          startDate: any(named: 'startDate'),
          endDate: any(named: 'endDate'),
          limit: any(named: 'limit'),
          cursor: any(named: 'cursor'),
        ),
      ).thenAnswer((_) async => tBookingsList);

      when(
        () => mockRepository.updateBooking(
          bookingId: any(named: 'bookingId'),
          startTime: any(named: 'startTime'),
          endTime: any(named: 'endTime'),
          notes: any(named: 'notes'),
          participantIds: any(named: 'participantIds'),
        ),
      ).thenAnswer((_) async => updatedBooking);

      final container = ProviderContainer(
        overrides: [
          bookingsRepositoryProvider.overrideWithValue(mockRepository),
        ],
      );

      // Wait for initial load
      await container.read(bookingsControllerProvider.future);

      final controller = container.read(bookingsControllerProvider.notifier);

      final request = ModifyBookingRequest(notes: 'Updated notes');

      // act
      await controller.modifyBooking('1', request);

      // assert
      verify(
        () => mockRepository.updateBooking(
          bookingId: '1',
          startTime: any(named: 'startTime'),
          endTime: any(named: 'endTime'),
          notes: any(named: 'notes'),
          participantIds: any(named: 'participantIds'),
        ),
      ).called(1);
    });

    test('should refresh bookings', () async {
      // arrange
      when(
        () => mockRepository.getUserBookings(
          status: any(named: 'status'),
          startDate: any(named: 'startDate'),
          endDate: any(named: 'endDate'),
          limit: any(named: 'limit'),
          cursor: any(named: 'cursor'),
        ),
      ).thenAnswer((_) async => tBookingsList);

      final container = ProviderContainer(
        overrides: [
          bookingsRepositoryProvider.overrideWithValue(mockRepository),
        ],
      );

      // Wait for initial load
      await container.read(bookingsControllerProvider.future);

      final controller = container.read(bookingsControllerProvider.notifier);

      // act
      await controller.refresh();

      // assert
      // Should be called twice: once on init, once on refresh
      verify(() => mockRepository.getUserBookings()).called(2);
    });
  });
}
