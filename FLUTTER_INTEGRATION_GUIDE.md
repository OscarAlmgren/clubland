# Reciprocal Clubs Backend - Flutter Integration Guide

**Backend Server**: henrybook (192.168.0.170)
**Deployment Status**: ✅ FULLY OPERATIONAL - All 9 Services Running
**Last Updated**: October 31, 2025

---

## Quick Start - API Access

### Base URLs

```dart
// HTTP/REST API
const String apiBaseUrl = 'http://192.168.0.170:30080';

// GraphQL API
const String graphqlUrl = 'http://192.168.0.170:30080/graphql';

// gRPC (if needed)
const String grpcUrl = '192.168.0.170:30090';
```

### Health Check Endpoint

```dart
// Test backend connectivity
GET http://192.168.0.170:30080/health

// Expected Response:
{
  "status": "healthy",
  "timestamp": "2025-10-20T12:00:00Z",
  "version": "v0.1.0-beta",
  "services": {
    "database": "healthy",
    "redis": "healthy",
    "nats": "healthy"
  }
}
```

---

## Available Services (9 Microservices)

### 1. API Gateway (Your Main Entry Point)
- **HTTP**: `http://192.168.0.170:30080`
- **GraphQL**: `http://192.168.0.170:30080/graphql`
- **gRPC**: `192.168.0.170:30090`
- **Purpose**: Single entry point for all backend operations
- **Features**: GraphQL API, REST endpoints, authentication, rate limiting

### 2. Authentication Service
- **Endpoint**: Via API Gateway
- **Features**: Passkey authentication (WebAuthn/FIDO2), JWT tokens, multi-tenant
- **Key Operations**: Login, register, token refresh, user management

### 3. Member Service
- **Endpoint**: Via API Gateway
- **Features**: Member profile management, club membership
- **Key Operations**: Create/update members, membership management, profile queries

### 4. Reciprocal Service
- **Endpoint**: Via API Gateway
- **Features**: Club agreements, visit management
- **Key Operations**: Create agreements, request/confirm visits, check-in/check-out, QR codes

### 5. Blockchain Service
- **Endpoint**: Via API Gateway
- **Features**: Hyperledger Fabric integration, immutable records
- **Key Operations**: Record transactions, query blockchain history

### 6. Notification Service
- **Endpoint**: Via API Gateway
- **Features**: Multi-channel notifications (email, SMS, push, in-app)
- **Key Operations**: Send notifications, manage preferences, templates

### 7. Analytics Service
- **Endpoint**: Via API Gateway
- **Features**: Usage analytics, reporting, dashboards
- **Key Operations**: Track events, generate reports, export data

### 8. Governance Service
- **Endpoint**: Via API Gateway
- **Features**: Proposals, voting, governance policies
- **Key Operations**: Create proposals, vote, manage policies

### 9. Booking Service
- **Endpoint**: Via API Gateway
- **Features**: Facility bookings, restaurant reservations, event management
- **Key Operations**: Book facilities, check availability, manage reservations, check-in/check-out

---

## API Integration Examples

### GraphQL Setup (Recommended)

```dart
// pubspec.yaml
dependencies:
  graphql_flutter: ^5.1.0

// graphql_client.dart
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLService {
  static final HttpLink httpLink = HttpLink(
    'http://192.168.0.170:30080/graphql',
  );

  static final AuthLink authLink = AuthLink(
    getToken: () async => 'Bearer ${await getStoredToken()}',
  );

  static final Link link = authLink.concat(httpLink);

  static final GraphQLClient client = GraphQLClient(
    cache: GraphQLCache(),
    link: link,
  );
}
```

### REST API Setup (Alternative)

```dart
// pubspec.yaml
dependencies:
  dio: ^5.4.0

// api_service.dart
import 'package:dio/dio.dart';

class ApiService {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://192.168.0.170:30080',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );

  // Add JWT token to requests
  static void setAuthToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  // Health check
  static Future<Map<String, dynamic>> checkHealth() async {
    final response = await _dio.get('/health');
    return response.data;
  }
}
```

---

## Authentication Flow

### 1. Register User

```dart
// GraphQL Mutation
const String registerMutation = '''
  mutation RegisterUser(\$input: RegisterInput!) {
    register(input: \$input) {
      user {
        id
        email
        clubId
        roles
      }
      accessToken
      refreshToken
    }
  }
''';

// Usage
final result = await GraphQLService.client.mutate(
  MutationOptions(
    document: gql(registerMutation),
    variables: {
      'input': {
        'email': 'user@example.com',
        'password': 'SecurePass123!',
        'clubId': 'club-uuid',
        'firstName': 'John',
        'lastName': 'Doe',
      }
    },
  ),
);
```

