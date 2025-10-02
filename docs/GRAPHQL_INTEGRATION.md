# GraphQL Integration Guide

## Overview

The Clubland platform uses GraphQL as its primary API interface through the API Gateway service. GraphQL provides a unified, type-safe, and efficient way to interact with all microservices while allowing clients to request exactly the data they need.

## API Gateway Architecture

### GraphQL Endpoint Information

- **Production**: `https://api.clubland.com/graphql`
- **Staging**: `https://staging-api.clubland.com/graphql`
- **Development**: `https://dev-api.clubland.com/graphql`
- **WebSocket (Subscriptions)**: `wss://api.clubland.com/graphql`
- **GraphiQL Playground**: Available in development environment

### Architecture Flow

```text
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Flutter Apps  │    │   Web Apps      │    │  Mobile Apps    │
│   (Admin/User)  │    │  (Dashboard)    │    │   (Native)      │
└─────────┬───────┘    └─────────┬───────┘    └─────────┬───────┘
          │                      │                      │
          └──────────────────────┼──────────────────────┘
                                 │
                    ┌────────────▼──────────────┐
                    │      API Gateway          │
                    │   (GraphQL Endpoint)      │
                    │ Schema + Resolvers        │
                    └────────────┬──────────────┘
                                 │ gRPC
          ┌──────────────────────┼──────────────────────┐
          │                      │                      │
    ┌─────▼──────┐     ┌─────────▼─────────┐     ┌──────▼─────┐
    │Auth Service│     │ Member Service    │     │Club Service│
    │  (gRPC)    │     │  (gRPC)           │     │  (gRPC)    │
    └────────────┘     └───────────────────┘     └────────────┘
```

## Core GraphQL Schema

### Authentication Types

```graphql
type User {
  id: ID!
  clubId: ID!
  email: String!
  username: String!
  firstName: String
  lastName: String
  status: UserStatus!
  roles: [String!]!
  permissions: [String!]!
  createdAt: Time!
  updatedAt: Time!
}

enum UserStatus {
  ACTIVE
  INACTIVE
  SUSPENDED
  PENDING_VERIFICATION
}

type AuthPayload {
  token: String!
  refreshToken: String!
  user: User!
  expiresAt: Time!
}

input LoginInput {
  email: String!
  password: String!
  clubId: ID
}

input RegisterInput {
  email: String!
  username: String!
  firstName: String!
  lastName: String!
  clubId: ID!
  password: String!
  confirmPassword: String!
}
```

### Member Management Types

```graphql
type Member {
  id: ID!
  clubId: ID!
  memberNumber: String!
  profile: MemberProfile!
  membership: Membership!
  status: MemberStatus!
  visits: [Visit!]!
  blockchainIdentity: String
  createdAt: Time!
  updatedAt: Time!
}

type MemberProfile {
  firstName: String!
  lastName: String!
  email: String!
  phone: String
  dateOfBirth: Date
  address: Address
  emergencyContact: EmergencyContact
  preferences: MemberPreferences!
}

type Membership {
  type: MembershipType!
  tier: MembershipTier!
  status: MembershipStatus!
  joinedAt: Time!
  expiresAt: Time
  reciprocalPrivileges: [ReciprocalPrivilege!]!
}

enum MemberStatus {
  ACTIVE
  INACTIVE
  SUSPENDED
  PENDING_APPROVAL
  EXPIRED
}

enum MembershipType {
  REGULAR
  ASSOCIATE
  CORPORATE
  HONORARY
  TEMPORARY
}

enum MembershipTier {
  STANDARD
  PREMIUM
  PLATINUM
  LIFETIME
}
```

### Club and Location Types

```graphql
type Club {
  id: ID!
  name: String!
  description: String
  location: Location!
  contactInfo: ContactInfo!
  amenities: [Amenity!]!
  policies: ClubPolicies!
  reciprocalAgreements: [ReciprocalAgreement!]!
  members: [Member!]!
  visits: [Visit!]!
  createdAt: Time!
  updatedAt: Time!
}

type Location {
  address: Address!
  coordinates: Coordinates
  timezone: String!
}

type Address {
  street: String!
  city: String!
  state: String!
  country: String!
  postalCode: String!
}

type Coordinates {
  latitude: Float!
  longitude: Float!
}

type ContactInfo {
  phone: String
  email: String
  website: String
  socialMedia: SocialMediaLinks
}
```

### Reciprocal Agreement Types

