import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/graphql_client.dart';
import '../../data/datasources/events_remote_datasource.dart';
import '../../data/repositories/events_repository_impl.dart';
import '../../domain/entities/cancel_rsvp_response_entity.dart';
import '../../domain/entities/event_entity.dart';
import '../../domain/entities/event_rsvp_entity.dart';
import '../../domain/entities/events_connection_entity.dart';
import '../../domain/entities/finding_friends_subgroup_entity.dart';
import '../../domain/entities/rsvp_eligibility_entity.dart';
import '../../domain/repositories/events_repository.dart';
import '../../domain/usecases/cancel_rsvp.dart';
import '../../domain/usecases/check_rsvp_eligibility.dart';
import '../../domain/usecases/create_rsvp.dart';
import '../../domain/usecases/get_event_by_id.dart';
import '../../domain/usecases/get_events.dart';
import '../../domain/usecases/get_finding_friends_subgroups.dart';
import '../../domain/usecases/get_my_rsvps.dart';
import '../../domain/usecases/update_rsvp.dart';

part 'events_controller.g.dart';

// ============================================================================
// DATASOURCE & REPOSITORY PROVIDERS
// ============================================================================

/// Provider for the events remote datasource
final eventsRemoteDataSourceProvider = Provider<EventsRemoteDataSource>(
  (ref) => EventsRemoteDataSourceImpl(
    client: GraphQLClientConfig.client,
  ),
);

/// Provider for the events repository
@riverpod
EventsRepository eventsRepository(Ref ref) {
  final datasource = ref.read(eventsRemoteDataSourceProvider);
  return EventsRepositoryImpl(remoteDataSource: datasource);
}

// ============================================================================
// USE CASE PROVIDERS
// ============================================================================

/// Provider for GetEvents use case
@riverpod
GetEvents getEventsUseCase(Ref ref) {
  final repository = ref.read(eventsRepositoryProvider);
  return GetEvents(repository);
}

/// Provider for GetEventById use case
@riverpod
GetEventById getEventByIdUseCase(Ref ref) {
  final repository = ref.read(eventsRepositoryProvider);
  return GetEventById(repository);
}

/// Provider for CheckRSVPEligibility use case
@riverpod
CheckRSVPEligibility checkRSVPEligibilityUseCase(Ref ref) {
  final repository = ref.read(eventsRepositoryProvider);
  return CheckRSVPEligibility(repository);
}

/// Provider for CreateRSVP use case
@riverpod
CreateRSVP createRSVPUseCase(Ref ref) {
  final repository = ref.read(eventsRepositoryProvider);
  return CreateRSVP(repository);
}

/// Provider for UpdateRSVP use case
@riverpod
UpdateRSVP updateRSVPUseCase(Ref ref) {
  final repository = ref.read(eventsRepositoryProvider);
  return UpdateRSVP(repository);
}

/// Provider for CancelRSVP use case
@riverpod
CancelRSVP cancelRSVPUseCase(Ref ref) {
  final repository = ref.read(eventsRepositoryProvider);
  return CancelRSVP(repository);
}

/// Provider for GetMyRSVPs use case
@riverpod
GetMyRSVPs getMyRSVPsUseCase(Ref ref) {
  final repository = ref.read(eventsRepositoryProvider);
  return GetMyRSVPs(repository);
}

/// Provider for GetFindingFriendsSubgroups use case
@riverpod
GetFindingFriendsSubgroups getFindingFriendsSubgroupsUseCase(Ref ref) {
  final repository = ref.read(eventsRepositoryProvider);
  return GetFindingFriendsSubgroups(repository);
}

// ============================================================================
// DATA PROVIDERS
// ============================================================================

/// Provider for fetching events for a club
@riverpod
Future<EventsConnectionEntity> clubEvents(
  Ref ref,
  String clubId, {
  Map<String, dynamic>? filters,
  int page = 1,
  int pageSize = 20,
}) async {
  final useCase = ref.read(getEventsUseCaseProvider);
  final result = await useCase(
    GetEventsParams(
      clubId: clubId,
      filters: filters,
      page: page,
      pageSize: pageSize,
    ),
  );

  return result.fold(
    (failure) => throw Exception(failure.message),
    (connection) => connection,
  );
}

