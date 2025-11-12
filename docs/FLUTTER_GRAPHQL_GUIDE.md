# Flutter GraphQL Guide - Complete Reference

**Version**: 1.0
**Last Updated**: November 12, 2025
**Status**: Production Ready

This comprehensive guide covers all Flutter-specific GraphQL patterns, best practices, and integration strategies for the Clubland application.

---

## Table of Contents

1. [Setup & Configuration](#1-setup--configuration)
2. [Query Patterns](#2-query-patterns)
3. [Pagination](#3-pagination)
4. [Code Generation](#4-code-generation)
5. [Error Handling](#5-error-handling)
6. [Riverpod Integration](#6-riverpod-integration)
7. [Best Practices](#7-best-practices)
8. [Common Mistakes](#8-common-mistakes)
9. [Field Mapping Notes](#9-field-mapping-notes)
10. [Real-World Examples](#10-real-world-examples)

---

## 1. Setup & Configuration

### 1.1 GraphQL Client Setup

**Core Dependencies** (from `pubspec.yaml`):
```yaml
dependencies:
  graphql_flutter: ^5.1.2
  flutter_riverpod: ^2.5.1
  riverpod_annotation: ^2.3.5

dev_dependencies:
  build_runner: ^2.4.6
  riverpod_generator: ^2.4.0
  graphql_codegen: ^0.13.0  # For type-safe code generation
```

**GraphQL Client Configuration**:
```dart
// lib/core/graphql/graphql_client.dart

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class GraphQLConfig {
  // Base URLs
  static const String httpUrl = 'http://192.168.0.170:30080/graphql';
  static const String wsUrl = 'ws://192.168.0.170:30080/graphql';

  /// Initialize GraphQL client with authentication
  static ValueNotifier<GraphQLClient> initializeClient() {
    // HTTP Link
    final HttpLink httpLink = HttpLink(httpUrl);

    // WebSocket Link (for subscriptions)
    final WebSocketLink websocketLink = WebSocketLink(
      wsUrl,
      config: const SocketClientConfig(
        autoReconnect: true,
        inactivityTimeout: Duration(seconds: 30),
      ),
    );

    // Authentication Link
    final AuthLink authLink = AuthLink(
      getToken: () async {
        const storage = FlutterSecureStorage();
        final token = await storage.read(key: 'auth_token');
        return token != null ? 'Bearer $token' : null;
      },
    );

    // Combine links: Auth → HTTP/WebSocket
    final Link link = authLink.concat(
      Link.split(
        (request) => request.isSubscription,
        websocketLink,
        httpLink,
      ),
    );

    // Create client with cache
    return ValueNotifier(
      GraphQLClient(
        link: link,
        cache: GraphQLCache(store: InMemoryStore()),
        defaultPolicies: DefaultPolicies(
          query: Policies(
            fetchPolicy: FetchPolicy.cacheFirst,
            errorPolicy: ErrorPolicy.all,
          ),
          mutate: Policies(
            fetchPolicy: FetchPolicy.networkOnly,
            errorPolicy: ErrorPolicy.all,
          ),
          watchQuery: Policies(
            fetchPolicy: FetchPolicy.cacheAndNetwork,
            errorPolicy: ErrorPolicy.all,
          ),
        ),
      ),
    );
  }
}
```

### 1.2 Environment Configuration

**Development vs Production URLs**:
```dart
// lib/core/config/environment.dart

class EnvironmentConfig {
  static const String environment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: 'development',
  );

  static String get graphqlUrl {
    switch (environment) {
      case 'production':
        return 'https://api.clubland.com/graphql';
      case 'staging':
        return 'https://staging-api.clubland.com/graphql';
      default:
        return 'http://192.168.0.170:30080/graphql';
    }
  }

  static String get wsUrl {
    switch (environment) {
      case 'production':
        return 'wss://api.clubland.com/graphql';
      case 'staging':
        return 'wss://staging-api.clubland.com/graphql';
      default:
        return 'ws://192.168.0.170:30080/graphql';
    }
  }
}
```

### 1.3 Health Check

**Test Backend Connectivity**:
```dart
Future<bool> testBackendConnection() async {
  try {
    final dio = Dio();
    final response = await dio.get(
      'http://192.168.0.170:30080/health',
      options: Options(
        sendTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
      ),
    );

    if (response.statusCode == 200 && response.data['status'] == 'healthy') {
      print('✅ Backend connection successful');
      print('Services: ${response.data['services']}');
      return true;
    }
    return false;
  } catch (e) {
    print('❌ Backend connection failed: $e');
    return false;
  }
}
```

---

## 2. Query Patterns

### 2.1 Basic Query Execution

**Simple Query (No Variables)**:
```dart
// Query definition
const String meQuery = r'''
  query Me {
    me {
      id
      email
      firstName
      lastName
      clubId
      roles
    }
  }
''';

// Execution
Future<User?> getCurrentUser(GraphQLClient client) async {
  final result = await client.query(
    QueryOptions(
      document: gql(meQuery),
      fetchPolicy: FetchPolicy.networkOnly,
    ),
  );

  if (result.hasException) {
    throw Exception(result.exception.toString());
  }

  return result.data != null
    ? User.fromJson(result.data!['me'])
    : null;
}
```

**Query with Variables**:
```dart
const String clubQuery = r'''
  query GetClub($id: ID, $slug: String) {
    club(id: $id, slug: $slug) {
      id
      name
      slug
      description
      location
      facilities {
        id
        name
        type
        capacity
      }
    }
  }
''';

// Execution
Future<Club> getClub(GraphQLClient client, String clubId) async {
  final result = await client.query(
    QueryOptions(
      document: gql(clubQuery),
      variables: {'id': clubId},
    ),
  );

  if (result.hasException) {
    throw Exception(result.exception.toString());
  }

  return Club.fromJson(result.data!['club']);
}
```

### 2.2 Mutations

**Create Mutation**:
```dart
const String createBookingMutation = r'''
  mutation CreateBooking($input: CreateBookingInput!) {
    createBooking(input: $input) {
      id
      facilityId
      userId
      startTime
      endTime
      status
      facility {
        name
        type
      }
    }
  }
''';

// Execution
Future<Booking> createBooking(
  GraphQLClient client,
  Map<String, dynamic> input,
) async {
  final result = await client.mutate(
    MutationOptions(
      document: gql(createBookingMutation),
      variables: {'input': input},
    ),
  );

  if (result.hasException) {
    throw Exception(result.exception.toString());
  }

  return Booking.fromJson(result.data!['createBooking']);
}
```

**Update Mutation**:
```dart
const String updateRSVPMutation = r'''
  mutation UpdateRSVP($id: ID!, $input: UpdateRSVPInput!) {
    updateRSVP(id: $id, input: $input) {
      id
      response
      status
      attendanceCount
      updatedAt
    }
  }
''';

// Execution with optimistic response
Future<EventRSVP> updateRSVP(
  GraphQLClient client,
  String rsvpId,
  Map<String, dynamic> input,
) async {
  final result = await client.mutate(
    MutationOptions(
      document: gql(updateRSVPMutation),
      variables: {
        'id': rsvpId,
        'input': input,
      },
      optimisticResult: {
        'updateRSVP': {
          '__typename': 'EventRSVP',
          'id': rsvpId,
          ...input,
          'updatedAt': DateTime.now().toIso8601String(),
        },
      },
    ),
  );

  if (result.hasException) {
    throw Exception(result.exception.toString());
  }

  return EventRSVP.fromJson(result.data!['updateRSVP']);
}
```

### 2.3 Subscriptions (Real-Time Updates)

**Basic Subscription**:
```dart
const String notificationSubscription = r'''
  subscription OnNotificationReceived {
    notificationReceived {
      id
      type
      title
      message
      status
      createdAt
    }
  }
''';

// Subscription stream
Stream<Notification> subscribeToNotifications(GraphQLClient client) {
  final operation = Operation(
    document: gql(notificationSubscription),
  );

  return client.subscribe(operation).map((result) {
    if (result.hasException) {
      throw Exception(result.exception.toString());
    }
    return Notification.fromJson(result.data!['notificationReceived']);
  });
}

// Usage in widget
class NotificationListener extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final client = ref.watch(graphQLClientProvider).value;

    return StreamBuilder<Notification>(
      stream: subscribeToNotifications(client),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          _showNotification(snapshot.data!);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
```

**Subscription with Variables**:
```dart
const String rsvpUpdatesSubscription = r'''
  subscription OnRSVPUpdated($eventId: ID!) {
    rsvpUpdated(eventId: $eventId) {
      id
      status
      waitlistPosition
      updatedAt
    }
  }
''';

Stream<EventRSVP> subscribeToRSVPUpdates(
  GraphQLClient client,
  String eventId,
) {
  final operation = Operation(
    document: gql(rsvpUpdatesSubscription),
    variables: {'eventId': eventId},
  );

  return client.subscribe(operation).map((result) {
    if (result.hasException) {
      throw Exception(result.exception.toString());
    }
    return EventRSVP.fromJson(result.data!['rsvpUpdated']);
  });
}
```

---

## 3. Pagination

### 3.1 Relay-Style Cursor Pagination (EventConnection)

**EventConnection Pattern**:
```graphql
# Query structure
query GetEvents($clubId: ID!, $pagination: PaginationInput!) {
  events(clubId: $clubId, pagination: $pagination) {
    edges {           # Array of event nodes
      node {          # Individual event data
        id
        title
        # ... event fields
      }
      cursor          # Cursor for this edge
    }
    pageInfo {
      hasNextPage
      hasPreviousPage
      startCursor
      endCursor
    }
    totalCount
  }
}
```

**Actual Query from Codebase** (`lib/graphql/events/get_events.graphql`):
```graphql
query GetEvents($clubId: ID!, $filters: EventFilters, $pagination: PaginationInput!) {
  events(clubId: $clubId, filters: $filters, pagination: $pagination) {
    edges {
      node {
        id
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
        requiresApproval
        requiresPayment
        price
      }
    }
    pageInfo {
      hasNextPage
      hasPreviousPage
      startCursor
      endCursor
    }
    totalCount
  }
}
```

**Implementation**:
```dart
class EventsDataSource {
  Future<EventsConnection> getEvents({
    required String clubId,
    Map<String, dynamic>? filters,
    int page = 1,
    int pageSize = 20,
  }) async {
    final result = await client.query(
      QueryOptions(
        document: documentNodeQueryGetEvents,
        variables: {
          'clubId': clubId,
          'filters': filters,
          'pagination': {
            'page': page,
            'pageSize': pageSize,
          },
        },
      ),
    );

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    // Access events through edges → node
    final List<dynamic> edges = result.data?['events']['edges'] ?? [];
    final events = edges
        .map((edge) => Event.fromJson(edge['node']))
        .toList();

    final pageInfo = PageInfo.fromJson(
      result.data?['events']['pageInfo'],
    );

    return EventsConnection(
      events: events,
      pageInfo: pageInfo,
      totalCount: result.data?['events']['totalCount'] ?? 0,
    );
  }
}
```

### 3.2 Offset-Based Pagination (ClubConnection)

**ClubConnection Pattern**:
```graphql
query Clubs($pagination: PaginationInput) {
  clubs(pagination: $pagination) {
    nodes {          # Array of club objects (simpler than edges)
      id
      name
      description
      location
      settings {
        allowReciprocal
        requireApproval
      }
    }
    pageInfo {
      page           # Current page number
      pageSize       # Items per page
      total          # Total items
      totalPages     # Total pages
      hasNextPage
      hasPrevPage
    }
  }
}
```

**Actual Query from Codebase** (`lib/graphql/clubs/clubs.graphql`):
```graphql
query Clubs($pagination: PaginationInput) {
  clubs(pagination: $pagination) {
    nodes {
      id
      name
      description
      location
      website
      status
      settings {
        allowReciprocal
        requireApproval
        maxVisitsPerMonth
        reciprocalFee
      }
      createdAt
      updatedAt
    }
    pageInfo {
      page
      pageSize
      total
      totalPages
      hasNextPage
      hasPrevPage
    }
  }
}
```

**Implementation**:
```dart
class ClubsDataSource {
  Future<ClubsConnection> getClubs({
    int page = 1,
    int pageSize = 20,
  }) async {
    final result = await client.query(
      QueryOptions(
        document: documentNodeQueryClubs,
        variables: {
          'pagination': {
            'page': page,
            'pageSize': pageSize,
          },
        },
      ),
    );

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    // Access clubs through nodes (no edges wrapper)
    final List<dynamic> nodes = result.data?['clubs']['nodes'] ?? [];
    final clubs = nodes.map((node) => Club.fromJson(node)).toList();

    final pageInfo = PageInfo.fromJson(
      result.data?['clubs']['pageInfo'],
    );

    return ClubsConnection(
      clubs: clubs,
      pageInfo: pageInfo,
    );
  }
}
```

### 3.3 Infinite Scroll with Riverpod

**Events Provider with Infinite Scroll**:
```dart
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
    final dataSource = ref.read(eventsDataSourceProvider);
    final connection = await dataSource.getEvents(
      clubId: clubId,
      page: _currentPage,
      pageSize: 20,
    );

    _allEvents.addAll(connection.events);
    _hasMorePages = connection.pageInfo.hasNextPage;

    return List.unmodifiable(_allEvents);
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
}
```

**Widget with Scroll Detection**:
```dart
class EventsListPage extends ConsumerStatefulWidget {
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
      ref.read(eventsListProvider(clubId).notifier).loadMore();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  bool get _isLoading {
    return ref.read(eventsListProvider(clubId)).isLoading;
  }

  @override
  Widget build(BuildContext context) {
    final eventsState = ref.watch(eventsListProvider(clubId));

    return eventsState.when(
      data: (events) => ListView.builder(
        controller: _scrollController,
        itemCount: events.length + 1,
        itemBuilder: (context, index) {
          if (index >= events.length) {
            return const Center(child: CircularProgressIndicator());
          }
          return EventCard(event: events[index]);
        },
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => ErrorView(message: error.toString()),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
```

### 3.4 Pagination Input Types

**PaginationInput for ClubConnection**:
```dart
class PaginationInput {
  final int page;
  final int pageSize;

  const PaginationInput({
    this.page = 1,
    this.pageSize = 20,
  });

  Map<String, dynamic> toJson() => {
    'page': page,
    'pageSize': pageSize,
  };
}
```

**PageInfo Models**:
```dart
// For ClubConnection (offset-based)
class OffsetPageInfo {
  final int page;
  final int pageSize;
  final int total;
  final int totalPages;
  final bool hasNextPage;
  final bool hasPrevPage;

  const OffsetPageInfo({
    required this.page,
    required this.pageSize,
    required this.total,
    required this.totalPages,
    required this.hasNextPage,
    required this.hasPrevPage,
  });

  factory OffsetPageInfo.fromJson(Map<String, dynamic> json) =>
      OffsetPageInfo(
        page: json['page'] as int,
        pageSize: json['pageSize'] as int,
        total: json['total'] as int,
        totalPages: json['totalPages'] as int,
        hasNextPage: json['hasNextPage'] as bool,
        hasPrevPage: json['hasPrevPage'] as bool,
      );
}

// For EventConnection (cursor-based)
class CursorPageInfo {
  final bool hasNextPage;
  final bool hasPreviousPage;
  final String? startCursor;
  final String? endCursor;

  const CursorPageInfo({
    required this.hasNextPage,
    required this.hasPreviousPage,
    this.startCursor,
    this.endCursor,
  });

  factory CursorPageInfo.fromJson(Map<String, dynamic> json) =>
      CursorPageInfo(
        hasNextPage: json['hasNextPage'] as bool,
        hasPreviousPage: json['hasPreviousPage'] as bool,
        startCursor: json['startCursor'] as String?,
        endCursor: json['endCursor'] as String?,
      );
}
```

---

## 4. Code Generation

### 4.1 graphql_codegen Setup

**Configuration** (`build.yaml`):
```yaml
targets:
  $default:
    builders:
      graphql_codegen:
        options:
          # Schema source
          schema: lib/schema/schema.graphql

          # Generate for all .graphql files
          queries_glob: lib/graphql/**/*.graphql

          # Output configuration
          output_directory: lib/core/graphql/

          # Type-safe options
          type_overrides:
            DateTime: DateTime

          # Naming
          naming_convention: snake_case

          # Features
          generate_helpers: true
          add_query_prefix: true
```

**Running Code Generation**:
```bash
# One-time generation
dart run build_runner build --delete-conflicting-outputs

# Watch mode (auto-regenerate on changes)
dart run build_runner watch --delete-conflicting-outputs

# Clean generated files
dart run build_runner clean
```

### 4.2 Generated Code Structure

**Query File** (`lib/graphql/auth/login.graphql`):
```graphql
mutation Login($email: String!, $password: String!) {
  login(email: $email, password: $password) {
    token
    refreshToken
    user {
      id
      email
      firstName
      lastName
    }
    expiresAt
  }
}
```

**Generated Dart File** (`lib/graphql/auth/login.graphql.dart`):
```dart
// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:graphql/client.dart' as graphql;

// Variable class (type-safe input)
class Variables$Mutation$Login {
  Variables$Mutation$Login({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
  };

  factory Variables$Mutation$Login.fromJson(Map<String, dynamic> data) =>
      Variables$Mutation$Login(
        email: data['email'] as String,
        password: data['password'] as String,
      );

  CopyWith$Variables$Mutation$Login<Variables$Mutation$Login> get copyWith =>
      CopyWith$Variables$Mutation$Login(this, (i) => i);
}

// Response data classes
class Mutation$Login {
  Mutation$Login({required this.login});

  factory Mutation$Login.fromJson(Map<String, dynamic> json) =>
      Mutation$Login(
        login: Mutation$Login$login.fromJson(json['login']),
      );

  final Mutation$Login$login login;

  Map<String, dynamic> toJson() => {
    'login': login.toJson(),
  };
}

class Mutation$Login$login {
  final String token;
  final String refreshToken;
  final DateTime expiresAt;
  final Mutation$Login$login$user user;

  // ... fromJson, toJson methods
}

class Mutation$Login$login$user {
  final String id;
  final String email;
  final String firstName;
  final String lastName;

  // ... fromJson, toJson methods
}

// DocumentNode constant (pre-parsed GraphQL AST)
const documentNodeMutationLogin = DocumentNode(/* ... */);
```

### 4.3 Using Generated Code

**Type-Safe Query Execution**:
```dart
import 'package:clubland/core/graphql/graphql_api.dart';

Future<AuthResult> login(String email, String password) async {
  final result = await client.mutate(
    MutationOptions(
      document: documentNodeMutationLogin,
      variables: Variables$Mutation$Login(
        email: email,
        password: password,
      ).toJson(),
    ),
  );

  if (result.hasException) {
    throw Exception(result.exception.toString());
  }

  // Type-safe data parsing
  final data = Mutation$Login.fromJson(result.data!);

  return AuthResult(
    token: data.login.token,
    refreshToken: data.login.refreshToken,
    expiresAt: data.login.expiresAt,
    user: User(
      id: data.login.user.id,
      email: data.login.user.email,
      firstName: data.login.user.firstName,
      lastName: data.login.user.lastName,
    ),
  );
}
```

### 4.4 Central API Export

**GraphQL API Export** (`lib/core/graphql/graphql_api.dart`):
```dart
// Central export file for all generated GraphQL operations

// Authentication
export '../../graphql/auth/login.graphql.dart';
export '../../graphql/auth/register.graphql.dart';
export '../../graphql/auth/logout.graphql.dart';
export '../../graphql/auth/refresh_token.graphql.dart';

// Clubs
export '../../graphql/clubs/clubs.graphql.dart';
export '../../graphql/clubs/club.graphql.dart';
export '../../graphql/clubs/my_club.graphql.dart';

// Events
export '../../graphql/events/get_events.graphql.dart';
export '../../graphql/events/get_event.graphql.dart';
export '../../graphql/events/create_rsvp.graphql.dart';
export '../../graphql/events/update_rsvp.graphql.dart';
export '../../graphql/events/cancel_rsvp.graphql.dart';

// Bookings
export '../../graphql/bookings/bookings.graphql.dart';
export '../../graphql/bookings/create_booking.graphql.dart';
export '../../graphql/bookings/cancel_booking.graphql.dart';

// Subscriptions
export '../../graphql/subscriptions/notification_received.graphql.dart';
export '../../graphql/subscriptions/rsvp_updated.graphql.dart';
```

**Usage**:
```dart
// Single import for all GraphQL operations
import 'package:clubland/core/graphql/graphql_api.dart';

// Now you have access to all generated classes and DocumentNodes
final loginDoc = documentNodeMutationLogin;
final clubsDoc = documentNodeQueryClubs;
final eventsDoc = documentNodeQueryGetEvents;
```

---

## 5. Error Handling

### 5.1 GraphQL Error Types

**Error Response Structure**:
```json
{
  "data": null,
  "errors": [
    {
      "message": "Member with this email already exists",
      "path": ["createMember"],
      "extensions": {
        "code": "DUPLICATE_ENTRY",
        "field": "email",
        "details": {
          "existingMemberId": "mem_123"
        }
      }
    }
  ]
}
```

**Error Handling Pattern**:
```dart
Future<Either<Failure, Club>> getClub(String clubId) async {
  try {
    final result = await client.query(
      QueryOptions(document: documentNodeQueryClub, variables: {'id': clubId}),
    );

    if (result.hasException) {
      return Left(_handleGraphQLException(result.exception!));
    }

    if (result.data == null) {
      return const Left(ServerFailure('No data returned'));
    }

    final club = Club.fromJson(result.data!['club']);
    return Right(club);

  } on NetworkException catch (e) {
    return Left(NetworkFailure(e.message));
  } catch (e) {
    return Left(UnknownFailure(e.toString()));
  }
}

Failure _handleGraphQLException(OperationException exception) {
  // GraphQL errors
  if (exception.graphqlErrors.isNotEmpty) {
    final error = exception.graphqlErrors.first;
    final code = error.extensions?['code'] as String?;

    switch (code) {
      case 'UNAUTHENTICATED':
        return const AuthFailure('Please log in again');
      case 'FORBIDDEN':
        return const AuthFailure('Access denied');
      case 'NOT_FOUND':
        return NotFoundFailure(error.message);
      case 'VALIDATION_ERROR':
        return ValidationFailure(error.message);
      case 'DUPLICATE_ENTRY':
        return DuplicateFailure(error.message);
      default:
        return ServerFailure(error.message);
    }
  }

  // Network errors
  if (exception.linkException != null) {
    if (exception.linkException is ServerException) {
      return const ServerFailure('Server error');
    }
    if (exception.linkException is NetworkException) {
      return const NetworkFailure('No internet connection');
    }
  }

  return const UnknownFailure('An unexpected error occurred');
}
```

### 5.2 Failure Classes

```dart
// lib/core/errors/failures.dart

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}

class NetworkFailure extends Failure {
  const NetworkFailure(String message) : super(message);
}

class AuthFailure extends Failure {
  const AuthFailure(String message) : super(message);
}

class ValidationFailure extends Failure {
  const ValidationFailure(String message) : super(message);
}

class NotFoundFailure extends Failure {
  const NotFoundFailure(String message) : super(message);
}

class DuplicateFailure extends Failure {
  const DuplicateFailure(String message) : super(message);
}

class UnknownFailure extends Failure {
  const UnknownFailure(String message) : super(message);
}
```

### 5.3 UI Error Display

**Error Widget**:
```dart
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
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64, color: Colors.red[300]),
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

**Usage in Riverpod Provider**:
```dart
@override
Widget build(BuildContext context, WidgetRef ref) {
  final clubsState = ref.watch(clubsProvider);

  return clubsState.when(
    data: (clubs) => ClubsList(clubs: clubs),
    loading: () => const LoadingView(),
    error: (error, stackTrace) => ErrorView(
      message: _getErrorMessage(error),
      onRetry: () => ref.invalidate(clubsProvider),
    ),
  );
}

String _getErrorMessage(Object error) {
  if (error is Failure) {
    return error.message;
  }
  return 'An unexpected error occurred';
}
```

### 5.4 Retry Logic

**Automatic Retry for Network Errors**:
```dart
Future<QueryResult> queryWithRetry(
  QueryOptions options, {
  int maxRetries = 3,
  Duration retryDelay = const Duration(seconds: 2),
}) async {
  int attempts = 0;

  while (attempts < maxRetries) {
    try {
      final result = await client.query(options);

      // Success or non-retryable error
      if (!result.hasException || !_isRetryableError(result.exception!)) {
        return result;
      }

      attempts++;
      if (attempts < maxRetries) {
        await Future.delayed(retryDelay * attempts); // Exponential backoff
      }
    } catch (e) {
      if (attempts >= maxRetries - 1) rethrow;
      attempts++;
      await Future.delayed(retryDelay * attempts);
    }
  }

  throw Exception('Max retries exceeded');
}

bool _isRetryableError(OperationException exception) {
  // Retry on network errors
  if (exception.linkException is NetworkException) return true;

  // Retry on server errors (5xx)
  if (exception.linkException is ServerException) {
    final serverException = exception.linkException as ServerException;
    return serverException.statusCode >= 500;
  }

  return false;
}
```

---

## 6. Riverpod Integration

### 6.1 Provider Setup

**GraphQL Client Provider**:
```dart
// lib/core/providers/graphql_provider.dart

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

part 'graphql_provider.g.dart';

@riverpod
ValueNotifier<GraphQLClient> graphQLClient(Ref ref) {
  return GraphQLConfig.initializeClient();
}
```

**Data Source Provider**:
```dart
@riverpod
EventsDataSource eventsDataSource(Ref ref) {
  final client = ref.watch(graphQLClientProvider).value;
  return EventsDataSourceImpl(client: client);
}
```

**Repository Provider**:
```dart
@riverpod
EventsRepository eventsRepository(Ref ref) {
  final dataSource = ref.watch(eventsDataSourceProvider);
  return EventsRepositoryImpl(dataSource: dataSource);
}
```

### 6.2 Query Providers

**Simple Query Provider**:
```dart
@riverpod
Future<Club> club(Ref ref, String clubId) async {
  final repository = ref.watch(clubsRepositoryProvider);

  final result = await repository.getClub(clubId);

  return result.fold(
    (failure) => throw Exception(failure.message),
    (club) => club,
  );
}
```

**Query Provider with Cache**:
```dart
@riverpod
Future<List<Club>> clubs(Ref ref) async {
  final repository = ref.watch(clubsRepositoryProvider);

  // Keep provider alive for 5 minutes
  ref.keepAlive();

  final timer = Timer(const Duration(minutes: 5), () {
    ref.invalidateSelf();
  });

  ref.onDispose(timer.cancel);

  final result = await repository.getClubs();

  return result.fold(
    (failure) => throw Exception(failure.message),
    (clubs) => clubs,
  );
}
```

### 6.3 Mutation Providers

**Mutation State Provider**:
```dart
@riverpod
class CreateBooking extends _$CreateBooking {
  @override
  FutureOr<Booking?> build() {
    return null;
  }

  Future<void> create(Map<String, dynamic> input) async {
    state = const AsyncLoading();

    final repository = ref.read(bookingsRepositoryProvider);
    state = await AsyncValue.guard(() async {
      final result = await repository.createBooking(input);
      return result.fold(
        (failure) => throw Exception(failure.message),
        (booking) => booking,
      );
    });

    // Invalidate related queries
    if (state.hasValue) {
      ref.invalidate(upcomingBookingsProvider);
      ref.invalidate(myBookingsProvider);
    }
  }
}
```

**Usage in Widget**:
```dart
class BookingForm extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Listen to mutation state
    ref.listen<AsyncValue<Booking?>>(
      createBookingProvider,
      (previous, next) {
        next.when(
          data: (booking) {
            if (booking != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Booking created!')),
              );
              Navigator.pop(context);
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
      },
    );

    final mutationState = ref.watch(createBookingProvider);

    return ElevatedButton(
      onPressed: mutationState.isLoading
          ? null
          : () => _submitBooking(ref),
      child: mutationState.isLoading
          ? const CircularProgressIndicator()
          : const Text('Book Now'),
    );
  }

  void _submitBooking(WidgetRef ref) {
    final input = {
      'facilityId': _facilityId,
      'startTime': _startTime.toIso8601String(),
      'endTime': _endTime.toIso8601String(),
      'notes': _notes,
    };

    ref.read(createBookingProvider.notifier).create(input);
  }
}
```

### 6.4 Subscription Providers

**Real-Time Subscription Provider**:
```dart
@riverpod
Stream<Notification> notificationStream(Ref ref) {
  final client = ref.watch(graphQLClientProvider).value;

  final operation = Operation(
    document: documentNodeSubscriptionNotificationReceived,
  );

  return client.subscribe(operation).map((result) {
    if (result.hasException) {
      throw Exception(result.exception.toString());
    }
    return Notification.fromJson(result.data!['notificationReceived']);
  });
}
```

**Usage with StreamProvider**:
```dart
@riverpod
Stream<List<Notification>> recentNotifications(Ref ref) {
  final stream = ref.watch(notificationStreamProvider);

  // Accumulate notifications
  final List<Notification> notifications = [];

  return stream.map((notification) {
    notifications.insert(0, notification);
    if (notifications.length > 50) {
      notifications.removeLast();
    }
    return List.unmodifiable(notifications);
  });
}

// In widget
@override
Widget build(BuildContext context, WidgetRef ref) {
  final notificationsStream = ref.watch(recentNotificationsProvider);

  return notificationsStream.when(
    data: (notifications) => NotificationsList(notifications: notifications),
    loading: () => const LoadingView(),
    error: (error, _) => ErrorView(message: error.toString()),
  );
}
```

---

## 7. Best Practices

### 7.1 Query Optimization

**Use Fragments for Reusable Fields**:
```graphql
fragment ClubBasicInfo on Club {
  id
  name
  description
  location
  status
}

fragment ClubSettings on ClubSettings {
  allowReciprocal
  requireApproval
  maxVisitsPerMonth
}

query GetClubs {
  clubs {
    nodes {
      ...ClubBasicInfo
      settings {
        ...ClubSettings
      }
    }
  }
}
```

**Request Only Needed Fields**:
```dart
// ❌ Bad: Over-fetching
const String badQuery = r'''
  query GetEvent($id: ID!) {
    event(id: $id) {
      # Requesting all 50+ fields when only need 5
    }
  }
''';

// ✅ Good: Minimal fields
const String goodQuery = r'''
  query GetEventSummary($id: ID!) {
    event(id: $id) {
      id
      title
      startTime
      availableSpots
      requiresPayment
    }
  }
''';
```

### 7.2 Caching Strategies

**Cache-First for Static Data**:
```dart
// Use cached data if available, fetch from network if not
final result = await client.query(
  QueryOptions(
    document: documentNodeQueryClubs,
    fetchPolicy: FetchPolicy.cacheFirst,
  ),
);
```

**Network-Only for Dynamic Data**:
```dart
// Always fetch fresh data (e.g., availability, waitlist)
final result = await client.query(
  QueryOptions(
    document: documentNodeQueryCheckAvailability,
    fetchPolicy: FetchPolicy.networkOnly,
  ),
);
```

**Cache-And-Network for Best UX**:
```dart
// Show cached data immediately, then update with fresh data
final result = await client.query(
  QueryOptions(
    document: documentNodeQueryEvents,
    fetchPolicy: FetchPolicy.cacheAndNetwork,
  ),
);
```

### 7.3 Performance Tips

**Batch Queries**:
```dart
// ❌ Bad: Multiple sequential queries
final club = await getClub(clubId);
final facilities = await getFacilities(clubId);
final bookings = await getBookings(clubId);

// ✅ Good: Single query with all data
const String batchQuery = r'''
  query GetClubData($clubId: ID!) {
    club(id: $clubId) {
      id
      name
      facilities {
        id
        name
      }
      bookings {
        id
        startTime
      }
    }
  }
''';
```

**Use Optimistic Updates**:
```dart
Future<void> cancelBooking(String bookingId) async {
  await client.mutate(
    MutationOptions(
      document: documentNodeMutationCancelBooking,
      variables: {'id': bookingId},
      optimisticResult: {
        'cancelBooking': {
          '__typename': 'Booking',
          'id': bookingId,
          'status': 'CANCELLED',
        },
      },
    ),
  );
}
```

**Debounce Search Queries**:
```dart
Timer? _debounceTimer;

void onSearchChanged(String query) {
  _debounceTimer?.cancel();
  _debounceTimer = Timer(const Duration(milliseconds: 500), () {
    ref.read(searchClubsProvider.notifier).search(query);
  });
}
```

### 7.4 Security Best Practices

**Never Log Sensitive Data**:
```dart
// ❌ Bad
print('Login result: ${result.data}'); // Contains tokens!

// ✅ Good
if (kDebugMode) {
  print('Login successful for user: ${result.data?['login']['user']['id']}');
}
```

**Validate Input Before Mutation**:
```dart
Future<void> createRSVP(Map<String, dynamic> input) async {
  // Validate locally first
  if (input['attendanceCount'] == null || input['attendanceCount'] < 1) {
    throw ValidationException('Attendance count must be at least 1');
  }

  // Then send to server
  final result = await client.mutate(
    MutationOptions(
      document: documentNodeMutationCreateRSVP,
      variables: {'input': input},
    ),
  );
}
```

**Handle Token Expiration**:
```dart
class AuthLink extends Link {
  @override
  Stream<Response> request(Request request, [NextLink? forward]) async* {
    final token = await _getValidToken();

    final newRequest = request.updateContextEntry<HttpLinkHeaders>(
      (headers) => HttpLinkHeaders(
        headers: {
          ...headers?.headers ?? {},
          'Authorization': 'Bearer $token',
        },
      ),
    );

    yield* forward!(newRequest);
  }

  Future<String?> _getValidToken() async {
    final storage = SecureStorageService();
    final token = await storage.getToken();

    // Check if token is expired
    if (_isTokenExpired(token)) {
      return await _refreshToken();
    }

    return token;
  }
}
```

---

## 8. Common Mistakes

### 8.1 Pagination Mistakes

**❌ Mistake: Querying fields directly on Connection type**:
```graphql
query BadClubsQuery {
  clubs {
    id          # ❌ ERROR: Cannot query field "id" on type "ClubConnection"
    name        # ❌ ERROR: Cannot query field "name" on type "ClubConnection"
  }
}
```

**✅ Correct: Use nodes wrapper**:
```graphql
query GoodClubsQuery {
  clubs {
    nodes {     # ✅ CORRECT: Access clubs through nodes
      id
      name
    }
  }
}
```

**❌ Mistake: Accessing data incorrectly**:
```dart
// ❌ Bad: Trying to access clubs directly
final clubs = result.data?['clubs'] as List;

// ✅ Good: Access through nodes
final clubs = result.data?['clubs']['nodes'] as List;
```

### 8.2 Null Safety Mistakes

**❌ Mistake: Not handling null fields**:
```dart
// ❌ Bad: Assumes price is always present
final price = event.price.toStringAsFixed(2); // Crash if price is null

// ✅ Good: Handle nullable fields
final price = event.price?.toStringAsFixed(2) ?? 'Free';
```

**❌ Mistake: Not checking result data**:
```dart
// ❌ Bad: Assumes data is always present
final club = Club.fromJson(result.data!['club']);

// ✅ Good: Check for null
if (result.data == null || result.data!['club'] == null) {
  throw Exception('Club not found');
}
final club = Club.fromJson(result.data!['club']);
```

### 8.3 Type Mismatch Mistakes

**❌ Mistake: Wrong variable types**:
```dart
// ❌ Bad: Passing string when expecting DateTime
final variables = {
  'startTime': '2025-11-15 18:00:00',  // Wrong format
};

// ✅ Good: Use proper ISO 8601 format
final variables = {
  'startTime': DateTime(2025, 11, 15, 18, 0).toIso8601String(),
};
```

**❌ Mistake: Enum string mismatch**:
```dart
// ❌ Bad: Using wrong enum value
final variables = {
  'response': 'yes',  // Should be uppercase
};

// ✅ Good: Match GraphQL enum exactly
final variables = {
  'response': 'YES',  // GraphQL enum value
};
```

### 8.4 Error Handling Mistakes

**❌ Mistake: Not checking for exceptions**:
```dart
// ❌ Bad: Assuming query always succeeds
final clubs = result.data!['clubs'];

// ✅ Good: Check for exceptions first
if (result.hasException) {
  throw Exception(result.exception.toString());
}
final clubs = result.data?['clubs'];
```

**❌ Mistake: Ignoring GraphQL errors**:
```dart
// ❌ Bad: Only checking for link exceptions
if (result.exception?.linkException != null) {
  // Handle error
}

// ✅ Good: Check both GraphQL and link errors
if (result.hasException) {
  if (result.exception?.graphqlErrors.isNotEmpty ?? false) {
    // Handle GraphQL error
  }
  if (result.exception?.linkException != null) {
    // Handle network error
  }
}
```

### 8.5 Riverpod Mistakes (3.x)

**❌ Mistake: Using wrong ref type**:
```dart
// ❌ Bad: Custom ref type (Riverpod 2.x style)
@riverpod
class MyController extends _$MyController {
  @override
  FutureOr<String> build(MyControllerRef ref) {  // ❌ Wrong
    // ...
  }
}

// ✅ Good: Generic Ref (Riverpod 3.x style)
@riverpod
class MyController extends _$MyController {
  @override
  FutureOr<String> build() {  // ✅ Correct - no ref parameter
    // Access ref via this.ref
  }
}
```

**❌ Mistake: Using valueOrNull (deprecated)**:
```dart
// ❌ Bad: valueOrNull is deprecated
final user = ref.read(authProvider).valueOrNull;

// ✅ Good: Use value (throws if loading/error)
final user = ref.read(authProvider).value;

// ✅ Good: Use hasValue check
final authState = ref.read(authProvider);
final user = authState.hasValue ? authState.value : null;
```

---

## 9. Field Mapping Notes

### 9.1 Event Field Aliases

Flutter queries can use **friendly field names** that differ from backend field names. The backend provides **aliases** for compatibility:

| Flutter Field | Backend Field | Type | Notes |
|--------------|---------------|------|-------|
| `capacity` | `maxCapacity` | Int! | Both names work |
| `currentAttendees` | `currentAttendance` | Int! | Both names work |
| `requiresApproval` | `rsvpMode` | Boolean / String | `requiresApproval` returns boolean; `rsvpMode` returns "auto_confirm" or "approval_required" |
| `requiresPayment` | `isPaid` | Boolean! | Both names work |
| `price` | `price` | Float | New field (Nov 2025) |
| `imageUrl` | `imageUrl` | String | New field (Nov 2025) |
| `location` | `location` | String | New field (Nov 2025) - venue/room name |
| `cancellationDeadline` | `cancellationDeadline` | DateTime | New field (Nov 2025) |
| `cancellationFeePercentage` | `cancellationFeePercent` | Int! | Both names work (0-100) |
| `allowsSubgroupPriority` | `subgroupPriority` | Boolean! | Both names work |

**Example Query Using Aliases**:
```graphql
query GetEvent($id: ID!) {
  event(id: $id) {
    # Use Flutter-friendly field names
    capacity                    # Alias for maxCapacity
    currentAttendees            # Alias for currentAttendance
    requiresApproval            # Alias - returns boolean
    requiresPayment             # Alias for isPaid
    price                       # New field
    cancellationFeePercentage   # Alias for cancellationFeePercent
  }
}
```

### 9.2 Club Field Notes

| Field | Type | Nullable | Notes |
|-------|------|----------|-------|
| `logo` | String | ✓ | URL to club logo image |
| `coverImage` | String | ✓ | URL to cover/banner image |
| `settings.allowReciprocal` | Boolean! | ✗ | Whether club accepts reciprocal members |
| `settings.reciprocalFee` | Float | ✓ | Fee charged to reciprocal members |

### 9.3 Booking Field Notes

| Field | Type | Nullable | Notes |
|-------|------|----------|-------|
| `status` | BookingStatus! | ✗ | PENDING, CONFIRMED, CHECKED_IN, COMPLETED, CANCELLED, NO_SHOW |
| `participants` | [String!] | ✓ | Array of user IDs (for group bookings) |
| `facility.type` | String! | ✗ | Facility type (TENNIS_COURT, DINING_ROOM, etc.) |

---

## 10. Real-World Examples

### 10.1 Complete Clubs Query Example

**GraphQL Query** (`lib/graphql/clubs/clubs.graphql`):
```graphql
query Clubs($pagination: PaginationInput) {
  clubs(pagination: $pagination) {
    nodes {
      id
      name
      description
      location
      website
      status
      settings {
        allowReciprocal
        requireApproval
        maxVisitsPerMonth
        reciprocalFee
      }
      createdAt
      updatedAt
    }
    pageInfo {
      page
      pageSize
      total
      totalPages
      hasNextPage
      hasPrevPage
    }
  }
}
```

**Data Source Implementation**:
```dart
// lib/features/clubs/data/datasources/clubs_remote_datasource.dart

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:clubland/core/graphql/graphql_api.dart';

class ClubsRemoteDataSource {
  final GraphQLClient client;

  ClubsRemoteDataSource({required this.client});

  Future<ClubsConnection> getClubs({
    int page = 1,
    int pageSize = 20,
  }) async {
    final result = await client.query(
      QueryOptions(
        document: documentNodeQueryClubs,
        variables: {
          'pagination': {
            'page': page,
            'pageSize': pageSize,
          },
        },
        fetchPolicy: FetchPolicy.cacheFirst,
      ),
    );

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    // Parse nodes
    final List<dynamic> nodes = result.data?['clubs']['nodes'] ?? [];
    final clubs = nodes.map((node) => ClubModel.fromJson(node)).toList();

    // Parse pageInfo
    final pageInfoData = result.data?['clubs']['pageInfo'];
    final pageInfo = PageInfo(
      page: pageInfoData['page'],
      pageSize: pageInfoData['pageSize'],
      total: pageInfoData['total'],
      totalPages: pageInfoData['totalPages'],
      hasNextPage: pageInfoData['hasNextPage'],
      hasPrevPage: pageInfoData['hasPrevPage'],
    );

    return ClubsConnection(
      clubs: clubs.map((model) => model.toEntity()).toList(),
      pageInfo: pageInfo,
    );
  }
}
```

**Riverpod Provider**:
```dart
// lib/features/clubs/presentation/providers/clubs_provider.dart

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'clubs_provider.g.dart';

@riverpod
class ClubsList extends _$ClubsList {
  int _currentPage = 1;
  List<Club> _allClubs = [];
  bool _hasMorePages = true;

  @override
  FutureOr<List<Club>> build() async {
    _currentPage = 1;
    _allClubs = [];
    return _fetchClubs();
  }

  Future<List<Club>> _fetchClubs() async {
    final dataSource = ref.read(clubsRemoteDataSourceProvider);
    final connection = await dataSource.getClubs(
      page: _currentPage,
      pageSize: 20,
    );

    _allClubs.addAll(connection.clubs);
    _hasMorePages = connection.pageInfo.hasNextPage;

    return List.unmodifiable(_allClubs);
  }

  Future<void> loadMore() async {
    if (!_hasMorePages) return;

    state = const AsyncValue.loading();
    _currentPage++;

    state = await AsyncValue.guard(() => _fetchClubs());
  }

  Future<void> refresh() async {
    _currentPage = 1;
    _allClubs = [];
    _hasMorePages = true;

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchClubs());
  }
}
```

**Widget Usage**:
```dart
class ClubsListPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clubsState = ref.watch(clubsListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Clubs')),
      body: clubsState.when(
        data: (clubs) => RefreshIndicator(
          onRefresh: () async {
            await ref.read(clubsListProvider.notifier).refresh();
          },
          child: clubs.isEmpty
              ? const Center(child: Text('No clubs found'))
              : ListView.builder(
                  itemCount: clubs.length,
                  itemBuilder: (context, index) {
                    final club = clubs[index];
                    return ClubCard(
                      club: club,
                      onTap: () => _navigateToDetails(context, club.id),
                    );
                  },
                ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => ErrorView(
          message: error.toString(),
          onRetry: () => ref.invalidate(clubsListProvider),
        ),
      ),
    );
  }

  void _navigateToDetails(BuildContext context, String clubId) {
    Navigator.pushNamed(context, '/club-details', arguments: clubId);
  }
}
```

### 10.2 Complete Events Query Example

**GraphQL Query** (`lib/graphql/events/get_events.graphql`):
```graphql
query GetEvents($clubId: ID!, $filters: EventFilters, $pagination: PaginationInput!) {
  events(clubId: $clubId, filters: $filters, pagination: $pagination) {
    edges {
      node {
        id
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
        requiresApproval
        requiresPayment
        price
        cancellationDeadline
        freeCancellationDays
        cancellationFeePercentage
      }
    }
    pageInfo {
      hasNextPage
      hasPreviousPage
      startCursor
      endCursor
    }
    totalCount
  }
}
```

**Data Source with Filters**:
```dart
Future<EventsConnection> getEvents({
  required String clubId,
  Map<String, dynamic>? filters,
  int page = 1,
  int pageSize = 20,
}) async {
  final result = await client.query(
    QueryOptions(
      document: documentNodeQueryGetEvents,
      variables: {
        'clubId': clubId,
        'filters': filters,
        'pagination': {
          'page': page,
          'pageSize': pageSize,
        },
      },
      fetchPolicy: FetchPolicy.cacheAndNetwork,
    ),
  );

  if (result.hasException) {
    throw Exception(result.exception.toString());
  }

  // Parse edges → node pattern
  final List<dynamic> edges = result.data?['events']['edges'] ?? [];
  final events = edges
      .map((edge) => EventModel.fromJson(edge['node']))
      .toList();

  final pageInfo = CursorPageInfo(
    hasNextPage: result.data?['events']['pageInfo']['hasNextPage'] ?? false,
    hasPreviousPage: result.data?['events']['pageInfo']['hasPreviousPage'] ?? false,
    startCursor: result.data?['events']['pageInfo']['startCursor'],
    endCursor: result.data?['events']['pageInfo']['endCursor'],
  );

  final totalCount = result.data?['events']['totalCount'] ?? 0;

  return EventsConnection(
    events: events.map((model) => model.toEntity()).toList(),
    pageInfo: pageInfo,
    totalCount: totalCount,
  );
}
```

**Filter Usage**:
```dart
// Filter by event type
final sportsEvents = await dataSource.getEvents(
  clubId: clubId,
  filters: {
    'eventType': ['SPORTS', 'SPORTING'],
    'hasAvailableSpots': true,
  },
);

// Filter by date range
final upcomingEvents = await dataSource.getEvents(
  clubId: clubId,
  filters: {
    'startDate': DateTime.now().toIso8601String(),
    'endDate': DateTime.now().add(Duration(days: 30)).toIso8601String(),
  },
);

// Filter by payment requirement
final freeEvents = await dataSource.getEvents(
  clubId: clubId,
  filters: {
    'requiresPayment': false,
  },
);
```

### 10.3 Complete Create RSVP Example

**GraphQL Mutation** (`lib/graphql/events/create_rsvp.graphql`):
```graphql
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
  }
}
```

**Data Source Implementation**:
```dart
Future<EventRSVP> createRSVP(Map<String, dynamic> input) async {
  final result = await client.mutate(
    MutationOptions(
      document: documentNodeMutationCreateRSVP,
      variables: {'input': input},
      fetchPolicy: FetchPolicy.networkOnly,
    ),
  );

  if (result.hasException) {
    // Handle specific GraphQL errors
    if (result.exception?.graphqlErrors.isNotEmpty ?? false) {
      final error = result.exception!.graphqlErrors.first;
      final code = error.extensions?['code'];

      switch (code) {
        case 'EVENT_FULL':
          throw EventFullException(error.message);
        case 'RSVP_DEADLINE_PASSED':
          throw RSVPDeadlineException(error.message);
        case 'OUTSTANDING_DEBT':
          throw OutstandingDebtException(error.message);
        default:
          throw Exception(error.message);
      }
    }
    throw Exception(result.exception.toString());
  }

  return EventRSVPModel.fromJson(result.data!['createRSVP']).toEntity();
}
```

**Riverpod Provider with Form State**:
```dart
@riverpod
class CreateRSVP extends _$CreateRSVP {
  @override
  FutureOr<EventRSVP?> build() {
    return null;
  }

  Future<void> submit({
    required String eventId,
    required String memberId,
    required String clubId,
    required String response, // YES, MAYBE, NO
    int attendanceCount = 1,
    List<String>? guestNames,
    List<String>? dietaryRestrictions,
    String? seatingPreferences,
    String? specialRequests,
    String? subgroupId,
  }) async {
    state = const AsyncValue.loading();

    final input = {
      'eventId': eventId,
      'memberId': memberId,
      'clubId': clubId,
      'response': response,
      'attendanceCount': attendanceCount,
      if (guestNames != null && guestNames.isNotEmpty)
        'guestNames': guestNames,
      if (dietaryRestrictions != null && dietaryRestrictions.isNotEmpty)
        'dietaryRestrictions': dietaryRestrictions,
      if (seatingPreferences != null)
        'seatingPreferences': seatingPreferences,
      if (specialRequests != null)
        'specialRequests': specialRequests,
      if (subgroupId != null)
        'subgroupId': subgroupId,
    };

    final dataSource = ref.read(eventsRemoteDataSourceProvider);

    state = await AsyncValue.guard(() async {
      final rsvp = await dataSource.createRSVP(input);

      // Invalidate related providers
      ref.invalidate(eventDetailsProvider(eventId));
      ref.invalidate(myRSVPsProvider);

      return rsvp;
    });
  }
}
```

**Form Widget**:
```dart
class RSVPForm extends ConsumerStatefulWidget {
  final String eventId;
  final Event event;

  const RSVPForm({
    Key? key,
    required this.eventId,
    required this.event,
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

  @override
  Widget build(BuildContext context) {
    // Listen to mutation state
    ref.listen<AsyncValue<EventRSVP?>>(
      createRSVPProvider,
      (previous, next) {
        next.when(
          data: (rsvp) {
            if (rsvp != null) {
              final message = rsvp.status == 'WAITLIST'
                  ? 'Added to waitlist (position ${rsvp.waitlistPosition})'
                  : 'RSVP confirmed!';

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message)),
              );
              Navigator.pop(context, true);
            }
          },
          loading: () {},
          error: (error, _) {
            String message = 'Failed to create RSVP';

            if (error is EventFullException) {
              message = 'Event is full. Would you like to join the waitlist?';
            } else if (error is RSVPDeadlineException) {
              message = 'RSVP deadline has passed';
            } else if (error is OutstandingDebtException) {
              message = 'You have outstanding debt. Please contact the club.';
            }

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: Colors.red,
              ),
            );
          },
        );
      },
    );

    final mutationState = ref.watch(createRSVPProvider);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Response selector (Yes/Maybe/No)
          _buildResponseSelector(),

          if (_response != 'NO') ...[
            // Attendance count
            _buildAttendanceCounter(),

            // Guest names (if > 1 person)
            if (_attendanceCount > 1 && widget.event.acceptsGuests)
              _buildGuestNames(),

            // Dietary restrictions
            _buildDietaryRestrictions(),
          ],

          // Submit button
          ElevatedButton(
            onPressed: mutationState.isLoading ? null : _submitRSVP,
            child: mutationState.isLoading
                ? const CircularProgressIndicator()
                : const Text('Submit RSVP'),
          ),
        ],
      ),
    );
  }

  Future<void> _submitRSVP() async {
    if (_formKey.currentState!.validate()) {
      final memberId = ref.read(currentUserProvider).value?.id;
      if (memberId == null) return;

      await ref.read(createRSVPProvider.notifier).submit(
        eventId: widget.eventId,
        memberId: memberId,
        clubId: widget.event.clubId,
        response: _response,
        attendanceCount: _attendanceCount,
        guestNames: _guestNames.isEmpty ? null : _guestNames,
        dietaryRestrictions: _dietaryRestrictions.isEmpty
            ? null
            : _dietaryRestrictions,
      );
    }
  }

  // ... widget builder methods
}
```

### 10.4 Complete Bookings Query Example

**GraphQL Query** (`lib/graphql/bookings/bookings.graphql`):
```graphql
query Bookings($filter: BookingFilterInput, $pagination: PaginationInput) {
  bookings(filter: $filter, pagination: $pagination) {
    nodes {
      id
      facilityId
      userId
      facility {
        name
        type
      }
      user {
        firstName
        lastName
      }
      startTime
      endTime
      status
      notes
      participants
      createdAt
    }
    pageInfo {
      page
      pageSize
      total
      totalPages
      hasNextPage
      hasPrevPage
    }
  }
}
```

**Usage with Filter**:
```dart
// Get upcoming bookings for a user
Future<List<Booking>> getUpcomingBookings(String userId) async {
  final now = DateTime.now();

  final connection = await dataSource.getBookings(
    filters: {
      'userId': userId,
      'status': ['CONFIRMED', 'PENDING'],
      'startAfter': now.toIso8601String(),
    },
    page: 1,
    pageSize: 50,
  );

  return connection.bookings;
}

// Get bookings for a specific facility on a date
Future<List<Booking>> getFacilityBookings(
  String facilityId,
  DateTime date,
) async {
  final startOfDay = DateTime(date.year, date.month, date.day);
  final endOfDay = startOfDay.add(const Duration(days: 1));

  final connection = await dataSource.getBookings(
    filters: {
      'facilityId': facilityId,
      'startAfter': startOfDay.toIso8601String(),
      'startBefore': endOfDay.toIso8601String(),
      'status': ['CONFIRMED', 'CHECKED_IN'],
    },
  );

  return connection.bookings
      ..sort((a, b) => a.startTime.compareTo(b.startTime));
}
```

---

## Appendix: Quick Reference

### GraphQL Endpoint URLs

| Environment | HTTP URL | WebSocket URL |
|------------|----------|---------------|
| Development | `http://192.168.0.170:30080/graphql` | `ws://192.168.0.170:30080/graphql` |
| Staging | `https://staging-api.clubland.com/graphql` | `wss://staging-api.clubland.com/graphql` |
| Production | `https://api.clubland.com/graphql` | `wss://api.clubland.com/graphql` |

### Common Commands

```bash
# Code generation
dart run build_runner build --delete-conflicting-outputs

# Watch mode
dart run build_runner watch --delete-conflicting-outputs

# Clean generated files
dart run build_runner clean

# Test connectivity
curl http://192.168.0.170:30080/health

# GraphQL Playground (browser)
open http://192.168.0.170:30080/graphql
```

### Connection Patterns

| Type | Pattern | Use Case |
|------|---------|----------|
| **ClubConnection** | `nodes { ... }` | Offset pagination (simpler) |
| **EventConnection** | `edges { node { ... } }` | Cursor pagination (Relay-style) |
| **BookingConnection** | `nodes { ... }` | Offset pagination |
| **RSVPConnection** | `edges { node { ... } }` | Cursor pagination |

### Fetch Policies

| Policy | When to Use |
|--------|-------------|
| `cacheFirst` | Static data (clubs, facilities) |
| `networkOnly` | Dynamic data (availability, waitlist) |
| `cacheAndNetwork` | List views (show cached, then update) |
| `noCache` | Mutations, sensitive data |
| `cacheOnly` | Offline mode |

---

**Document Version**: 1.0
**Created**: November 12, 2025
**Status**: Production Ready
**Backend Version**: v0.1.1+
**Flutter SDK**: 3.37.0+
**GraphQL Package**: graphql_flutter ^5.1.2

---

## Related Documentation

- **FLUTTER_EVENT_FIELD_MAPPING.md** - Event-specific field mappings
- **FLUTTER_EVENT_RSVP_GUIDE.md** - Complete RSVP implementation guide
- **GRAPHQL_INTEGRATION.md** - General GraphQL integration patterns
- **API_DOCUMENTATION.md** - Complete API reference
- **BACKEND_INTEGRATION_GUIDE.md** - Backend GraphQL operations

---

**End of Flutter GraphQL Guide**
