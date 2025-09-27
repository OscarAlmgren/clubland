// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookings_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$allBookingsHash() => r'60df9b242e85b6f04d1b13eacb1e93cb82055716';

/// Provider for all bookings
///
/// Copied from [allBookings].
@ProviderFor(allBookings)
final allBookingsProvider =
    AutoDisposeFutureProvider<List<BookingModel>>.internal(
  allBookings,
  name: r'allBookingsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$allBookingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AllBookingsRef = AutoDisposeFutureProviderRef<List<BookingModel>>;
String _$upcomingBookingsHash() => r'56d9ec6faa2cba86a33055363bda31ec326ca4a7';

/// Provider for upcoming bookings only
///
/// Copied from [upcomingBookings].
@ProviderFor(upcomingBookings)
final upcomingBookingsProvider =
    AutoDisposeFutureProvider<List<BookingModel>>.internal(
  upcomingBookings,
  name: r'upcomingBookingsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$upcomingBookingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UpcomingBookingsRef = AutoDisposeFutureProviderRef<List<BookingModel>>;
String _$pastBookingsHash() => r'859047f516581d3ea081036bc0352f15ec8d1899';

/// Provider for past bookings only
///
/// Copied from [pastBookings].
@ProviderFor(pastBookings)
final pastBookingsProvider =
    AutoDisposeFutureProvider<List<BookingModel>>.internal(
  pastBookings,
  name: r'pastBookingsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$pastBookingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PastBookingsRef = AutoDisposeFutureProviderRef<List<BookingModel>>;
String _$bookingUpdatesHash() => r'5926d0c39584153d468b7a2868607a056bc1947e';

/// Provider for real-time booking updates
///
/// Copied from [bookingUpdates].
@ProviderFor(bookingUpdates)
final bookingUpdatesProvider =
    AutoDisposeStreamProvider<List<BookingUpdate>>.internal(
  bookingUpdates,
  name: r'bookingUpdatesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$bookingUpdatesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef BookingUpdatesRef = AutoDisposeStreamProviderRef<List<BookingUpdate>>;
String _$bookingsControllerHash() =>
    r'2ee6788f61a0d19f08d4b46bbdb4996a202f18c7';

/// Main bookings controller for managing booking state and actions
///
/// Copied from [BookingsController].
@ProviderFor(BookingsController)
final bookingsControllerProvider = AutoDisposeAsyncNotifierProvider<
    BookingsController, List<BookingModel>>.internal(
  BookingsController.new,
  name: r'bookingsControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$bookingsControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$BookingsController = AutoDisposeAsyncNotifier<List<BookingModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