### 2. Login (Passkey Authentication)

```dart
// REST API Example
Future<Map<String, dynamic>> login(String email, String password) async {
  final response = await ApiService._dio.post(
    '/api/v1/auth/login',
    data: {
      'email': email,
      'password': password,
    },
  );

  // Store tokens
  final accessToken = response.data['accessToken'];
  final refreshToken = response.data['refreshToken'];

  await secureStorage.write(key: 'access_token', value: accessToken);
  await secureStorage.write(key: 'refresh_token', value: refreshToken);

  ApiService.setAuthToken(accessToken);

  return response.data;
}
```

### 3. Token Refresh

```dart
Future<void> refreshToken() async {
  final refreshToken = await secureStorage.read(key: 'refresh_token');

  final response = await ApiService._dio.post(
    '/api/v1/auth/refresh',
    data: {'refreshToken': refreshToken},
  );

  final newAccessToken = response.data['accessToken'];
  await secureStorage.write(key: 'access_token', value: newAccessToken);
  ApiService.setAuthToken(newAccessToken);
}
```

---

## Complete GraphQL Operations Reference

### Authentication Operations

#### Login
```dart
const String loginMutation = '''
  mutation Login(\$input: LoginInput!) {
    login(input: \$input) {
      token
      refreshToken
      user {
        id
        clubId
        email
        username
        firstName
        lastName
        status
        roles
        permissions
      }
      expiresAt
    }
  }
''';

// Usage
final result = await client.mutate(
  MutationOptions(
    document: gql(loginMutation),
    variables: {
      'input': {
        'email': 'user@example.com',
        'password': 'SecurePass123!',
      }
    },
  ),
);
```

#### Register
```dart
const String registerMutation = '''
  mutation Register(\$input: RegisterInput!) {
    register(input: \$input) {
      token
      refreshToken
      user {
        id
        clubId
        email
        username
        firstName
        lastName
      }
      expiresAt
    }
  }
''';
```

#### Get Current User
```dart
const String meQuery = '''
  query Me {
    me {
      id
      clubId
      email
      username
      firstName
      lastName
      status
      roles
      permissions
      createdAt
      updatedAt
    }
  }
''';
```

### Club Operations

#### Get Clubs
```dart
const String clubsQuery = '''
  query GetClubs(\$filter: ClubFilterInput, \$pagination: PaginationInput) {
    clubs(filter: \$filter, pagination: \$pagination) {
      nodes {
        id
        name
        slug
        description
        location
        website
        logo
        coverImage
        address
        contactEmail
        contactPhone
        status
        settings {
          allowReciprocal
          requireApproval
          maxVisitsPerMonth
          reciprocalFee
          enablePasskeyAuth
        }
        createdAt
      }
      pageInfo {
        page
        pageSize
        total
        totalPages
        hasNextPage
      }
    }
  }
''';
```

#### Get Single Club
```dart
const String clubQuery = '''
  query GetClub(\$id: ID, \$slug: String) {
    club(id: \$id, slug: \$slug) {
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
        status
      }
      settings {
        allowReciprocal
        maxVisitsPerMonth
      }
    }
  }
''';
```

#### Create Club
```dart
const String createClubMutation = '''
  mutation CreateClub(\$input: CreateClubInput!) {
    createClub(input: \$input) {
      id
      name
      slug
      location
      status
    }
  }
''';
```

### Member Operations

#### Get Members
```dart
const String membersQuery = '''
  query GetMembers(\$pagination: PaginationInput, \$status: MemberStatus) {
    members(pagination: \$pagination, status: \$status) {
      nodes {
        id
        clubId
        userId
        memberNumber
        membershipType
        status
        blockchainIdentity
        profile {
          firstName
          lastName
          dateOfBirth
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
          preferences {
            emailNotifications
            smsNotifications
            pushNotifications
          }
        }
        joinedAt
        createdAt
      }
      pageInfo {
        page
        total
        hasNextPage
      }
    }
  }
''';
```

#### Get Single Member
```dart
const String memberQuery = '''
  query GetMember(\$id: ID!) {
    member(id: \$id) {
      id
      clubId
      userId
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
        }
      }
      joinedAt
    }
  }
''';
```

