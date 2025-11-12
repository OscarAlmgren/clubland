# Flutter Event RSVP - Complete Implementation Guide

This document provides the complete Flutter frontend implementation guide for the Event RSVP feature, including architecture, dependencies, state management, UI components, code examples, testing, and troubleshooting.

---

## Architecture Overview

**Architecture Pattern**: Clean Architecture + Riverpod State Management

```text
lib/
├── core/
│   ├── config/
│   │   └── graphql_config.dart          # GraphQL client setup
│   ├── error/
│   │   ├── failures.dart                # Error handling
│   │   └── exceptions.dart
│   ├── network/
│   │   ├── graphql_client.dart          # GraphQL client wrapper
│   │   └── network_info.dart            # Connectivity check
│   └── utils/
│       ├── date_formatter.dart
│       └── validators.dart
├── features/
│   └── events/
│       ├── data/
│       │   ├── models/
│       │   │   ├── event_model.dart
│       │   │   ├── event_rsvp_model.dart
│       │   │   └── subgroup_model.dart
│       │   ├── datasources/
│       │   │   └── event_remote_datasource.dart
│       │   └── repositories/
│       │       └── event_repository_impl.dart
│       ├── domain/
│       │   ├── entities/
│       │   │   ├── event.dart
│       │   │   ├── event_rsvp.dart
│       │   │   └── finding_friends_subgroup.dart
│       │   ├── repositories/
│       │   │   └── event_repository.dart
│       │   └── usecases/
│       │       ├── get_events.dart
│       │       ├── get_event_details.dart
│       │       ├── create_rsvp.dart
│       │       ├── update_rsvp.dart
│       │       ├── cancel_rsvp.dart
│       │       └── check_eligibility.dart
│       └── presentation/
│           ├── providers/
│           │   ├── events_provider.dart
│           │   ├── event_details_provider.dart
│           │   ├── rsvp_provider.dart
│           │   └── rsvp_form_provider.dart
│           ├── pages/
│           │   ├── events_list_page.dart
│           │   ├── event_details_page.dart
│           │   ├── rsvp_form_page.dart
│           │   └── my_rsvps_page.dart
│           └── widgets/
│               ├── event_card.dart
│               ├── rsvp_form.dart
│               ├── waitlist_banner.dart
│               ├── priority_badge.dart
│               └── guest_form.dart
└── providers.dart                        # Global providers
```

## Dependencies (pubspec.yaml)

```yaml
dependencies:
  flutter:
    sdk: flutter

  # State Management
  flutter_riverpod: ^2.5.1
  riverpod_annotation: ^2.3.5

  # GraphQL
  graphql_flutter: ^5.1.2

  # Functional Programming
  dartz: ^0.10.1
  freezed_annotation: ^2.4.1

  # Network
  connectivity_plus: ^5.0.1

  # Storage
  shared_preferences: ^2.2.2

  # UI
  intl: ^0.18.1
  cached_network_image: ^3.3.0
  shimmer: ^3.0.0
  flutter_svg: ^2.0.9

  # Calendar
  table_calendar: ^3.0.9
  add_2_calendar: ^3.0.1

  # Utils
  uuid: ^4.2.1

dev_dependencies:
  flutter_test:
    sdk: flutter

  # Code Generation
  build_runner: ^2.4.6
  riverpod_generator: ^2.4.0
  riverpod_lint: ^2.3.10
  freezed: ^2.4.7
  json_serializable: ^6.7.1

  # Testing
  mockito: ^5.4.4
```

## GraphQL Schema Reference

Complete GraphQL schema for the Event RSVP feature:

```graphql
# ============================================
# QUERIES
# ============================================

type Query {
  # Get all events with filtering and pagination
  events(
    clubId: ID!
    filters: EventFilters
    pagination: PaginationInput
  ): EventsConnection!

  # Get single event details
  event(id: ID!): Event!

  # Get member's RSVPs
  myRSVPs(
    clubId: ID!
    status: [RSVPStatus!]
    pagination: PaginationInput
  ): RSVPsConnection!

  # Get Finding Friends subgroups
  findingFriendsSubgroups(clubId: ID!): [FindingFriendsSubgroup!]!

  # Check RSVP eligibility
  checkRSVPEligibility(
    eventId: ID!
    memberId: ID!
  ): RSVPEligibility!
}

# ============================================
# MUTATIONS
# ============================================

type Mutation {
  # Create RSVP
  createRSVP(input: CreateRSVPInput!): EventRSVP!

  # Update RSVP
  updateRSVP(id: ID!, input: UpdateRSVPInput!): EventRSVP!

  # Cancel RSVP
  cancelRSVP(id: ID!): CancelRSVPResponse!

  # Admin: Verify payment manually
  verifyRSVPPayment(rsvpId: ID!, verified: Boolean!): EventRSVP!

  # Admin: Move from waitlist to confirmed
  promoteFromWaitlist(rsvpId: ID!): EventRSVP!
}

# ============================================
# SUBSCRIPTIONS
# ============================================

type Subscription {
  # Real-time RSVP updates
  rsvpUpdated(eventId: ID!): EventRSVP!

  # Event capacity updates
  eventCapacityUpdated(eventId: ID!): EventCapacityUpdate!

  # Waitlist position updates
  waitlistPositionUpdated(memberId: ID!): WaitlistUpdate!
}

# ============================================
# TYPES
# ============================================

type Event {
  id: ID!
  clubId: ID!
  title: String!
  description: String!
  eventType: EventType!
  startTime: DateTime!
  endTime: DateTime!
  location: String!
  imageUrl: String

  capacity: Int
  currentAttendees: Int!
  availableSpots: Int!

  guestPolicy: GuestPolicy!
  maxGuestsPerMember: Int
  requiresApproval: Boolean!
  requiresPayment: Boolean!
  price: Float

  cancellationDeadline: DateTime
  freeCancellationDays: Int
  cancellationFeePercentage: Float

  allowsSubgroupPriority: Boolean!
  fullHouseExclusive: Boolean!

  rsvpDeadline: DateTime

  createdAt: DateTime!
  updatedAt: DateTime!
}

type EventRSVP {
  id: ID!
  eventId: ID!
  memberId: ID!
  clubId: ID!

  response: RSVPResponse!
  rsvpType: RSVPType!
  priority: Int!

  attendanceCount: Int!
  guestNames: [String!]
  dietaryRestrictions: [String!]
  seatingPreferences: String
  specialRequests: String

  status: RSVPStatus!

  paymentRequired: Boolean!
  paymentVerified: Boolean!
  paymentAmount: Float

  cancellationFee: Float
  feeWaived: Boolean!

  waitlistPosition: Int

  rsvpedAt: DateTime!
  updatedAt: DateTime!

  # Computed fields
  canCancel: Boolean!
  canModify: Boolean!
  cancellationDeadline: DateTime
}

type FindingFriendsSubgroup {
  id: ID!
  clubId: ID!
  name: String!
  description: String
  memberCount: Int!
  isActive: Boolean!
}

type RSVPEligibility {
  eligible: Boolean!
  reason: String
  memberInGoodStanding: Boolean!
  hasOutstandingDebt: Boolean!
  debtAmount: Float
  wouldBeWaitlisted: Boolean!
  estimatedWaitlistPosition: Int
  availableSpots: Int!
  priority: Int!
}

type CancelRSVPResponse {
  success: Boolean!
  message: String!
  cancellationFee: Float
  refundAmount: Float
  feeWaived: Boolean!
}

type EventCapacityUpdate {
  eventId: ID!
  availableSpots: Int!
  currentAttendees: Int!
  waitlistCount: Int!
}

type WaitlistUpdate {
  rsvpId: ID!
  eventId: ID!
  newPosition: Int!
  promoted: Boolean!
}

# ============================================
# INPUTS
# ============================================

input CreateRSVPInput {
  eventId: ID!
  memberId: ID!
  clubId: ID!
  response: RSVPResponse!
  subgroupId: ID
  attendanceCount: Int!
  guestNames: [String!]
  dietaryRestrictions: [String!]
  seatingPreferences: String
  specialRequests: String
}

input UpdateRSVPInput {
  response: RSVPResponse
  attendanceCount: Int
  guestNames: [String!]
  dietaryRestrictions: [String!]
  seatingPreferences: String
  specialRequests: String
}

input EventFilters {
  eventType: [EventType!]
  startDate: DateTime
  endDate: DateTime
  requiresPayment: Boolean
  hasAvailableSpots: Boolean
  search: String
}

input PaginationInput {
  page: Int!
  pageSize: Int!
}

# ============================================
# ENUMS
# ============================================

enum RSVPResponse {
  YES
  MAYBE
  NO
}

enum RSVPType {
  PRIMARY      # Home club member
  RECIPROCAL   # Visiting reciprocal member
  SUBGROUP     # Finding Friends subgroup member
}

enum RSVPStatus {
  CONFIRMED
  TENTATIVE
  PENDING_APPROVAL
  WAITLIST
  CANCELLED
}

enum EventType {
  SOCIAL
  DINING
  SPORTS
  CULTURAL
  EDUCATIONAL
  NETWORKING
  FAMILY
  SPECIAL
}

enum GuestPolicy {
  NO_GUESTS
  MEMBERS_ONLY
  MALE_GUESTS_ONLY
  FEMALE_GUESTS_ONLY
  FRIENDS_AND_FAMILY
}

# ============================================
# PAGINATION
# ============================================

type EventsConnection {
  edges: [EventEdge!]!
  pageInfo: PageInfo!
  totalCount: Int!
}

type EventEdge {
  node: Event!
  cursor: String!
}

type RSVPsConnection {
  edges: [RSVPEdge!]!
  pageInfo: PageInfo!
  totalCount: Int!
}

type RSVPEdge {
  node: EventRSVP!
  cursor: String!
}

type PageInfo {
  hasNextPage: Boolean!
  hasPreviousPage: Boolean!
  startCursor: String
  endCursor: String
}

scalar DateTime
```

