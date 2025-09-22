# Administrator App Functional Requirements and API Specifications

## Overview

The Reciprocal Clubs Administrator App is a Flutter-based application designed for club reception staff and backoffice administrators. It provides comprehensive tools for daily operations, member management, and advanced blockchain interactions.

## Application Architecture

### Target Platforms

- **Primary**: Web application (responsive design)
- **Secondary**: Tablet application (iOS/Android)
- **Optional**: Desktop application (Windows/macOS/Linux)

### Technical Requirements

- Flutter 3.x framework
- Dart 3.x programming language
- State management: Riverpod or Bloc
- HTTP client: Dio with interceptors
- Authentication: JWT with secure storage
- Real-time updates: WebSocket integration
- Offline capability: Hive/SQLite local storage

## Core Functional Requirements

### 1. Authentication and Security

#### Multi-Factor Authentication

```graphql
# GraphQL Mutation
mutation AdminLogin($input: LoginInput!) {
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

# Variables
{
  "input": {
    "email": "admin@clubname.com",
    "password": "secure_password"
  }
}

# Response
{
  "data": {
    "login": {
      "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
      "refreshToken": "refresh_token_here",
      "expiresAt": "2024-01-16T10:30:00Z",
      "user": {
        "id": "admin_001",
        "email": "admin@clubname.com",
        "username": "john.admin",
        "firstName": "John",
        "lastName": "Administrator",
        "clubId": "club_001",
        "roles": ["club_admin"],
        "permissions": ["member_read", "member_write", "visit_manage", "reports_view"],
        "status": "ACTIVE"
      }
    }
  }
}
```

#### Role-Based Access Control

- **Reception Staff**: Member check-in/out, basic queries, visit management
- **Club Administrator**: Full member management, reporting, configuration
- **Super Administrator**: Multi-club access, agreement management, blockchain operations

### 2. Member Management Module

#### Member Search and Lookup

```graphql
# GraphQL Query
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
          city
          state
          country
        }
      }
      clubId
      joinedAt
      blockchainIdentity
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

# Variables
{
  "pagination": {
    "page": 1,
    "pageSize": 20
  },
  "status": "ACTIVE"
}

# Member by Number Query
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
    joinedAt
  }
}
```

#### Member Profile Management

```graphql
# GraphQL Mutation
mutation UpdateMember($id: ID!, $input: MemberProfileInput!) {
  updateMember(id: $id, input: $input) {
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
      preferences {
        emailNotifications
        smsNotifications
        pushNotifications
        marketingEmails
      }
    }
    blockchainIdentity
    updatedAt
  }
}

# Variables
{
  "id": "member_001",
  "input": {
    "firstName": "Jane",
    "lastName": "Smith",
    "phoneNumber": "+1234567890",
    "address": {
      "street": "123 Main St",
      "city": "New York",
      "state": "NY",
      "postalCode": "10001",
      "country": "USA"
    },
    "preferences": {
      "emailNotifications": true,
      "smsNotifications": false,
      "pushNotifications": true,
      "marketingEmails": false
    }
  }
}
```

### 3. Visit Management Module

#### Member Check-In Process

```graphql
# GraphQL Mutation
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
    createdAt
  }
}

# Variables
{
  "input": {
    "memberId": "member_001",
    "visitingClubId": "club_001",
    "services": ["dining", "pool"],
    "cost": 25.00
  }
}

# Response includes member details via nested query
query GetVisitWithDetails($visitId: ID!) {
  visit(id: $visitId) {
    id
    status
    checkInTime
    services
    cost
    verified
    blockchainTxId
    # Member details fetched via relation
    member {
      id
      memberNumber
      profile {
        firstName
        lastName
      }
      clubId
    }
  }
}
```

#### Visit History and Analytics

```graphql
# GraphQL Query for Visit History
query GetVisits($pagination: PaginationInput, $status: VisitStatus) {
  visits(pagination: $pagination, status: $status) {
    nodes {
      id
      memberId
      visitingClubId
      status
      checkInTime
      checkOutTime
      services
      cost
      verified
      blockchainTxId
      # Nested member and club data
      member {
        profile {
          firstName
          lastName
        }
        clubId
      }
    }
    pageInfo {
      total
      hasNextPage
      page
    }
  }
}

# GraphQL Query for Analytics
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
    }
  }
}
```

### 4. Agreement Management Module

#### Agreement Dashboard

```dart
// API Endpoint
GET /api/admin/agreements?club_id={club_id}&status={status}

// Response
{
  "agreements": [
    {
      "id": "agreement_001",
      "partner_club": {
        "id": "club_002",
        "name": "Ocean View Club",
        "city": "Miami",
        "country": "USA"
      },
      "status": "active",
      "effective_date": "2023-01-01",
      "expiry_date": "2024-12-31",
      "terms": {
        "reciprocal_privileges": ["dining", "fitness", "pool"],
        "guest_policy": "members_only",
        "advance_booking_required": false,
        "fees": {
          "dining_surcharge": 0,
          "facility_fee": 10.00
        }
      },
      "usage_stats": {
        "incoming_visits": 145,
        "outgoing_visits": 132,
        "revenue_generated": 1450.00,
        "costs_incurred": 1320.00
      }
    }
  ]
}
```

