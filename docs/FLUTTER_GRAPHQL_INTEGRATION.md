# Flutter GraphQL Integration Guide for Reciprocal Clubs Platform

## Overview

This guide provides comprehensive instructions for integrating Flutter applications with the Reciprocal Clubs GraphQL API. The platform uses GraphQL as its primary API interface, providing type-safe, efficient data fetching with real-time capabilities.

## GraphQL Client Setup

### 1. Dependencies

Add these dependencies to your `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter

  # GraphQL Core
  graphql_flutter: ^5.1.2
  gql: ^0.14.0

  # Code Generation
  graphql_codegen: ^0.13.3
  build_runner: ^2.4.6
  json_annotation: ^4.8.1

  # HTTP and WebSocket
  http: ^1.1.0
  web_socket_channel: ^2.4.0

  # State Management
  flutter_riverpod: ^2.4.0
  riverpod_annotation: ^2.1.1

  # Secure Storage
  flutter_secure_storage: ^9.0.0

  # Utilities
  freezed_annotation: ^2.4.1

dev_dependencies:
  # Code Generation
  freezed: ^2.4.6
  json_serializable: ^6.7.1
  riverpod_generator: ^2.2.3
  build_runner: ^2.4.6
  graphql_codegen: ^0.13.3
```

### 2. GraphQL Code Generation Setup

Create `build.yaml` in the project root:

```yaml
targets:
  $default:
    builders:
      graphql_codegen:
        options:
          # GraphQL endpoint for introspection
          schema: "https://api.reciprocal-clubs.com/graphql"
          # Generate typed queries, mutations, and subscriptions
          queries_glob: "lib/**/*.graphql"
          # Output directory
          output_dir: "lib/generated/"
          # Dart naming conventions
          naming_convention: "pathedFields"
          # Generate Freezed classes
          generate_helpers: true
          # Custom scalars
          scalar_mapping:
            Time: "DateTime"
            ID: "String"
```

### 3. GraphQL Schema Files

Create a `schema/` directory and store your GraphQL operations:

```text
lib/
├── schema/
│   ├── auth.graphql
│   ├── members.graphql
│   ├── clubs.graphql
│   ├── visits.graphql
│   └── subscriptions.graphql
└── generated/
    ├── auth.graphql.dart
    ├── members.graphql.dart
    └── ...
```

#### Example: `lib/schema/auth.graphql`

```graphql
mutation Login($input: LoginInput!) {
  login(input: $input) {
    token
    refreshToken
    expiresAt
    user {
      id
      email
      username
      firstName
      lastName
      clubId
      roles
      permissions
      status
    }
  }
}

query Me {
  me {
    id
    email
    username
    firstName
    lastName
    clubId
    status
    roles
    permissions
  }
}

mutation RefreshToken($refreshToken: String!) {
  refreshToken(refreshToken: $refreshToken) {
    token
    refreshToken
    expiresAt
    user {
      id
      email
      status
    }
  }
}
```

#### Example: `lib/schema/members.graphql`

```graphql
query GetMembers($pagination: PaginationInput, $status: MemberStatus) {
  members(pagination: $pagination, status: $status) {
    nodes {
      id
      memberNumber
      membershipType
      status
      profile {
        firstName
        lastName
        phoneNumber
        address {
          street
          city
          state
          country
        }
      }
      joinedAt
      blockchainIdentity
    }
    pageInfo {
      page
      pageSize
      total
      hasNextPage
    }
  }
}

query GetMemberByNumber($memberNumber: String!) {
  memberByNumber(memberNumber: $memberNumber) {
    id
    memberNumber
    membershipType
    status
    profile {
      firstName
      lastName
      phoneNumber
      address {
        street
        city
        state
        postalCode
        country
      }
      emergencyContact {
        name
        relationship
        phoneNumber
      }
    }
    blockchainIdentity
    joinedAt
  }
}

mutation UpdateMember($id: ID!, $input: MemberProfileInput!) {
  updateMember(id: $id, input: $input) {
    id
    memberNumber
    profile {
      firstName
      lastName
      phoneNumber
      preferences {
        emailNotifications
        smsNotifications
      }
    }
    updatedAt
  }
}
```