/// Provider for fetching a single event by ID
@riverpod
Future<EventEntity> eventDetails(Ref ref, String eventId) async {
  // Keep this provider alive to prevent auto-disposal during fetch
  final link = ref.keepAlive();

  // After the fetch completes, schedule disposal after a delay
  Timer? timer;
  ref.onDispose(() => timer?.cancel());

  try {
    final useCase = ref.read(getEventByIdUseCaseProvider);
    final result = await useCase(eventId);

    return result.fold(
      (failure) {
        // Check if this is a GraphQL validation error (API doesn't support the query yet)
        if (failure.message.contains('Cannot query field') ||
            failure.message.contains('GRAPHQL_VALIDATION_FAILED') ||
            failure.code == 'SERVER_ERROR_500') {
          // Log warning about API unavailability
          Logger().w(
            'Event details API not available yet. Event ID: $eventId. '
            'Error: ${failure.message}',
          );

          // Throw a specific exception for API unavailability
          throw Exception(
            'API_UNAVAILABLE: Unable to load event details. The event details API is currently unavailable.',
          );
        }

        // For other failures, throw with the original message
        throw Exception(failure.message);
      },
      (event) {
        // Schedule disposal after successful fetch
        timer = Timer(const Duration(minutes: 5), link.close);
        return event;
      },
    );
  } catch (e) {
    // Schedule disposal after error
    timer = Timer(const Duration(seconds: 30), link.close);
    rethrow;
  }
}

/// Provider for checking RSVP eligibility
@riverpod
Future<RSVPEligibilityEntity> rsvpEligibility(
  Ref ref,
  String eventId,
  String memberId,
) async {
  final useCase = ref.read(checkRSVPEligibilityUseCaseProvider);
  final result = await useCase(
    CheckRSVPEligibilityParams(
      eventId: eventId,
      memberId: memberId,
    ),
  );

  return result.fold(
    (failure) => throw Exception(failure.message),
    (eligibility) => eligibility,
  );
}

/// Provider for fetching member's RSVPs
@riverpod
Future<RSVPsConnectionEntity> myRSVPs(
  Ref ref,
  String clubId, {
  List<String>? statusFilter,
  int page = 1,
  int pageSize = 20,
}) async {
  final useCase = ref.read(getMyRSVPsUseCaseProvider);
  final result = await useCase(
    GetMyRSVPsParams(
      clubId: clubId,
      statusFilter: statusFilter,
      page: page,
      pageSize: pageSize,
    ),
  );

  return result.fold(
    (failure) => throw Exception(failure.message),
    (connection) => connection,
  );
}

/// Provider for fetching Finding Friends subgroups
@riverpod
Future<List<FindingFriendsSubgroupEntity>> findingFriendsSubgroups(
  Ref ref,
  String clubId,
) async {
  final useCase = ref.read(getFindingFriendsSubgroupsUseCaseProvider);
  final result = await useCase(clubId);

  return result.fold(
    (failure) => throw Exception(failure.message),
    (subgroups) => subgroups,
  );
}

// ============================================================================
// EVENTS LIST CONTROLLER
// ============================================================================

/// State for events list with filtering and pagination
class EventsListState {
  const EventsListState({
    required this.events,
    required this.pageInfo,
    required this.totalCount,
    this.filters,
    this.isLoadingMore = false,
  });

  final List<EventEntity> events;
  final PageInfoEntity pageInfo;
  final int totalCount;
  final Map<String, dynamic>? filters;
  final bool isLoadingMore;

