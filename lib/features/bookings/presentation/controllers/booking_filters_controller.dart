import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/booking_entity.dart';

part 'booking_filters_controller.g.dart';

/// Filter options for bookings list.
class BookingFilters {
  const BookingFilters({
    this.status,
    this.startDate,
    this.endDate,
    this.clubId,
    this.searchQuery,
  });

  final BookingStatus? status;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? clubId;
  final String? searchQuery;

  /// Creates a copy of this filter with the given fields replaced.
  BookingFilters copyWith({
    BookingStatus? Function()? status,
    DateTime? Function()? startDate,
    DateTime? Function()? endDate,
    String? Function()? clubId,
    String? Function()? searchQuery,
  }) {
    return BookingFilters(
      status: status != null ? status() : this.status,
      startDate: startDate != null ? startDate() : this.startDate,
      endDate: endDate != null ? endDate() : this.endDate,
      clubId: clubId != null ? clubId() : this.clubId,
      searchQuery: searchQuery != null ? searchQuery() : this.searchQuery,
    );
  }

  /// Whether any filters are active.
  bool get hasActiveFilters =>
      status != null ||
      startDate != null ||
      endDate != null ||
      clubId != null ||
      (searchQuery != null && searchQuery!.isNotEmpty);

  /// Clears all filters.
  BookingFilters get cleared => const BookingFilters();
}

/// Controller for managing booking filters.
@riverpod
class BookingFiltersController extends _$BookingFiltersController {
  @override
  BookingFilters build() => const BookingFilters();

  /// Sets the status filter.
  void setStatusFilter(BookingStatus? status) {
    state = state.copyWith(status: () => status);
  }

  /// Sets the date range filter.
  void setDateRangeFilter({DateTime? startDate, DateTime? endDate}) {
    state = state.copyWith(
      startDate: () => startDate,
      endDate: () => endDate,
    );
  }

  /// Sets the club ID filter.
  void setClubFilter(String? clubId) {
    state = state.copyWith(clubId: () => clubId);
  }

  /// Sets the search query filter.
  void setSearchQuery(String? query) {
    state = state.copyWith(searchQuery: () => query);
  }

  /// Clears all filters.
  void clearFilters() {
    state = state.cleared;
  }

  /// Clears a specific filter.
  void clearFilter(String filterType) {
    switch (filterType) {
      case 'status':
        state = state.copyWith(status: () => null);
      case 'dateRange':
        state = state.copyWith(
          startDate: () => null,
          endDate: () => null,
        );
      case 'club':
        state = state.copyWith(clubId: () => null);
      case 'search':
        state = state.copyWith(searchQuery: () => null);
    }
  }

  /// Quick filter for upcoming bookings.
  void showUpcomingOnly() {
    final now = DateTime.now();
    state = state.copyWith(
      startDate: () => now,
      endDate: () => null,
    );
  }

  /// Quick filter for past bookings.
  void showPastOnly() {
    final now = DateTime.now();
    state = state.copyWith(
      startDate: () => null,
      endDate: () => now,
    );
  }

  /// Quick filter for today's bookings.
  void showTodayOnly() {
    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);
    final endOfDay = DateTime(now.year, now.month, now.day, 23, 59, 59);
    state = state.copyWith(
      startDate: () => startOfDay,
      endDate: () => endOfDay,
    );
  }

  /// Quick filter for this week's bookings.
  void showThisWeek() {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    final endOfWeek = startOfWeek.add(const Duration(days: 6));
    state = state.copyWith(
      startDate: () => startOfWeek,
      endDate: () => endOfWeek,
    );
  }

  /// Quick filter for this month's bookings.
  void showThisMonth() {
    final now = DateTime.now();
    final startOfMonth = DateTime(now.year, now.month);
    final endOfMonth = DateTime(now.year, now.month + 1, 0);
    state = state.copyWith(
      startDate: () => startOfMonth,
      endDate: () => endOfMonth,
    );
  }
}