#### Create Member
```dart
const String createMemberMutation = '''
  mutation CreateMember(\$input: CreateMemberInput!) {
    createMember(input: \$input) {
      id
      memberNumber
      membershipType
      status
      profile {
        firstName
        lastName
      }
    }
  }
''';

// Usage
final result = await client.mutate(
  MutationOptions(
    document: gql(createMemberMutation),
    variables: {
      'input': {
        'userId': 'user-uuid',
        'membershipType': 'PREMIUM',
        'profile': {
          'firstName': 'John',
          'lastName': 'Doe',
          'phoneNumber': '+1234567890',
          'address': {
            'street': '123 Main St',
            'city': 'New York',
            'state': 'NY',
            'postalCode': '10001',
            'country': 'USA',
          },
          'emergencyContact': {
            'name': 'Jane Doe',
            'relationship': 'Spouse',
            'phoneNumber': '+1234567891',
          },
          'preferences': {
            'emailNotifications': true,
            'smsNotifications': true,
            'pushNotifications': true,
            'marketingEmails': false,
          }
        }
      }
    },
  ),
);
```

#### Update Member
```dart
const String updateMemberMutation = '''
  mutation UpdateMember(\$id: ID!, \$input: MemberProfileInput!) {
    updateMember(id: \$id, input: \$input) {
      id
      profile {
        firstName
        lastName
        phoneNumber
      }
    }
  }
''';
```

### Facility Operations

#### Get Facilities
```dart
const String facilitiesQuery = '''
  query GetFacilities(\$filter: FacilityFilterInput, \$pagination: PaginationInput) {
    facilities(filter: \$filter, pagination: \$pagination) {
      nodes {
        id
        clubId
        name
        description
        type
        capacity
        amenities
        status
        minBookingDuration
        maxBookingDuration
        advanceBookingDays
        cancellationDeadline
        operatingHours
        createdAt
      }
      pageInfo {
        page
        total
        hasNextPage
      }
    }
  }
''';
```

#### Get Facility Types
```dart
const String facilityTypesQuery = '''
  query GetFacilityTypes {
    facilityTypes
  }
''';
```

#### Create Facility
```dart
const String createFacilityMutation = '''
  mutation CreateFacility(\$input: CreateFacilityInput!) {
    createFacility(input: \$input) {
      id
      name
      type
      capacity
      status
    }
  }
''';
```

### Booking Operations

#### Check Availability
```dart
const String checkAvailabilityQuery = '''
  query CheckAvailability(
    \$facilityId: ID!
    \$startTime: Time!
    \$endTime: Time!
    \$excludeBookingId: ID
  ) {
    checkAvailability(
      facilityId: \$facilityId
      startTime: \$startTime
      endTime: \$endTime
      excludeBookingId: \$excludeBookingId
    )
  }
''';
```

#### Get Available Time Slots
```dart
const String availableSlotsQuery = '''
  query GetAvailableSlots(
    \$facilityId: ID!
    \$date: Time!
    \$slotDuration: Int!
  ) {
    availableSlots(
      facilityId: \$facilityId
      date: \$date
      slotDuration: \$slotDuration
    ) {
      startTime
      endTime
      available
      reason
    }
  }
''';

// Usage
final result = await client.query(
  QueryOptions(
    document: gql(availableSlotsQuery),
    variables: {
      'facilityId': 'facility-uuid',
      'date': '2025-11-01T00:00:00Z',
      'slotDuration': 60, // 60 minutes
    },
  ),
);
```

#### Create Booking (Facility)
```dart
const String createBookingMutation = '''
  mutation CreateBooking(\$input: CreateBookingInput!) {
    createBooking(input: \$input) {
      id
      facilityId
      userId
      startTime
      endTime
      status
      notes
      participants
      facility {
        name
        type
      }
      createdAt
    }
  }
''';

// Usage for facility booking
final result = await client.mutate(
  MutationOptions(
    document: gql(createBookingMutation),
    variables: {
      'input': {
        'facilityId': 'tennis-court-1',
        'startTime': '2025-11-01T10:00:00Z',
        'endTime': '2025-11-01T11:00:00Z',
        'notes': 'Singles match',
        'participants': ['user-id-1', 'user-id-2'],
      }
    },
  ),
);
```