```graphql
type ReciprocalAgreement {
  id: ID!
  initiatingClub: Club!
  reciprocalClub: Club!
  status: AgreementStatus!
  terms: AgreementTerms!
  effectiveDate: Date!
  expiryDate: Date
  blockchainTxId: String
  createdAt: Time!
  updatedAt: Time!
}

type AgreementTerms {
  guestFees: [Fee!]!
  accessRestrictions: [String!]
  amenityAccess: [AmenityAccess!]!
  bookingRequirements: BookingRequirements
  reciprocityLimits: ReciprocityLimits
}

enum AgreementStatus {
  DRAFT
  PENDING_APPROVAL
  ACTIVE
  SUSPENDED
  TERMINATED
  EXPIRED
}
```

### Visit Management Types

```graphql
type Visit {
  id: ID!
  member: Member!
  club: Club!
  visitType: VisitType!
  status: VisitStatus!
  checkInTime: Time!
  checkOutTime: Time
  services: [Service!]!
  guests: [Guest!]!
  totalCost: Money!
  blockchainTxId: String!
  verified: Boolean!
  createdAt: Time!
  updatedAt: Time!
}

enum VisitType {
  RECIPROCAL
  MEMBER
  GUEST
  EVENT
}

enum VisitStatus {
  PENDING
  CHECKED_IN
  CHECKED_OUT
  CANCELLED
  NO_SHOW
}

type Service {
  id: ID!
  name: String!
  category: ServiceCategory!
  cost: Money!
  duration: Int # minutes
}

type Money {
  amount: Float!
  currency: Currency!
}
```

## Key GraphQL Operations

### Authentication Operations

```graphql
# User Login
mutation Login($input: LoginInput!) {
  login(input: $input) {
    token
    refreshToken
    user {
      id
      email
      username
      roles
      permissions
      clubId
    }
    expiresAt
  }
}

# User Registration
mutation Register($input: RegisterInput!) {
  register(input: $input) {
    token
    refreshToken
    user {
      id
      email
      username
      status
    }
    expiresAt
  }
}

# Token Refresh
mutation RefreshToken($refreshToken: String!) {
  refreshToken(refreshToken: $refreshToken) {
    token
    refreshToken
    expiresAt
  }
}

# Current User Query
query Me {
  me {
    id
    email
    firstName
    lastName
    clubId
    roles
    permissions
    status
  }
}

# Logout
mutation Logout {
  logout {
    success
    message
  }
}
```

### Member Management Operations

```graphql
# Get Members with Pagination
query GetMembers(
  $pagination: PaginationInput
  $filters: MemberFilters
  $sorting: SortingInput
) {
  members(pagination: $pagination, filters: $filters, sorting: $sorting) {
    nodes {
      id
      memberNumber
      profile {
        firstName
        lastName
        email
      }
      membership {
        type
        tier
        status
      }
      status
      createdAt
    }
    pageInfo {
      currentPage
      totalPages
      totalCount
      hasNextPage
      hasPreviousPage
    }
  }
}

# Create Member
mutation CreateMember($input: CreateMemberInput!) {
  createMember(input: $input) {
    id
    memberNumber
    profile {
      firstName
      lastName
      email
    }
    membership {
      type
      tier
      status
    }
    status
  }
}

# Update Member
mutation UpdateMember($id: ID!, $input: UpdateMemberInput!) {
  updateMember(id: $id, input: $input) {
    id
    profile {
      firstName
      lastName
      email
      phone
    }
    membership {
      type
      tier
    }
    updatedAt
  }
}

# Get Member Details
query GetMember($id: ID!) {
  member(id: $id) {
    id
    memberNumber
    profile {
      firstName
      lastName
      email
      phone
      address {
        street
        city
        state
        country
      }
    }
    membership {
      type
      tier
      status
      joinedAt
      expiresAt
    }
    visits(limit: 10) {
      id
      club { name }
      checkInTime
      status
    }
  }
}
```

### Club and Reciprocal Operations

```graphql
# Search Clubs
query SearchClubs(
  $searchTerm: String
  $location: LocationInput
  $radius: Float
  $filters: ClubFilters
) {
  searchClubs(
    searchTerm: $searchTerm
    location: $location
    radius: $radius
    filters: $filters
  ) {
    id
    name
    description
    location {
      address {
        city
        state
        country
      }
      coordinates {
        latitude
        longitude
      }
    }
    amenities {
      name
      category
    }
    reciprocalAgreements(status: ACTIVE) {
      id
      reciprocalClub {
        name
      }
    }
  }
}

# Create Reciprocal Agreement
mutation CreateReciprocalAgreement($input: CreateAgreementInput!) {
  createReciprocalAgreement(input: $input) {
    id
    initiatingClub {
      name
    }
    reciprocalClub {
      name
    }
    status
    terms {
      guestFees {
        amount
        currency
        feeType
      }
      accessRestrictions
    }
    blockchainTxId
  }
}
```