#### Example: `lib/schema/subscriptions.graphql`

```graphql
subscription NotificationReceived {
  notificationReceived {
    id
    type
    title
    message
    status
    createdAt
  }
}

subscription VisitStatusChanged($clubId: ID) {
  visitStatusChanged(clubId: $clubId) {
    id
    status
    memberId
    checkInTime
    checkOutTime
    services
  }
}

subscription TransactionStatusChanged {
  transactionStatusChanged {
    id
    type
    status
    txId
    blockNumber
    error
  }
}
```

## GraphQL Client Configuration

### 1. GraphQL Client Provider

```dart
// lib/core/graphql/graphql_client.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final graphqlClientProvider = Provider<GraphQLClient>((ref) {
  final authLink = AuthLink(
    getToken: () async {
      const storage = FlutterSecureStorage();
      final token = await storage.read(key: 'auth_token');
      return token != null ? 'Bearer $token' : null;
    },
  );

  final httpLink = HttpLink(
    'https://api.reciprocal-clubs.com/graphql',
    defaultHeaders: {
      'Content-Type': 'application/json',
    },
  );

  final wsLink = WebSocketLink(
    'wss://api.reciprocal-clubs.com/graphql',
    config: SocketClientConfig(
      autoReconnect: true,
      inactivityTimeout: Duration(seconds: 30),
      initialPayload: () async {
        const storage = FlutterSecureStorage();
        final token = await storage.read(key: 'auth_token');
        return {'authorization': token != null ? 'Bearer $token' : null};
      },
    ),
  );

  final link = Link.split(
    (request) => request.isSubscription,
    wsLink,
    authLink.concat(httpLink),
  );

  return GraphQLClient(
    link: link,
    cache: GraphQLCache(store: InMemoryStore()),
    defaultPolicies: DefaultPolicies(
      watchQuery: Policies(
        fetch: FetchPolicy.cacheAndNetwork,
        error: ErrorPolicy.all,
        cacheReread: CacheRereadPolicy.mergeOptimistic,
      ),
      query: Policies(
        fetch: FetchPolicy.cacheFirst,
        error: ErrorPolicy.all,
      ),
      mutate: Policies(
        fetch: FetchPolicy.networkOnly,
        error: ErrorPolicy.all,
      ),
    ),
  );
});

// GraphQL Provider Wrapper
final graphqlProvider = Provider<GraphQLClient>((ref) {
  return ref.watch(graphqlClientProvider);
});
```

### 2. Authentication Service with GraphQL