#### Create Restaurant Reservation
```dart
const String createRestaurantReservationMutation = '''
  mutation CreateRestaurantReservation(\$input: CreateBookingInput!) {
    createBooking(input: \$input) {
      id
      facilityId
      startTime
      endTime
      status
      partySize
      mealType
      dietaryRestrictions
      specialRequests
      tablePreference
    }
  }
''';

// Usage
final result = await client.mutate(
  MutationOptions(
    document: gql(createRestaurantReservationMutation),
    variables: {
      'input': {
        'facilityId': 'dining-room-id',
        'startTime': '2025-11-01T19:00:00Z',
        'endTime': '2025-11-01T21:00:00Z',
        'partySize': 4,
        'mealType': 'DINNER',
        'dietaryRestrictions': ['VEGETARIAN', 'GLUTEN_FREE'],
        'specialRequests': 'Window table if possible',
        'tablePreference': 'WINDOW',
      }
    },
  ),
);
```

#### Create Event Booking
```dart
const String createEventBookingMutation = '''
  mutation CreateEventBooking(\$input: CreateBookingInput!) {
    createBooking(input: \$input) {
      id
      facilityId
      startTime
      endTime
      status
      eventType
      guestCount
      serviceAddons
      notes
    }
  }
''';

// Usage
final result = await client.mutate(
  MutationOptions(
    document: gql(createEventBookingMutation),
    variables: {
      'input': {
        'facilityId': 'event-space-id',
        'startTime': '2025-12-15T18:00:00Z',
        'endTime': '2025-12-15T23:00:00Z',
        'eventType': 'WEDDING',
        'guestCount': 150,
        'serviceAddons': ['CATERING', 'AV_EQUIPMENT', 'DECORATIONS'],
        'notes': 'Wedding reception for Smith family',
      }
    },
  ),
);
```

#### Get My Bookings
```dart
const String myBookingsQuery = '''
  query GetMyBookings(\$filter: BookingFilterInput, \$pagination: PaginationInput) {
    myBookings(filter: \$filter, pagination: \$pagination) {
      nodes {
        id
        facilityId
        startTime
        endTime
        status
        notes
        facility {
          name
          type
        }
        user {
          firstName
          lastName
        }
        createdAt
      }
      pageInfo {
        page
        total
        hasNextPage
      }
    }
  }
''';
```

#### Get Upcoming Bookings
```dart
const String upcomingBookingsQuery = '''
  query GetUpcomingBookings(\$days: Int, \$pagination: PaginationInput) {
    upcomingBookings(days: \$days, pagination: \$pagination) {
      nodes {
        id
        facility {
          name
          type
        }
        startTime
        endTime
        status
      }
      pageInfo {
        total
      }
    }
  }
''';
```

#### Confirm Booking
```dart
const String confirmBookingMutation = '''
  mutation ConfirmBooking(\$bookingId: ID!) {
    confirmBooking(bookingId: \$bookingId) {
      id
      status
      confirmedAt
      confirmedBy
    }
  }
''';
```

#### Cancel Booking
```dart
const String cancelBookingMutation = '''
  mutation CancelBooking(\$bookingId: ID!, \$reason: String) {
    cancelBooking(bookingId: \$bookingId, reason: \$reason) {
      id
      status
      cancellationReason
      cancelledAt
    }
  }
''';
```

#### Check-in Booking
```dart
const String checkInBookingMutation = '''
  mutation CheckInBooking(\$bookingId: ID!) {
    checkInBooking(bookingId: \$bookingId) {
      id
      status
      checkedInAt
    }
  }
''';
```

#### Check-out Booking
```dart
const String checkOutBookingMutation = '''
  mutation CheckOutBooking(\$bookingId: ID!) {
    checkOutBooking(bookingId: \$bookingId) {
      id
      status
      checkedOutAt
    }
  }
''';
```

#### Booking Statistics
```dart
const String bookingStatisticsQuery = '''
  query GetBookingStatistics(\$startDate: Time!, \$endDate: Time!) {
    bookingStatistics(startDate: \$startDate, endDate: \$endDate) {
      totalBookings
      confirmedBookings
      cancelledBookings
      completedBookings
      noShowBookings
      averageBookingDuration
    }
  }
''';
```

### Reciprocal Agreement Operations