### Visit Management Operations

```graphql
# Record Visit
mutation RecordVisit($input: RecordVisitInput!) {
  recordVisit(input: $input) {
    id
    member {
      profile {
        firstName
        lastName
      }
    }
    club {
      name
    }
    visitType
    status
    checkInTime
    services {
      name
      cost {
        amount
        currency
      }
    }
    blockchainTxId
  }
}

# Get Visit History
query GetVisitHistory(
  $memberId: ID
  $clubId: ID
  $pagination: PaginationInput
  $filters: VisitFilters
) {
  visits(
    memberId: $memberId
    clubId: $clubId
    pagination: $pagination
    filters: $filters
  ) {
    nodes {
      id
      member {
        profile {
          firstName
          lastName
        }
      }
      club {
        name
        location {
          address {
            city
            state
          }
        }
      }
      visitType
      status
      checkInTime
      checkOutTime
      totalCost {
        amount
        currency
      }
      verified
    }
    pageInfo {
      totalCount
      hasNextPage
    }
  }
}

# Update Visit Status
mutation UpdateVisitStatus($id: ID!, $status: VisitStatus!, $checkOutTime: Time) {
  updateVisitStatus(id: $id, status: $status, checkOutTime: $checkOutTime) {
    id
    status
    checkOutTime
    totalCost {
      amount
      currency
    }
  }
}
```

## Real-time Subscriptions

### WebSocket Subscriptions

```graphql
# Visit Status Updates
subscription VisitStatusChanged($clubId: ID) {
  visitStatusChanged(clubId: $clubId) {
    id
    status
    member {
      profile {
        firstName
        lastName
      }
    }
    club {
      name
    }
    checkInTime
    services {
      name
    }
  }
}

# Member Status Updates
subscription MemberStatusChanged($clubId: ID) {
  memberStatusChanged(clubId: $clubId) {
    id
    memberNumber
    status
    profile {
      firstName
      lastName
    }
  }
}

# Reciprocal Agreement Updates
subscription AgreementUpdated($clubId: ID) {
  agreementUpdated(clubId: $clubId) {
    id
    status
    initiatingClub {
      name
    }
    reciprocalClub {
      name
    }
  }
}

# Live Notifications
subscription NotificationReceived($userId: ID) {
  notificationReceived(userId: $userId) {
    id
    type
    title
    message
    data
    status
    createdAt
  }
}

# System Events
subscription SystemEvents($clubId: ID) {
  systemEvents(clubId: $clubId) {
    id
    type
    message
    severity
    timestamp
    source
  }
}
```

## Pagination and Filtering

### Standard Pagination Pattern

```graphql
input PaginationInput {
  page: Int = 1
  limit: Int = 20
  offset: Int
}

type PageInfo {
  currentPage: Int!
  totalPages: Int!
  totalCount: Int!
  hasNextPage: Boolean!
  hasPreviousPage: Boolean!
  pageSize: Int!
}

input SortingInput {
  field: String!
  direction: SortDirection!
}

enum SortDirection {
  ASC
  DESC
}
```

### Filtering Examples

```graphql
input MemberFilters {
  status: [MemberStatus!]
  membershipType: [MembershipType!]
  membershipTier: [MembershipTier!]
  searchTerm: String
  joinedAfter: Date
  joinedBefore: Date
}

input VisitFilters {
  status: [VisitStatus!]
  visitType: [VisitType!]
  checkInAfter: Time
  checkInBefore: Time
  verified: Boolean
  minCost: Float
  maxCost: Float
}

input ClubFilters {
  amenities: [AmenityType!]
  membershipTypes: [MembershipType!]
  hasReciprocalAgreements: Boolean
  location: LocationFilters
}
```

## Error Handling

### GraphQL Error Format

```graphql
type Error {
  message: String!
  code: ErrorCode!
  field: String
  details: JSON
}

enum ErrorCode {
  VALIDATION_ERROR
  AUTHENTICATION_ERROR
  AUTHORIZATION_ERROR
  NOT_FOUND
  DUPLICATE_ENTRY
  BUSINESS_RULE_VIOLATION
  EXTERNAL_SERVICE_ERROR
  BLOCKCHAIN_ERROR
  RATE_LIMIT_EXCEEDED
}
```

### Error Response Example

```json
{
  "data": null,
  "errors": [
    {
      "message": "Member with this email already exists",
      "code": "DUPLICATE_ENTRY",
      "field": "email",
      "path": ["createMember"],
      "extensions": {
        "details": {
          "existingMemberId": "mem_123",
          "clubId": "club_456"
        }
      }
    }
  ]
}
```

