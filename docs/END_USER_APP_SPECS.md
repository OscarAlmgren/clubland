# End User App Functional Requirements and API Specifications

## Overview

The Reciprocal Clubs End User App is a Flutter-based mobile and web application designed for club members' daily use and travel experiences. It provides seamless access to reciprocal club networks, booking capabilities, and social features.

## Application Architecture

### Target Platforms

- **Primary**: Mobile applications (iOS/Android)
- **Secondary**: Progressive Web App (PWA)
- **Optional**: Desktop companion app

### Technical Requirements

- Flutter 3.x framework with multi-platform support
- Dart 3.x programming language
- State management: Riverpod with AsyncNotifier
- HTTP client: Dio with retry mechanisms
- Authentication: JWT with biometric integration
- Maps: Google Maps/Apple Maps integration
- Push notifications: Firebase Cloud Messaging
- Offline-first architecture: Hive/Drift local database
- Real-time updates: WebSocket with automatic reconnection

## Core Functional Requirements

### 1. Authentication and Onboarding

#### Passwordless Authentication Flow

```graphql
# GraphQL Mutation for Login
mutation MemberLogin($input: LoginInput!) {
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
      status
      roles
      permissions
      createdAt
    }
  }
}

# Variables
{
  "input": {
    "email": "member@email.com",
    "password": "secure_password"
  }
}

# Get Current User Query
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
```

#### Member Profile Setup

```dart
// API Endpoint
PUT /api/member/profile/setup
{
  "personal_info": {
    "full_name": "Jane Smith",
    "preferred_name": "Jane",
    "date_of_birth": "1985-06-15",
    "phone": "+1234567890",
    "address": {
      "street": "123 Main St",
      "city": "New York",
      "state": "NY",
      "postal_code": "10001",
      "country": "USA"
    }
  },
  "preferences": {
    "language": "en",
    "currency": "USD",
    "distance_unit": "miles",
    "notifications": {
      "push_enabled": true,
      "email_enabled": true,
      "sms_enabled": false
    },
    "privacy": {
      "profile_visibility": "members_only",
      "activity_sharing": "friends_only",
      "location_sharing": "while_using_app"
    }
  },
  "interests": ["dining", "fitness", "golf", "spa", "networking"],
  "dietary_restrictions": ["vegetarian"],
  "accessibility_needs": []
}

// Response
{
  "profile": {
    "id": "member_001",
    "status": "active",
    "onboarding_complete": true,
    "verification_status": "pending_documents"
  }
}
```

### 2. Club Discovery and Search

#### Location-Based Club Search

```graphql
# GraphQL Query for Club Search
query GetClubs {
  clubs {
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
}

# For location-based search, use a custom resolver or filter
# This would be implemented in the resolver to handle geographic queries
query SearchNearbyClubs($lat: Float!, $lng: Float!, $radius: Float!) {
  # Custom resolver that filters clubs by location
  clubs {
    id
    name
    description
    location
    settings {
      allowReciprocal
      reciprocalFee
    }
    # Additional fields calculated in resolver:
    # - distance from provided coordinates
    # - current capacity/availability
    # - reciprocal agreement status with user's club
  }
}

# Get specific club details
query GetClubDetails($id: ID!) {
  club(id: $id) {
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
    # Related data via resolvers
    # reciprocalAgreements {
    #   status
    #   terms
    # }
  }
}
```

#### Club Details and Virtual Tour

