# GraphQL API Documentation for Reciprocal Clubs Platform

## Overview

The Reciprocal Clubs platform uses GraphQL as its primary API interface through the API Gateway service. GraphQL provides a unified, type-safe, and efficient way to interact with all microservices while allowing clients to request exactly the data they need.

## API Gateway Architecture

### GraphQL as the Unified API Layer

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
                    │ schema.graphql + Resolvers│
                    └────────────┬──────────────┘
                                 │
          ┌──────────────────────┼──────────────────────┐
          │                      │                      │
    ┌─────▼──────┐     ┌─────────▼─────────┐     ┌──────▼─────┐
    │Auth Service│     │ Member Service    │     │Club Service│
    │  (gRPC)    │     │  (gRPC)           │     │  (gRPC)    │
    └────────────┘     └───────────────────┘     └────────────┘
          │                      │                      │
    ┌─────▼──────┐     ┌─────────▼─────────┐     ┌──────▼─────┐
    │ Reciprocal │     │ Blockchain        │     │ Analytics  │
    │ Service    │     │ Service           │     │ Service    │
    │  (gRPC)    │     │  (gRPC)           │     │  (gRPC)    │
    └────────────┘     └───────────────────┘     └────────────┘
```

### GraphQL Endpoint Information

- **URL**: `https://api.reciprocal-clubs.com/graphql`
- **WebSocket (Subscriptions)**: `wss://api.reciprocal-clubs.com/graphql`
- **GraphiQL Playground**: `https://api.reciprocal-clubs.com/graphql` (dev environment)
- **Schema Introspection**: Enabled in development, disabled in production

## Core GraphQL Schema

### Authentication & Authorization

#### User Type

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
```

#### Authentication Mutations

```graphql
# Login with email/password
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
    }
    expiresAt
  }
}

# Variables
{
  "input": {
    "email": "admin@club.com",
    "password": "secure_password"
  }
}
```

### Member Management

#### Member Type

```graphql
type Member {
  id: ID!
  clubId: ID!
  userId: ID!
  memberNumber: String!
  membershipType: MembershipType!
  status: MemberStatus!
  blockchainIdentity: String
  profile: MemberProfile
  joinedAt: Time!
  createdAt: Time!
  updatedAt: Time!
}

type MemberProfile {
  firstName: String!
  lastName: String!
  dateOfBirth: Time
  phoneNumber: String
  address: Address
  emergencyContact: EmergencyContact
  preferences: MemberPreferences
}
```

#### Member Queries

```graphql
# Get paginated members list
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
      }
      joinedAt
    }
    pageInfo {
      page
      pageSize
      total
      hasNextPage
    }
  }
}

