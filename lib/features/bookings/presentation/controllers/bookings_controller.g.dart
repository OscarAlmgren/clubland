// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookings_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for all bookings

@ProviderFor(allBookings)
const allBookingsProvider = AllBookingsProvider._();

/// Provider for all bookings

final class AllBookingsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<BookingModel>>,
          List<BookingModel>,
          FutureOr<List<BookingModel>>
        >
    with
        $FutureModifier<List<BookingModel>>,
        $FutureProvider<List<BookingModel>> {
  /// Provider for all bookings
  const AllBookingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allBookingsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allBookingsHash();

  @$internal
  @override
  $FutureProviderElement<List<BookingModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<BookingModel>> create(Ref ref) {
    return allBookings(ref);
  }
}

String _$allBookingsHash() => r'41b541f96990ea5c7c382a12cb9a08ed2563d07d';

/// Provider for upcoming bookings only

@ProviderFor(upcomingBookings)
const upcomingBookingsProvider = UpcomingBookingsProvider._();

/// Provider for upcoming bookings only

final class UpcomingBookingsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<BookingModel>>,
          List<BookingModel>,
          FutureOr<List<BookingModel>>
        >
    with
        $FutureModifier<List<BookingModel>>,
        $FutureProvider<List<BookingModel>> {
  /// Provider for upcoming bookings only
  const UpcomingBookingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'upcomingBookingsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$upcomingBookingsHash();

  @$internal
  @override
  $FutureProviderElement<List<BookingModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<BookingModel>> create(Ref ref) {
    return upcomingBookings(ref);
  }
}

String _$upcomingBookingsHash() => r'56d9ec6faa2cba86a33055363bda31ec326ca4a7';

/// Provider for past bookings only

@ProviderFor(pastBookings)
const pastBookingsProvider = PastBookingsProvider._();

/// Provider for past bookings only

final class PastBookingsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<BookingModel>>,
          List<BookingModel>,
          FutureOr<List<BookingModel>>
        >
    with
        $FutureModifier<List<BookingModel>>,
        $FutureProvider<List<BookingModel>> {
  /// Provider for past bookings only
  const PastBookingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pastBookingsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pastBookingsHash();

  @$internal
  @override
  $FutureProviderElement<List<BookingModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<BookingModel>> create(Ref ref) {
    return pastBookings(ref);
  }
}

String _$pastBookingsHash() => r'859047f516581d3ea081036bc0352f15ec8d1899';

/// Provider for real-time booking updates

@ProviderFor(bookingUpdates)
const bookingUpdatesProvider = BookingUpdatesProvider._();

/// Provider for real-time booking updates

final class BookingUpdatesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<BookingUpdate>>,
          List<BookingUpdate>,
          Stream<List<BookingUpdate>>
        >
    with
        $FutureModifier<List<BookingUpdate>>,
        $StreamProvider<List<BookingUpdate>> {
  /// Provider for real-time booking updates
  const BookingUpdatesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bookingUpdatesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bookingUpdatesHash();

  @$internal
  @override
  $StreamProviderElement<List<BookingUpdate>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<BookingUpdate>> create(Ref ref) {
    return bookingUpdates(ref);
  }
}

String _$bookingUpdatesHash() => r'5926d0c39584153d468b7a2868607a056bc1947e';

/// Main bookings controller for managing booking state and actions

@ProviderFor(BookingsController)
const bookingsControllerProvider = BookingsControllerProvider._();

/// Main bookings controller for managing booking state and actions
final class BookingsControllerProvider
    extends $AsyncNotifierProvider<BookingsController, List<BookingModel>> {
  /// Main bookings controller for managing booking state and actions
  const BookingsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bookingsControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bookingsControllerHash();

  @$internal
  @override
  BookingsController create() => BookingsController();
}

String _$bookingsControllerHash() =>
    r'40e18f5be3c974e9c50b015ec57a35377476ca8d';

/// Main bookings controller for managing booking state and actions

abstract class _$BookingsController extends $AsyncNotifier<List<BookingModel>> {
  FutureOr<List<BookingModel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<BookingModel>>, List<BookingModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<BookingModel>>, List<BookingModel>>,
              AsyncValue<List<BookingModel>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