```dart
// API Endpoint
GET /api/clubs/{club_id}/details

// Response
{
  "club": {
    "id": "club_001",
    "name": "Manhattan Athletic Club",
    "description": "Premier athletic club in the heart of Manhattan since 1892",
    "contact": {
      "phone": "+12125551234",
      "email": "concierge@manhattanac.com",
      "website": "https://manhattanac.com"
    },
    "hours": {
      "monday": {"open": "05:00", "close": "23:00"},
      "tuesday": {"open": "05:00", "close": "23:00"},
      "wednesday": {"open": "05:00", "close": "23:00"},
      "thursday": {"open": "05:00", "close": "23:00"},
      "friday": {"open": "05:00", "close": "23:00"},
      "saturday": {"open": "06:00", "close": "22:00"},
      "sunday": {"open": "07:00", "close": "21:00"}
    },
    "facilities": [
      {
        "type": "fitness_center",
        "name": "Main Gym",
        "description": "State-of-the-art equipment with personal trainers",
        "capacity": 100,
        "booking_required": false,
        "images": ["gym1.jpg", "gym2.jpg"]
      },
      {
        "type": "dining",
        "name": "The Grille",
        "description": "Fine dining with Manhattan skyline views",
        "capacity": 80,
        "booking_required": true,
        "booking_window_days": 7,
        "images": ["dining1.jpg", "dining2.jpg"]
      }
    ],
    "virtual_tour": {
      "available": true,
      "tour_url": "https://tour.club.com/club_001",
      "360_images": ["360_lobby.jpg", "360_pool.jpg", "360_dining.jpg"]
    },
    "policies": {
      "dress_code": {
        "fitness": "Athletic attire required",
        "dining": "Business casual minimum",
        "pool": "Appropriate swimwear only"
      },
      "guest_policy": "Members may bring one guest per visit",
      "age_restrictions": "18+ in fitness areas, all ages in dining",
      "cancellation_policy": "24-hour notice required"
    }
  }
}
```

### 3. Booking and Reservation System

#### Service Availability Check

```dart
// API Endpoint
GET /api/clubs/{club_id}/availability
  ?service=dining
  &date=2024-01-20
  &party_size=2
  &duration=120

// Response
{
  "service": "dining",
  "date": "2024-01-20",
  "availability": [
    {
      "time": "12:00",
      "available": true,
      "table_type": "standard",
      "duration_minutes": 120,
      "price": 0.00,
      "restrictions": []
    },
    {
      "time": "12:30",
      "available": true,
      "table_type": "window",
      "duration_minutes": 120,
      "price": 10.00,
      "restrictions": ["premium_seating"]
    },
    {
      "time": "19:00",
      "available": false,
      "reason": "fully_booked"
    }
  ],
  "booking_policies": {
    "advance_booking_required": true,
    "max_advance_days": 30,
    "cancellation_deadline_hours": 24,
    "no_show_policy": "May affect future booking privileges"
  }
}
```

#### Create Reservation

```dart
// API Endpoint
POST /api/reservations
{
  "club_id": "club_001",
  "service": "dining",
  "date": "2024-01-20",
  "time": "12:30",
  "party_size": 2,
  "duration_minutes": 120,
  "special_requests": "Window table if available, celebrating anniversary",
  "guest_info": [
    {
      "name": "John Smith",
      "relationship": "spouse",
      "dietary_restrictions": ["gluten_free"]
    }
  ],
  "contact_preferences": {
    "confirmation_method": "push_and_email",
    "reminder_times": [1440, 60] // minutes before
  }
}

// Response
{
  "reservation": {
    "id": "reservation_001",
    "confirmation_code": "MAC2024-001",
    "status": "confirmed",
    "club": {
      "name": "Manhattan Athletic Club",
      "address": "456 Park Ave, New York, NY",
      "phone": "+12125551234"
    },
    "details": {
      "service": "dining",
      "date": "2024-01-20",
      "time": "12:30",
      "party_size": 2,
      "estimated_duration": "2 hours",
      "table_preference": "window"
    },
    "total_cost": 10.00,
    "payment_required": false,
    "access_info": {
      "check_in_method": "qr_code",
      "qr_code": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAA...",
      "early_arrival_allowed": 15,
      "late_arrival_grace": 15
    },
    "cancellation": {
      "allowed_until": "2024-01-19T12:30:00Z",
      "penalty": null
    }
  }
}
```

### 4. Visit Management and Check-In

#### Self-Service Check-In

```dart
// API Endpoint
POST /api/visits/checkin
{
  "club_id": "club_001",
  "location": {
    "lat": 40.7589,
    "lng": -73.9786,
    "accuracy": 5.0
  },
  "check_in_method": "geolocation",
  "reservation_id": "reservation_001", // optional
  "planned_activities": ["dining", "fitness"],
  "estimated_duration": 180
}

// Response
{
  "visit": {
    "id": "visit_001",
    "status": "checked_in",
    "check_in_time": "2024-01-20T12:25:00Z",
    "access_badge": {
      "qr_code": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAA...",
      "access_code": "2024-001",
      "valid_until": "2024-01-20T23:59:59Z"
    },
    "permissions": {
      "areas_accessible": ["dining", "fitness", "pool", "lobby"],
      "guest_privileges": true,
      "service_discounts": []
    },
    "club_info": {
      "wifi": {
        "network": "MAC_Guest",
        "password": "welcome2024"
      },
      "emergency_contact": "+12125551234",
      "concierge_extension": "0"
    },
    "recommendations": [
      {
        "type": "dining",
        "title": "Chef's Special Today",
        "description": "Pan-seared salmon with seasonal vegetables",
        "location": "The Grille - 2nd Floor"
      }
    ]
  }
}
```

