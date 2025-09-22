# GraphQL API Documentation - Reciprocal Clubs Platform

## Overview

This document provides comprehensive GraphQL API documentation for the Reciprocal Clubs Platform, designed to help developers build mobile, web, and desktop applications with GraphQL capabilities. The API follows GraphQL best practices and provides a unified interface to all platform services.

## Table of Contents

1. [Quick Start](#quick-start)
2. [Authentication](#authentication)
3. [Real-World Scenarios](#real-world-scenarios)
4. [Core Operations](#core-operations)
5. [Subscriptions (Real-time)](#subscriptions-real-time)
6. [Error Handling](#error-handling)
7. [Best Practices](#best-practices)
8. [SDK Examples](#sdk-examples)

## Quick Start

### GraphQL Endpoint

```http
https://api.reciprocal-clubs.com/graphql
```

### Basic Query Example

```graphql
query GetMyProfile {
  me {
    id
    email
    username
    firstName
    lastName
    roles
    permissions
  }
}
```

### Authentication Header

```http
Authorization: Bearer <your-jwt-token>
Content-Type: application/json
```

## Authentication

### 1. Login with Email/Password

```graphql
mutation Login($email: String!, $password: String!) {
  login(input: { email: $email, password: $password }) {
    token
    refreshToken
    user {
      id
      email
      username
      firstName
      lastName
      roles
      permissions
    }
    expiresAt
  }
}
```

**Variables:**

```json
{
  "email": "john.doe@example.com",
  "password": "securePassword123"
}
```

### 2. Register New User

```graphql
mutation Register($input: RegisterInput!) {
  register(input: $input) {
    token
    refreshToken
    user {
      id
      email
      username
      firstName
      lastName
    }
    expiresAt
  }
}
```

**Variables:**

```json
{
  "input": {
    "email": "newuser@example.com",
    "password": "securePassword123",
    "username": "newuser",
    "clubId": "1",
    "firstName": "John",
    "lastName": "Doe"
  }
}
```

### 3. Refresh Token

```graphql
mutation RefreshToken($refreshToken: String!) {
  refreshToken(refreshToken: $refreshToken) {
    token
    refreshToken
    user {
      id
      email
    }
    expiresAt
  }
}
```

## Real-World Scenarios

### Scenario 1: Mobile App - Member Visits Partner Club

**Business Flow:**

1. Member opens mobile app at partner club
2. App shows club details and available services
3. Member checks in for visit
4. Member uses club facilities
5. Member checks out with service usage
6. Visit is recorded on blockchain for audit

#### Step 1: Get Current Club Information

```graphql
query GetClubDetails($clubId: ID!) {
  club(id: $clubId) {
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
  }
}
```

#### Step 2: Check Reciprocal Agreement

```graphql
query CheckReciprocalAgreement($clubId: ID!, $partnerClubId: ID!) {
  reciprocalAgreements(status: ACTIVE) {
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
    }
  }
}
```

#### Step 3: Record Visit Check-in

```graphql
mutation RecordVisit($input: RecordVisitInput!) {
  recordVisit(input: $input) {
    id
    memberId
    clubId
    visitingClubId
    status
    checkInTime
    services
    cost
    verified
    blockchainTxId
  }
}
```

**Variables:**

```json
{
  "input": {
    "memberId": "member-123",
    "visitingClubId": "club-456",
    "services": ["gym", "pool"],
    "cost": 25.00
  }
}
```

#### Step 4: Check Out with Additional Services

```graphql
mutation CheckOutVisit($input: CheckOutVisitInput!) {
  checkOutVisit(input: $input) {
    id
    status
    checkOutTime
    services
    cost
    verified
    blockchainTxId
  }
}
```

**Variables:**

```json
{
  "input": {
    "visitId": "visit-789",
    "services": ["gym", "pool", "spa", "restaurant"],
    "cost": 85.00
  }
}
```

### Scenario 2: Web Dashboard - Club Administrator

**Business Flow:**

1. Admin logs into web dashboard
2. Views pending reciprocal agreements
3. Reviews member activity analytics
4. Approves new reciprocal agreement
5. Sends notification to members

#### Step 1: Get Dashboard Overview

```graphql
query AdminDashboard($startDate: Time!, $endDate: Time!) {
  analytics(startDate: $startDate, endDate: $endDate) {
    visits {
      totalVisits
      monthlyVisits {
        month
        count
      }
      topDestinations {
        club {
          id
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
```

#### Step 2: View Pending Agreements

```graphql
query PendingAgreements {
  reciprocalAgreements(status: PENDING) {
    nodes {
      id
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
      total
      hasNextPage
    }
  }
}
```

#### Step 3: Approve Agreement

```graphql
mutation ApproveAgreement($agreementId: ID!) {
  approveReciprocalAgreement(id: $agreementId) {
    id
    status
    effectiveDate
    terms {
      maxVisitsPerMonth
      reciprocalFee
    }
  }
}
```

#### Step 4: Notify Members

```graphql
mutation NotifyMembers($input: CreateNotificationInput!) {
  createNotification(input: $input) {
    id
    title
    message
    status
    channels
    scheduledAt
  }
}
```

**Variables:**

```json
{
  "input": {
    "userIds": ["user-1", "user-2", "user-3"],
    "type": "RECIPROCAL",
    "title": "New Partner Club Available",
    "message": "We've added City Athletic Club to our reciprocal network. Enjoy access to their premium facilities!",
    "channels": ["EMAIL", "PUSH", "IN_APP"]
  }
}
```

### Scenario 3: Mobile App - Real-time Visit Tracking

**Business Flow:**

1. Member checks in at partner club
2. Club staff receives real-time notification
3. Visit status updates automatically
4. Member receives confirmation

#### Step 1: Subscribe to Visit Updates

```graphql
subscription VisitUpdates($clubId: ID!) {
  visitStatusChanged(clubId: $clubId) {
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
  }
}
```

#### Step 2: Subscribe to Notifications

```graphql
subscription NotificationUpdates {
  notificationReceived {
    id
    type
    title
    message
    status
    channels
    sentAt
  }
}
```

## Core Operations

### Member Management

#### Get Members List

```graphql
query GetMembers($pagination: PaginationInput, $status: MemberStatus) {
  members(pagination: $pagination, status: $status) {
    nodes {
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
          marketingEmails
        }
      }
      joinedAt
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

#### Create New Member

```graphql
mutation CreateMember($input: CreateMemberInput!) {
  createMember(input: $input) {
    id
    memberNumber
    membershipType
    status
    profile {
      firstName
      lastName
      phoneNumber
    }
    joinedAt
  }
}
```

#### Update Member Profile

```graphql
mutation UpdateMember($id: ID!, $input: MemberProfileInput!) {
  updateMember(id: $id, input: $input) {
    id
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
      preferences {
        emailNotifications
        smsNotifications
        pushNotifications
        marketingEmails
      }
    }
    updatedAt
  }
}
```

### Visit Management

#### Get My Visits History

```graphql
query MyVisits($pagination: PaginationInput) {
  myVisits(pagination: $pagination) {
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
      pageSize
      total
      hasNextPage
    }
  }
}
```

#### Verify Visit (Admin)

```graphql
mutation VerifyVisit($visitId: ID!) {
  verifyVisit(id: $visitId) {
    id
    status
    verified
    blockchainTxId
  }
}
```

### Governance Operations

#### Get Active Proposals

```graphql
query ActiveProposals {
  proposals(status: VOTING) {
    nodes {
      id
      title
      description
      type
      status
      proposer {
        id
        username
        firstName
        lastName
      }
      votes {
        id
        voter {
          id
          username
        }
        choice
        comment
        createdAt
      }
      votingDeadline
      createdAt
    }
    pageInfo {
      total
    }
  }
}
```

#### Cast Vote

```graphql
mutation CastVote($input: CastVoteInput!) {
  castVote(input: $input) {
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
```

#### Create Proposal

```graphql
mutation CreateProposal($input: CreateProposalInput!) {
  createProposal(input: $input) {
    id
    title
    description
    type
    status
    proposer {
      id
      username
    }
    votingDeadline
    createdAt
  }
}
```

### Blockchain Operations

#### Get Transaction History

```graphql
query TransactionHistory($pagination: PaginationInput, $status: TransactionStatus) {
  transactions(pagination: $pagination, status: $status) {
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
```

#### Sync Blockchain Data

```graphql
mutation SyncBlockchainData {
  syncBlockchainData
}
```

## Subscriptions (Real-time)

### Setup WebSocket Connection

**JavaScript Example:**

```javascript
import { createClient } from 'graphql-ws';

const client = createClient({
  url: 'wss://api.reciprocal-clubs.com/graphql',
  connectionParams: {
    Authorization: `Bearer ${token}`,
  },
});
```

### Real-time Notifications

```graphql
subscription NotificationStream {
  notificationReceived {
    id
    type
    title
    message
    status
    channels
    sentAt
  }
}
```

### Real-time Visit Updates

```graphql
subscription VisitStream($clubId: ID) {
  visitStatusChanged(clubId: $clubId) {
    id
    memberId
    status
    checkInTime
    checkOutTime
    services
    cost
  }
}
```

### Real-time Governance Updates

```graphql
subscription GovernanceStream($proposalId: ID) {
  proposalUpdated(proposalId: $proposalId) {
    id
    status
    votes {
      choice
      voter {
        username
      }
    }
  }

  voteReceived(proposalId: $proposalId) {
    id
    choice
    voter {
      username
    }
    createdAt
  }
}
```

## Error Handling

### Standard Error Format

```json
{
  "errors": [
    {
      "message": "Member not found",
      "locations": [{"line": 2, "column": 3}],
      "path": ["member"],
      "extensions": {
        "code": "NOT_FOUND",
        "field": "id",
        "value": "invalid-id"
      }
    }
  ],
  "data": null
}
```

### Common Error Codes

- `UNAUTHENTICATED`: Missing or invalid authentication
- `FORBIDDEN`: Insufficient permissions
- `NOT_FOUND`: Resource not found
- `VALIDATION_ERROR`: Input validation failed
- `RATE_LIMITED`: Too many requests
- `INTERNAL_ERROR`: Server error

### Error Handling Example

```javascript
const result = await client.request(query, variables);

if (result.errors) {
  result.errors.forEach(error => {
    switch (error.extensions?.code) {
      case 'UNAUTHENTICATED':
        // Redirect to login
        break;
      case 'VALIDATION_ERROR':
        // Show validation errors
        break;
      case 'NOT_FOUND':
        // Show not found message
        break;
      default:
        // Show generic error
        break;
    }
  });
}
```

## Best Practices

### 1. Request Only Needed Fields

```graphql
# Good - Only request needed fields
query GetMembers {
  members {
    nodes {
      id
      memberNumber
      profile {
        firstName
        lastName
      }
    }
  }
}

# Avoid - Requesting unnecessary data
query GetMembers {
  members {
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
          marketingEmails
        }
      }
      joinedAt
      createdAt
      updatedAt
    }
  }
}
```

### 2. Use Fragments for Reusability

```graphql
fragment MemberBasicInfo on Member {
  id
  memberNumber
  membershipType
  status
  profile {
    firstName
    lastName
    phoneNumber
  }
}

query GetMembers {
  members {
    nodes {
      ...MemberBasicInfo
    }
  }
}

query GetMember($id: ID!) {
  member(id: $id) {
    ...MemberBasicInfo
    profile {
      address {
        street
        city
        state
        postalCode
        country
      }
    }
  }
}
```

### 3. Use Variables for Dynamic Queries

```graphql
# Good - Use variables
query GetVisits($status: VisitStatus, $pagination: PaginationInput) {
  visits(status: $status, pagination: $pagination) {
    nodes {
      id
      status
      checkInTime
    }
  }
}

# Avoid - Hard-coding values
query GetVisits {
  visits(status: CHECKED_IN, pagination: { page: 1, pageSize: 10 }) {
    nodes {
      id
      status
      checkInTime
    }
  }
}
```

### 4. Implement Proper Pagination

```graphql
query GetMembersWithPagination($page: Int!, $pageSize: Int!) {
  members(pagination: { page: $page, pageSize: $pageSize }) {
    nodes {
      id
      memberNumber
      profile {
        firstName
        lastName
      }
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

### 5. Handle Loading and Error States

```javascript
const [loading, setLoading] = useState(true);
const [error, setError] = useState(null);
const [data, setData] = useState(null);

useEffect(() => {
  const fetchData = async () => {
    try {
      setLoading(true);
      const result = await client.request(query, variables);

      if (result.errors) {
        setError(result.errors[0].message);
      } else {
        setData(result.data);
      }
    } catch (err) {
      setError(err.message);
    } finally {
      setLoading(false);
    }
  };

  fetchData();
}, [query, variables]);
```

## SDK Examples

### React Hooks with Apollo Client

```javascript
import { useQuery, useMutation, useSubscription } from '@apollo/client';
import { GET_MEMBERS, CREATE_MEMBER, NOTIFICATION_RECEIVED } from './queries';

// Query Hook
function MembersList() {
  const { loading, error, data, refetch } = useQuery(GET_MEMBERS, {
    variables: { pagination: { page: 1, pageSize: 10 } }
  });

  if (loading) return <div>Loading...</div>;
  if (error) return <div>Error: {error.message}</div>;

  return (
    <div>
      {data.members.nodes.map(member => (
        <div key={member.id}>
          {member.profile.firstName} {member.profile.lastName}
        </div>
      ))}
    </div>
  );
}

// Mutation Hook
function CreateMemberForm() {
  const [createMember, { loading, error }] = useMutation(CREATE_MEMBER, {
    refetchQueries: [{ query: GET_MEMBERS }]
  });

  const handleSubmit = async (formData) => {
    try {
      const result = await createMember({
        variables: { input: formData }
      });
      console.log('Member created:', result.data.createMember);
    } catch (err) {
      console.error('Error creating member:', err);
    }
  };

  return (
    <form onSubmit={handleSubmit}>
      {/* Form fields */}
    </form>
  );
}

// Subscription Hook
function NotificationComponent() {
  const { data, loading } = useSubscription(NOTIFICATION_RECEIVED);

  useEffect(() => {
    if (data?.notificationReceived) {
      // Show notification to user
      showNotification(data.notificationReceived);
    }
  }, [data]);

  return null; // This component just handles notifications
}
```

### React Native with GraphQL Request

```javascript
import { request } from 'graphql-request';

const endpoint = 'https://api.reciprocal-clubs.com/graphql';

// Service class for GraphQL operations
class GraphQLService {
  constructor(token) {
    this.token = token;
    this.headers = {
      Authorization: `Bearer ${token}`,
    };
  }

  async getMembers(pagination = { page: 1, pageSize: 10 }) {
    const query = `
      query GetMembers($pagination: PaginationInput) {
        members(pagination: $pagination) {
          nodes {
            id
            memberNumber
            profile {
              firstName
              lastName
            }
          }
          pageInfo {
            hasNextPage
            total
          }
        }
      }
    `;

    try {
      const data = await request(endpoint, query, { pagination }, this.headers);
      return data.members;
    } catch (error) {
      throw new Error(`Failed to fetch members: ${error.message}`);
    }
  }

  async recordVisit(visitInput) {
    const mutation = `
      mutation RecordVisit($input: RecordVisitInput!) {
        recordVisit(input: $input) {
          id
          status
          checkInTime
          blockchainTxId
        }
      }
    `;

    try {
      const data = await request(endpoint, mutation, { input: visitInput }, this.headers);
      return data.recordVisit;
    } catch (error) {
      throw new Error(`Failed to record visit: ${error.message}`);
    }
  }
}

// Usage in React Native component
function VisitScreen() {
  const [graphQLService] = useState(() => new GraphQLService(authToken));

  const handleCheckIn = async () => {
    try {
      const visit = await graphQLService.recordVisit({
        memberId: currentMember.id,
        visitingClubId: selectedClub.id,
        services: ['gym', 'pool'],
        cost: 25.00
      });

      Alert.alert('Success', 'Check-in recorded successfully!');
    } catch (error) {
      Alert.alert('Error', error.message);
    }
  };

  return (
    <View>
      <Button title="Check In" onPress={handleCheckIn} />
    </View>
  );
}
```

### Flutter with graphql_flutter

```dart
import 'package:graphql_flutter/graphql_flutter.dart';

// GraphQL Client Setup
class GraphQLConfig {
  static final HttpLink httpLink = HttpLink('https://api.reciprocal-clubs.com/graphql');

  static final AuthLink authLink = AuthLink(
    getToken: () async => 'Bearer $authToken',
  );

  static final Link link = authLink.concat(httpLink);

  static final GraphQLClient client = GraphQLClient(
    cache: GraphQLCache(store: InMemoryStore()),
    link: link,
  );
}

// Query Widget
class MembersListWidget extends StatelessWidget {
  final String getMembersQuery = """
    query GetMembers(\$pagination: PaginationInput) {
      members(pagination: \$pagination) {
        nodes {
          id
          memberNumber
          profile {
            firstName
            lastName
          }
        }
        pageInfo {
          hasNextPage
          total
        }
      }
    }
  """;

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        document: gql(getMembersQuery),
        variables: {'pagination': {'page': 1, 'pageSize': 10}},
      ),
      builder: (QueryResult result, {VoidCallback? refetch, FetchMore? fetchMore}) {
        if (result.hasException) {
          return Text('Error: ${result.exception.toString()}');
        }

        if (result.isLoading) {
          return CircularProgressIndicator();
        }

        final members = result.data?['members']['nodes'] as List;

        return ListView.builder(
          itemCount: members.length,
          itemBuilder: (context, index) {
            final member = members[index];
            return ListTile(
              title: Text('${member['profile']['firstName']} ${member['profile']['lastName']}'),
              subtitle: Text('Member #${member['memberNumber']}'),
            );
          },
        );
      },
    );
  }
}

// Mutation Widget
class CheckInWidget extends StatelessWidget {
  final String recordVisitMutation = """
    mutation RecordVisit(\$input: RecordVisitInput!) {
      recordVisit(input: \$input) {
        id
        status
        checkInTime
        blockchainTxId
      }
    }
  """;

  @override
  Widget build(BuildContext context) {
    return Mutation(
      options: MutationOptions(
        document: gql(recordVisitMutation),
        onCompleted: (dynamic resultData) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Check-in successful!')),
          );
        },
        onError: (OperationException error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${error.toString()}')),
          );
        },
      ),
      builder: (RunMutation runMutation, QueryResult? result) {
        return ElevatedButton(
          onPressed: result?.isLoading == true ? null : () {
            runMutation({
              'input': {
                'memberId': 'member-123',
                'visitingClubId': 'club-456',
                'services': ['gym', 'pool'],
                'cost': 25.00,
              }
            });
          },
          child: result?.isLoading == true
            ? CircularProgressIndicator()
            : Text('Check In'),
        );
      },
    );
  }
}
```

---

## API Versioning

The GraphQL API follows semantic versioning. Breaking changes will be introduced in new versions while maintaining backward compatibility for existing versions.

**Current Version**: v1
**Endpoint**: `https://api.reciprocal-clubs.com/graphql`

## Rate Limiting

- **Authenticated requests**: 1000 requests per hour
- **Unauthenticated requests**: 100 requests per hour
- **Subscription connections**: 10 concurrent connections per user

## Support

For GraphQL API support, please refer to:

- [API Status Page](https://status.reciprocal-clubs.com)
- [Developer Forum](https://developers.reciprocal-clubs.com)
- [GitHub Issues](https://github.com/reciprocal-clubs-platform/issues)

---

**Last Updated**: September 20, 2025
**API Version**: v1.0
**Documentation Version**: 1.0