  EventsListState copyWith({
    List<EventEntity>? events,
    PageInfoEntity? pageInfo,
    int? totalCount,
    Map<String, dynamic>? filters,
    bool? isLoadingMore,
  }) {
    return EventsListState(
      events: events ?? this.events,
      pageInfo: pageInfo ?? this.pageInfo,
      totalCount: totalCount ?? this.totalCount,
      filters: filters ?? this.filters,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

/// Controller for managing events list with pagination and filtering
@riverpod
class EventsListController extends _$EventsListController {
  int _currentPage = 1;
  List<EventEntity> _allEvents = [];

  @override
  Future<EventsListState> build(String clubId) async {
    _currentPage = 1;
    _allEvents = [];
    return _fetchEvents(clubId);
  }

  Future<EventsListState> _fetchEvents(
    String clubId, {
    Map<String, dynamic>? filters,
  }) async {
    final connection = await ref.read(
      clubEventsProvider(
        clubId,
        filters: filters,
        page: _currentPage,
      ).future,
    );

    if (_currentPage == 1) {
      _allEvents = connection.events;
    } else {
      _allEvents.addAll(connection.events);
    }

    return EventsListState(
      events: List.unmodifiable(_allEvents),
      pageInfo: connection.pageInfo,
      totalCount: connection.totalCount,
      filters: filters,
    );
  }

  /// Apply filters to events list
  Future<void> applyFilters(Map<String, dynamic>? filters) async {
    _currentPage = 1;
    _allEvents = [];

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _fetchEvents(clubId, filters: filters),
    );
  }

  /// Load more events (pagination)
  Future<void> loadMore() async {
    final currentState = state.value;
    if (currentState == null ||
        !currentState.pageInfo.hasNextPage ||
        currentState.isLoadingMore) {
      return;
    }

    // Set loading more flag
    state = AsyncData(currentState.copyWith(isLoadingMore: true));

    _currentPage++;

    try {
      final newState = await _fetchEvents(clubId, filters: currentState.filters);
      state = AsyncData(newState.copyWith(isLoadingMore: false));
    } catch (e, stack) {
      // Revert page increment on error
      _currentPage--;
      state = AsyncError(e, stack);
    }
  }

  /// Refresh events list
  Future<void> refresh() async {
    _currentPage = 1;
    _allEvents = [];

    final currentFilters = state.value?.filters;
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _fetchEvents(clubId, filters: currentFilters),
    );
  }

  /// Search events
  Future<void> search(String query) async {
    if (query.isEmpty) {
      await applyFilters(null);
      return;
    }

    final filters = {'search': query};
    await applyFilters(filters);
  }
}

// ============================================================================
// EVENT DETAILS CONTROLLER
// ============================================================================

/// State for event details with eligibility
class EventDetailsState {
  const EventDetailsState({
    required this.event,
    this.eligibility,
    this.existingRSVP,
  });

  final EventEntity event;
  final RSVPEligibilityEntity? eligibility;
  final EventRSVPEntity? existingRSVP;

  EventDetailsState copyWith({
    EventEntity? event,
    RSVPEligibilityEntity? eligibility,
    EventRSVPEntity? existingRSVP,
  }) {
    return EventDetailsState(
      event: event ?? this.event,
      eligibility: eligibility ?? this.eligibility,
      existingRSVP: existingRSVP ?? this.existingRSVP,
    );
  }
}

/// Controller for managing event details and eligibility
@riverpod
class EventDetailsController extends _$EventDetailsController {
  @override
  Future<EventDetailsState> build(String eventId, String memberId) async {
    // Keep this controller alive to prevent auto-disposal and refetching
    ref.keepAlive();

    final event = await ref.read(eventDetailsProvider(eventId).future);

    // Fetch eligibility in parallel
    RSVPEligibilityEntity? eligibility;
    try {
      eligibility = await ref.read(
        rsvpEligibilityProvider(eventId, memberId).future,
      );
    } catch (e) {
      // Eligibility check failed, log and continue without it
      Logger().w('Failed to fetch RSVP eligibility for event $eventId: $e');
      eligibility = null;
    }

    return EventDetailsState(
      event: event,
      eligibility: eligibility,
    );
  }

  /// Reload event details
  Future<void> reload() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => build(eventId, memberId));
  }

  /// Refresh only eligibility
  Future<void> refreshEligibility() async {
    final currentState = state.value;
    if (currentState == null) return;

    try {
      final eligibility = await ref.read(
        rsvpEligibilityProvider(eventId, memberId).future,
      );
      state = AsyncData(currentState.copyWith(eligibility: eligibility));
    } catch (e) {
      // Log the error but don't update state
      Logger().w('Failed to refresh RSVP eligibility: $e');
    }
  }
}

// ============================================================================
// RSVP CONTROLLER
// ============================================================================

/// Controller for managing RSVP operations
@riverpod
class RSVPController extends _$RSVPController {
  @override
  FutureOr<EventRSVPEntity?> build() {
    return null;
  }

  /// Create a new RSVP
  Future<void> createRSVP(Map<String, dynamic> input) async {
    state = const AsyncLoading();

    final useCase = ref.read(createRSVPUseCaseProvider);
    state = await AsyncValue.guard(() async {
      final result = await useCase(input);
      return result.fold(
        (failure) => throw Exception(failure.message),
        (rsvp) => rsvp,
      );
    });
  }