## Performance Optimization

### Query Complexity Analysis

```graphql
# Query complexity scoring to prevent abuse
directive @cost(
  complexity: Int = 1
  multipliers: [String!]
  useMultipliers: Boolean = true
) on FIELD | FIELD_DEFINITION
```

### DataLoader Pattern

The API Gateway implements DataLoader pattern for efficient data fetching:

- **Batching**: Multiple requests combined into single database query
- **Caching**: Request-level caching to avoid duplicate queries
- **N+1 Prevention**: Eliminates common GraphQL performance issue

### Query Caching

```http
# Query caching headers
Cache-Control: public, max-age=300
ETag: "abc123def456"
Vary: Authorization
```

## Security Considerations

### Authentication Headers

```http
# Required for authenticated requests
Authorization: Bearer eyJhbGciOiJSUzI1NiIs...

# Optional for specific tenant context
X-Club-ID: club_123

# Rate limiting identifier
X-Client-ID: mobile_app_v1.0
```

### Query Depth Limiting

- Maximum query depth: 10 levels
- Query complexity limit: 1000 points
- Rate limiting: 1000 requests per minute per user

### Field-Level Authorization

```graphql
type Member {
  id: ID!
  memberNumber: String!
  profile: MemberProfile! @auth(requires: "member:read")
  financialInfo: FinancialInfo @auth(requires: "member:financial:read")
  privateNotes: [Note!] @auth(requires: "admin:notes:read")
}
```

## Flutter Client Implementation

### Type-Safe GraphQL with DocumentNode AST

The Clubland Flutter application uses a modern, type-safe approach to GraphQL integration using DocumentNode AST objects instead of traditional code generation.

#### Architecture Overview

```dart
lib/
├── core/
│   └── graphql/
│       ├── graphql_documents.dart    # Type-safe DocumentNode definitions
│       ├── graphql_client.dart       # GraphQL client setup
│       └── graphql_links.dart        # Auth, HTTP, WebSocket links
└── graphql/                          # GraphQL operation files (.graphql)
    ├── auth/
    │   ├── login.graphql
    │   ├── register.graphql
    │   └── refresh_token.graphql
    ├── clubs/
    │   ├── clubs_query.graphql
    │   ├── club_query.graphql
    │   └── my_club_query.graphql
    ├── bookings/
    │   └── ... (booking operations)
    ├── social/
    │   └── ... (social operations)
    └── subscriptions/
        ├── notification_received.graphql
        ├── visit_status_changed.graphql
        └── transaction_status_changed.graphql
```

#### GraphQLDocuments Class

The `GraphQLDocuments` class provides centralized, type-safe access to all GraphQL operations:

```dart
import 'package:gql/ast.dart';
import 'package:gql/language.dart' as gql;

/// Type-safe GraphQL operations using DocumentNode AST objects.
class GraphQLDocuments {
  // Authentication Operations
  static final DocumentNode loginMutation = gql.parseString(r'''
    mutation Login($email: String!, $password: String!) {
      login(input: { email: $email, password: $password }) {
        token
        refreshToken
        expiresAt
        user { id email username firstName lastName }
      }
    }
  ''');

  static final DocumentNode registerMutation = gql.parseString(r'''
    mutation Register($email: String!, $password: String!, ...) {
      register(input: { ... }) {
        token
        user { id email }
      }
    }
  ''');

  // Club Operations
  static final DocumentNode clubsQuery = gql.parseString(r'''
    query Clubs {
      clubs {
        id name description location
        settings { allowReciprocal requireApproval }
      }
    }
  ''');

  // Subscription Operations
  static final DocumentNode notificationReceivedSubscription = gql.parseString(r'''
    subscription NotificationReceived {
      notificationReceived {
        id type title message createdAt
      }
    }
  ''');
}
```

#### Usage Examples

**Query Execution:**
```dart
import 'package:clubland/core/graphql/graphql_documents.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

// Execute query
final result = await client.query(
  QueryOptions(
    document: GraphQLDocuments.clubsQuery,
    fetchPolicy: FetchPolicy.networkOnly,
  ),
);

if (result.hasException) {
  // Handle error
  print('Error: ${result.exception}');
} else {
  final clubs = result.data?['clubs'] as List;
  // Process data
}
```

**Mutation Execution:**
```dart
// Execute mutation
final result = await client.mutate(
  MutationOptions(
    document: GraphQLDocuments.loginMutation,
    variables: {
      'email': 'user@example.com',
      'password': 'secure_password',
    },
  ),
);

if (!result.hasException) {
  final authData = result.data?['login'];
  final token = authData['token'];
  final user = authData['user'];
  // Handle successful login
}
```