## Screen Designs

### 1. Events List Screen

**Features**:
- Calendar view showing events
- List view with filters
- Search functionality
- Filter by event type, payment requirement, availability
- Pull-to-refresh
- Infinite scroll pagination

**Key Widgets**:
- `EventCard` - Shows event summary with availability badge
- `FilterChips` - Event type filters
- `CalendarView` - Monthly calendar with event dots
- `SearchBar` - Search events by title/description

### 2. Event Details Screen

**Features**:
- Full event information
- Capacity indicator (visual progress bar)
- RSVP button with eligibility check
- Existing RSVP status (if user already RSVPed)
- Guest policy display
- Payment information (if applicable)
- Cancellation terms
- Location map preview

**Key Widgets**:
- `EventHeader` - Image, title, date/time
- `CapacityIndicator` - Progress bar with counts
- `RSVPButton` - Smart button that shows eligibility state
- `PriorityBadge` - Shows user's priority level
- `WaitlistBanner` - Shows if user is on waitlist

### 3. RSVP Form Screen

**Features**:
- Response selection (Yes/Maybe/No)
- Attendance count selector
- Guest names input (if applicable)
- Dietary restrictions multi-select
- Seating preferences
- Special requests text field
- Finding Friends subgroup selection (priority boost)
- Payment acknowledgment (if required)
- Eligibility warnings
- Submission with loading state

**Key Widgets**:
- `RSVPResponseSelector` - Yes/Maybe/No toggle
- `AttendanceCounter` - Stepper for guests
- `GuestNamesList` - Dynamic list of text fields
- `DietaryRestrictionsPicker` - Multi-select chips
- `SubgroupSelector` - Dropdown for Finding Friends groups
- `PaymentAcknowledgment` - Checkbox for payment terms
- `EligibilityCard` - Shows waitlist warning if applicable

### 4. My RSVPs Screen

**Features**:
- List of user's RSVPs (upcoming, past)
- Filter by status (confirmed, waitlist, cancelled)
- Quick actions (view details, cancel)
- Waitlist position indicator
- Payment status badges
- Calendar export button (.ics download)

**Key Widgets**:
- `RSVPCard` - Summary card with status badge
- `StatusBadge` - Color-coded status indicator
- `WaitlistPositionChip` - Shows position in queue
- `QuickActions` - Cancel, modify, export buttons

## State Management with Riverpod

### Events Provider

**Events List State**:
```dart
// lib/features/events/presentation/providers/events_provider.dart

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/event.dart';
import '../../domain/usecases/get_events.dart';

part 'events_provider.g.dart';

@riverpod
class EventsList extends _$EventsList {
  int _currentPage = 1;
  List<Event> _allEvents = [];
  bool _hasMorePages = true;

  @override
  FutureOr<List<Event>> build(String clubId) async {
    _currentPage = 1;
    _allEvents = [];
    return _fetchEvents();
  }

  Future<List<Event>> _fetchEvents() async {
    final getEvents = ref.read(getEventsUseCaseProvider);
    final result = await getEvents(GetEventsParams(
      clubId: clubId,
      page: _currentPage,
    ));

    return result.fold(
      (failure) => throw Exception(failure.message),
      (eventsConnection) {
        final newEvents = eventsConnection.events;
        _allEvents.addAll(newEvents);
        _hasMorePages = eventsConnection.pageInfo.hasNextPage;
        return List.unmodifiable(_allEvents);
      },
    );
  }

  Future<void> loadMore() async {
    if (!_hasMorePages) return;

    state = const AsyncValue.loading();
    _currentPage++;

    state = await AsyncValue.guard(() => _fetchEvents());
  }

  Future<void> refresh() async {
    _currentPage = 1;
    _allEvents = [];
    _hasMorePages = true;

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchEvents());
  }

  Future<void> search(String query) async {
    // Implement search logic
    state = const AsyncValue.loading();
    // ... search implementation
  }
}
```

