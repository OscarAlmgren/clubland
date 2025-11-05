// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_filters_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Controller for managing booking filters.

@ProviderFor(BookingFiltersController)
const bookingFiltersControllerProvider = BookingFiltersControllerProvider._();

/// Controller for managing booking filters.
final class BookingFiltersControllerProvider
    extends $NotifierProvider<BookingFiltersController, BookingFilters> {
  /// Controller for managing booking filters.
  const BookingFiltersControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bookingFiltersControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bookingFiltersControllerHash();

  @$internal
  @override
  BookingFiltersController create() => BookingFiltersController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BookingFilters value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BookingFilters>(value),
    );
  }
}

String _$bookingFiltersControllerHash() =>
    r'0495ae4a456abd7d954ccec0071b748bdd470f04';

/// Controller for managing booking filters.

abstract class _$BookingFiltersController extends $Notifier<BookingFilters> {
  BookingFilters build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<BookingFilters, BookingFilters>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<BookingFilters, BookingFilters>,
              BookingFilters,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
