import 'package:clubland/core/errors/exceptions.dart';
import 'package:clubland/features/bookings/data/datasources/bookings_remote_datasource.dart';
import 'package:clubland/features/bookings/data/models/booking_model.dart';
import 'package:clubland/features/bookings/data/models/facility_availability_model.dart';
import 'package:clubland/features/bookings/data/repositories/bookings_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockBookingsRemoteDataSource extends Mock
    implements BookingsRemoteDataSource {}

void main() {
  late BookingsRepositoryImpl repository;
  late MockBookingsRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockBookingsRemoteDataSource();
    repository = BookingsRepositoryImpl(remoteDataSource: mockRemoteDataSource);
  });

  group('BookingsRepositoryImpl -', () {
    group('getUserBookings', () {
      final tBookingsList = [
        BookingModel(
          id: '1',
          startTime: DateTime(2025, 12, 1, 10),
          endTime: DateTime(2025, 12, 1, 11),
          status: BookingStatus.confirmed,
          club: const ClubSummary(id: 'club1', name: 'Test Club'),
          facility: const FacilitySummary(
            id: 'facility1',
            name: 'Tennis Court',
          ),
          user: const UserSummary(
            id: 'user1',
            firstName: 'John',
            lastName: 'Doe',
          ),
          createdAt: DateTime(2025, 11),
        ),
      ];

      test(
        'should return list of bookings when datasource call succeeds',
        () async {
          // arrange
          when(
            () => mockRemoteDataSource.getUserBookings(
              status: any(named: 'status'),
              startDate: any(named: 'startDate'),
              endDate: any(named: 'endDate'),
              limit: any(named: 'limit'),
              cursor: any(named: 'cursor'),
            ),
          ).thenAnswer((_) async => tBookingsList);

          // act
          final result = await repository.getUserBookings();

          // assert
          expect(result, equals(tBookingsList));
          verify(
            () => mockRemoteDataSource.getUserBookings(
              status: any(named: 'status'),
              startDate: any(named: 'startDate'),
              endDate: any(named: 'endDate'),
              limit: any(named: 'limit'),
              cursor: any(named: 'cursor'),
            ),
          ).called(1);
        },
      );

      test(
        'should return filtered bookings when status filter is provided',
        () async {
          // arrange
          when(
            () => mockRemoteDataSource.getUserBookings(
              status: BookingStatus.confirmed,
              startDate: any(named: 'startDate'),
              endDate: any(named: 'endDate'),
              limit: any(named: 'limit'),
              cursor: any(named: 'cursor'),
            ),
          ).thenAnswer((_) async => tBookingsList);

          // act
          final result = await repository.getUserBookings(
            status: BookingStatus.confirmed,
          );

          // assert
          expect(result, equals(tBookingsList));
          verify(
            () => mockRemoteDataSource.getUserBookings(
              status: BookingStatus.confirmed,
              startDate: any(named: 'startDate'),
              endDate: any(named: 'endDate'),
              limit: any(named: 'limit'),
              cursor: any(named: 'cursor'),
            ),
          ).called(1);
        },
      );

      test('should throw NetworkException when datasource throws', () async {
        // arrange
        when(
          () => mockRemoteDataSource.getUserBookings(
            status: any(named: 'status'),
            startDate: any(named: 'startDate'),
            endDate: any(named: 'endDate'),
            limit: any(named: 'limit'),
            cursor: any(named: 'cursor'),
          ),
        ).thenThrow(const NetworkException('Server error', 'SERVER_ERROR'));

        // act & assert
        expect(
          () => repository.getUserBookings(),
          throwsA(isA<NetworkException>()),
        );
      });
    });

    group('getBookingById', () {
      final tBooking = BookingModel(
        id: '1',
        startTime: DateTime(2025, 12, 1, 10),
        endTime: DateTime(2025, 12, 1, 11),
        status: BookingStatus.confirmed,
        club: const ClubSummary(id: 'club1', name: 'Test Club'),
        facility: const FacilitySummary(id: 'facility1', name: 'Tennis Court'),
        user: const UserSummary(
          id: 'user1',
          firstName: 'John',
          lastName: 'Doe',
        ),
        createdAt: DateTime(2025, 11),
      );

      test('should return booking when datasource call succeeds', () async {
        // arrange
        when(
          () => mockRemoteDataSource.getBookingById('1'),
        ).thenAnswer((_) async => tBooking);

        // act
        final result = await repository.getBookingById('1');

        // assert
        expect(result, equals(tBooking));
        verify(() => mockRemoteDataSource.getBookingById('1')).called(1);
      });

      test('should throw NetworkException when booking not found', () async {
        // arrange
        when(
          () => mockRemoteDataSource.getBookingById('999'),
        ).thenThrow(NetworkException.notFound());

        // act & assert
        expect(
          () => repository.getBookingById('999'),
          throwsA(isA<NetworkException>()),
        );
      });
    });

    group('createBooking', () {
      final tBooking = BookingModel(
        id: 'new-booking',
        startTime: DateTime(2025, 12, 1, 10),
        endTime: DateTime(2025, 12, 1, 11),
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

      test(
        'should create and return booking when datasource call succeeds',
        () async {
          // arrange
          when(
            () => mockRemoteDataSource.createBooking(
              facilityId: any(named: 'facilityId'),
              startTime: any(named: 'startTime'),
              endTime: any(named: 'endTime'),
              notes: any(named: 'notes'),
              participantIds: any(named: 'participantIds'),
            ),
          ).thenAnswer((_) async => tBooking);

          // act
          final result = await repository.createBooking(
            facilityId: 'facility1',
            startTime: DateTime(2025, 12, 1, 10),
            endTime: DateTime(2025, 12, 1, 11),
          );

          // assert
          expect(result, equals(tBooking));
          verify(
            () => mockRemoteDataSource.createBooking(
              facilityId: 'facility1',
              startTime: any(named: 'startTime'),
              endTime: any(named: 'endTime'),
              notes: any(named: 'notes'),
              participantIds: any(named: 'participantIds'),
            ),
          ).called(1);
        },
      );

      test('should throw NetworkException when creation fails', () async {
        // arrange
        when(
          () => mockRemoteDataSource.createBooking(
            facilityId: any(named: 'facilityId'),
            startTime: any(named: 'startTime'),
            endTime: any(named: 'endTime'),
            notes: any(named: 'notes'),
            participantIds: any(named: 'participantIds'),
          ),
        ).thenThrow(const NetworkException('Creation failed', 'CREATE_ERROR'));

        // act & assert
        expect(
          () => repository.createBooking(
            facilityId: 'facility1',
            startTime: DateTime(2025, 12, 1, 10),
            endTime: DateTime(2025, 12, 1, 11),
          ),
          throwsA(isA<NetworkException>()),
        );
      });
    });

    group('updateBooking', () {
      final tUpdatedBooking = BookingModel(
        id: '1',
        startTime: DateTime(2025, 12, 1, 11),
        endTime: DateTime(2025, 12, 1, 12),
        status: BookingStatus.confirmed,
        club: const ClubSummary(id: 'club1', name: 'Test Club'),
        facility: const FacilitySummary(id: 'facility1', name: 'Tennis Court'),
        user: const UserSummary(
          id: 'user1',
          firstName: 'John',
          lastName: 'Doe',
        ),
        createdAt: DateTime(2025, 11),
      );

      test(
        'should update and return booking when datasource call succeeds',
        () async {
          // arrange
          when(
            () => mockRemoteDataSource.updateBooking(
              bookingId: any(named: 'bookingId'),
              startTime: any(named: 'startTime'),
              endTime: any(named: 'endTime'),
              notes: any(named: 'notes'),
              participantIds: any(named: 'participantIds'),
            ),
          ).thenAnswer((_) async => tUpdatedBooking);

          // act
          final result = await repository.updateBooking(
            bookingId: '1',
            startTime: DateTime(2025, 12, 1, 11),
          );

          // assert
          expect(result, equals(tUpdatedBooking));
          verify(
            () => mockRemoteDataSource.updateBooking(
              bookingId: '1',
              startTime: any(named: 'startTime'),
              endTime: any(named: 'endTime'),
              notes: any(named: 'notes'),
              participantIds: any(named: 'participantIds'),
            ),
          ).called(1);
        },
      );
    });

    group('cancelBooking', () {
      final tCancelledBooking = BookingModel(
        id: '1',
        startTime: DateTime(2025, 12, 1, 10),
        endTime: DateTime(2025, 12, 1, 11),
        status: BookingStatus.cancelled,
        club: const ClubSummary(id: 'club1', name: 'Test Club'),
        facility: const FacilitySummary(id: 'facility1', name: 'Tennis Court'),
        user: const UserSummary(
          id: 'user1',
          firstName: 'John',
          lastName: 'Doe',
        ),
        createdAt: DateTime(2025, 11),
        cancellation: BookingCancellation(
          reason: 'User cancelled',
          cancelledAt: DateTime.now(),
        ),
      );

      test(
        'should cancel and return booking when datasource call succeeds',
        () async {
          // arrange
          when(
            () => mockRemoteDataSource.cancelBooking(
              bookingId: any(named: 'bookingId'),
              reason: any(named: 'reason'),
            ),
          ).thenAnswer((_) async => tCancelledBooking);

          // act
          final result = await repository.cancelBooking(
            bookingId: '1',
            reason: 'User cancelled',
          );

          // assert
          expect(result.status, equals(BookingStatus.cancelled));
          verify(
            () => mockRemoteDataSource.cancelBooking(
              bookingId: '1',
              reason: 'User cancelled',
            ),
          ).called(1);
        },
      );
    });

    group('getFacilityAvailability', () {
      final tAvailability = FacilityAvailabilityModel(
        facility: const FacilityDetails(
          id: 'facility1',
          name: 'Tennis Court',
          capacity: 4,
          bookingSettings: BookingSettings(
            minBookingDuration: Duration(minutes: 60),
            maxBookingDuration: Duration(minutes: 120),
            advanceBookingLimit: Duration(days: 7),
            cancellationPolicy: '24 hours before',
          ),
        ),
        availableSlots: [
          AvailableSlot(
            startTime: DateTime(2025, 12, 1, 10),
            endTime: DateTime(2025, 12, 1, 11),
            available: true,
            capacity: 4,
            remainingSpots: 4,
          ),
        ],
        bookedSlots: const [],
      );

      test(
        'should return facility availability when datasource call succeeds',
        () async {
          // arrange
          when(
            () => mockRemoteDataSource.getFacilityAvailability(
              facilityId: any(named: 'facilityId'),
              startDate: any(named: 'startDate'),
              endDate: any(named: 'endDate'),
            ),
          ).thenAnswer((_) async => tAvailability);

          // act
          final result = await repository.getFacilityAvailability(
            facilityId: 'facility1',
            startDate: DateTime(2025, 12),
            endDate: DateTime(2025, 12, 2),
          );

          // assert
          expect(result, equals(tAvailability));
          verify(
            () => mockRemoteDataSource.getFacilityAvailability(
              facilityId: 'facility1',
              startDate: any(named: 'startDate'),
              endDate: any(named: 'endDate'),
            ),
          ).called(1);
        },
      );
    });
  });
}