#### Real-Time Visit Tracking

```dart
// WebSocket Connection
wss://api.club.com/visits/{visit_id}/track?token={jwt_token}

// Status Updates
{
  "type": "location_update",
  "data": {
    "area": "fitness_center",
    "timestamp": "2024-01-20T13:15:00Z",
    "occupancy": "moderate"
  }
}

{
  "type": "service_opportunity",
  "data": {
    "service": "spa",
    "message": "Relaxing massage available in 30 minutes",
    "booking_url": "/spa/book?time=13:45"
  }
}

{
  "type": "checkout_reminder",
  "data": {
    "estimated_checkout": "2024-01-20T15:30:00Z",
    "checkout_options": ["self_service", "concierge"]
  }
}
```

### 5. Social Features and Community

#### Activity Feed and Social Sharing

```dart
// API Endpoint
GET /api/social/feed?type=following&limit=20&offset=0

// Response
{
  "activities": [
    {
      "id": "activity_001",
      "type": "visit_review",
      "member": {
        "id": "member_002",
        "name": "Alex Johnson",
        "avatar": "https://cdn.club.com/avatars/member_002.jpg",
        "home_club": "Boston Harbor Club"
      },
      "timestamp": "2024-01-20T14:30:00Z",
      "content": {
        "club": {
          "id": "club_001",
          "name": "Manhattan Athletic Club"
        },
        "rating": 5,
        "review": "Exceptional dining experience! The chef's special was outstanding.",
        "photos": ["review_photo_1.jpg"],
        "activities": ["dining", "networking"]
      },
      "engagement": {
        "likes": 12,
        "comments": 3,
        "user_liked": false,
        "user_bookmarked": true
      }
    }
  ],
  "suggestions": {
    "trending_clubs": [
      {"id": "club_015", "name": "Chicago Yacht Club", "recent_visits": 45}
    ],
    "recommended_connections": [
      {"id": "member_025", "name": "Sarah Wilson", "mutual_clubs": 3}
    ]
  }
}
```

#### Member Connections and Networking

```dart
// API Endpoint
POST /api/social/connections/request
{
  "target_member_id": "member_003",
  "message": "I noticed we've both visited Ocean View Club. Would love to connect!",
  "connection_type": "professional" // or "social", "travel_buddy"
}

// Response
{
  "connection_request": {
    "id": "request_001",
    "status": "pending",
    "target_member": {
      "name": "Michael Chen",
      "home_club": "San Francisco Athletic Club",
      "mutual_connections": 2,
      "common_interests": ["fitness", "dining", "travel"]
    },
    "sent_at": "2024-01-20T15:00:00Z"
  }
}
```

### 6. Travel Planning and Trip Management

#### Trip Planning Assistant

```dart
// API Endpoint
POST /api/trips/plan
{
  "destination": {
    "city": "Los Angeles",
    "state": "CA",
    "country": "USA"
  },
  "travel_dates": {
    "arrival": "2024-02-15",
    "departure": "2024-02-18"
  },
  "preferences": {
    "interests": ["dining", "fitness", "networking"],
    "budget_level": "moderate",
    "group_size": 1,
    "accommodation_proximity": "walking_distance"
  }
}

// Response
{
  "trip_plan": {
    "id": "trip_001",
    "destination": "Los Angeles, CA",
    "recommended_clubs": [
      {
        "club": {
          "id": "club_025",
          "name": "Los Angeles Athletic Club",
          "distance_from_accommodation": "0.3 miles"
        },
        "suggested_activities": [
          {
            "date": "2024-02-15",
            "activity": "welcome_dinner",
            "time": "19:00",
            "estimated_duration": 120
          },
          {
            "date": "2024-02-16",
            "activity": "fitness_session",
            "time": "07:00",
            "estimated_duration": 90
          }
        ],
        "booking_recommendations": [
          {
            "service": "dining",
            "priority": "high",
            "suggested_times": ["19:00", "19:30"],
            "book_by": "2024-02-08"
          }
        ]
      }
    ],
    "itinerary": {
      "total_estimated_cost": 125.00,
      "recommended_duration": "3 days",
      "networking_opportunities": 2
    }
  }
}
```

