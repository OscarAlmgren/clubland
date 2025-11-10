// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for the events repository

@ProviderFor(eventsRepository)
const eventsRepositoryProvider = EventsRepositoryProvider._();

/// Provider for the events repository

final class EventsRepositoryProvider
    extends
        $FunctionalProvider<
          EventsRepository,
          EventsRepository,
          EventsRepository
        >
    with $Provider<EventsRepository> {
  /// Provider for the events repository
  const EventsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'eventsRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$eventsRepositoryHash();

  @$internal
  @override
  $ProviderElement<EventsRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  EventsRepository create(Ref ref) {
    return eventsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EventsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EventsRepository>(value),
    );
  }
}

String _$eventsRepositoryHash() => r'0cd015e22bbe7b99a0d3d4af00776db341f94c21';

/// Provider for GetEvents use case

@ProviderFor(getEventsUseCase)
const getEventsUseCaseProvider = GetEventsUseCaseProvider._();

/// Provider for GetEvents use case

final class GetEventsUseCaseProvider
    extends $FunctionalProvider<GetEvents, GetEvents, GetEvents>
    with $Provider<GetEvents> {
  /// Provider for GetEvents use case
  const GetEventsUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getEventsUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getEventsUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetEvents> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetEvents create(Ref ref) {
    return getEventsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetEvents value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetEvents>(value),
    );
  }
}

String _$getEventsUseCaseHash() => r'c0997e4cfbd89b7c5b0766dfbc74c76642bf18a1';

/// Provider for GetEventById use case

@ProviderFor(getEventByIdUseCase)
const getEventByIdUseCaseProvider = GetEventByIdUseCaseProvider._();

/// Provider for GetEventById use case

final class GetEventByIdUseCaseProvider
    extends $FunctionalProvider<GetEventById, GetEventById, GetEventById>
    with $Provider<GetEventById> {
  /// Provider for GetEventById use case
  const GetEventByIdUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getEventByIdUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getEventByIdUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetEventById> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetEventById create(Ref ref) {
    return getEventByIdUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetEventById value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetEventById>(value),
    );
  }
}

String _$getEventByIdUseCaseHash() =>
    r'fc8097cf89902deed5f53c2b0b534c0efc3a5214';

/// Provider for CheckRSVPEligibility use case

@ProviderFor(checkRSVPEligibilityUseCase)
const checkRSVPEligibilityUseCaseProvider =
    CheckRSVPEligibilityUseCaseProvider._();

/// Provider for CheckRSVPEligibility use case

final class CheckRSVPEligibilityUseCaseProvider
    extends
        $FunctionalProvider<
          CheckRSVPEligibility,
          CheckRSVPEligibility,
          CheckRSVPEligibility
        >
    with $Provider<CheckRSVPEligibility> {
  /// Provider for CheckRSVPEligibility use case
  const CheckRSVPEligibilityUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'checkRSVPEligibilityUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$checkRSVPEligibilityUseCaseHash();

  @$internal
  @override
  $ProviderElement<CheckRSVPEligibility> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CheckRSVPEligibility create(Ref ref) {
    return checkRSVPEligibilityUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CheckRSVPEligibility value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CheckRSVPEligibility>(value),
    );
  }
}

String _$checkRSVPEligibilityUseCaseHash() =>
    r'2b75ca9ff26e06779a937564a81112bd86d62d4f';

/// Provider for CreateRSVP use case

@ProviderFor(createRSVPUseCase)
const createRSVPUseCaseProvider = CreateRSVPUseCaseProvider._();

/// Provider for CreateRSVP use case

final class CreateRSVPUseCaseProvider
    extends $FunctionalProvider<CreateRSVP, CreateRSVP, CreateRSVP>
    with $Provider<CreateRSVP> {
  /// Provider for CreateRSVP use case
  const CreateRSVPUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createRSVPUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createRSVPUseCaseHash();

  @$internal
  @override
  $ProviderElement<CreateRSVP> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CreateRSVP create(Ref ref) {
    return createRSVPUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CreateRSVP value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CreateRSVP>(value),
    );
  }
}