```dart
// lib/features/auth/services/auth_service.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../generated/auth.graphql.dart';

class AuthService {
  final GraphQLClient _client;
  final FlutterSecureStorage _storage;

  AuthService(this._client, this._storage);

  Future<LoginResult> login(String email, String password) async {
    final options = MutationOptions$Login(
      variables: Variables$Mutation$Login(
        input: Input$LoginInput(
          email: email,
          password: password,
        ),
      ),
    );

    final result = await _client.mutate(options);

    if (result.hasException) {
      throw AuthException(result.exception.toString());
    }

    final loginData = result.parsedData?.login;
    if (loginData == null) {
      throw AuthException('Login failed: No data received');
    }

    // Store tokens securely
    await _storage.write(key: 'auth_token', value: loginData.token);
    await _storage.write(key: 'refresh_token', value: loginData.refreshToken);

    return LoginResult(
      token: loginData.token,
      user: loginData.user,
      expiresAt: loginData.expiresAt,
    );
  }

  Future<User?> getCurrentUser() async {
    final options = QueryOptions$Me();
    final result = await _client.query(options);

    if (result.hasException) {
      return null;
    }

    return result.parsedData?.me;
  }

  Future<void> logout() async {
    await _storage.deleteAll();
    // Clear GraphQL cache
    await _client.cache.store.reset();
  }

  Future<bool> refreshToken() async {
    final refreshToken = await _storage.read(key: 'refresh_token');
    if (refreshToken == null) return false;

    final options = MutationOptions$RefreshToken(
      variables: Variables$Mutation$RefreshToken(
        refreshToken: refreshToken,
      ),
    );

    final result = await _client.mutate(options);

    if (result.hasException) {
      await logout();
      return false;
    }

    final refreshData = result.parsedData?.refreshToken;
    if (refreshData == null) return false;

    await _storage.write(key: 'auth_token', value: refreshData.token);
    await _storage.write(key: 'refresh_token', value: refreshData.refreshToken);

    return true;
  }
}

// Provider
final authServiceProvider = Provider<AuthService>((ref) {
  final client = ref.watch(graphqlProvider);
  return AuthService(client, const FlutterSecureStorage());
});

// Auth State Provider
@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  Future<User?> build() async {
    final authService = ref.read(authServiceProvider);
    return await authService.getCurrentUser();
  }

  Future<void> login(String email, String password) async {
    state = const AsyncLoading();

    try {
      final authService = ref.read(authServiceProvider);
      final result = await authService.login(email, password);
      state = AsyncData(result.user);
    } on Exception catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }

  Future<void> logout() async {
    final authService = ref.read(authServiceProvider);
    await authService.logout();
    state = const AsyncData(null);
  }
}

// Data classes
class LoginResult {
  final String token;
  final User user;
  final DateTime expiresAt;

  LoginResult({
    required this.token,
    required this.user,
    required this.expiresAt,
  });
}

class AuthException implements Exception {
  final String message;
  AuthException(this.message);
}
```

### 3. Data Repository with GraphQL

```dart
// lib/features/members/repositories/member_repository.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../../generated/members.graphql.dart';

class MemberRepository {
  final GraphQLClient _client;

  MemberRepository(this._client);

  Future<MemberConnection> getMembers({
    int page = 1,
    int pageSize = 20,
    MemberStatus? status,
  }) async {
    final options = QueryOptions$GetMembers(
      variables: Variables$Query$GetMembers(
        pagination: Input$PaginationInput(
          page: page,
          pageSize: pageSize,
        ),
        status: status,
      ),
      fetchPolicy: FetchPolicy.cacheAndNetwork,
    );

    final result = await _client.query(options);

    if (result.hasException) {
      throw RepositoryException(result.exception.toString());
    }

    final data = result.parsedData?.members;
    if (data == null) {
      throw RepositoryException('No data received');
    }

    return data;
  }

  Future<Member?> getMemberByNumber(String memberNumber) async {
    final options = QueryOptions$GetMemberByNumber(
      variables: Variables$Query$GetMemberByNumber(
        memberNumber: memberNumber,
      ),
      fetchPolicy: FetchPolicy.cacheFirst,
    );

    final result = await _client.query(options);

    if (result.hasException) {
      throw RepositoryException(result.exception.toString());
    }

    return result.parsedData?.memberByNumber;
  }

  Future<Member> updateMember(String id, MemberProfileInput input) async {
    final options = MutationOptions$UpdateMember(
      variables: Variables$Mutation$UpdateMember(
        id: id,
        input: input,
      ),
    );

    final result = await _client.mutate(options);

    if (result.hasException) {
      throw RepositoryException(result.exception.toString());
    }

    final data = result.parsedData?.updateMember;
    if (data == null) {
      throw RepositoryException('Update failed: No data received');
    }

    return data;
  }

  Stream<Member> watchMemberUpdates(String memberId) {
    // This would require a custom subscription
    // For now, using polling with cache
    return Stream.periodic(Duration(seconds: 30), (i) async {
      final member = await getMemberByNumber(memberId);
      return member;
    }).asyncMap((future) => future).where((member) => member != null).cast<Member>();
  }
}

// Provider
final memberRepositoryProvider = Provider<MemberRepository>((ref) {
  final client = ref.watch(graphqlProvider);
  return MemberRepository(client);
});

class RepositoryException implements Exception {
  final String message;
  RepositoryException(this.message);
}
```