#### Travel Companion Matching

```dart
// API Endpoint
GET /api/travel/companions
  ?destination=los_angeles
  &dates=2024-02-15,2024-02-18
  &interests=dining,networking

// Response
{
  "potential_companions": [
    {
      "member": {
        "id": "member_010",
        "name": "Emily Rodriguez",
        "home_club": "Denver Country Club",
        "travel_style": "cultural_explorer"
      },
      "trip_overlap": {
        "common_dates": ["2024-02-16", "2024-02-17"],
        "common_interests": ["dining", "networking"],
        "compatibility_score": 0.85
      },
      "verification": {
        "identity_verified": true,
        "positive_reviews": 12,
        "safety_rating": 4.9
      }
    }
  ]
}
```

### 7. Account Management and Preferences

#### Member Dashboard

```dart
// API Endpoint
GET /api/member/dashboard

// Response
{
  "member": {
    "id": "member_001",
    "name": "Jane Smith",
    "home_club": {
      "id": "club_005",
      "name": "Boston Harbor Club",
      "member_since": "2019-03-15"
    },
    "membership_status": {
      "tier": "platinum",
      "status": "active",
      "expiry": "2024-12-31",
      "benefits": ["global_access", "guest_privileges", "concierge_service"]
    }
  },
  "stats": {
    "total_visits": 127,
    "clubs_visited": 23,
    "countries_visited": 8,
    "total_savings": 3250.00,
    "social_connections": 45,
    "reviews_written": 12
  },
  "recent_activity": {
    "last_visit": {
      "club": "Manhattan Athletic Club",
      "date": "2024-01-20",
      "rating": 5
    },
    "upcoming_reservations": [
      {
        "club": "Chicago Yacht Club",
        "date": "2024-01-25",
        "service": "dining",
        "time": "19:00"
      }
    ],
    "pending_invitations": 2
  },
  "achievements": [
    {
      "id": "globe_trotter",
      "title": "Globe Trotter",
      "description": "Visited clubs in 5+ countries",
      "earned_date": "2024-01-15",
      "badge_icon": "globe_icon.png"
    }
  ]
}
```

#### Notification Preferences

```dart
// API Endpoint
PUT /api/member/notifications/preferences
{
  "channels": {
    "push": {
      "enabled": true,
      "quiet_hours": {
        "start": "22:00",
        "end": "07:00",
        "timezone": "America/New_York"
      }
    },
    "email": {
      "enabled": true,
      "frequency": "weekly_digest"
    },
    "sms": {
      "enabled": false
    }
  },
  "types": {
    "reservation_confirmations": true,
    "visit_reminders": true,
    "social_activity": true,
    "promotional_offers": false,
    "security_alerts": true,
    "travel_recommendations": true,
    "friend_activity": true,
    "club_updates": true
  },
  "location_based": {
    "nearby_clubs": true,
    "check_in_reminders": true,
    "local_events": true,
    "radius_miles": 10
  }
}
```

## User Interface Specifications

### 1. Design System and Theming

#### Color Palette

```dart
// Primary Brand Colors
primary: Color(0xFF2E7D32),        // Forest green
primaryVariant: Color(0xFF1B5E20),
secondary: Color(0xFF1976D2),      // Professional blue
secondaryVariant: Color(0xFF0D47A1),

// Accent Colors
success: Color(0xFF4CAF50),
warning: Color(0xFFFF9800),
error: Color(0xFFE53935),
info: Color(0xFF42A5F5),

// Neutral Colors
background: Color(0xFFF8F9FA),
surface: Color(0xFFFFFFFF),
surfaceVariant: Color(0xFFF5F5F5),

// Text Colors
onPrimary: Color(0xFFFFFFFF),
onSecondary: Color(0xFFFFFFFF),
onBackground: Color(0xFF212121),
onSurface: Color(0xFF424242),
textSecondary: Color(0xFF757575),
```