**Event Details Provider**:
```dart
// lib/features/events/presentation/providers/event_details_provider.dart

import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/event.dart';
import '../../domain/entities/event_rsvp.dart';
import '../../domain/usecases/get_event_details.dart';
import '../../domain/usecases/check_eligibility.dart';

part 'event_details_provider.g.dart';

class EventDetailsState {
  final Event event;
  final RSVPEligibility? eligibility;
  final EventRSVP? existingRSVP;

  const EventDetailsState({
    required this.event,
    this.eligibility,
    this.existingRSVP,
  });

  EventDetailsState copyWith({
    Event? event,
    RSVPEligibility? eligibility,
    EventRSVP? existingRSVP,
  }) {
    return EventDetailsState(
      event: event ?? this.event,
      eligibility: eligibility ?? this.eligibility,
      existingRSVP: existingRSVP ?? this.existingRSVP,
    );
  }
}

@riverpod
class EventDetails extends _$EventDetails {
  @override
  FutureOr<EventDetailsState> build(String eventId, String memberId) async {
    final getEventDetails = ref.read(getEventDetailsUseCaseProvider);
    final checkEligibility = ref.read(checkEligibilityUseCaseProvider);

    final eventResult = await getEventDetails(eventId);
    final event = eventResult.fold(
      (failure) => throw Exception(failure.message),
      (event) => event,
    );

    final eligibilityResult = await checkEligibility(
      CheckEligibilityParams(eventId: eventId, memberId: memberId),
    );
    final eligibility = eligibilityResult.fold(
      (failure) => null,
      (eligibility) => eligibility,
    );

    return EventDetailsState(
      event: event,
      eligibility: eligibility,
    );
  }

  Future<void> reload() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => build(eventId, memberId));
  }
}
```

### RSVP Provider

**RSVP Submit State**:
```dart
// lib/features/events/presentation/providers/rsvp_provider.dart

import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/event_rsvp.dart';
import '../../domain/usecases/create_rsvp.dart';
import '../../domain/usecases/update_rsvp.dart';
import '../../domain/usecases/cancel_rsvp.dart';

part 'rsvp_provider.g.dart';

class CancelRSVPResponse {
  final bool success;
  final String message;
  final double? cancellationFee;
  final double? refundAmount;
  final bool feeWaived;

  const CancelRSVPResponse({
    required this.success,
    required this.message,
    this.cancellationFee,
    this.refundAmount,
    required this.feeWaived,
  });
}

@riverpod
class RSVPSubmit extends _$RSVPSubmit {
  @override
  FutureOr<EventRSVP?> build() {
    return null;
  }

  Future<void> create(Map<String, dynamic> input) async {
    state = const AsyncValue.loading();

    final createRSVP = ref.read(createRSVPUseCaseProvider);
    state = await AsyncValue.guard(() async {
      final result = await createRSVP(CreateRSVPParams(input: input));
      return result.fold(
        (failure) => throw Exception(failure.message),
        (rsvp) => rsvp,
      );
    });
  }

  Future<void> update(String rsvpId, Map<String, dynamic> input) async {
    state = const AsyncValue.loading();

    final updateRSVP = ref.read(updateRSVPUseCaseProvider);
    state = await AsyncValue.guard(() async {
      final result = await updateRSVP(
        UpdateRSVPParams(rsvpId: rsvpId, input: input),
      );
      return result.fold(
        (failure) => throw Exception(failure.message),
        (rsvp) => rsvp,
      );
    });
  }

  Future<CancelRSVPResponse> cancel(String rsvpId) async {
    final cancelRSVP = ref.read(cancelRSVPUseCaseProvider);
    final result = await cancelRSVP(CancelRSVPParams(rsvpId: rsvpId));

    return result.fold(
      (failure) => throw Exception(failure.message),
      (response) => response,
    );
  }
}

@riverpod
class MyRSVPs extends _$MyRSVPs {
  @override
  FutureOr<List<EventRSVP>> build(String clubId, {List<String>? statusFilter}) async {
    final getMyRSVPs = ref.read(getMyRSVPsUseCaseProvider);
    final result = await getMyRSVPs(
      GetMyRSVPsParams(clubId: clubId, statusFilter: statusFilter),
    );

    return result.fold(
      (failure) => throw Exception(failure.message),
      (rsvpsConnection) => rsvpsConnection.rsvps,
    );
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => build(clubId, statusFilter: statusFilter));
  }
}
```

### Provider Dependencies

```dart
// lib/providers.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'core/config/graphql_config.dart';
import 'features/events/data/datasources/event_remote_datasource.dart';
import 'features/events/data/repositories/event_repository_impl.dart';
import 'features/events/domain/repositories/event_repository.dart';
import 'features/events/domain/usecases/get_events.dart';
import 'features/events/domain/usecases/get_event_details.dart';
import 'features/events/domain/usecases/create_rsvp.dart';
import 'features/events/domain/usecases/update_rsvp.dart';
import 'features/events/domain/usecases/cancel_rsvp.dart';
import 'features/events/domain/usecases/check_eligibility.dart';

// GraphQL Client
final graphQLClientProvider = Provider<ValueNotifier<GraphQLClient>>((ref) {
  return GraphQLConfig.initializeClient();
});

// Data Sources
final eventRemoteDataSourceProvider = Provider<EventRemoteDataSource>((ref) {
  final client = ref.watch(graphQLClientProvider).value;
  return EventRemoteDataSourceImpl(client: client);
});

// Repositories
final eventRepositoryProvider = Provider<EventRepository>((ref) {
  final remoteDataSource = ref.watch(eventRemoteDataSourceProvider);
  return EventRepositoryImpl(remoteDataSource: remoteDataSource);
});

// Use Cases
final getEventsUseCaseProvider = Provider<GetEvents>((ref) {
  final repository = ref.watch(eventRepositoryProvider);
  return GetEvents(repository);
});

final getEventDetailsUseCaseProvider = Provider<GetEventDetails>((ref) {
  final repository = ref.watch(eventRepositoryProvider);
  return GetEventDetails(repository);
});

final createRSVPUseCaseProvider = Provider<CreateRSVP>((ref) {
  final repository = ref.watch(eventRepositoryProvider);
  return CreateRSVP(repository);
});

final updateRSVPUseCaseProvider = Provider<UpdateRSVP>((ref) {
  final repository = ref.watch(eventRepositoryProvider);
  return UpdateRSVP(repository);
});

final cancelRSVPUseCaseProvider = Provider<CancelRSVP>((ref) {
  final repository = ref.watch(eventRepositoryProvider);
  return CancelRSVP(repository);
});

final checkEligibilityUseCaseProvider = Provider<CheckEligibility>((ref) {
  final repository = ref.watch(eventRepositoryProvider);
  return CheckEligibility(repository);
});

final getMyRSVPsUseCaseProvider = Provider<GetMyRSVPs>((ref) {
  final repository = ref.watch(eventRepositoryProvider);
  return GetMyRSVPs(repository);
});
```

## Complete Code Examples

### 1. GraphQL Client Setup

