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

## Next Steps

1. **Implement**: [Authentication & Security](./AUTHENTICATION_SECURITY.md) for JWT handling
2. **Build**: [Flutter Integration](./FLUTTER_INTEGRATION.md) for client implementation
3. **Monitor**: [Testing & Deployment](./TESTING_DEPLOYMENT.md) for production setup
4. **Optimize**: [Backend Architecture](./BACKEND_ARCHITECTURE.md) for scaling patterns