#### Agreement Creation Workflow

```dart
// API Endpoint
POST /api/admin/agreements/draft
{
  "partner_club_id": "club_002",
  "proposed_terms": {
    "reciprocal_privileges": ["dining", "fitness", "pool"],
    "guest_policy": "members_plus_one",
    "advance_booking_required": true,
    "booking_window_days": 30,
    "fees": {
      "dining_surcharge": 5.00,
      "facility_fee": 15.00
    },
    "capacity_limits": {
      "daily_limit": 50,
      "concurrent_limit": 20
    }
  },
  "effective_date": "2024-02-01",
  "expiry_date": "2025-01-31",
  "notes": "Premium partnership agreement"
}

// Response
{
  "agreement_draft": {
    "id": "draft_001",
    "status": "pending_review",
    "created_by": "admin_001",
    "created_at": "2024-01-15T10:30:00Z",
    "review_url": "https://app.club.com/agreements/draft_001/review",
    "estimated_revenue": 25000.00,
    "risk_assessment": "low"
  }
}
```

### 5. Blockchain Integration Module

#### Blockchain Transaction Dashboard

```dart
// API Endpoint
GET /api/admin/blockchain/transactions?type={type}&status={status}&limit=20

// Response
{
  "transactions": [
    {
      "id": "blockchain_tx_001",
      "type": "member_update",
      "entity_id": "member_001",
      "transaction_hash": "0x1234567890abcdef",
      "block_number": 12345,
      "timestamp": "2024-01-15T10:30:00Z",
      "status": "confirmed",
      "gas_used": 21000,
      "data": {
        "member_id": "member_001",
        "changes": ["membership_tier", "privileges"],
        "previous_hash": "0xabcdef1234567890",
        "new_hash": "0x567890abcdef1234"
      }
    }
  ],
  "network_status": {
    "latest_block": 12350,
    "network_health": "healthy",
    "pending_transactions": 5
  }
}
```

#### Manual Blockchain Operations

```dart
// API Endpoint
POST /api/admin/blockchain/manual-transaction
{
  "type": "agreement_update",
  "entity_id": "agreement_001",
  "data": {
    "agreement_id": "agreement_001",
    "changes": {
      "status": "terminated",
      "termination_date": "2024-01-15",
      "reason": "mutual_agreement"
    }
  },
  "priority": "high",
  "admin_signature": "admin_digital_signature"
}

// Response
{
  "transaction": {
    "id": "blockchain_tx_002",
    "status": "pending",
    "estimated_confirmation_time": "2-5 minutes",
    "gas_estimate": 45000,
    "tracking_url": "https://explorer.fabric.com/tx/blockchain_tx_002"
  }
}
```

### 6. Reporting and Analytics Module

#### Daily Operations Report

```dart
// API Endpoint
GET /api/admin/reports/daily?date={date}&club_id={club_id}

// Response
{
  "report_date": "2024-01-15",
  "club": {
    "id": "club_001",
    "name": "Downtown Athletic Club"
  },
  "metrics": {
    "total_checkins": 45,
    "total_checkouts": 42,
    "current_occupancy": 3,
    "peak_occupancy": 18,
    "revenue_generated": 1250.00,
    "services_breakdown": {
      "dining": {"usage": 28, "revenue": 850.00},
      "fitness": {"usage": 35, "revenue": 0.00},
      "pool": {"usage": 22, "revenue": 400.00}
    },
    "top_home_clubs": [
      {"name": "Ocean View Club", "visits": 8},
      {"name": "Mountain Resort", "visits": 6}
    ]
  },
  "issues": [
    {
      "type": "agreement_conflict",
      "description": "Member from expired agreement attempted access",
      "resolution": "Manual override granted, agreement renewal needed"
    }
  ]
}
```

#### Financial Reports

```dart
// API Endpoint
GET /api/admin/reports/financial?from={date}&to={date}&club_id={club_id}

// Response
{
  "period": {
    "from": "2024-01-01",
    "to": "2024-01-31"
  },
  "revenue": {
    "total": 45250.00,
    "breakdown": {
      "reciprocal_fees": 25000.00,
      "service_charges": 15250.00,
      "guest_fees": 5000.00
    }
  },
  "costs": {
    "total": 18750.00,
    "breakdown": {
      "outgoing_reciprocal": 12000.00,
      "processing_fees": 3750.00,
      "blockchain_gas": 250.00,
      "system_maintenance": 2750.00
    }
  },
  "net_profit": 26500.00,
  "trends": {
    "revenue_growth": 12.5,
    "cost_efficiency": 8.3,
    "member_satisfaction": 4.6
  }
}
```

### 7. Real-Time Notifications

#### WebSocket Integration