#### Get Agreements
```dart
const String reciprocalAgreementsQuery = '''
  query GetReciprocalAgreements(
    \$pagination: PaginationInput
    \$status: AgreementStatus
  ) {
    reciprocalAgreements(pagination: \$pagination, status: \$status) {
      nodes {
        id
        clubId
        partnerClubId
        status
        terms {
          maxVisitsPerMonth
          reciprocalFee
          blackoutDates
          specialConditions
        }
        effectiveDate
        expirationDate
        createdAt
      }
      pageInfo {
        page
        total
        hasNextPage
      }
    }
  }
''';
```

#### Create Agreement
```dart
const String createReciprocalAgreementMutation = '''
  mutation CreateReciprocalAgreement(\$input: CreateReciprocalAgreementInput!) {
    createReciprocalAgreement(input: \$input) {
      id
      clubId
      partnerClubId
      status
      terms {
        maxVisitsPerMonth
        reciprocalFee
      }
      effectiveDate
    }
  }
''';
```

#### Approve Agreement
```dart
const String approveReciprocalAgreementMutation = '''
  mutation ApproveReciprocalAgreement(\$id: ID!) {
    approveReciprocalAgreement(id: \$id) {
      id
      status
    }
  }
''';
```

### Visit Operations

#### Get Visits
```dart
const String visitsQuery = '''
  query GetVisits(\$pagination: PaginationInput, \$status: VisitStatus) {
    visits(pagination: \$pagination, status: \$status) {
      nodes {
        id
        memberId
        clubId
        visitingClubId
        status
        checkInTime
        checkOutTime
        services
        cost
        verified
        blockchainTxId
        createdAt
      }
      pageInfo {
        page
        total
      }
    }
  }
''';
```

#### Record Visit
```dart
const String recordVisitMutation = '''
  mutation RecordVisit(\$input: RecordVisitInput!) {
    recordVisit(input: \$input) {
      id
      memberId
      clubId
      visitingClubId
      status
      checkInTime
      services
      cost
    }
  }
''';
```

#### Check-out Visit
```dart
const String checkOutVisitMutation = '''
  mutation CheckOutVisit(\$input: CheckOutVisitInput!) {
    checkOutVisit(input: \$input) {
      id
      status
      checkOutTime
      services
      cost
      verified
      blockchainTxId
    }
  }
''';
```

### Notification Operations

#### Get Notifications
```dart
const String notificationsQuery = '''
  query GetNotifications(\$pagination: PaginationInput, \$unreadOnly: Boolean) {
    notifications(pagination: \$pagination, unreadOnly: \$unreadOnly) {
      nodes {
        id
        userId
        type
        title
        message
        status
        channels
        scheduledAt
        sentAt
        readAt
        createdAt
      }
      pageInfo {
        page
        total
      }
    }
  }
''';
```

#### Get Unread Count
```dart
const String unreadNotificationCountQuery = '''
  query GetUnreadNotificationCount {
    unreadNotificationCount
  }
''';
```

#### Mark Notification as Read
```dart
const String markNotificationReadMutation = '''
  mutation MarkNotificationRead(\$id: ID!) {
    markNotificationRead(id: \$id) {
      id
      status
      readAt
    }
  }
''';
```

#### Mark All Notifications as Read
```dart
const String markAllNotificationsReadMutation = '''
  mutation MarkAllNotificationsRead {
    markAllNotificationsRead
  }
''';
```

### Analytics Operations

#### Get Analytics
```dart
const String analyticsQuery = '''
  query GetAnalytics(\$startDate: Time, \$endDate: Time) {
    analytics(startDate: \$startDate, endDate: \$endDate) {
      visits {
        totalVisits
        monthlyVisits {
          month
          count
        }
        topDestinations {
          club {
            name
            location
          }
          count
        }
        averageVisitDuration
      }
      members {
        totalMembers
        activeMembers
        newMembersThisMonth
        membershipDistribution {
          type
          count
        }
      }
      reciprocals {
        totalAgreements
        activeAgreements
        pendingAgreements
        monthlyReciprocalUsage {
          month
          count
        }
      }
    }
  }
''';
```

### Governance Operations

#### Get Proposals
```dart
const String proposalsQuery = '''
  query GetProposals(\$pagination: PaginationInput, \$status: ProposalStatus) {
    proposals(pagination: \$pagination, status: \$status) {
      nodes {
        id
        title
        description
        type
        status
        proposer {
          username
          firstName
          lastName
        }
        votes {
          id
          choice
          voter {
            username
          }
        }
        votingDeadline
        createdAt
      }
      pageInfo {
        page
        total
      }
    }
  }
''';
```