```dart
// lib/core/config/graphql_config.dart

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter/foundation.dart';

class GraphQLConfig {
  static const String _apiUrl = 'http://192.168.0.170:8080/graphql';
  static const String _wsUrl = 'ws://192.168.0.170:8080/graphql';

  static HttpLink httpLink = HttpLink(_apiUrl);

  static WebSocketLink websocketLink = WebSocketLink(
    _wsUrl,
    config: SocketClientConfig(
      autoReconnect: true,
      inactivityTimeout: const Duration(seconds: 30),
    ),
  );

  static AuthLink authLink = AuthLink(
    getToken: () async {
      // Get JWT token from secure storage
      final token = await _getAuthToken();
      return token != null ? 'Bearer $token' : null;
    },
  );

  static Link link = authLink.concat(httpLink).concat(websocketLink);

  static ValueNotifier<GraphQLClient> initializeClient() {
    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        link: link,
        cache: GraphQLCache(store: InMemoryStore()),
      ),
    );
    return client;
  }

  static Future<String?> _getAuthToken() async {
    // TODO: Implement token retrieval from secure storage
    return null;
  }
}
```

### 2. Event Entity

```dart
// lib/features/events/domain/entities/event.dart

import 'package:equatable/equatable.dart';

class Event extends Equatable {
  final String id;
  final String clubId;
  final String title;
  final String description;
  final EventType eventType;
  final DateTime startTime;
  final DateTime endTime;
  final String location;
  final String? imageUrl;

  final int? capacity;
  final int currentAttendees;
  final int availableSpots;

  final GuestPolicy guestPolicy;
  final int? maxGuestsPerMember;
  final bool requiresApproval;
  final bool requiresPayment;
  final double? price;

  final DateTime? cancellationDeadline;
  final int? freeCancellationDays;
  final double? cancellationFeePercentage;

  final bool allowsSubgroupPriority;
  final bool fullHouseExclusive;

  final DateTime? rsvpDeadline;

  final DateTime createdAt;
  final DateTime updatedAt;

  const Event({
    required this.id,
    required this.clubId,
    required this.title,
    required this.description,
    required this.eventType,
    required this.startTime,
    required this.endTime,
    required this.location,
    this.imageUrl,
    this.capacity,
    required this.currentAttendees,
    required this.availableSpots,
    required this.guestPolicy,
    this.maxGuestsPerMember,
    required this.requiresApproval,
    required this.requiresPayment,
    this.price,
    this.cancellationDeadline,
    this.freeCancellationDays,
    this.cancellationFeePercentage,
    required this.allowsSubgroupPriority,
    required this.fullHouseExclusive,
    this.rsvpDeadline,
    required this.createdAt,
    required this.updatedAt,
  });

  bool get isFull => availableSpots <= 0;
  bool get acceptsGuests => guestPolicy != GuestPolicy.noGuests;
  bool get isPaid => requiresPayment && price != null && price! > 0;

  @override
  List<Object?> get props => [
    id,
    clubId,
    title,
    description,
    eventType,
    startTime,
    endTime,
    location,
    imageUrl,
    capacity,
    currentAttendees,
    availableSpots,
    guestPolicy,
    maxGuestsPerMember,
    requiresApproval,
    requiresPayment,
    price,
    cancellationDeadline,
    freeCancellationDays,
    cancellationFeePercentage,
    allowsSubgroupPriority,
    fullHouseExclusive,
    rsvpDeadline,
    createdAt,
    updatedAt,
  ];
}

enum EventType {
  social,
  dining,
  sports,
  cultural,
  educational,
  networking,
  family,
  special,
}

enum GuestPolicy {
  noGuests,
  membersOnly,
  maleGuestsOnly,
  femaleGuestsOnly,
  friendsAndFamily,
}
```

### 3. Event Remote DataSource