```dart
// WebSocket Connection
wss://api.club.com/admin/ws?token={jwt_token}&club_id={club_id}

// Message Types
{
  "type": "member_checkin",
  "data": {
    "member": {
      "name": "Jane Smith",
      "home_club": "Ocean View Club"
    },
    "timestamp": "2024-01-15T10:30:00Z",
    "services": ["dining", "pool"]
  }
}

{
  "type": "agreement_notification",
  "data": {
    "agreement_id": "agreement_001",
    "message": "New agreement proposal received",
    "priority": "medium",
    "action_required": true
  }
}

{
  "type": "blockchain_confirmation",
  "data": {
    "transaction_id": "blockchain_tx_001",
    "status": "confirmed",
    "block_number": 12345
  }
}
```

## User Interface Specifications

### 1. Dashboard Layout

- **Header**: Club branding, user info, notifications, settings
- **Sidebar**: Navigation menu with role-based items
- **Main Content**: Context-sensitive dashboard widgets
- **Footer**: System status, help links, logout

### 2. Color Scheme and Theming

```dart
// Primary Colors
primary: Color(0xFF1976D2),      // Professional blue
primaryVariant: Color(0xFF0D47A1),
secondary: Color(0xFF43A047),     // Success green
secondaryVariant: Color(0xFF2E7D32),
error: Color(0xFFD32F2F),        // Error red
warning: Color(0xFFFF9800),      // Warning orange

// Background Colors
background: Color(0xFFF5F5F5),   // Light grey
surface: Color(0xFFFFFFFF),      // White
cardBackground: Color(0xFFFAFAFA),

// Text Colors
onPrimary: Color(0xFFFFFFFF),
onSecondary: Color(0xFFFFFFFF),
onBackground: Color(0xFF212121),
onSurface: Color(0xFF424242),
```

### 3. Component Library

- **Data Tables**: Sortable, filterable member and visit lists
- **Cards**: Information display for members, agreements, reports
- **Forms**: Member creation/editing with validation
- **Modals**: Confirmation dialogs, detail views
- **Charts**: Analytics visualization using FL Chart
- **QR Scanner**: Camera integration for member lookup

### 4. Responsive Design Breakpoints

```dart
// Breakpoints
mobile: 0-600px     // Single column layout
tablet: 601-900px   // Two column layout
desktop: 901px+     // Multi-column layout with sidebar
```

## Offline Functionality

### 1. Critical Operations Available Offline

- Member lookup (cached recent searches)
- Basic member information display
- Visit check-in (queued for synchronization)
- Emergency access codes generation

### 2. Data Synchronization Strategy

```dart
// Sync Queue Management
class SyncQueue {
  // Queue operations for background sync
  Future<void> queueCheckin(VisitCheckin checkin);
  Future<void> queueMemberUpdate(MemberUpdate update);
  Future<void> processQueue(); // Called when connectivity restored
}

// Local Storage Schema
Table: cached_members
- id, name, email, phone, home_club, status, last_updated

Table: pending_checkins
- member_id, club_id, timestamp, services, synced

Table: app_settings
- theme, language, notification_preferences, offline_mode
```

## Security Requirements

### 1. Data Protection

- JWT token secure storage using Flutter Secure Storage
- Biometric authentication for sensitive operations
- Automatic session timeout after inactivity
- Data encryption for offline storage

### 2. API Security

```dart
// HTTP Interceptor for Authentication
class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = 'Bearer ${getStoredToken()}';
    options.headers['X-Club-ID'] = getCurrentClubId();
    handler.next(options);
  }
}

// Error Handling
class ApiErrorHandler {
  static void handleResponse(DioError error) {
    switch (error.response?.statusCode) {
      case 401: // Redirect to login
      case 403: // Show insufficient permissions
      case 429: // Rate limit exceeded
      case 500: // Server error handling
    }
  }
}
```

### 3. Audit Trail

```dart
// API Endpoint
POST /api/admin/audit/log
{
  "action": "member_update",
  "entity_type": "member",
  "entity_id": "member_001",
  "changes": {
    "membership_tier": {"from": "gold", "to": "platinum"},
    "privileges": {"added": ["spa"], "removed": []}
  },
  "admin_id": "admin_001",
  "timestamp": "2024-01-15T10:30:00Z",
  "ip_address": "192.168.1.100",
  "user_agent": "FlutterApp/1.0"
}
```

## Performance Requirements

### 1. Load Times

- Initial app launch: < 3 seconds
- Member search results: < 1 second
- Visit check-in process: < 2 seconds
- Report generation: < 5 seconds

### 2. Caching Strategy

- Member data: 24-hour cache with refresh capability
- Club information: 7-day cache
- Agreement data: 1-hour cache
- Real-time data: No caching

### 3. Resource Management

- Maximum memory usage: 150MB
- Battery optimization for mobile devices
- Background sync during charging only
- Automatic cache cleanup

This comprehensive specification provides all necessary details for developing a professional Administrator App that meets the operational needs of reciprocal club management while integrating advanced blockchain functionality.