#### Create Proposal
```dart
const String createProposalMutation = '''
  mutation CreateProposal(\$input: CreateProposalInput!) {
    createProposal(input: \$input) {
      id
      title
      description
      type
      status
      votingDeadline
    }
  }
''';
```

#### Cast Vote
```dart
const String castVoteMutation = '''
  mutation CastVote(\$input: CastVoteInput!) {
    castVote(input: \$input) {
      id
      proposalId
      voter {
        id
        username
      }
      choice
      comment
      createdAt
    }
  }
''';

// Usage
final result = await client.mutate(
  MutationOptions(
    document: gql(castVoteMutation),
    variables: {
      'input': {
        'proposalId': 'proposal-uuid',
        'choice': 'YES',
        'comment': 'I support this proposal',
      }
    },
  ),
);
```

### Blockchain Operations

#### Get Transactions
```dart
const String transactionsQuery = '''
  query GetTransactions(\$pagination: PaginationInput, \$status: TransactionStatus) {
    transactions(pagination: \$pagination, status: \$status) {
      id
      type
      chaincode
      function
      args
      status
      txId
      blockNumber
      timestamp
      error
      createdAt
    }
  }
''';
```

#### Get Transaction
```dart
const String transactionQuery = '''
  query GetTransaction(\$id: ID!) {
    transaction(id: \$id) {
      id
      type
      chaincode
      function
      args
      status
      txId
      blockNumber
      timestamp
      error
      createdAt
    }
  }
''';
```

---

## GraphQL Subscriptions (Real-time Updates)

### Notification Subscription
```dart
const String notificationReceivedSubscription = '''
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

// Usage
final subscription = client.subscribe(
  SubscriptionOptions(
    document: gql(notificationReceivedSubscription),
  ),
);

subscription.listen((result) {
  if (result.hasException) {
    print('Subscription error: ${result.exception}');
    return;
  }

  final notification = result.data?['notificationReceived'];
  // Handle new notification
  showNotification(notification);
});
```

### Booking Updates Subscription
```dart
const String bookingUpdatesSubscription = '''
  subscription OnBookingUpdates(\$userId: ID) {
    bookingUpdates(userId: \$userId) {
      id
      status
      facility {
        name
      }
      startTime
      endTime
    }
  }
''';
```

### Visit Status Changed Subscription
```dart
const String visitStatusChangedSubscription = '''
  subscription OnVisitStatusChanged(\$clubId: ID) {
    visitStatusChanged(clubId: \$clubId) {
      id
      memberId
      status
      checkInTime
      checkOutTime
    }
  }
''';
```

### Proposal Updates Subscription
```dart
const String proposalUpdatedSubscription = '''
  subscription OnProposalUpdated(\$proposalId: ID) {
    proposalUpdated(proposalId: \$proposalId) {
      id
      title
      status
      votes {
        choice
      }
    }
  }
''';
```

### Transaction Status Changed Subscription
```dart
const String transactionStatusChangedSubscription = '''
  subscription OnTransactionStatusChanged {
    transactionStatusChanged {
      id
      type
      status
      txId
      blockNumber
      timestamp
    }
  }
''';
```

---

## REST API Endpoints (Examples)

### Authentication
```
POST   /api/v1/auth/register
POST   /api/v1/auth/login
POST   /api/v1/auth/refresh
POST   /api/v1/auth/logout
GET    /api/v1/auth/me
```

### Members
```
GET    /api/v1/members?clubId={id}
POST   /api/v1/members
GET    /api/v1/members/{id}
PUT    /api/v1/members/{id}
DELETE /api/v1/members/{id}
```

### Reciprocal Agreements
```
GET    /api/v1/agreements?clubId={id}
POST   /api/v1/agreements
GET    /api/v1/agreements/{id}
PUT    /api/v1/agreements/{id}/approve
PUT    /api/v1/agreements/{id}/reject
```

### Visits
```
GET    /api/v1/visits?memberId={id}
POST   /api/v1/visits
GET    /api/v1/visits/{id}
PUT    /api/v1/visits/{id}/confirm
PUT    /api/v1/visits/{id}/check-in
PUT    /api/v1/visits/{id}/check-out
```

### Notifications
```
POST   /api/v1/notifications/send
GET    /api/v1/notifications?userId={id}
PUT    /api/v1/notifications/{id}/read
```

### Analytics
```
GET    /api/v1/analytics/events?clubId={id}
POST   /api/v1/analytics/track
GET    /api/v1/analytics/reports/usage
```