  /// Update an existing RSVP
  Future<void> updateRSVP(String rsvpId, Map<String, dynamic> input) async {
    state = const AsyncLoading();

    final useCase = ref.read(updateRSVPUseCaseProvider);
    state = await AsyncValue.guard(() async {
      final result = await useCase(
        UpdateRSVPParams(rsvpId: rsvpId, input: input),
      );
      return result.fold(
        (failure) => throw Exception(failure.message),
        (rsvp) => rsvp,
      );
    });
  }

  /// Cancel an RSVP
  Future<CancelRSVPResponseEntity> cancelRSVP(
    String rsvpId, {
    String? reason,
  }) async {
    final useCase = ref.read(cancelRSVPUseCaseProvider);
    final result = await useCase(
      CancelRSVPParams(rsvpId: rsvpId, reason: reason),
    );

    return result.fold(
      (failure) => throw Exception(failure.message),
      (response) {
        // Clear current RSVP state on successful cancellation
        state = const AsyncData(null);
        return response;
      },
    );
  }
}

// ============================================================================
// MY RSVPS CONTROLLER
// ============================================================================

/// State for My RSVPs with filtering and pagination
class MyRSVPsState {
  const MyRSVPsState({
    required this.rsvps,
    required this.pageInfo,
    required this.totalCount,
    this.statusFilter,
    this.isLoadingMore = false,
  });

  final List<dynamic> rsvps;
  final PageInfoEntity pageInfo;
  final int totalCount;
  final List<String>? statusFilter;
  final bool isLoadingMore;

  MyRSVPsState copyWith({
    List<dynamic>? rsvps,
    PageInfoEntity? pageInfo,
    int? totalCount,
    List<String>? statusFilter,
    bool? isLoadingMore,
  }) {
    return MyRSVPsState(
      rsvps: rsvps ?? this.rsvps,
      pageInfo: pageInfo ?? this.pageInfo,
      totalCount: totalCount ?? this.totalCount,
      statusFilter: statusFilter ?? this.statusFilter,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

/// Controller for managing member's RSVPs
@riverpod
class MyRSVPsController extends _$MyRSVPsController {
  int _currentPage = 1;
  List<dynamic> _allRSVPs = [];

  @override
  Future<MyRSVPsState> build(String clubId) async {
    _currentPage = 1;
    _allRSVPs = [];
    return _fetchRSVPs(clubId);
  }

  Future<MyRSVPsState> _fetchRSVPs(
    String clubId, {
    List<String>? statusFilter,
  }) async {
    final connection = await ref.read(
      myRSVPsProvider(
        clubId,
        statusFilter: statusFilter,
        page: _currentPage,
      ).future,
    );

    if (_currentPage == 1) {
      _allRSVPs = connection.rsvps;
    } else {
      _allRSVPs.addAll(connection.rsvps);
    }

    return MyRSVPsState(
      rsvps: List.unmodifiable(_allRSVPs),
      pageInfo: connection.pageInfo,
      totalCount: connection.totalCount,
      statusFilter: statusFilter,
    );
  }

  /// Apply status filter
  Future<void> applyFilter(List<String>? statusFilter) async {
    _currentPage = 1;
    _allRSVPs = [];

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _fetchRSVPs(clubId, statusFilter: statusFilter),
    );
  }

  /// Load more RSVPs (pagination)
  Future<void> loadMore() async {
    final currentState = state.value;
    if (currentState == null ||
        !currentState.pageInfo.hasNextPage ||
        currentState.isLoadingMore) {
      return;
    }

    // Set loading more flag
    state = AsyncData(currentState.copyWith(isLoadingMore: true));

    _currentPage++;

    try {
      final newState = await _fetchRSVPs(
        clubId,
        statusFilter: currentState.statusFilter,
      );
      state = AsyncData(newState.copyWith(isLoadingMore: false));
    } catch (e, stack) {
      // Revert page increment on error
      _currentPage--;
      state = AsyncError(e, stack);
    }
  }

  /// Refresh RSVPs list
  Future<void> refresh() async {
    _currentPage = 1;
    _allRSVPs = [];

    final currentFilter = state.value?.statusFilter;
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _fetchRSVPs(clubId, statusFilter: currentFilter),
    );
  }
}