# Search member by number
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
        country
      }
    }
    blockchainIdentity
  }
}
```

#### Member Mutations

```graphql
# Create new member
mutation CreateMember($input: CreateMemberInput!) {
  createMember(input: $input) {
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

# Update member profile
mutation UpdateMember($id: ID!, $input: MemberProfileInput!) {
  updateMember(id: $id, input: $input) {
    id
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

### Club Management

#### Club Type

```graphql
type Club {
  id: ID!
  name: String!
  description: String
  location: String!
  website: String
  status: ClubStatus!
  settings: ClubSettings
  createdAt: Time!
  updatedAt: Time!
}

type ClubSettings {
  allowReciprocal: Boolean!
  requireApproval: Boolean!
  maxVisitsPerMonth: Int!
  reciprocalFee: Float
}
```

#### Club Queries

```graphql
# Get all clubs
query GetClubs {
  clubs {
    id
    name
    description
    location
    status
    settings {
      allowReciprocal
      maxVisitsPerMonth
      reciprocalFee
    }
  }
}

# Get current user's club
query GetMyClub {
  myClub {
    id
    name
    description
    location
    settings {
      allowReciprocal
      requireApproval
      maxVisitsPerMonth
    }
  }
}
```

### Reciprocal Agreements

#### Agreement Type

```graphql
type ReciprocalAgreement {
  id: ID!
  clubId: ID!
  partnerClubId: ID!
  status: AgreementStatus!
  terms: AgreementTerms!
  effectiveDate: Time!
  expirationDate: Time
  createdAt: Time!
  updatedAt: Time!
}

type AgreementTerms {
  maxVisitsPerMonth: Int!
  reciprocalFee: Float
  blackoutDates: [Time!]
  specialConditions: String
}

enum AgreementStatus {
  PENDING
  APPROVED
  ACTIVE
  SUSPENDED
  EXPIRED
  REJECTED
}
```

#### Agreement Operations

```graphql
# Get reciprocal agreements
query GetReciprocalAgreements($pagination: PaginationInput, $status: AgreementStatus) {
  reciprocalAgreements(pagination: $pagination, status: $status) {
    nodes {
      id
      clubId
      partnerClubId
      status
      terms {
        maxVisitsPerMonth
        reciprocalFee
        blackoutDates
      }
      effectiveDate
      expirationDate
    }
    pageInfo {
      total
      hasNextPage
    }
  }
}

# Create new agreement
mutation CreateReciprocalAgreement($input: CreateReciprocalAgreementInput!) {
  createReciprocalAgreement(input: $input) {
    id
    status
    terms {
      maxVisitsPerMonth
      reciprocalFee
    }
    effectiveDate
  }
}

# Approve agreement
mutation ApproveAgreement($id: ID!) {
  approveReciprocalAgreement(id: $id) {
    id
    status
    updatedAt
  }
}
```

### Visit Management

#### Visit Type

```graphql
type Visit {
  id: ID!
  memberId: ID!
  clubId: ID!
  visitingClubId: ID!
  status: VisitStatus!
  checkInTime: Time!
  checkOutTime: Time
  services: [String!]
  cost: Float
  verified: Boolean!
  blockchainTxId: String
  createdAt: Time!
}

enum VisitStatus {
  CHECKED_IN
  CHECKED_OUT
  CANCELLED
  NO_SHOW
}
```

#### Visit Operations

```graphql
# Record new visit (check-in)
mutation RecordVisit($input: RecordVisitInput!) {
  recordVisit(input: $input) {
    id
    memberId
    visitingClubId
    status
    checkInTime
    services
  }
}

# Variables for check-in
{
  "input": {
    "memberId": "member_001",
    "visitingClubId": "club_002",
    "services": ["dining", "fitness"],
    "cost": 25.00
  }
}

# Check out visit
mutation CheckOutVisit($input: CheckOutVisitInput!) {
  checkOutVisit(input: $input) {
    id
    status
    checkOutTime
    cost
    verified
    blockchainTxId
  }
}

# Get visit history
query GetMyVisits($pagination: PaginationInput) {
  myVisits(pagination: $pagination) {
    nodes {
      id
      visitingClubId
      status
      checkInTime
      checkOutTime
      services
      cost
      verified
    }
    pageInfo {
      total
      hasNextPage
    }
  }
}
```

### Real-time Subscriptions

#### Subscription Types

```graphql
# Subscribe to notifications
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

# Subscribe to visit status changes
subscription VisitStatusChanged($clubId: ID) {
  visitStatusChanged(clubId: $clubId) {
    id
    status
    memberId
    checkInTime
    checkOutTime
  }
}

# Subscribe to blockchain transaction updates
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

### Analytics and Reporting

#### Analytics Queries

```graphql
# Get comprehensive analytics
query GetAnalytics($startDate: Time, $endDate: Time) {
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

### Blockchain Integration

#### Transaction Tracking

```graphql
# Get blockchain transactions
query GetTransactions($pagination: PaginationInput, $status: TransactionStatus) {
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
  }
}

# Sync blockchain data
mutation SyncBlockchainData {
  syncBlockchainData
}
```

### Governance System

#### Proposal Management

```graphql
# Get governance proposals
query GetProposals($pagination: PaginationInput, $status: ProposalStatus) {
  proposals(pagination: $pagination, status: $status) {
    nodes {
      id
      title
      description
      type
      status
      proposer {
        id
        username
      }
      votes {
        choice
        voter {
          username
        }
        comment
      }
      votingDeadline
    }
    pageInfo {
      total
      hasNextPage
    }
  }
}

# Create new proposal
mutation CreateProposal($input: CreateProposalInput!) {
  createProposal(input: $input) {
    id
    title
    type
    status
    votingDeadline
  }
}

# Cast vote
mutation CastVote($input: CastVoteInput!) {
  castVote(input: $input) {
    id
    choice
    comment
    createdAt
  }
}
```

## Error Handling

### GraphQL Error Format

```json
{
  "errors": [
    {
      "message": "Member not found",
      "locations": [{"line": 2, "column": 3}],
      "path": ["member"],
      "extensions": {
        "code": "MEMBER_NOT_FOUND",
        "field": "id",
        "value": "invalid_id"
      }
    }
  ],
  "data": {
    "member": null
  }
}
```

### Common Error Codes

- `UNAUTHENTICATED`: User not authenticated
- `UNAUTHORIZED`: Insufficient permissions
- `VALIDATION_ERROR`: Input validation failed
- `NOT_FOUND`: Resource not found
- `INTERNAL_ERROR`: Server error
- `RATE_LIMITED`: Too many requests
- `BLOCKCHAIN_ERROR`: Blockchain operation failed

## Authentication & Authorization Details

### JWT Token in Headers

```text
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
X-Club-ID: club_001
```

### Permission-based Access Control

```graphql
# Query requires MEMBER_READ permission
query {
  members {
    # Only returns data if user has permission
  }
}

# Mutation requires MEMBER_WRITE permission
mutation {
  updateMember(input: {...}) {
    # Only executes if user has permission
  }
}
```

## Rate Limiting and Caching

### Query Complexity Analysis

- Maximum query depth: 10 levels
- Maximum query complexity: 1000 points
- Field-level complexity scoring

### Caching Strategy

- Query result caching: 5 minutes for read operations
- DataLoader for N+1 query prevention
- Redis cache for expensive operations

## Development Tools

### GraphiQL Integration

Access the GraphiQL playground at `/graphql` in development mode for:

- Schema exploration
- Query building and testing
- Documentation browsing
- Subscription testing

### Schema Introspection

```graphql
query IntrospectionQuery {
  __schema {
    queryType {
      name
      fields {
        name
        type {
          name
        }
      }
    }
    mutationType {
      name
    }
    subscriptionType {
      name
    }
  }
}
```

This GraphQL API provides a comprehensive, type-safe interface to all Reciprocal Clubs platform functionality, supporting both Administrator and End User applications with real-time capabilities and blockchain integration.