---

## Multi-Tenant Architecture

All API requests require `clubId` for tenant isolation:

```dart
// Example: Query data for specific club
final result = await GraphQLService.client.query(
  QueryOptions(
    document: gql(getMembersQuery),
    variables: {
      'clubId': 'club-uuid-123', // Required for tenant isolation
    },
  ),
);

// Headers (auto-added from JWT)
{
  'Authorization': 'Bearer eyJhbGc...',  // Contains clubId claim
  'X-Club-ID': 'club-uuid-123',          // Optional explicit header
}
```

---

## Error Handling

### GraphQL Errors

```dart
final result = await GraphQLService.client.query(queryOptions);

if (result.hasException) {
  // Handle GraphQL errors
  if (result.exception?.graphqlErrors != null) {
    for (var error in result.exception!.graphqlErrors) {
      print('GraphQL Error: ${error.message}');
      // Error codes: UNAUTHENTICATED, FORBIDDEN, NOT_FOUND, etc.
    }
  }

  // Handle network errors
  if (result.exception?.linkException != null) {
    print('Network Error: ${result.exception!.linkException}');
  }
}
```

### REST API Errors

```dart
try {
  final response = await ApiService._dio.get('/api/v1/members');
} on DioException catch (e) {
  if (e.response != null) {
    // Server error with response
    final statusCode = e.response?.statusCode;
    final message = e.response?.data['message'];

    switch (statusCode) {
      case 401:
        // Unauthorized - refresh token or re-login
        await refreshToken();
        break;
      case 403:
        // Forbidden - user lacks permissions
        showError('Access denied');
        break;
      case 404:
        // Not found
        showError('Resource not found');
        break;
      case 500:
        // Server error
        showError('Server error - please try again');
        break;
    }
  } else {
    // Network error (no response)
    showError('Network error - check connection');
  }
}
```

---

## Testing Connectivity

### Simple Connectivity Test

```dart
import 'package:dio/dio.dart';

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

    if (response.statusCode == 200 &&
        response.data['status'] == 'healthy') {
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

// Call in app initialization
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final isConnected = await testBackendConnection();
  if (!isConnected) {
    // Show error or offline mode
  }

  runApp(MyApp());
}
```

---

## Network Considerations

### Same Network Required
- Backend is on local network: `192.168.0.170`
- Flutter app must be on same network (WiFi) OR use VPN/port forwarding
- Not accessible from outside the local network (behind router firewall)

### Development Options

**Option 1: Same WiFi Network** (Easiest)
- Connect Flutter device to same WiFi as henrybook server
- Use IP: `192.168.0.170:30080`

**Option 2: Android Emulator** (Development)
- Use `10.0.2.2` to access host machine
- Requires port forwarding: `adb reverse tcp:30080 tcp:30080`

**Option 3: iOS Simulator** (Development)
- Simulators can access `localhost` or LAN IPs directly
- Use: `http://192.168.0.170:30080`

**Option 4: VPN/Tunneling** (Remote Access)
- Set up VPN to local network
- Or use ngrok/cloudflare tunnel for testing

---

## Example Flutter App Structure

```
lib/
├── services/
│   ├── api_service.dart          # REST API client
│   ├── graphql_service.dart      # GraphQL client
│   └── auth_service.dart         # Authentication logic
├── models/
│   ├── user.dart
│   ├── member.dart
│   ├── visit.dart
│   └── agreement.dart
├── screens/
│   ├── login_screen.dart
│   ├── member_list_screen.dart
│   ├── visit_request_screen.dart
│   └── agreement_screen.dart
└── main.dart
```

---

## Backend Service Status

```
✅ api-gateway              Running (0 restarts)
✅ auth-service             Running (0 restarts)
✅ member-service           Running (0 restarts)
✅ reciprocal-service       Running (0 restarts)
✅ blockchain-service       Running (0 restarts)
✅ notification-service     Running (0 restarts)
✅ analytics-service        Running (0 restarts)
✅ governance-service       Running (0 restarts)
✅ booking-service          Running (0 restarts)

Infrastructure:
✅ postgres                 Running
✅ redis                    Running
✅ nats                     Running

Blockchain:
✅ fabric-orderer           Running
✅ fabric-peer0             Running
✅ fabric-couchdb0          Running
```

**All 9 microservices + infrastructure fully operational with 0 restarts.**