String _$createRSVPUseCaseHash() => r'ce0ccb4f9780fb2746d528bc1d026302ec38c0ec';

/// Provider for UpdateRSVP use case

@ProviderFor(updateRSVPUseCase)
const updateRSVPUseCaseProvider = UpdateRSVPUseCaseProvider._();

/// Provider for UpdateRSVP use case

final class UpdateRSVPUseCaseProvider
    extends $FunctionalProvider<UpdateRSVP, UpdateRSVP, UpdateRSVP>
    with $Provider<UpdateRSVP> {
  /// Provider for UpdateRSVP use case
  const UpdateRSVPUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateRSVPUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updateRSVPUseCaseHash();

  @$internal
  @override
  $ProviderElement<UpdateRSVP> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UpdateRSVP create(Ref ref) {
    return updateRSVPUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UpdateRSVP value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UpdateRSVP>(value),
    );
  }
}

String _$updateRSVPUseCaseHash() => r'b4dcbcea0817b19d3748d300c364be850ddc8d11';

/// Provider for CancelRSVP use case

@ProviderFor(cancelRSVPUseCase)
const cancelRSVPUseCaseProvider = CancelRSVPUseCaseProvider._();

/// Provider for CancelRSVP use case

final class CancelRSVPUseCaseProvider
    extends $FunctionalProvider<CancelRSVP, CancelRSVP, CancelRSVP>
    with $Provider<CancelRSVP> {
  /// Provider for CancelRSVP use case
  const CancelRSVPUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cancelRSVPUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cancelRSVPUseCaseHash();

  @$internal
  @override
  $ProviderElement<CancelRSVP> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CancelRSVP create(Ref ref) {
    return cancelRSVPUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CancelRSVP value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CancelRSVP>(value),
    );
  }
}

String _$cancelRSVPUseCaseHash() => r'cfdeb9c4ec8c8a27824056edcab34dd4fa34c7e0';

/// Provider for GetMyRSVPs use case

@ProviderFor(getMyRSVPsUseCase)
const getMyRSVPsUseCaseProvider = GetMyRSVPsUseCaseProvider._();

/// Provider for GetMyRSVPs use case

final class GetMyRSVPsUseCaseProvider
    extends $FunctionalProvider<GetMyRSVPs, GetMyRSVPs, GetMyRSVPs>
    with $Provider<GetMyRSVPs> {
  /// Provider for GetMyRSVPs use case
  const GetMyRSVPsUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getMyRSVPsUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getMyRSVPsUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetMyRSVPs> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetMyRSVPs create(Ref ref) {
    return getMyRSVPsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetMyRSVPs value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetMyRSVPs>(value),
    );
  }
}

String _$getMyRSVPsUseCaseHash() => r'507c15bed15644dd8b6f6a2eda11b07a3bf123f0';

/// Provider for GetFindingFriendsSubgroups use case

@ProviderFor(getFindingFriendsSubgroupsUseCase)
const getFindingFriendsSubgroupsUseCaseProvider =
    GetFindingFriendsSubgroupsUseCaseProvider._();

/// Provider for GetFindingFriendsSubgroups use case

final class GetFindingFriendsSubgroupsUseCaseProvider
    extends
        $FunctionalProvider<
          GetFindingFriendsSubgroups,
          GetFindingFriendsSubgroups,
          GetFindingFriendsSubgroups
        >
    with $Provider<GetFindingFriendsSubgroups> {
  /// Provider for GetFindingFriendsSubgroups use case
  const GetFindingFriendsSubgroupsUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getFindingFriendsSubgroupsUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$getFindingFriendsSubgroupsUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetFindingFriendsSubgroups> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetFindingFriendsSubgroups create(Ref ref) {
    return getFindingFriendsSubgroupsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetFindingFriendsSubgroups value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetFindingFriendsSubgroups>(value),
    );
  }
}

