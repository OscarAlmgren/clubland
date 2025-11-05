// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookings_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for the bookings repository

@ProviderFor(bookingsRepository)
const bookingsRepositoryProvider = BookingsRepositoryProvider._();

/// Provider for the bookings repository

final class BookingsRepositoryProvider
    extends
        $FunctionalProvider<
          BookingsRepository,
          BookingsRepository,
          BookingsRepository
        >
    with $Provider<BookingsRepository> {
  /// Provider for the bookings repository
  const BookingsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bookingsRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bookingsRepositoryHash();

  @$internal
  @override
  $ProviderElement<BookingsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  BookingsRepository create(Ref ref) {
    return bookingsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BookingsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BookingsRepository>(value),
    );
  }
}

String _$bookingsRepositoryHash() =>
    r'277bc036b90766242eeeba3940122402f8d9a0e6';

/// Provider for all bookings

@ProviderFor(allBookings)
const allBookingsProvider = AllBookingsProvider._();

/// Provider for all bookings

final class AllBookingsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<BookingEntity>>,
          List<BookingEntity>,
          FutureOr<List<BookingEntity>>
        >
    with
        $FutureModifier<List<BookingEntity>>,
        $FutureProvider<List<BookingEntity>> {
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
  $FutureProviderElement<List<BookingEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<BookingEntity>> create(Ref ref) {
    return allBookings(ref);
  }
}

String _$allBookingsHash() => r'b6a22d2713ed82fde9a3d3a960fe2b578c680057';

/// Provider for upcoming bookings only

@ProviderFor(upcomingBookings)
const upcomingBookingsProvider = UpcomingBookingsProvider._();

/// Provider for upcoming bookings only

final class UpcomingBookingsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<BookingEntity>>,
          List<BookingEntity>,
          FutureOr<List<BookingEntity>>
        >
    with
        $FutureModifier<List<BookingEntity>>,
        $FutureProvider<List<BookingEntity>> {
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
  $FutureProviderElement<List<BookingEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<BookingEntity>> create(Ref ref) {
    return upcomingBookings(ref);
  }
}

String _$upcomingBookingsHash() => r'2779ada3fbacb7634e951a7f6d26c4eac1cb56b3';

/// Provider for past bookings only

@ProviderFor(pastBookings)
const pastBookingsProvider = PastBookingsProvider._();

/// Provider for past bookings only

final class PastBookingsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<BookingEntity>>,
          List<BookingEntity>,
          FutureOr<List<BookingEntity>>
        >
    with
        $FutureModifier<List<BookingEntity>>,
        $FutureProvider<List<BookingEntity>> {
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
  $FutureProviderElement<List<BookingEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<BookingEntity>> create(Ref ref) {
    return pastBookings(ref);
  }
}

String _$pastBookingsHash() => r'bb488e359798c5ea43f02972fe40fbc69ab87c28';

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
    extends $AsyncNotifierProvider<BookingsController, List<BookingEntity>> {
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
    r'd91b97b21dbb8aed10d32c64bfbc1712ef54e7e8';

/// Main bookings controller for managing booking state and actions

abstract class _$BookingsController
    extends $AsyncNotifier<List<BookingEntity>> {
  FutureOr<List<BookingEntity>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<BookingEntity>>, List<BookingEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<BookingEntity>>, List<BookingEntity>>,
              AsyncValue<List<BookingEntity>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