```dart
// lib/features/events/data/datasources/event_remote_datasource.dart

import 'package:graphql_flutter/graphql_flutter.dart';
import '../models/event_model.dart';
import '../models/event_rsvp_model.dart';

abstract class EventRemoteDataSource {
  Future<List<EventModel>> getEvents({
    required String clubId,
    Map<String, dynamic>? filters,
    int page = 1,
    int pageSize = 20,
  });

  Future<EventModel> getEventById(String id);

  Future<RSVPEligibilityModel> checkEligibility({
    required String eventId,
    required String memberId,
  });

  Future<EventRSVPModel> createRSVP(Map<String, dynamic> input);

  Future<EventRSVPModel> updateRSVP(String id, Map<String, dynamic> input);

  Future<Map<String, dynamic>> cancelRSVP(String id);

  Future<List<EventRSVPModel>> getMyRSVPs({
    required String clubId,
    List<String>? statusFilter,
    int page = 1,
  });

  Stream<EventRSVPModel> subscribeToRSVPUpdates(String eventId);
}

class EventRemoteDataSourceImpl implements EventRemoteDataSource {
  final GraphQLClient client;

  EventRemoteDataSourceImpl({required this.client});

  @override
  Future<List<EventModel>> getEvents({
    required String clubId,
    Map<String, dynamic>? filters,
    int page = 1,
    int pageSize = 20,
  }) async {
    const String query = r'''
      query GetEvents($clubId: ID!, $filters: EventFilters, $pagination: PaginationInput!) {
        events(clubId: $clubId, filters: $filters, pagination: $pagination) {
          edges {
            node {
              id
              clubId
              title
              description
              eventType
              startTime
              endTime
              location
              imageUrl
              capacity
              currentAttendees
              availableSpots
              guestPolicy
              maxGuestsPerMember
              requiresApproval
              requiresPayment
              price
              cancellationDeadline
              freeCancellationDays
              cancellationFeePercentage
              allowsSubgroupPriority
              fullHouseExclusive
              rsvpDeadline
              createdAt
              updatedAt
            }
          }
          pageInfo {
            hasNextPage
            hasPreviousPage
          }
          totalCount
        }
      }
    ''';

    final QueryOptions options = QueryOptions(
      document: gql(query),
      variables: {
        'clubId': clubId,
        'filters': filters,
        'pagination': {
          'page': page,
          'pageSize': pageSize,
        },
      },
    );

    final QueryResult result = await client.query(options);

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    final List<dynamic> edges = result.data?['events']['edges'] ?? [];
    return edges
        .map((edge) => EventModel.fromJson(edge['node']))
        .toList();
  }

  @override
  Future<EventModel> getEventById(String id) async {
    const String query = r'''
      query GetEvent($id: ID!) {
        event(id: $id) {
          id
          clubId
          title
          description
          eventType
          startTime
          endTime
          location
          imageUrl
          capacity
          currentAttendees
          availableSpots
          guestPolicy
          maxGuestsPerMember
          requiresApproval
          requiresPayment
          price
          cancellationDeadline
          freeCancellationDays
          cancellationFeePercentage
          allowsSubgroupPriority
          fullHouseExclusive
          rsvpDeadline
          createdAt
          updatedAt
        }
      }
    ''';

    final QueryOptions options = QueryOptions(
      document: gql(query),
      variables: {'id': id},
    );

    final QueryResult result = await client.query(options);

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    return EventModel.fromJson(result.data?['event']);
  }

  @override
  Future<RSVPEligibilityModel> checkEligibility({
    required String eventId,
    required String memberId,
  }) async {
    const String query = r'''
      query CheckEligibility($eventId: ID!, $memberId: ID!) {
        checkRSVPEligibility(eventId: $eventId, memberId: $memberId) {
          eligible
          reason
          memberInGoodStanding
          hasOutstandingDebt
          debtAmount
          wouldBeWaitlisted
          estimatedWaitlistPosition
          availableSpots
          priority
        }
      }
    ''';

    final QueryOptions options = QueryOptions(
      document: gql(query),
      variables: {
        'eventId': eventId,
        'memberId': memberId,
      },
    );

    final QueryResult result = await client.query(options);

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    return RSVPEligibilityModel.fromJson(
      result.data?['checkRSVPEligibility'],
    );
  }

  @override
  Future<EventRSVPModel> createRSVP(Map<String, dynamic> input) async {
    const String mutation = r'''
      mutation CreateRSVP($input: CreateRSVPInput!) {
        createRSVP(input: $input) {
          id
          eventId
          memberId
          clubId
          response
          rsvpType
          priority
          attendanceCount
          guestNames
          dietaryRestrictions
          seatingPreferences
          specialRequests
          status
          paymentRequired
          paymentVerified
          paymentAmount
          cancellationFee
          feeWaived
          waitlistPosition
          rsvpedAt
          updatedAt
          canCancel
          canModify
          cancellationDeadline
        }
      }
    ''';

    final MutationOptions options = MutationOptions(
      document: gql(mutation),
      variables: {'input': input},
    );

    final QueryResult result = await client.mutate(options);

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    return EventRSVPModel.fromJson(result.data?['createRSVP']);
  }

  @override
  Future<EventRSVPModel> updateRSVP(String id, Map<String, dynamic> input) async {
    const String mutation = r'''
      mutation UpdateRSVP($id: ID!, $input: UpdateRSVPInput!) {
        updateRSVP(id: $id, input: $input) {
          id
          eventId
          memberId
          clubId
          response
          rsvpType
          priority
          attendanceCount
          guestNames
          dietaryRestrictions
          seatingPreferences
          specialRequests
          status
          paymentRequired
          paymentVerified
          paymentAmount
          cancellationFee
          feeWaived
          waitlistPosition
          rsvpedAt
          updatedAt
          canCancel
          canModify
          cancellationDeadline
        }
      }
    ''';

    final MutationOptions options = MutationOptions(
      document: gql(mutation),
      variables: {
        'id': id,
        'input': input,
      },
    );

    final QueryResult result = await client.mutate(options);

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    return EventRSVPModel.fromJson(result.data?['updateRSVP']);
  }

  @override
  Future<Map<String, dynamic>> cancelRSVP(String id) async {
    const String mutation = r'''
      mutation CancelRSVP($id: ID!) {
        cancelRSVP(id: $id) {
          success
          message
          cancellationFee
          refundAmount
          feeWaived
        }
      }
    ''';

    final MutationOptions options = MutationOptions(
      document: gql(mutation),
      variables: {'id': id},
    );

    final QueryResult result = await client.mutate(options);

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    return result.data?['cancelRSVP'] as Map<String, dynamic>;
  }

  @override
  Future<List<EventRSVPModel>> getMyRSVPs({
    required String clubId,
    List<String>? statusFilter,
    int page = 1,
  }) async {
    const String query = r'''
      query GetMyRSVPs($clubId: ID!, $status: [RSVPStatus!], $pagination: PaginationInput!) {
        myRSVPs(clubId: $clubId, status: $status, pagination: $pagination) {
          edges {
            node {
              id
              eventId
              memberId
              clubId
              response
              rsvpType
              priority
              attendanceCount
              guestNames
              dietaryRestrictions
              seatingPreferences
              specialRequests
              status
              paymentRequired
              paymentVerified
              paymentAmount
              cancellationFee
              feeWaived
              waitlistPosition
              rsvpedAt
              updatedAt
              canCancel
              canModify
              cancellationDeadline
            }
          }
          pageInfo {
            hasNextPage
            hasPreviousPage
          }
        }
      }
    ''';

    final QueryOptions options = QueryOptions(
      document: gql(query),
      variables: {
        'clubId': clubId,
        'status': statusFilter,
        'pagination': {
          'page': page,
          'pageSize': 20,
        },
      },
    );

    final QueryResult result = await client.query(options);

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    final List<dynamic> edges = result.data?['myRSVPs']['edges'] ?? [];
    return edges
        .map((edge) => EventRSVPModel.fromJson(edge['node']))
        .toList();
  }

  @override
  Stream<EventRSVPModel> subscribeToRSVPUpdates(String eventId) {
    const String subscription = r'''
      subscription OnRSVPUpdated($eventId: ID!) {
        rsvpUpdated(eventId: $eventId) {
          id
          eventId
          memberId
          clubId
          response
          rsvpType
          priority
          attendanceCount
          status
          paymentVerified
          waitlistPosition
          updatedAt
        }
      }
    ''';

    final operation = Operation(
      document: gql(subscription),
      variables: {'eventId': eventId},
    );

    return client.subscribe(operation).map((result) {
      if (result.hasException) {
        throw Exception(result.exception.toString());
      }
      return EventRSVPModel.fromJson(result.data?['rsvpUpdated']);
    });
  }
}
```

### 4. Events List Page

```dart
// lib/features/events/presentation/pages/events_list_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/events_provider.dart';
import '../widgets/event_card.dart';

class EventsListPage extends ConsumerStatefulWidget {
  final String clubId;

  const EventsListPage({
    Key? key,
    required this.clubId,
  }) : super(key: key);

  @override
  ConsumerState<EventsListPage> createState() => _EventsListPageState();
}

class _EventsListPageState extends ConsumerState<EventsListPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_isBottom && !_isLoading) {
      ref.read(eventsListProvider(widget.clubId).notifier).loadMore();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  bool get _isLoading {
    final eventsState = ref.read(eventsListProvider(widget.clubId));
    return eventsState.isLoading;
  }

  @override
  Widget build(BuildContext context) {
    final eventsState = ref.watch(eventsListProvider(widget.clubId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Club Events'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: _showFilters,
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: _showSearch,
          ),
        ],
      ),
      body: eventsState.when(
        data: (events) => RefreshIndicator(
          onRefresh: () async {
            await ref.read(eventsListProvider(widget.clubId).notifier).refresh();
          },
          child: events.isEmpty
              ? const Center(child: Text('No events found'))
              : ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.all(16),
                  itemCount: events.length + 1,
                  itemBuilder: (context, index) {
                    if (index >= events.length) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }

                    final event = events[index];
                    return EventCard(
                      event: event,
                      onTap: () => _navigateToDetails(event.id),
                    );
                  },
                ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(error.toString()),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  ref.invalidate(eventsListProvider(widget.clubId));
                },
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showFilters() {
    // TODO: Implement filters bottom sheet
  }

  void _showSearch() {
    // TODO: Implement search delegate
  }

  void _navigateToDetails(String eventId) {
    Navigator.pushNamed(
      context,
      '/event-details',
      arguments: eventId,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
```

### 5. RSVP Form Widget