**Subscription Usage:**
```dart
// Subscribe to real-time updates
final stream = client.subscribe(
  SubscriptionOptions(
    document: GraphQLDocuments.notificationReceivedSubscription,
  ),
);

// Listen to stream
stream.listen((result) {
  if (!result.hasException && result.data != null) {
    final notification = result.data!['notificationReceived'];
    // Handle real-time notification
  }
});
```

#### Benefits of DocumentNode Approach

**1. Type Safety Without Code Generation:**
- No dependency conflicts (eliminated Artemis, Ferry, gql_build)
- Parse operations at compile-time using `gql.parseString()`
- Type-safe AST objects instead of raw strings

**2. Compile-Time Validation:**
- GraphQL syntax errors caught during compilation
- Invalid operations fail at build time, not runtime
- Better developer experience with immediate feedback

**3. Better IDE Support:**
- Auto-completion for GraphQL operations
- Jump to definition for operation usage
- Refactoring support across codebase

**4. Organized Structure:**
- Operations organized by feature in `lib/graphql/` directory
- Single source of truth in `GraphQLDocuments` class
- Easy to find and update operations

**5. No Build Runner Dependency:**
- No need to run `dart run build_runner build` for GraphQL
- Faster development workflow
- Simpler CI/CD pipeline

#### Migration Guide

**From Raw Strings (Old):**
```dart
// Deprecated approach
final String loginMutation = '''
  mutation Login($email: String!, $password: String!) {
    login(input: { email: $email, password: $password }) {
      token
      user { id email }
    }
  }
''';

// Usage (unsafe)
final result = await client.mutate(
  MutationOptions(
    document: gql(loginMutation),  // Parsing at runtime
    variables: variables,
  ),
);
```

**To DocumentNode (New):**
```dart
// Modern type-safe approach
class GraphQLDocuments {
  static final DocumentNode loginMutation = gql.parseString(r'''
    mutation Login($email: String!, $password: String!) {
      login(input: { email: $email, password: $password }) {
        token
        user { id email }
      }
    }
  ''');
}

// Usage (type-safe)
final result = await client.mutate(
  MutationOptions(
    document: GraphQLDocuments.loginMutation,  // Pre-parsed AST
    variables: variables,
  ),
);
```

#### Integration with Data Layer

**Repository Pattern:**
```dart
class AuthRepository {
  final GraphQLClient _client;

  Future<AuthResult> login(String email, String password) async {
    final result = await _client.mutate(
      MutationOptions(
        document: GraphQLDocuments.loginMutation,
        variables: {
          'email': email,
          'password': password,
        },
      ),
    );

    if (result.hasException) {
      throw _handleException(result.exception!);
    }

    return AuthResult.fromJson(result.data!['login']);
  }
}
```

**With Riverpod:**
```dart
@riverpod
Future<List<Club>> clubs(Ref ref) async {
  final client = ref.watch(graphQLClientProvider);

  final result = await client.query(
    QueryOptions(
      document: GraphQLDocuments.clubsQuery,
    ),
  );

  if (result.hasException) {
    throw NetworkException(result.exception.toString());
  }

  return (result.data!['clubs'] as List)
      .map((json) => Club.fromJson(json))
      .toList();
}
```

#### Best Practices

1. **Operation Organization:**
   - Keep `.graphql` files organized by feature
   - One operation per file for clarity
   - Use descriptive names (e.g., `login.graphql`, `clubs_query.graphql`)

2. **DocumentNode Definitions:**
   - Define all operations in `GraphQLDocuments` class
   - Use static final fields for immutability
   - Add doc comments for operation purpose

3. **Error Handling:**
   - Always check `result.hasException`
   - Map GraphQL errors to domain-specific exceptions
   - Provide meaningful error messages to users

4. **Performance:**
   - Use appropriate fetch policies (`networkOnly`, `cacheFirst`, etc.)
   - Implement pagination for large data sets
   - Leverage subscriptions for real-time updates

5. **Testing:**
   - Mock GraphQL client in tests
   - Test error scenarios
   - Verify variable passing
   - Test subscription streams

## Next Steps

1. **Implement**: [Authentication & Security](./AUTHENTICATION_SECURITY.md) for JWT handling
2. **Build**: [Flutter Integration](./FLUTTER_INTEGRATION.md) for client implementation
3. **Monitor**: [Testing & Deployment](./TESTING_DEPLOYMENT.md) for production setup
4. **Optimize**: [Backend Architecture](./BACKEND_ARCHITECTURE.md) for scaling patterns
