import 'package:clubland/features/bookings/domain/entities/booking_entity.dart';
import 'package:clubland/features/bookings/presentation/controllers/booking_filters_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BookingFilters -', () {
    test('should initialize with no active filters', () {
      // arrange
      const filters = BookingFilters();

      // assert
      expect(filters.hasActiveFilters, isFalse);
      expect(filters.status, isNull);
      expect(filters.startDate, isNull);
      expect(filters.endDate, isNull);
      expect(filters.clubId, isNull);
      expect(filters.searchQuery, isNull);
    });

    test('should detect active filters when status is set', () {
      // arrange
      const filters = BookingFilters(status: BookingStatus.confirmed);

      // assert
      expect(filters.hasActiveFilters, isTrue);
    });

    test('should detect active filters when date range is set', () {
      // arrange
      final filters = BookingFilters(
        startDate: DateTime(2025, 12),
        endDate: DateTime(2025, 12, 31),
      );

      // assert
      expect(filters.hasActiveFilters, isTrue);
    });

    test('should copy with new values', () {
      // arrange
      const original = BookingFilters(status: BookingStatus.pending);

      // act
      final copied = original.copyWith(status: () => BookingStatus.confirmed);

      // assert
      expect(copied.status, equals(BookingStatus.confirmed));
      expect(original.status, equals(BookingStatus.pending));
    });

    test('should clear all filters', () {
      // arrange
      final filters = BookingFilters(
        status: BookingStatus.confirmed,
        startDate: DateTime(2025, 12),
        clubId: 'club123',
      );

      // act
      final cleared = filters.cleared;

      // assert
      expect(cleared.hasActiveFilters, isFalse);
      expect(cleared.status, isNull);
      expect(cleared.startDate, isNull);
      expect(cleared.clubId, isNull);
    });

    test('should not detect active filters for empty search query', () {
      // arrange
      const filters = BookingFilters(searchQuery: '');

      // assert
      expect(filters.hasActiveFilters, isFalse);
    });

    test('should detect active filters for non-empty search query', () {
      // arrange
      const filters = BookingFilters(searchQuery: 'tennis');

      // assert
      expect(filters.hasActiveFilters, isTrue);
    });
  });

  group('BookingFiltersController -', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('should initialize with no active filters', () {
      // act
      final filters = container.read(bookingFiltersControllerProvider);

      // assert
      expect(filters.hasActiveFilters, isFalse);
    });

    test('should set status filter', () {
      // arrange
      final controller = container.read(
        bookingFiltersControllerProvider.notifier,
      );

      // act
      controller.setStatusFilter(BookingStatus.confirmed);

      // assert
      final filters = container.read(bookingFiltersControllerProvider);
      expect(filters.status, equals(BookingStatus.confirmed));
      expect(filters.hasActiveFilters, isTrue);
    });

    test('should clear status filter when set to null', () {
      // arrange
      final controller = container.read(
        bookingFiltersControllerProvider.notifier,
      );
      controller.setStatusFilter(BookingStatus.confirmed);

      // act
      controller.setStatusFilter(null);

      // assert
      final filters = container.read(bookingFiltersControllerProvider);
      expect(filters.status, isNull);
    });

    test('should set date range filter', () {
      // arrange
      final controller = container.read(
        bookingFiltersControllerProvider.notifier,
      );
      final startDate = DateTime(2025, 12);
      final endDate = DateTime(2025, 12, 31);

      // act
      controller.setDateRangeFilter(startDate: startDate, endDate: endDate);

      // assert
      final filters = container.read(bookingFiltersControllerProvider);
      expect(filters.startDate, equals(startDate));
      expect(filters.endDate, equals(endDate));
      expect(filters.hasActiveFilters, isTrue);
    });

    test('should set club filter', () {
      // arrange
      final controller = container.read(
        bookingFiltersControllerProvider.notifier,
      );

      // act
      controller.setClubFilter('club123');

      // assert
      final filters = container.read(bookingFiltersControllerProvider);
      expect(filters.clubId, equals('club123'));
      expect(filters.hasActiveFilters, isTrue);
    });

    test('should set search query filter', () {
      // arrange
      final controller = container.read(
        bookingFiltersControllerProvider.notifier,
      );

      // act
      controller.setSearchQuery('tennis');

      // assert
      final filters = container.read(bookingFiltersControllerProvider);
      expect(filters.searchQuery, equals('tennis'));
      expect(filters.hasActiveFilters, isTrue);
    });

    test('should clear all filters', () {
      // arrange
      final controller = container.read(
        bookingFiltersControllerProvider.notifier,
      );
      controller.setStatusFilter(BookingStatus.confirmed);
      controller.setClubFilter('club123');
      controller.setSearchQuery('tennis');

      // act
      controller.clearFilters();

      // assert
      final filters = container.read(bookingFiltersControllerProvider);
      expect(filters.hasActiveFilters, isFalse);
      expect(filters.status, isNull);
      expect(filters.clubId, isNull);
      expect(filters.searchQuery, isNull);
    });

    test('should clear specific filter - status', () {
      // arrange
      final controller = container.read(
        bookingFiltersControllerProvider.notifier,
      );
      controller.setStatusFilter(BookingStatus.confirmed);
      controller.setClubFilter('club123');

      // act
      controller.clearFilter('status');

      // assert
      final filters = container.read(bookingFiltersControllerProvider);
      expect(filters.status, isNull);
      expect(filters.clubId, equals('club123')); // Other filters unchanged
    });

    test('should clear specific filter - dateRange', () {
      // arrange
      final controller = container.read(
        bookingFiltersControllerProvider.notifier,
      );
      controller.setDateRangeFilter(
        startDate: DateTime(2025, 12),
        endDate: DateTime(2025, 12, 31),
      );

      // act
      controller.clearFilter('dateRange');

      // assert
      final filters = container.read(bookingFiltersControllerProvider);
      expect(filters.startDate, isNull);
      expect(filters.endDate, isNull);
    });

    test('should show upcoming bookings only', () {
      // arrange
      final controller = container.read(
        bookingFiltersControllerProvider.notifier,
      );

      // act
      controller.showUpcomingOnly();

      // assert
      final filters = container.read(bookingFiltersControllerProvider);
      expect(filters.startDate, isNotNull);
      expect(filters.endDate, isNull);
      expect(
        filters.startDate!.isBefore(
          DateTime.now().add(const Duration(seconds: 1)),
        ),
        isTrue,
      );
    });

    test('should show past bookings only', () {
      // arrange
      final controller = container.read(
        bookingFiltersControllerProvider.notifier,
      );

      // act
      controller.showPastOnly();

      // assert
      final filters = container.read(bookingFiltersControllerProvider);
      expect(filters.startDate, isNull);
      expect(filters.endDate, isNotNull);
      expect(
        filters.endDate!.isAfter(
          DateTime.now().subtract(const Duration(seconds: 1)),
        ),
        isTrue,
      );
    });

    test("should show today's bookings only", () {
      // arrange
      final controller = container.read(
        bookingFiltersControllerProvider.notifier,
      );
      final now = DateTime.now();

      // act
      controller.showTodayOnly();

      // assert
      final filters = container.read(bookingFiltersControllerProvider);
      expect(filters.startDate, isNotNull);
      expect(filters.endDate, isNotNull);
      expect(filters.startDate!.day, equals(now.day));
      expect(filters.endDate!.day, equals(now.day));
    });

    test("should show this week's bookings", () {
      // arrange
      final controller = container.read(
        bookingFiltersControllerProvider.notifier,
      );

      // act
      controller.showThisWeek();

      // assert
      final filters = container.read(bookingFiltersControllerProvider);
      expect(filters.startDate, isNotNull);
      expect(filters.endDate, isNotNull);

      final daysDiff = filters.endDate!.difference(filters.startDate!).inDays;
      expect(daysDiff, equals(6)); // Week is 7 days (0-6)
    });

    test("should show this month's bookings", () {
      // arrange
      final controller = container.read(
        bookingFiltersControllerProvider.notifier,
      );
      final now = DateTime.now();

      // act
      controller.showThisMonth();

      // assert
      final filters = container.read(bookingFiltersControllerProvider);
      expect(filters.startDate, isNotNull);
      expect(filters.endDate, isNotNull);
      expect(filters.startDate!.month, equals(now.month));
      expect(filters.endDate!.month, equals(now.month));
      expect(filters.startDate!.day, equals(1)); // First day of month
    });
  });
}