```dart
// lib/features/events/presentation/widgets/rsvp_form.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/event.dart';
import '../providers/rsvp_provider.dart';

class RSVPForm extends ConsumerStatefulWidget {
  final Event event;
  final String memberId;

  const RSVPForm({
    Key? key,
    required this.event,
    required this.memberId,
  }) : super(key: key);

  @override
  ConsumerState<RSVPForm> createState() => _RSVPFormState();
}

class _RSVPFormState extends ConsumerState<RSVPForm> {
  final _formKey = GlobalKey<FormState>();

  String _response = 'YES';
  int _attendanceCount = 1;
  final List<String> _guestNames = [];
  final List<String> _dietaryRestrictions = [];
  String? _seatingPreferences;
  String? _specialRequests;
  String? _selectedSubgroupId;
  bool _paymentAcknowledged = false;

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<EventRSVP?>>(rsvpSubmitProvider, (previous, next) {
      next.when(
        data: (rsvp) {
          if (rsvp != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  rsvp.status == 'WAITLIST'
                      ? 'You have been added to the waitlist'
                      : 'RSVP confirmed!',
                ),
                backgroundColor: rsvp.status == 'WAITLIST'
                    ? Colors.orange
                    : Colors.green,
              ),
            );
            Navigator.pop(context, true);
          }
        },
        loading: () {},
        error: (error, _) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error.toString()),
              backgroundColor: Colors.red,
            ),
          );
        },
      );
    });

    return Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildResponseSelector(),
              const SizedBox(height: 24),

              if (_response != 'NO') ...[
                _buildAttendanceCounter(),
                const SizedBox(height: 24),

                if (widget.event.acceptsGuests && _attendanceCount > 1) ...[
                  _buildGuestNames(),
                  const SizedBox(height: 24),
                ],

                _buildDietaryRestrictions(),
                const SizedBox(height: 24),

                _buildSeatingPreferences(),
                const SizedBox(height: 24),

                _buildSpecialRequests(),
                const SizedBox(height: 24),

                if (widget.event.allowsSubgroupPriority) ...[
                  _buildSubgroupSelector(),
                  const SizedBox(height: 24),
                ],

                if (widget.event.isPaid) ...[
                  _buildPaymentAcknowledgment(),
                  const SizedBox(height: 24),
                ],
              ],

              _buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResponseSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Your Response',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        SegmentedButton<String>(
          segments: const [
            ButtonSegment(value: 'YES', label: Text('Yes')),
            ButtonSegment(value: 'MAYBE', label: Text('Maybe')),
            ButtonSegment(value: 'NO', label: Text('No')),
          ],
          selected: {_response},
          onSelectionChanged: (Set<String> selected) {
            setState(() {
              _response = selected.first;
            });
          },
        ),
      ],
    );
  }

  Widget _buildAttendanceCounter() {
    final maxGuests = widget.event.maxGuestsPerMember ?? 5;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Number of Attendees',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.remove_circle_outline),
              onPressed: _attendanceCount > 1
                  ? () => setState(() => _attendanceCount--)
                  : null,
            ),
            Text(
              '$_attendanceCount',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            IconButton(
              icon: const Icon(Icons.add_circle_outline),
              onPressed: _attendanceCount < maxGuests
                  ? () => setState(() => _attendanceCount++)
                  : null,
            ),
            const SizedBox(width: 8),
            Text(
              '(including yourself)',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildGuestNames() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Guest Names',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        ...List.generate(
          _attendanceCount - 1,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Guest ${index + 1}',
                border: const OutlineInputBorder(),
              ),
              onChanged: (value) {
                if (_guestNames.length <= index) {
                  _guestNames.add(value);
                } else {
                  _guestNames[index] = value;
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDietaryRestrictions() {
    final restrictions = [
      'Vegetarian',
      'Vegan',
      'Gluten-Free',
      'Dairy-Free',
      'Nut Allergy',
      'Shellfish Allergy',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Dietary Restrictions',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          children: restrictions.map((restriction) {
            final isSelected = _dietaryRestrictions.contains(restriction);
            return FilterChip(
              label: Text(restriction),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    _dietaryRestrictions.add(restriction);
                  } else {
                    _dietaryRestrictions.remove(restriction);
                  }
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildSeatingPreferences() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Seating Preferences',
        hintText: 'e.g., Near window, quiet area',
        border: OutlineInputBorder(),
      ),
      maxLines: 2,
      onChanged: (value) => _seatingPreferences = value,
    );
  }

  Widget _buildSpecialRequests() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Special Requests',
        hintText: 'Any other requests or information',
        border: OutlineInputBorder(),
      ),
      maxLines: 3,
      onChanged: (value) => _specialRequests = value,
    );
  }

  Widget _buildSubgroupSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Finding Friends Subgroup (Priority Boost)',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Select your subgroup',
          ),
          value: _selectedSubgroupId,
          items: const [
            // TODO: Load from subgroups query
            DropdownMenuItem(value: '1', child: Text('Vinna Vänner - Golf')),
            DropdownMenuItem(value: '2', child: Text('Vinna Vänner - Tennis')),
          ],
          onChanged: (value) {
            setState(() {
              _selectedSubgroupId = value;
            });
          },
        ),
      ],
    );
  }

  Widget _buildPaymentAcknowledgment() {
    return Card(
      color: Colors.orange[50],
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.payment, color: Colors.orange),
                const SizedBox(width: 8),
                Text(
                  'Payment Required: \$${widget.event.price?.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              'Please arrange payment with the club staff. Your RSVP will be confirmed once payment is verified.',
            ),
            const SizedBox(height: 12),
            CheckboxListTile(
              value: _paymentAcknowledged,
              onChanged: (value) {
                setState(() {
                  _paymentAcknowledged = value ?? false;
                });
              },
              title: const Text('I acknowledge the payment requirement'),
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    final rsvpState = ref.watch(rsvpSubmitProvider);

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: rsvpState.isLoading ? null : _submitRSVP,
        child: rsvpState.isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : const Text('Submit RSVP'),
      ),
    );
  }

  Future<void> _submitRSVP() async {
    if (_formKey.currentState!.validate()) {
      if (widget.event.isPaid && !_paymentAcknowledged) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please acknowledge the payment requirement'),
            backgroundColor: Colors.orange,
          ),
        );
        return;
      }

      final input = {
        'eventId': widget.event.id,
        'memberId': widget.memberId,
        'clubId': widget.event.clubId,
        'response': _response,
        'attendanceCount': _attendanceCount,
        if (_guestNames.isNotEmpty) 'guestNames': _guestNames,
        if (_dietaryRestrictions.isNotEmpty)
          'dietaryRestrictions': _dietaryRestrictions,
        if (_seatingPreferences != null)
          'seatingPreferences': _seatingPreferences,
        if (_specialRequests != null) 'specialRequests': _specialRequests,
        if (_selectedSubgroupId != null) 'subgroupId': _selectedSubgroupId,
      };

      await ref.read(rsvpSubmitProvider.notifier).create(input);
    }
  }
}
```

## Real-Time Subscriptions Implementation

### Subscription Manager