### 4. GraphQL Widgets and Hooks

```dart
// lib/shared/widgets/graphql_widgets.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

// Query Widget
class GraphQLQueryWidget<T> extends ConsumerWidget {
  final QueryOptions options;
  final Widget Function(BuildContext context, T data) builder;
  final Widget Function(BuildContext context)? loading;
  final Widget Function(BuildContext context, OperationException error)? error;

  const GraphQLQueryWidget({
    Key? key,
    required this.options,
    required this.builder,
    this.loading,
    this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Query(
      options: options,
      builder: (result, {refetch, fetchMore}) {
        if (result.hasException) {
          return error?.call(context, result.exception!) ??
              ErrorWidget(result.exception.toString());
        }

        if (result.isLoading && result.data == null) {
          return loading?.call(context) ??
              const Center(child: CircularProgressIndicator());
        }

        if (result.data == null) {
          return const Center(child: Text('No data'));
        }

        return builder(context, result.data as T);
      },
    );
  }
}

// Mutation Hook
mixin GraphQLMutationMixin<T extends ConsumerStatefulWidget> on ConsumerState<T> {
  bool _isLoading = false;
  String? _error;

  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<R?> executeMutation<R>(
    MutationOptions options,
    R Function(Map<String, dynamic>) parser,
  ) async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final client = ref.read(graphqlProvider);
      final result = await client.mutate(options);

      if (result.hasException) {
        setState(() {
          _error = result.exception.toString();
          _isLoading = false;
        });
        return null;
      }

      final data = parser(result.data!);
      setState(() {
        _isLoading = false;
      });
      return data;
    } on Exception catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
      return null;
    }
  }
}

// Subscription Widget
class GraphQLSubscriptionWidget<T> extends ConsumerWidget {
  final SubscriptionOptions options;
  final Widget Function(BuildContext context, T? data, bool isLoading) builder;

  const GraphQLSubscriptionWidget({
    Key? key,
    required this.options,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Subscription(
      options: options,
      builder: (result) {
        return builder(
          context,
          result.data as T?,
          result.isLoading,
        );
      },
    );
  }
}
```

### 5. Real-time Subscriptions

```dart
// lib/features/notifications/services/notification_service.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../../generated/subscriptions.graphql.dart';

class NotificationService {
  final GraphQLClient _client;

  NotificationService(this._client);

  Stream<Notification> watchNotifications() {
    final options = SubscriptionOptions$NotificationReceived();

    return _client.subscribe(options).map((result) {
      if (result.hasException || result.data == null) {
        throw Exception('Subscription error: ${result.exception}');
      }

      return result.parsedData!.notificationReceived;
    });
  }

  Stream<Visit> watchVisitStatusChanges(String? clubId) {
    final options = SubscriptionOptions$VisitStatusChanged(
      variables: Variables$Subscription$VisitStatusChanged(
        clubId: clubId,
      ),
    );

    return _client.subscribe(options).map((result) {
      if (result.hasException || result.data == null) {
        throw Exception('Subscription error: ${result.exception}');
      }

      return result.parsedData!.visitStatusChanged;
    });
  }
}

// Riverpod Stream Provider
final notificationStreamProvider = StreamProvider<Notification>((ref) {
  final client = ref.watch(graphqlProvider);
  final service = NotificationService(client);
  return service.watchNotifications();
});

final visitStatusStreamProvider = StreamProvider.family<Visit, String?>((ref, clubId) {
  final client = ref.watch(graphqlProvider);
  final service = NotificationService(client);
  return service.watchVisitStatusChanges(clubId);
});
```

### 6. Error Handling and Retry Logic