String _$getFindingFriendsSubgroupsUseCaseHash() =>
    r'e8d160fcc5402b5bcf64e27262c6ad95cac02b0e';

/// Provider for fetching events for a club

@ProviderFor(clubEvents)
const clubEventsProvider = ClubEventsFamily._();

/// Provider for fetching events for a club

final class ClubEventsProvider
    extends
        $FunctionalProvider<
          AsyncValue<EventsConnectionEntity>,
          EventsConnectionEntity,
          FutureOr<EventsConnectionEntity>
        >
    with
        $FutureModifier<EventsConnectionEntity>,
        $FutureProvider<EventsConnectionEntity> {
  /// Provider for fetching events for a club
  const ClubEventsProvider._({
    required ClubEventsFamily super.from,
    required (String, {Map<String, dynamic>? filters, int page, int pageSize})
    super.argument,
  }) : super(
         retry: null,
         name: r'clubEventsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$clubEventsHash();

  @override
  String toString() {
    return r'clubEventsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<EventsConnectionEntity> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<EventsConnectionEntity> create(Ref ref) {
    final argument =
        this.argument
            as (
              String, {
              Map<String, dynamic>? filters,
              int page,
              int pageSize,
            });
    return clubEvents(
      ref,
      argument.$1,
      filters: argument.filters,
      page: argument.page,
      pageSize: argument.pageSize,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ClubEventsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$clubEventsHash() => r'f9ef0b77eef16ab2a8b891636e616d205dc91c97';

/// Provider for fetching events for a club

final class ClubEventsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<EventsConnectionEntity>,
          (String, {Map<String, dynamic>? filters, int page, int pageSize})
        > {
  const ClubEventsFamily._()
    : super(
        retry: null,
        name: r'clubEventsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provider for fetching events for a club

  ClubEventsProvider call(
    String clubId, {
    Map<String, dynamic>? filters,
    int page = 1,
    int pageSize = 20,
  }) => ClubEventsProvider._(
    argument: (clubId, filters: filters, page: page, pageSize: pageSize),
    from: this,
  );

  @override
  String toString() => r'clubEventsProvider';
}

/// Provider for fetching a single event by ID

@ProviderFor(eventDetails)
const eventDetailsProvider = EventDetailsFamily._();

/// Provider for fetching a single event by ID

final class EventDetailsProvider
    extends
        $FunctionalProvider<
          AsyncValue<EventEntity>,
          EventEntity,
          FutureOr<EventEntity>
        >
    with $FutureModifier<EventEntity>, $FutureProvider<EventEntity> {
  /// Provider for fetching a single event by ID
  const EventDetailsProvider._({
    required EventDetailsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'eventDetailsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$eventDetailsHash();

  @override
  String toString() {
    return r'eventDetailsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<EventEntity> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<EventEntity> create(Ref ref) {
    final argument = this.argument as String;
    return eventDetails(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is EventDetailsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$eventDetailsHash() => r'c780b77b90edef8ba26df5c1b81eebcd99cceb08';

/// Provider for fetching a single event by ID

final class EventDetailsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<EventEntity>, String> {
  const EventDetailsFamily._()
    : super(
        retry: null,
        name: r'eventDetailsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provider for fetching a single event by ID

  EventDetailsProvider call(String eventId) =>
      EventDetailsProvider._(argument: eventId, from: this);

  @override
  String toString() => r'eventDetailsProvider';
}

/// Provider for checking RSVP eligibility

@ProviderFor(rsvpEligibility)
const rsvpEligibilityProvider = RsvpEligibilityFamily._();

/// Provider for checking RSVP eligibility

final class RsvpEligibilityProvider
    extends
        $FunctionalProvider<
          AsyncValue<RSVPEligibilityEntity>,
          RSVPEligibilityEntity,
          FutureOr<RSVPEligibilityEntity>
        >
    with
        $FutureModifier<RSVPEligibilityEntity>,
        $FutureProvider<RSVPEligibilityEntity> {
  /// Provider for checking RSVP eligibility
  const RsvpEligibilityProvider._({
    required RsvpEligibilityFamily super.from,
    required (String, String) super.argument,
  }) : super(
         retry: null,
         name: r'rsvpEligibilityProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$rsvpEligibilityHash();

  @override
  String toString() {
    return r'rsvpEligibilityProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<RSVPEligibilityEntity> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<RSVPEligibilityEntity> create(Ref ref) {
    final argument = this.argument as (String, String);
    return rsvpEligibility(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is RsvpEligibilityProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$rsvpEligibilityHash() => r'f6ac887148523f232b8da425cc4489dd41c86b1c';

/// Provider for checking RSVP eligibility

final class RsvpEligibilityFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<RSVPEligibilityEntity>,
          (String, String)
        > {
  const RsvpEligibilityFamily._()
    : super(
        retry: null,
        name: r'rsvpEligibilityProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provider for checking RSVP eligibility

  RsvpEligibilityProvider call(String eventId, String memberId) =>
      RsvpEligibilityProvider._(argument: (eventId, memberId), from: this);

  @override
  String toString() => r'rsvpEligibilityProvider';
}

/// Provider for fetching member's RSVPs

@ProviderFor(myRSVPs)
const myRSVPsProvider = MyRSVPsFamily._();

/// Provider for fetching member's RSVPs

final class MyRSVPsProvider
    extends
        $FunctionalProvider<
          AsyncValue<RSVPsConnectionEntity>,
          RSVPsConnectionEntity,
          FutureOr<RSVPsConnectionEntity>
        >
    with
        $FutureModifier<RSVPsConnectionEntity>,
        $FutureProvider<RSVPsConnectionEntity> {
  /// Provider for fetching member's RSVPs
  const MyRSVPsProvider._({
    required MyRSVPsFamily super.from,
    required (String, {List<String>? statusFilter, int page, int pageSize})
    super.argument,
  }) : super(
         retry: null,
         name: r'myRSVPsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$myRSVPsHash();

  @override
  String toString() {
    return r'myRSVPsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<RSVPsConnectionEntity> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<RSVPsConnectionEntity> create(Ref ref) {
    final argument =
        this.argument
            as (String, {List<String>? statusFilter, int page, int pageSize});
    return myRSVPs(
      ref,
      argument.$1,
      statusFilter: argument.statusFilter,
      page: argument.page,
      pageSize: argument.pageSize,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MyRSVPsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$myRSVPsHash() => r'dc392387eea5ea3748c52e051e5376fec584f53e';

/// Provider for fetching member's RSVPs

final class MyRSVPsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<RSVPsConnectionEntity>,
          (String, {List<String>? statusFilter, int page, int pageSize})
        > {
  const MyRSVPsFamily._()
    : super(
        retry: null,
        name: r'myRSVPsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provider for fetching member's RSVPs

  MyRSVPsProvider call(
    String clubId, {
    List<String>? statusFilter,
    int page = 1,
    int pageSize = 20,
  }) => MyRSVPsProvider._(
    argument: (
      clubId,
      statusFilter: statusFilter,
      page: page,
      pageSize: pageSize,
    ),
    from: this,
  );

  @override
  String toString() => r'myRSVPsProvider';
}

/// Provider for fetching Finding Friends subgroups

@ProviderFor(findingFriendsSubgroups)
const findingFriendsSubgroupsProvider = FindingFriendsSubgroupsFamily._();

/// Provider for fetching Finding Friends subgroups

final class FindingFriendsSubgroupsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<FindingFriendsSubgroupEntity>>,
          List<FindingFriendsSubgroupEntity>,
          FutureOr<List<FindingFriendsSubgroupEntity>>
        >
    with
        $FutureModifier<List<FindingFriendsSubgroupEntity>>,
        $FutureProvider<List<FindingFriendsSubgroupEntity>> {
  /// Provider for fetching Finding Friends subgroups
  const FindingFriendsSubgroupsProvider._({
    required FindingFriendsSubgroupsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'findingFriendsSubgroupsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$findingFriendsSubgroupsHash();

  @override
  String toString() {
    return r'findingFriendsSubgroupsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<FindingFriendsSubgroupEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<FindingFriendsSubgroupEntity>> create(Ref ref) {
    final argument = this.argument as String;
    return findingFriendsSubgroups(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is FindingFriendsSubgroupsProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$findingFriendsSubgroupsHash() =>
    r'7d4a55107ac70b5acb52f5a43874b9dda3f89f94';

/// Provider for fetching Finding Friends subgroups

final class FindingFriendsSubgroupsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<List<FindingFriendsSubgroupEntity>>,
          String
        > {
  const FindingFriendsSubgroupsFamily._()
    : super(
        retry: null,
        name: r'findingFriendsSubgroupsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provider for fetching Finding Friends subgroups

  FindingFriendsSubgroupsProvider call(String clubId) =>
      FindingFriendsSubgroupsProvider._(argument: clubId, from: this);

  @override
  String toString() => r'findingFriendsSubgroupsProvider';
}

/// Controller for managing events list with pagination and filtering

@ProviderFor(EventsListController)
const eventsListControllerProvider = EventsListControllerFamily._();

/// Controller for managing events list with pagination and filtering
final class EventsListControllerProvider
    extends $AsyncNotifierProvider<EventsListController, EventsListState> {
  /// Controller for managing events list with pagination and filtering
  const EventsListControllerProvider._({
    required EventsListControllerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'eventsListControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$eventsListControllerHash();

  @override
  String toString() {
    return r'eventsListControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  EventsListController create() => EventsListController();

  @override
  bool operator ==(Object other) {
    return other is EventsListControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$eventsListControllerHash() =>
    r'683268e1a423b61e6db08c8a11ea5b868496ffa8';

/// Controller for managing events list with pagination and filtering

final class EventsListControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          EventsListController,
          AsyncValue<EventsListState>,
          EventsListState,
          FutureOr<EventsListState>,
          String
        > {
  const EventsListControllerFamily._()
    : super(
        retry: null,
        name: r'eventsListControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Controller for managing events list with pagination and filtering

  EventsListControllerProvider call(String clubId) =>
      EventsListControllerProvider._(argument: clubId, from: this);

  @override
  String toString() => r'eventsListControllerProvider';
}

/// Controller for managing events list with pagination and filtering

abstract class _$EventsListController extends $AsyncNotifier<EventsListState> {
  late final _$args = ref.$arg as String;
  String get clubId => _$args;

  FutureOr<EventsListState> build(String clubId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<EventsListState>, EventsListState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<EventsListState>, EventsListState>,
              AsyncValue<EventsListState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Controller for managing event details and eligibility

@ProviderFor(EventDetailsController)
const eventDetailsControllerProvider = EventDetailsControllerFamily._();

/// Controller for managing event details and eligibility
final class EventDetailsControllerProvider
    extends $AsyncNotifierProvider<EventDetailsController, EventDetailsState> {
  /// Controller for managing event details and eligibility
  const EventDetailsControllerProvider._({
    required EventDetailsControllerFamily super.from,
    required (String, String) super.argument,
  }) : super(
         retry: null,
         name: r'eventDetailsControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$eventDetailsControllerHash();

  @override
  String toString() {
    return r'eventDetailsControllerProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  EventDetailsController create() => EventDetailsController();

  @override
  bool operator ==(Object other) {
    return other is EventDetailsControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$eventDetailsControllerHash() =>
    r'64f866a9908776079388851474e7e988fd56dc19';

/// Controller for managing event details and eligibility

final class EventDetailsControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          EventDetailsController,
          AsyncValue<EventDetailsState>,
          EventDetailsState,
          FutureOr<EventDetailsState>,
          (String, String)
        > {
  const EventDetailsControllerFamily._()
    : super(
        retry: null,
        name: r'eventDetailsControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Controller for managing event details and eligibility

  EventDetailsControllerProvider call(String eventId, String memberId) =>
      EventDetailsControllerProvider._(
        argument: (eventId, memberId),
        from: this,
      );

  @override
  String toString() => r'eventDetailsControllerProvider';
}

/// Controller for managing event details and eligibility

abstract class _$EventDetailsController
    extends $AsyncNotifier<EventDetailsState> {
  late final _$args = ref.$arg as (String, String);
  String get eventId => _$args.$1;
  String get memberId => _$args.$2;

  FutureOr<EventDetailsState> build(String eventId, String memberId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args.$1, _$args.$2);
    final ref =
        this.ref as $Ref<AsyncValue<EventDetailsState>, EventDetailsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<EventDetailsState>, EventDetailsState>,
              AsyncValue<EventDetailsState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Controller for managing RSVP operations

@ProviderFor(RSVPController)
const rSVPControllerProvider = RSVPControllerProvider._();

/// Controller for managing RSVP operations
final class RSVPControllerProvider
    extends $AsyncNotifierProvider<RSVPController, EventRSVPEntity?> {
  /// Controller for managing RSVP operations
  const RSVPControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'rSVPControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$rSVPControllerHash();

  @$internal
  @override
  RSVPController create() => RSVPController();
}

String _$rSVPControllerHash() => r'ed98276d2594fb0e34f20d14d1f3c9421116fab9';

/// Controller for managing RSVP operations

abstract class _$RSVPController extends $AsyncNotifier<EventRSVPEntity?> {
  FutureOr<EventRSVPEntity?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<EventRSVPEntity?>, EventRSVPEntity?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<EventRSVPEntity?>, EventRSVPEntity?>,
              AsyncValue<EventRSVPEntity?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Controller for managing member's RSVPs

@ProviderFor(MyRSVPsController)
const myRSVPsControllerProvider = MyRSVPsControllerFamily._();

/// Controller for managing member's RSVPs
final class MyRSVPsControllerProvider
    extends $AsyncNotifierProvider<MyRSVPsController, MyRSVPsState> {
  /// Controller for managing member's RSVPs
  const MyRSVPsControllerProvider._({
    required MyRSVPsControllerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'myRSVPsControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$myRSVPsControllerHash();

  @override
  String toString() {
    return r'myRSVPsControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  MyRSVPsController create() => MyRSVPsController();

  @override
  bool operator ==(Object other) {
    return other is MyRSVPsControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$myRSVPsControllerHash() => r'a7703586184560183fed6990dfbcc6317cf9cd6f';

/// Controller for managing member's RSVPs

final class MyRSVPsControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          MyRSVPsController,
          AsyncValue<MyRSVPsState>,
          MyRSVPsState,
          FutureOr<MyRSVPsState>,
          String
        > {
  const MyRSVPsControllerFamily._()
    : super(
        retry: null,
        name: r'myRSVPsControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Controller for managing member's RSVPs

  MyRSVPsControllerProvider call(String clubId) =>
      MyRSVPsControllerProvider._(argument: clubId, from: this);

  @override
  String toString() => r'myRSVPsControllerProvider';
}

/// Controller for managing member's RSVPs

abstract class _$MyRSVPsController extends $AsyncNotifier<MyRSVPsState> {
  late final _$args = ref.$arg as String;
  String get clubId => _$args;

  FutureOr<MyRSVPsState> build(String clubId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<MyRSVPsState>, MyRSVPsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<MyRSVPsState>, MyRSVPsState>,
              AsyncValue<MyRSVPsState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