```dart
// lib/features/events/data/datasources/rsvp_subscription_manager.dart

import 'dart:async';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../models/event_rsvp_model.dart';

class RSVPSubscriptionManager {
  final GraphQLClient client;
  final Map<String, StreamSubscription> _activeSubscriptions = {};

  RSVPSubscriptionManager({required this.client});

  Stream<EventRSVPModel> subscribeToRSVPUpdates(String eventId) {
    const String subscription = r'''
      subscription OnRSVPUpdated($eventId: ID!) {
        rsvpUpdated(eventId: $eventId) {
          id
          eventId
          memberId
          response
          status
          waitlistPosition
          paymentVerified
          updatedAt
        }
      }
    ''';

    final operation = Operation(
      document: gql(subscription),
      variables: {'eventId': eventId},
    );

    return client.subscribe(operation).map((result) {
      if (result.hasException) {
        throw Exception(result.exception.toString());
      }
      return EventRSVPModel.fromJson(result.data?['rsvpUpdated']);
    });
  }

  Stream<Map<String, dynamic>> subscribeToCapacityUpdates(String eventId) {
    const String subscription = r'''
      subscription OnCapacityUpdated($eventId: ID!) {
        eventCapacityUpdated(eventId: $eventId) {
          eventId
          availableSpots
          currentAttendees
          waitlistCount
        }
      }
    ''';

    final operation = Operation(
      document: gql(subscription),
      variables: {'eventId': eventId},
    );

    return client.subscribe(operation).map((result) {
      if (result.hasException) {
        throw Exception(result.exception.toString());
      }
      return result.data?['eventCapacityUpdated'] as Map<String, dynamic>;
    });
  }

  Stream<Map<String, dynamic>> subscribeToWaitlistUpdates(String memberId) {
    const String subscription = r'''
      subscription OnWaitlistUpdated($memberId: ID!) {
        waitlistPositionUpdated(memberId: $memberId) {
          rsvpId
          eventId
          newPosition
          promoted
        }
      }
    ''';

    final operation = Operation(
      document: gql(subscription),
      variables: {'memberId': memberId},
    );

    return client.subscribe(operation).map((result) {
      if (result.hasException) {
        throw Exception(result.exception.toString());
      }
      return result.data?['waitlistPositionUpdated'] as Map<String, dynamic>;
    });
  }

  void dispose() {
    for (final subscription in _activeSubscriptions.values) {
      subscription.cancel();
    }
    _activeSubscriptions.clear();
  }
}
```

## Implementation Timeline

### Phase 1: Project Setup (Day 1 - Morning)
**Duration**: 3-4 hours

1. Create Flutter project structure
2. Add dependencies to `pubspec.yaml`
3. Configure GraphQL client with authentication
4. Set up dependency injection with GetIt
5. Create base folder structure (core, features)
6. Configure environment variables

**Deliverables**:
- Project compiles successfully
- GraphQL client connects to backend (health check query)
- Dependency injection working

### Phase 2: Domain & Data Layers (Day 1 - Afternoon + Day 2 - Morning)
**Duration**: 6-8 hours

1. Create domain entities (Event, EventRSVP, FindingFriendsSubgroup)
2. Create domain repositories (interfaces)
3. Implement data models with JSON serialization
4. Implement remote data sources with GraphQL queries/mutations
5. Implement repository implementations
6. Create use cases for all operations
7. Write unit tests for repositories and use cases

**Deliverables**:
- All domain entities created
- All data models with JSON parsing
- Complete GraphQL integration
- Repository tests passing

### Phase 3: State Management (Day 2 - Afternoon)
**Duration**: 4-5 hours

1. Create Events Providers (EventsList, EventDetails)
2. Create RSVP Providers (RSVPSubmit, MyRSVPs)
3. Implement subscription handling in providers
4. Set up provider dependencies and overrides
5. Write provider tests

**Deliverables**:
- Events providers complete with pagination
- RSVP providers complete with form handling
- Real-time updates working
- Provider tests passing

### Phase 4: UI Implementation (Day 3 - Full Day)
**Duration**: 8 hours

1. Create Events List Page with infinite scroll
2. Create Event Details Page with eligibility check
3. Create RSVP Form Page with validation
4. Create My RSVPs Page
5. Create all reusable widgets (EventCard, RSVPForm, badges, etc.)
6. Implement navigation
7. Add loading states and error handling

**Deliverables**:
- All 4 main screens complete
- Navigation working
- Forms with validation
- Loading and error states

### Phase 5: Real-Time Features (Day 4 - Morning)
**Duration**: 3-4 hours

1. Implement GraphQL subscriptions
2. Add real-time RSVP updates to Event Details
3. Add real-time capacity updates
4. Add waitlist position notifications
5. Test subscription reconnection logic

**Deliverables**:
- Real-time updates working
- Subscription manager complete
- Reconnection logic tested

### Phase 6: Polish & Testing (Day 4 - Afternoon)
**Duration**: 4 hours

1. Add pull-to-refresh on all lists
2. Add shimmer loading states
3. Implement calendar export (.ics file)
4. Add error retry mechanisms
5. Write widget tests for critical UI
6. Integration testing
7. Fix bugs and edge cases

**Deliverables**:
- Polished UI with animations
- Calendar integration
- Comprehensive error handling
- Tests passing

### Phase 7: Documentation & Handoff (Final)
**Duration**: 2 hours

1. Create README for Flutter app
2. Document API integration
3. Create developer setup guide
4. Add inline code documentation
5. Create troubleshooting guide

**Deliverables**:
- Complete documentation
- Setup instructions
- API reference
- Troubleshooting guide

## Testing Strategy

### Unit Tests

```dart
// test/features/events/data/repositories/event_repository_impl_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([EventRemoteDataSource])
void main() {
  late EventRepositoryImpl repository;
  late MockEventRemoteDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockEventRemoteDataSource();
    repository = EventRepositoryImpl(remoteDataSource: mockDataSource);
  });

  group('getEvents', () {
    test('should return list of events when datasource call is successful', () async {
      // Arrange
      final mockEvents = [
        EventModel(id: '1', title: 'Test Event', /* ... */),
      ];
      when(mockDataSource.getEvents(clubId: anyNamed('clubId')))
          .thenAnswer((_) async => mockEvents);

      // Act
      final result = await repository.getEvents(clubId: '1');

      // Assert
      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Should not return failure'),
        (events) => expect(events.length, 1),
      );
    });

    test('should return ServerFailure when datasource throws exception', () async {
      // Arrange
      when(mockDataSource.getEvents(clubId: anyNamed('clubId')))
          .thenThrow(Exception('Server error'));

      // Act
      final result = await repository.getEvents(clubId: '1');

      // Assert
      expect(result.isLeft(), true);
    });
  });
}
```

### Widget Tests

```dart
// test/features/events/presentation/widgets/event_card_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('EventCard displays event information correctly', (tester) async {
    // Arrange
    final event = Event(
      id: '1',
      title: 'Test Event',
      startTime: DateTime(2025, 11, 15, 18, 0),
      availableSpots: 10,
      // ... other fields
    );

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: EventCard(event: event),
        ),
      ),
    );

    // Assert
    expect(find.text('Test Event'), findsOneWidget);
    expect(find.text('10 spots available'), findsOneWidget);
  });
}
```