```dart
// lib/core/graphql/graphql_error_handler.dart
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLErrorHandler {
  static String getErrorMessage(OperationException exception) {
    if (exception.graphqlErrors.isNotEmpty) {
      final graphqlError = exception.graphqlErrors.first;

      // Handle specific GraphQL error codes
      switch (graphqlError.extensions?['code']) {
        case 'UNAUTHENTICATED':
          return 'Please log in to continue';
        case 'UNAUTHORIZED':
          return 'You don\'t have permission to perform this action';
        case 'VALIDATION_ERROR':
          return 'Please check your input and try again';
        case 'NOT_FOUND':
          return 'The requested resource was not found';
        case 'RATE_LIMITED':
          return 'Too many requests. Please wait and try again';
        case 'BLOCKCHAIN_ERROR':
          return 'Blockchain operation failed. Please try again';
        default:
          return graphqlError.message;
      }
    }

    if (exception.linkException != null) {
      if (exception.linkException is NetworkException) {
        return 'Network error. Please check your connection';
      }
      if (exception.linkException is ServerException) {
        return 'Server error. Please try again later';
      }
    }

    return 'An unexpected error occurred';
  }

  static bool shouldRetry(OperationException exception) {
    // Retry on network errors or temporary server errors
    if (exception.linkException is NetworkException) return true;
    if (exception.linkException is ServerException) {
      final statusCode = (exception.linkException as ServerException).response.statusCode;
      return statusCode >= 500;
    }

    // Don't retry on GraphQL errors (they're usually client-side issues)
    return false;
  }
}

// Retry Link
class RetryLink extends Link {
  final int maxRetries;
  final Duration delay;

  RetryLink({this.maxRetries = 3, this.delay = const Duration(seconds: 1)});

  @override
  Stream<Response> request(Request request, [NextLink? forward]) {
    return forward!(request).handleError((error) async {
      if (error is OperationException && GraphQLErrorHandler.shouldRetry(error)) {
        for (int i = 0; i < maxRetries; i++) {
          await Future.delayed(delay * (i + 1));
          try {
            return await forward(request).first;
          } catch (retryError) {
            if (i == maxRetries - 1) rethrow;
          }
        }
      }
      throw error;
    });
  }
}
```

### 7. Code Generation Commands

Add these scripts to your development workflow:

```bash
# Generate GraphQL code
flutter packages pub run build_runner build --delete-conflicting-outputs

# Watch for changes and regenerate
flutter packages pub run build_runner watch --delete-conflicting-outputs

# Clean generated files
flutter packages pub run build_runner clean
```

### 8. Testing GraphQL Operations

```dart
// test/features/auth/auth_service_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class MockGraphQLClient extends Mock implements GraphQLClient {}

void main() {
  group('AuthService Tests', () {
    late MockGraphQLClient mockClient;
    late AuthService authService;

    setUp(() {
      mockClient = MockGraphQLClient();
      authService = AuthService(mockClient, const FlutterSecureStorage());
    });

    test('login success', () async {
      // Mock successful login response
      final mockResult = QueryResult(
        data: {
          'login': {
            'token': 'mock_token',
            'refreshToken': 'mock_refresh',
            'expiresAt': '2024-01-16T10:30:00Z',
            'user': {
              'id': 'user_001',
              'email': 'test@example.com',
              'username': 'testuser',
            }
          }
        },
        source: QueryResultSource.network,
        options: MutationOptions$Login(),
      );

      when(mockClient.mutate(any)).thenAnswer((_) async => mockResult);

      final result = await authService.login('test@example.com', 'password');

      expect(result.token, 'mock_token');
      expect(result.user.email, 'test@example.com');
      verify(mockClient.mutate(any)).called(1);
    });

    test('login failure', () async {
      final mockResult = QueryResult(
        exception: OperationException(graphqlErrors: [
          GraphQLError(message: 'Invalid credentials')
        ]),
        source: QueryResultSource.network,
        options: MutationOptions$Login(),
      );

      when(mockClient.mutate(any)).thenAnswer((_) async => mockResult);

      expect(
        () => authService.login('test@example.com', 'wrong_password'),
        throwsA(isA<AuthException>()),
      );
    });
  });
}
```

This comprehensive GraphQL integration guide provides everything needed to build Flutter applications that efficiently interact with the Reciprocal Clubs GraphQL API, including authentication, real-time subscriptions, error handling, and testing strategies.