---

## Troubleshooting

### Connection Issues

```dart
// Test 1: Can you reach the server?
ping 192.168.0.170

// Test 2: Check health endpoint
curl http://192.168.0.170:30080/health

// Test 3: In Flutter
final dio = Dio();
dio.options.connectTimeout = Duration(seconds: 10);
dio.options.receiveTimeout = Duration(seconds: 10);

try {
  final response = await dio.get('http://192.168.0.170:30080/health');
  print('Connected: ${response.data}');
} catch (e) {
  print('Connection failed: $e');
}
```

### Common Issues

**Problem**: Connection timeout
- **Solution**: Check WiFi network, verify IP address, check firewall

**Problem**: 401 Unauthorized
- **Solution**: Check JWT token, refresh token, or re-login

**Problem**: 403 Forbidden
- **Solution**: User lacks permissions, verify clubId and roles

**Problem**: Empty response / null data
- **Solution**: Check GraphQL query syntax, verify clubId parameter

---

## Additional Resources

- **GraphQL Playground**: `http://192.168.0.170:30080/graphql` (web interface)
- **API Documentation**: See backend README.md for full endpoint list
- **Backend Repository**: Contains all service documentation
- **Support**: Check logs via `kubectl logs -n reciprocal-clubs <pod-name>`

---

---

## Complete Operation Summary

### Total GraphQL Operations: 50+

**Query Operations (26)**:
- `me` - Get current user
- `members`, `member`, `memberByNumber` - Member queries
- `clubs`, `club`, `myClub`, `featuredClubs`, `nearbyClubs` - Club queries
- `facilities`, `facility`, `facilityTypes` - Facility queries
- `bookings`, `booking`, `myBookings`, `upcomingBookings`, `facilityBookings` - Booking queries
- `checkAvailability`, `availableSlots` - Availability queries
- `bookingStatistics`, `facilityUtilization` - Statistics queries
- `reciprocalAgreements`, `reciprocalAgreement` - Agreement queries
- `visits`, `visit`, `myVisits` - Visit queries
- `notifications`, `notification`, `unreadNotificationCount` - Notification queries
- `analytics` - Analytics queries
- `proposals`, `proposal`, `myVotes` - Governance queries
- `transactions`, `transaction` - Blockchain queries

**Mutation Operations (29)**:
- `login`, `register`, `refreshToken`, `logout` - Authentication
- `createClub`, `updateClub` - Club management
- `createMember`, `updateMember`, `suspendMember`, `reactivateMember` - Member management
- `createFacility`, `updateFacility`, `deleteFacility` - Facility management
- `createBooking`, `updateBooking`, `cancelBooking`, `confirmBooking`, `completeBooking`, `markBookingNoShow`, `checkInBooking`, `checkOutBooking` - Booking management
- `createReciprocalAgreement`, `approveReciprocalAgreement`, `rejectReciprocalAgreement`, `suspendReciprocalAgreement` - Agreement management
- `recordVisit`, `checkOutVisit`, `cancelVisit`, `verifyVisit` - Visit management
- `createNotification`, `markNotificationRead`, `markAllNotificationsRead` - Notification management
- `createProposal`, `castVote`, `finalizeProposal` - Governance operations
- `syncBlockchainData`, `generateAnalyticsReport` - System operations

**Subscription Operations (6)**:
- `notificationReceived` - Real-time notifications
- `bookingUpdates` - Real-time booking updates
- `visitStatusChanged` - Real-time visit status updates
- `proposalUpdated` - Real-time proposal updates
- `voteReceived` - Real-time vote notifications
- `transactionStatusChanged` - Real-time blockchain transaction updates

---

**Version**: 2.0
**Created**: October 20, 2025
**Updated**: October 31, 2025
**Backend Version**: v0.1.1
**Compatible Flutter**: 3.0+
**Services Documented**: All 9 microservices
**Total Operations Documented**: 50+ GraphQL operations

---

## Quick Test Checklist

- [ ] Can ping 192.168.0.170
- [ ] Health endpoint returns 200 OK
- [ ] Can create GraphQL client
- [ ] Can authenticate and get JWT token
- [ ] Can query members for a club
- [ ] Can query facilities and check availability
- [ ] Can create a booking
- [ ] Can create a visit request
- [ ] Can receive real-time notifications via subscription
- [ ] Error handling works correctly
- [ ] Token refresh works on 401

**Happy Coding!** 🚀