### Provider Tests

```dart
// test/features/events/presentation/providers/events_provider_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mockito/mockito.dart';

void main() {
  late ProviderContainer container;
  late MockGetEvents mockGetEvents;

  setUp(() {
    mockGetEvents = MockGetEvents();
    container = ProviderContainer(
      overrides: [
        getEventsUseCaseProvider.overrideWithValue(mockGetEvents),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  test('EventsList provider fetches events successfully', () async {
    // Arrange
    final mockEvents = [
      Event(id: '1', title: 'Test Event', /* ... */),
    ];
    when(mockGetEvents(any)).thenAnswer(
      (_) async => Right(EventsConnection(events: mockEvents)),
    );

    // Act
    final provider = eventsListProvider('club-1');
    final state = await container.read(provider.future);

    // Assert
    expect(state, mockEvents);
    verify(mockGetEvents(any)).called(1);
  });

  test('EventsList provider handles errors', () async {
    // Arrange
    when(mockGetEvents(any)).thenAnswer(
      (_) async => Left(ServerFailure('Server error')),
    );

    // Act
    final provider = eventsListProvider('club-1');
    final state = container.read(provider);

    // Assert
    expect(state.hasError, true);
  });

  test('EventsList provider loads more events', () async {
    // Arrange
    final mockEvents = [
      Event(id: '1', title: 'Event 1'),
      Event(id: '2', title: 'Event 2'),
    ];
    when(mockGetEvents(any)).thenAnswer(
      (_) async => Right(EventsConnection(events: mockEvents)),
    );

    // Act
    final provider = eventsListProvider('club-1');
    await container.read(provider.future);

    // Load more
    await container.read(provider.notifier).loadMore();

    // Assert
    verify(mockGetEvents(any)).called(2);
  });
}
```

## UI/UX Design Guidelines

### Material Design 3 Theme

```dart
// lib/core/theme/app_theme.dart

import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF1976D2), // Club blue
      brightness: Brightness.light,
    ),
    cardTheme: CardTheme(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  );
}
```

### Status Colors

```dart
class RSVPStatusColors {
  static const confirmed = Color(0xFF4CAF50);    // Green
  static const tentative = Color(0xFFFF9800);    // Orange
  static const waitlist = Color(0xFFFF5722);     // Deep Orange
  static const cancelled = Color(0xFF9E9E9E);    // Grey
  static const pendingApproval = Color(0xFF2196F3); // Blue
}

class PriorityColors {
  static const subgroup = Color(0xFFFF6B00);     // High priority - Orange
  static const home = Color(0xFF1976D2);         // Medium - Blue
  static const reciprocal = Color(0xFF757575);   // Lower - Grey
}
```

### Typography

```dart
class AppTypography {
  static const eventTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.15,
  );

  static const eventSubtitle = TextStyle(
    fontSize: 14,
    color: Colors.grey,
    letterSpacing: 0.1,
  );

  static const cardTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const body = TextStyle(
    fontSize: 14,
    letterSpacing: 0.25,
  );

  static const caption = TextStyle(
    fontSize: 12,
    color: Colors.grey,
    letterSpacing: 0.4,
  );
}
```

## Error Handling

### Error Types

```dart
// lib/core/error/failures.dart

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);

  @override
  List<Object> get props => [message];
}

class NetworkFailure extends Failure {
  const NetworkFailure() : super('No internet connection');

  @override
  List<Object> get props => [];
}

class ValidationFailure extends Failure {
  const ValidationFailure(String message) : super(message);

  @override
  List<Object> get props => [message];
}

class AuthFailure extends Failure {
  const AuthFailure() : super('Authentication failed');

  @override
  List<Object> get props => [];
}
```

### Error UI Components

```dart
// lib/core/widgets/error_view.dart

class ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;

  const ErrorView({
    Key? key,
    required this.message,
    this.onRetry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red[300],
            ),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: const Text('Retry'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
```

## API Contract Summary

**Base URL**: `http://192.168.0.170:8080/graphql`
**WebSocket URL**: `ws://192.168.0.170:8080/graphql`

**Authentication**: Bearer token in Authorization header

**Key Queries**:
- `events(clubId, filters, pagination)` - Get events list
- `event(id)` - Get single event
- `myRSVPs(clubId, status, pagination)` - Get member's RSVPs
- `checkRSVPEligibility(eventId, memberId)` - Check if member can RSVP

**Key Mutations**:
- `createRSVP(input)` - Create new RSVP
- `updateRSVP(id, input)` - Update existing RSVP
- `cancelRSVP(id)` - Cancel RSVP with fee calculation

**Key Subscriptions**:
- `rsvpUpdated(eventId)` - Real-time RSVP updates
- `eventCapacityUpdated(eventId)` - Real-time capacity changes
- `waitlistPositionUpdated(memberId)` - Waitlist position notifications

## Development Environment Setup

```bash
# 1. Clone repository (frontend repo)
git clone <flutter-repo-url>
cd reciprocal-clubs-flutter

# 2. Install dependencies
flutter pub get

# 3. Generate code (if using code generation)
flutter pub run build_runner build --delete-conflicting-outputs

# 4. Configure environment
cp .env.example .env
# Edit .env with:
# GRAPHQL_ENDPOINT=http://192.168.0.170:8080/graphql
# WS_ENDPOINT=ws://192.168.0.170:8080/graphql

# 5. Run app
flutter run

# 6. Run tests
flutter test

# 7. Run integration tests
flutter drive --target=test_driver/app.dart
```

## Troubleshooting Common Issues

### GraphQL Connection Issues
**Problem**: "Failed to connect to GraphQL endpoint"
**Solution**:
- Verify backend is running: `curl http://192.168.0.170:8080/health`
- Check network connectivity
- Ensure API endpoint in `.env` is correct

### Authentication Errors
**Problem**: "Authentication failed" or 401 errors
**Solution**:
- Verify JWT token is valid and not expired
- Check token is being sent in Authorization header
- Test token with Postman/curl first

### Subscription Not Working
**Problem**: Real-time updates not appearing
**Solution**:
- Verify WebSocket connection is established
- Check network allows WebSocket traffic
- Test subscription in GraphQL Playground first
- Ensure subscription reconnection logic is working

### Build Errors
**Problem**: "Undefined name" or import errors
**Solution**:
- Run `flutter pub get`
- Run `flutter pub run build_runner build --delete-conflicting-outputs`
- Clean and rebuild: `flutter clean && flutter pub get`

---

# End of Flutter Implementation Guide

This Flutter implementation guide is self-contained and can be copy-pasted to another AI for parallel frontend development. All necessary API specifications, data models, code examples, and implementation steps are included.

**Backend Implementation**: See sections above (before this Flutter guide)
**Frontend Implementation**: This Flutter guide (can be extracted and used independently)

---

**Document Version**: 2.0 (Refined + Flutter Guide)
**Created**: 2025-11-05
**Updated**: 2025-11-05
**Status**: Ready for Implementation 🚀