#### Typography Scale

```dart
// Text Styles
headline1: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
headline2: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
headline3: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
subtitle1: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
subtitle2: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
body1: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
body2: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
caption: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
button: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
```

### 2. Navigation Structure

#### Bottom Navigation (Mobile)

- **Discover**: Club search and discovery
- **My Trips**: Current and planned visits
- **Social**: Activity feed and connections
- **Account**: Profile and settings

#### Drawer Navigation (Tablet/Desktop)

- Dashboard
- Club Discovery
- My Reservations
- Visit History
- Social Network
- Travel Planning
- Account Settings
- Help & Support

### 3. Key Screens and Layouts

#### Home/Dashboard Screen

```dart
class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Welcome back, Jane'),
              background: MembershipCard(),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              QuickActionsSection(),
              UpcomingReservationsCard(),
              NearbyClubsSection(),
              RecentActivityFeed(),
            ]),
          ),
        ],
      ),
    );
  }
}
```

#### Club Search Results

```dart
class ClubSearchResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchFilters(),
        MapToggle(),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => ClubCard(
              club: clubs[index],
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ClubDetailScreen(clubs[index]),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
```

## Offline Functionality and Caching

### 1. Critical Offline Features

- View saved clubs and their basic information
- Access current reservations and digital access badges
- Display membership card and QR codes
- View recent visit history
- Emergency contact information

### 2. Data Synchronization Strategy

```dart
class OfflineManager {
  // Sync priorities
  static const syncPriorities = {
    'member_profile': 1,
    'current_reservations': 2,
    'saved_clubs': 3,
    'visit_history': 4,
    'social_feed': 5,
  };

  Future<void> syncWhenOnline() async {
    // Priority-based synchronization
    for (final priority in syncPriorities.entries) {
      await _syncDataType(priority.key);
    }
  }
}
```

### 3. Local Storage Schema

```dart
// Hive/Drift Database Tables
@Entity()
class CachedClub {
  final int id;
  final String name;
  final String address;
  final double lat;
  final double lng;
  final List<String> amenities;
  final DateTime lastUpdated;
}

@Entity()
class OfflineReservation {
  final String id;
  final String clubId;
  final DateTime dateTime;
  final String qrCode;
  final bool synced;
}
```

## Security and Privacy Requirements

### 1. Data Protection

```dart
class SecurityManager {
  // Biometric authentication
  static Future<bool> authenticateWithBiometrics() async {
    final LocalAuthentication auth = LocalAuthentication();
    return await auth.authenticate(
      localizedReason: 'Authenticate to access your account',
      options: AuthenticationOptions(
        biometricOnly: true,
        stickyAuth: true,
      ),
    );
  }

  // Secure token storage
  static Future<void> storeTokenSecurely(String token) async {
    const storage = FlutterSecureStorage();
    await storage.write(key: 'auth_token', value: token);
  }
}
```

### 2. Privacy Controls

- Granular location sharing settings
- Activity visibility controls
- Data export/deletion capabilities
- Anonymous usage analytics opt-out

## Performance and Optimization

### 1. Performance Targets

- App launch time: < 2 seconds
- Search results: < 1.5 seconds
- Image loading: Progressive with caching
- Battery usage: Optimized background processing

### 2. Caching Strategy

```dart
class CacheManager {
  // Image caching
  static final imageCache = CachedNetworkImageProvider.cache;

  // API response caching
  static final apiCache = Dio()..interceptors.add(
    DioCacheInterceptor(options: CacheOptions(
      store: MemCacheStore(),
      maxStale: Duration(hours: 24),
    )),
  );
}
```

### 3. Analytics and Monitoring

```dart
class AnalyticsService {
  static void trackUserAction(String action, Map<String, dynamic> properties) {
    // Firebase Analytics or Mixpanel integration
    FirebaseAnalytics.instance.logEvent(
      name: action,
      parameters: properties,
    );
  }

  static void trackPerformance(String screen, Duration loadTime) {
    FirebasePerformance.instance.newTrace(screen)
      ..setMetric('load_time_ms', loadTime.inMilliseconds)
      ..stop();
  }
}
```

This comprehensive specification provides all necessary details for developing a premium End User mobile application that delivers an exceptional reciprocal club experience for members worldwide.
