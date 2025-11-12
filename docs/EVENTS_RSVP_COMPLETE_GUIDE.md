# Events & RSVP Complete Guide

**Version**: 1.0
**Last Updated**: November 12, 2025
**Status**: Flutter Implementation Complete ✅ | Backend API Pending ⏳

---

## Table of Contents

1. [Business Overview](#business-overview)
2. [User Journey](#user-journey)
3. [Data Models](#data-models)
4. [GraphQL Schema](#graphql-schema)
5. [Implementation Status](#implementation-status)
6. [Flutter Integration](#flutter-integration)
7. [API Testing](#api-testing)

---

## Business Overview

### Feature Summary

Members RSVP to club events with a simple **Yes/No/Maybe** model. The system manages capacity with priority queues (home members first, reciprocal members second), enforces cancellation terms, collects dietary preferences, and sends timely reminders.

### Event Types Supported

All event types support RSVPs:
- **Social events** (galas, mixers, holiday parties)
- **Sporting events** (tournaments, competitions)
- **Educational events** (workshops, seminars)
- **Club meetings** (board meetings, assemblies)
- **Fundraisers**
- **Finding-Friends subgroups** (Vinna Vänner) - with priority for subgroup members

### RSVP Response Model

**Simple 3-state model**:
- ✅ **Yes** - Attending (creates confirmed RSVP)
- ❌ **No** - Not attending (no RSVP record created)
- ❓ **Maybe** - Interested (creates tentative RSVP, doesn't count toward capacity)

### Capacity Management

**Two-tier priority system**:

**Priority Queue A (Home Club Members)**:
- First access to all event capacity
- FCFS (First-Come-First-Served) by default
- Optional: Reserve X seats or Y% for approval-based allocation

**Priority Queue B (Reciprocal Club Members)**:
- Access to remaining capacity from Queue A
- Only if active reciprocal agreement exists
- Separate waitlist if reciprocal spots exhausted

**Priority Levels**:
1. **Subgroup Members** (Finding Friends) - Highest priority
2. **Home Club Members** - Standard priority
3. **Reciprocal Members** - Lower priority

### Guest Policies

Event organizer configures per event:
- **Members-only**: No guests
- **Male guests**: +N male guests allowed
- **Female guests**: +N female guests allowed
- **Friends & Family**: Any guests up to +N
- Guest names are **optional**

### Payment Options

Event organizer selects payment method:
- **Free event**: No payment
- **Paid event** with payment instructions in description:
  - Pay at bar/restaurant on arrival
  - Pre-pay to club bank account
  - Add to member's monthly bill

**No automated payment processing** - all payment verification is manual by club back-office.

### RSVP Modes

**Default**: Auto-confirm (immediate confirmation)

**Optional**: Approval-based
- Event organizer reviews and approves each RSVP
- Can reserve specific number/percentage of seats for approval
- Used for:
  - Finding-Friends subgroup events (subgroup members get priority)
  - Exclusive club events requiring vetting

### RSVP Deadlines

- **Standard**: Up to Day-1 before event
- **Configurable** by event organizer
- System blocks RSVP after deadline
- Shows organizer contact info for late requests

### Cancellation Terms

**Configurable by**:
- Club management (default club policy)
- Restaurant (for dining events)
- Event organizer (event-specific override)

**Default terms**:
- ✅ **Free cancellation**: Up to Day-3 before event
- ❌ **100% fee**: Cancellation within 3 days of event
- **Exception**: Fee waived if agreed by Member + Club/Restaurant

**Fee handling**:
- Charged to member account
- Or settled at next visit

---

## User Journey

### 1. Discover Events

**Member Action**: Browse club events

**System Response**:
- Display paginated list of upcoming events
- Show event type badges (color-coded)
- Display capacity indicators (green/orange/red)
- Show payment/approval indicators
- Enable search and filtering

**Eligibility Pre-check**:
- Check member authentication
- Verify member in good standing (no excessive debt)
- Check if reciprocal agreement active (for reciprocal members)

### 2. View Event Details

**Member Action**: Tap on an event

**System Response**:
- Display full event information:
  - Title, description, location, date/time
  - Event type and organizer
  - Capacity status with visual progress bar
  - Guest policy and max guests
  - Payment information (if paid)
  - Cancellation terms
  - RSVP and cancellation deadlines

**Eligibility Check**:
```
✅ Eligible: Green card with "You can RSVP"
🔵 Waitlist: Blue card with estimated position
🔴 Full: Red card with "Event is full"
⚫ Ineligible: Grey card with reason (e.g., "Outstanding dues")
```

**Priority Display**:
- Priority 1 (Subgroup): Orange badge
- Priority 2 (Home): Blue badge
- Priority 3 (Reciprocal): Grey badge

### 3. Submit RSVP

**Member Action**: Tap "RSVP Now" button

**Form Fields**:
1. **Response Selection**: Yes / Maybe / No (segmented buttons)
2. **Attendance Count**: Self + guests (stepper control)
3. **Guest Names**: Dynamic fields based on count (optional)
4. **Dietary Restrictions**: Multi-select chips (9 options)
   - Vegetarian, Vegan, Gluten-Free, Dairy-Free
   - Nut Allergy, Shellfish Allergy, Halal, Kosher, Other
5. **Seating Preferences**: Text field (optional)
6. **Special Requests**: Text area (optional)
7. **Payment Acknowledgment**: Checkbox (if paid event)
8. **Approval Notice**: Info card (if requires approval)

**System Processing**:
1. Validate form inputs
2. Check capacity in real-time
3. Determine RSVP status:
   - **Confirmed**: Auto-approve if space available
   - **Pending Approval**: If event requires approval
   - **Waitlist**: If event is full
   - **Tentative**: If response is "Maybe"
4. Increment attendance counter (if confirmed)
5. Send confirmation notification

**Success Response**:
- Success dialog with checkmark
- Message indicates status (confirmed/pending/waitlist)
- "Done" button returns to event details

### 4. View My RSVPs

**Member Action**: Navigate to "My RSVPs" page

**System Response**:
- Display paginated list of member's RSVPs
- Show status badges:
  - ✅ **Confirmed**: Green with checkmark
  - ❓ **Tentative**: Orange with question mark
  - ⏰ **Pending**: Amber with clock
  - ⏳ **Waitlist**: Blue with hourglass
  - ❌ **Cancelled**: Red with cancel icon
  - ⛔ **Declined**: Grey with not interested icon

**Filtering Options**:
- Filter by status (multiple selection)
- Show upcoming vs past events
- Search by event name

**Quick Actions**:
- View event details
- Cancel RSVP (with fee warning)
- Modify RSVP (if allowed)

### 5. Cancel RSVP

**Member Action**: Tap "Cancel RSVP" on confirmed RSVP

**System Response**:
1. Show confirmation dialog with:
   - Warning about cancellation
   - Calculated cancellation fee (if applicable)
   - Fee waiver status
2. Member confirms or cancels

**Fee Calculation**:
```go
daysUntilEvent := event.StartTime - now
if daysUntilEvent >= freeCancellationDays {
    fee = 0.0  // Free cancellation
} else {
    fee = paymentAmount * (cancellationFeePercent / 100)
}
```

**System Processing**:
1. Update RSVP status to "Cancelled"
2. Decrement event attendance counter
3. Calculate and record cancellation fee
4. Attempt to promote next waitlisted member
5. Send cancellation confirmation

### 6. Waitlist Auto-Promotion

**System Action**: When a spot becomes available

**Processing Logic**:
1. Check if anyone on waitlist
2. Get next waitlisted RSVP (ordered by priority, then RSVP date)
3. Verify capacity available for member type (home vs reciprocal)
4. Promote RSVP from "Waitlist" to "Confirmed"
5. Increment attendance counter
6. Send promotion notification to member

---

## Data Models

### Event Entity

Complete event model with all properties:

```dart
class EventEntity {
  // Core identifiers
  final String id;
  final String clubId;

  // Event details
  final String title;
  final String description;
  final EventType eventType;  // SOCIAL, SPORTING, EDUCATIONAL, MEETING, FUNDRAISER, FINDING_FRIENDS
  final String? location;     // Physical venue
  final String? imageUrl;     // Promotional image

  // Timing
  final DateTime startTime;
  final DateTime endTime;
  final DateTime? rsvpDeadline;

  // Capacity management
  final int? capacity;                 // Max attendees (alias for maxCapacity)
  final int currentAttendees;          // Current confirmed RSVPs (alias for currentAttendance)
  final int availableSpots;            // Calculated: capacity - currentAttendees
  final int? reciprocalCapacity;       // Slots reserved for reciprocal members
  final int? reciprocalSpotsUsed;
  final int? reciprocalSpotsAvailable;

  // Waitlist
  final bool waitlistEnabled;
  final int waitlistCount;
  final int? reciprocalWaitlistCount;

  // Guest policy
  final GuestPolicy guestPolicy;       // NO_GUESTS, MEMBERS_ONLY, MALE_GUESTS_ONLY, FEMALE_GUESTS_ONLY, FRIENDS_AND_FAMILY
  final int? maxGuestsPerMember;

  // Approval
  final bool requiresApproval;         // Alias: true if rsvpMode == "approval_required"
  final String? rsvpMode;              // "auto_confirm" or "approval_required"

  // Payment
  final bool requiresPayment;          // Alias for isPaid
  final double? price;                 // Price per person (null if free)
  final String? paymentInstructions;

  // Access control
  final bool allowReciprocalMembers;
  final bool allowsSubgroupPriority;   // Alias for subgroupPriority

  // Cancellation policy
  final DateTime? cancellationDeadline;
  final int? freeCancellationDays;     // Days before event for free cancellation
  final int? cancellationFeePercentage; // Alias for cancellationFeePercent (0-100)
  final String? cancellationTerms;

  // Organizer
  final String? organizerId;
  final String? organizerName;
  final String? contactEmail;
  final String? contactPhone;

  // Status
  final String status;                 // PENDING, CONFIRMED, CHECKED_IN, COMPLETED, CANCELLED, NO_SHOW
  final DateTime? publishedAt;
  final bool fullHouseExclusive;       // Entire club reserved for event

  // Data collection flags
  final bool? collectDietaryInfo;
  final bool? collectSeatingPrefs;

  // Attendee counts
  final int? confirmedAttendees;
  final int? tentativeAttendees;
  final int? tentativeCount;           // "Maybe" responses

  // Timestamps
  final DateTime createdAt;
  final DateTime updatedAt;

  // Computed properties
  bool get isFull => availableSpots <= 0;
  bool get acceptsGuests => guestPolicy != GuestPolicy.noGuests;
  bool get isPaid => requiresPayment && price != null && price! > 0;
  bool get isUpcoming => startTime.isAfter(DateTime.now());
  bool get isPast => endTime.isBefore(DateTime.now());
  bool get canRSVP => isUpcoming && (rsvpDeadline == null || DateTime.now().isBefore(rsvpDeadline!));
  double get capacityUtilization => capacity != null && capacity! > 0
    ? (currentAttendees / capacity!)
    : 0.0;
  bool get isNearlyFull => capacityUtilization >= 0.8;
}
```

**Enums**:
```dart
enum EventType {
  social,
  dining,
  sports,
  cultural,
  educational,
  networking,
  family,
  special,
  findingFriends,
}

enum GuestPolicy {
  noGuests,
  membersOnly,
  maleGuestsOnly,
  femaleGuestsOnly,
  friendsAndFamily,
}
```

### EventRSVP Entity

Complete RSVP model with all properties:

```dart
class EventRSVPEntity {
  // Core identifiers
  final String id;
  final String eventId;
  final String memberId;
  final String clubId;              // Member's home club

  // RSVP response
  final RSVPResponse response;      // YES, MAYBE, NO

  // Priority & Type
  final RSVPType rsvpType;          // PRIMARY (home), RECIPROCAL, SUBGROUP
  final int priority;               // 1=Subgroup, 2=Home, 3=Reciprocal

  // Attendance details
  final int attendanceCount;        // Self + guests
  final List<String>? guestNames;

  // Preferences
  final List<String>? dietaryRestrictions;
  final String? seatingPreferences;
  final String? specialRequests;

  // Status
  final RSVPStatus status;          // CONFIRMED, TENTATIVE, PENDING_APPROVAL, WAITLIST, CANCELLED, DECLINED

  // Approval (if required)
  final bool requiresApproval;
  final String? approvedBy;
  final DateTime? approvedAt;
  final String? declineReason;

  // Payment (manual verification)
  final bool paymentRequired;
  final bool paymentVerified;       // Manual verification by back-office
  final double? paymentAmount;
  final String? paymentNotes;

  // Cancellation
  final DateTime? cancelledAt;
  final String? cancellationReason;
  final double? cancellationFee;
  final bool feeWaived;             // Manual fee waiver

  // Check-in
  final bool checkedIn;
  final DateTime? checkedInAt;
  final int? actualGuestCount;      // At check-in

  // Waitlist
  final int? waitlistPosition;

  // Timestamps
  final DateTime rsvpedAt;
  final DateTime updatedAt;

  // Computed fields
  final bool canCancel;
  final bool canModify;
  final DateTime? cancellationDeadline;

  // Computed properties
  bool get isConfirmed => status == RSVPStatus.confirmed;
  bool get isOnWaitlist => status == RSVPStatus.waitlist;
  bool get isPendingApproval => status == RSVPStatus.pendingApproval;
  bool get isCancelled => status == RSVPStatus.cancelled;
}
```

**Enums**:
```dart
enum RSVPResponse {
  yes,
  maybe,
  no,
}

enum RSVPType {
  primary,      // Home club member
  reciprocal,   // Visiting reciprocal member
  subgroup,     // Finding Friends subgroup member
}

enum RSVPStatus {
  confirmed,
  tentative,
  pendingApproval,
  waitlist,
  cancelled,
  declined,
}
```

### RSVPEligibility Entity

Eligibility check response:

```dart
class RSVPEligibilityEntity {
  final bool eligible;
  final String? reason;
  final bool memberInGoodStanding;
  final bool hasOutstandingDebt;
  final double? debtAmount;
  final bool wouldBeWaitlisted;
  final int? estimatedWaitlistPosition;
  final int availableSpots;
  final int priority;
  final bool needsApproval;
  final bool paymentRequired;

  // Computed properties
  bool get wouldBeConfirmed => eligible && !wouldBeWaitlisted && !needsApproval;
  String get priorityLevel {
    switch (priority) {
      case 1: return "Subgroup Priority";
      case 2: return "Home Club Priority";
      case 3: return "Reciprocal Priority";
      default: return "Standard";
    }
  }
}
```

### FindingFriendsSubgroup Entity

Subgroup information:

```dart
class FindingFriendsSubgroupEntity {
  final String id;
  final String clubId;
  final String name;              // e.g., "Vinna Vänner - Golf"
  final String? description;
  final int memberCount;
  final bool isActive;

  const FindingFriendsSubgroupEntity({
    required this.id,
    required this.clubId,
    required this.name,
    this.description,
    required this.memberCount,
    required this.isActive,
  });
}
```

### CancelRSVPResponse Entity

Cancellation result:

```dart
class CancelRSVPResponseEntity {
  final bool success;
  final String message;
  final double? cancellationFee;
  final double? refundAmount;
  final bool feeWaived;

  const CancelRSVPResponseEntity({
    required this.success,
    required this.message,
    this.cancellationFee,
    this.refundAmount,
    required this.feeWaived,
  });
}
```

### Pagination Entities

```dart
class EventsConnectionEntity {
  final List<EventEntity> events;
  final PageInfoEntity pageInfo;
  final int totalCount;
}

class PageInfoEntity {
  final bool hasNextPage;
  final bool hasPreviousPage;
  final String? startCursor;
  final String? endCursor;
}
```

---

## GraphQL Schema

### Complete Type Definitions

```graphql
# ============================================
# ENUMS
# ============================================

enum EventType {
  SOCIAL
  DINING
  SPORTS
  CULTURAL
  EDUCATIONAL
  NETWORKING
  FAMILY
  SPECIAL
  FINDING_FRIENDS
}

enum GuestPolicy {
  NO_GUESTS
  MEMBERS_ONLY
  MALE_GUESTS_ONLY
  FEMALE_GUESTS_ONLY
  FRIENDS_AND_FAMILY
}

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
  DECLINED
}

enum BookingStatus {
  PENDING
  CONFIRMED
  CHECKED_IN
  COMPLETED
  CANCELLED
  NO_SHOW
}

# ============================================
# INPUT TYPES
# ============================================

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

# ============================================
# OBJECT TYPES
# ============================================

type Event {
  # Core identifiers
  id: ID!
  clubId: ID!

  # Event details
  title: String!
  description: String!
  eventType: EventType!
  location: String
  imageUrl: String

  # Timing
  startTime: DateTime!
  endTime: DateTime!
  rsvpDeadline: DateTime

  # Capacity - SUPPORTS BOTH FLUTTER & BACKEND NAMES
  capacity: Int                      # Flutter alias for maxCapacity
  maxCapacity: Int                   # Backend original
  currentAttendees: Int!             # Flutter alias for currentAttendance
  currentAttendance: Int!            # Backend original
  availableSpots: Int!
  tentativeCount: Int!
  reciprocalCapacity: Int
  reciprocalSpotsUsed: Int
  reciprocalSpotsAvailable: Int

  # Waitlist
  waitlistEnabled: Boolean!
  waitlistCount: Int!
  reciprocalWaitlistCount: Int

  # Guest policy
  guestPolicy: GuestPolicy!
  maxGuestsPerMember: Int

  # Approval - SUPPORTS BOTH FLUTTER & BACKEND NAMES
  requiresApproval: Boolean!         # Flutter alias (derived from rsvpMode)
  rsvpMode: String!                  # Backend original: "auto_confirm" or "approval_required"
  approvalSeatsReserved: Int
  approvalPercentage: Int

  # Payment - SUPPORTS BOTH FLUTTER & BACKEND NAMES
  requiresPayment: Boolean!          # Flutter alias for isPaid
  isPaid: Boolean!                   # Backend original
  price: Float                       # Price per person
  paymentInstructions: String

  # Access control - SUPPORTS BOTH FLUTTER & BACKEND NAMES
  allowReciprocalMembers: Boolean!
  allowsSubgroupPriority: Boolean!   # Flutter alias for subgroupPriority
  subgroupPriority: Boolean!         # Backend original

  # Cancellation - SUPPORTS BOTH FLUTTER & BACKEND NAMES
  cancellationDeadline: DateTime
  freeCancellationDays: Int!
  cancellationFeePercentage: Int!    # Flutter alias for cancellationFeePercent
  cancellationFeePercent: Int!       # Backend original
  cancellationTerms: String

  # Organizer
  organizerId: ID
  organizerName: String
  contactEmail: String
  contactPhone: String

  # Status
  status: BookingStatus!
  publishedAt: DateTime
  fullHouseExclusive: Boolean!

  # Data collection
  collectDietaryInfo: Boolean
  collectSeatingPrefs: Boolean

  # Attendee counts
  confirmedAttendees: Int!
  tentativeAttendees: Int!

  # Relations
  facility: Facility
  subgroup: FindingFriendsSubgroup
  myRSVP: EventRSVP

  # Timestamps
  createdAt: DateTime!
  updatedAt: DateTime!
}

type EventRSVP {
  # Core identifiers
  id: ID!
  eventId: ID!
  memberId: ID!
  clubId: ID!

  # RSVP details
  response: RSVPResponse!
  rsvpType: RSVPType!
  priority: Int!

  # Attendance
  attendanceCount: Int!
  guestNames: [String!]
  dietaryRestrictions: [String!]
  seatingPreferences: String
  specialRequests: String

  # Status
  status: RSVPStatus!

  # Approval
  requiresApproval: Boolean!
  approvedBy: ID
  approvedAt: DateTime
  declineReason: String

  # Payment
  paymentRequired: Boolean!
  paymentVerified: Boolean!
  paymentAmount: Float
  paymentNotes: String

  # Cancellation
  cancelledAt: DateTime
  cancellationReason: String
  cancellationFee: Float
  feeWaived: Boolean!

  # Check-in
  checkedIn: Boolean!
  checkedInAt: DateTime
  actualGuestCount: Int

  # Waitlist
  waitlistPosition: Int

  # Timestamps
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

# ============================================
# PAGINATION TYPES
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

  # Get event RSVPs (for organizers)
  eventRSVPs(
    eventId: ID!
    statusFilter: [RSVPStatus!]
  ): [EventRSVP!]!

  # Get single RSVP
  rsvp(id: ID!): EventRSVP!
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
  cancelRSVP(id: ID!, reason: String): CancelRSVPResponse!

  # Admin: Verify payment manually
  verifyRSVPPayment(rsvpId: ID!, verified: Boolean!): EventRSVP!

  # Admin: Move from waitlist to confirmed
  promoteFromWaitlist(rsvpId: ID!): EventRSVP!

  # Admin: Approve/decline RSVP
  approveRSVP(rsvpId: ID!): EventRSVP!
  declineRSVP(rsvpId: ID!, reason: String!): EventRSVP!
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

scalar DateTime
```

### Key Field Aliases

The backend supports **both Flutter and backend field names** for compatibility:

| Flutter Field | Backend Field | Type | Notes |
|--------------|---------------|------|-------|
| `capacity` | `maxCapacity` | Int! | Use either name |
| `currentAttendees` | `currentAttendance` | Int! | Use either name |
| `requiresApproval` | `rsvpMode` | Boolean! / String! | Boolean derived from rsvpMode |
| `requiresPayment` | `isPaid` | Boolean! | Use either name |
| `allowsSubgroupPriority` | `subgroupPriority` | Boolean! | Use either name |
| `cancellationFeePercentage` | `cancellationFeePercent` | Int! | Use either name |

---

## Implementation Status

### Flutter App (100% Complete) ✅

**Domain Layer** (13 files):
- ✅ Entities: Event, EventRSVP, RSVPEligibility, FindingFriendsSubgroup, CancelRSVPResponse, EventsConnection
- ✅ Repository interfaces with Either<Failure, T> pattern
- ✅ Use cases for all 8 operations

**Data Layer** (13 files + 39 unit tests):
- ✅ Data models with JSON serialization
- ✅ Remote data source with GraphQL client
- ✅ Repository implementation with error mapping
- ✅ 39 comprehensive unit tests (100% pass rate)

**Presentation Layer** (13 files + 109 tests):
- ✅ Riverpod controllers (4 controllers with AsyncNotifier pattern)
- ✅ UI Pages (4 pages):
  - Events List Page (pagination, search, filtering)
  - Event Details Page (eligibility checking)
  - RSVP Form Page (dynamic inputs, validation)
  - My RSVPs Page (status filtering, cancellation)
- ✅ Reusable Widgets (4 widgets):
  - EventCard (list item)
  - RSVPStatusBadge (status indicators)
  - CapacityIndicator (progress bar)
  - ErrorDisplay (error states)
- ✅ 24 controller tests (100% pass rate)
- ✅ 85 widget tests (100% pass rate)

**Infrastructure**:
- ✅ Routing integration (go_router with 4 routes)
- ✅ Internationalization (4 languages: en, sv, de, fr - 60+ strings each)
- ✅ Error handling (no automatic retry loops)
- ✅ Material Design 3 UI

**Code Metrics**:
- Total Files: 43
- Lines of Code: ~8,880
- Total Tests: 148
- Test Pass Rate: 100%

### Backend (Pending) ⏳

**GraphQL Schema**: ✅ Updated with Flutter-compatible aliases

**Code Generation**: ⏳ Pending
- Requires Go 1.25.3+
- Run `go generate ./...` in api-gateway

**Resolver Implementation**: ⏳ Pending
- New fields: location, imageUrl, price, cancellationDeadline
- Alias resolvers: capacity, currentAttendees, requiresApproval, etc.

**Database**: ⏳ Pending
- Add columns for new fields
- Run migrations

**Deployment**: ⏳ Pending
- Rebuild api-gateway
- Deploy to environment

---

## Flutter Integration

### Architecture

**Pattern**: Clean Architecture + Riverpod 3.x State Management

```
lib/features/events/
├── domain/
│   ├── entities/           # Business models
│   ├── repositories/       # Repository interfaces
│   └── usecases/          # Business logic
├── data/
│   ├── models/            # JSON models
│   ├── datasources/       # GraphQL datasources
│   └── repositories/      # Repository implementations
└── presentation/
    ├── controllers/       # Riverpod controllers
    ├── pages/            # UI pages
    └── widgets/          # Reusable widgets
```

### Key Dependencies

```yaml
dependencies:
  flutter_riverpod: ^2.5.1
  riverpod_annotation: ^2.3.5
  graphql_flutter: ^5.1.2
  dartz: ^0.10.1
  equatable: ^2.0.5
  intl: ^0.18.1

dev_dependencies:
  build_runner: ^2.4.6
  riverpod_generator: ^2.4.0
  mocktail: ^1.0.1
```

### GraphQL Client Setup

```dart
// lib/core/config/graphql_config.dart
class GraphQLConfig {
  static const String _apiUrl = 'http://192.168.0.170:8080/graphql';

  static HttpLink httpLink = HttpLink(_apiUrl);

  static AuthLink authLink = AuthLink(
    getToken: () async {
      final token = await _getAuthToken();
      return token != null ? 'Bearer $token' : null;
    },
  );

  static Link link = authLink.concat(httpLink);

  static ValueNotifier<GraphQLClient> initializeClient() {
    return ValueNotifier(
      GraphQLClient(
        link: link,
        cache: GraphQLCache(store: InMemoryStore()),
      ),
    );
  }
}
```

### Provider Architecture

```dart
// lib/features/events/presentation/controllers/events_controller.dart

// Remote data source provider
@riverpod
EventRemoteDataSource eventRemoteDataSource(EventRemoteDataSourceRef ref) {
  final client = ref.watch(graphQLClientProvider).value;
  return EventRemoteDataSourceImpl(client: client);
}

// Repository provider
@riverpod
EventsRepository eventsRepository(EventsRepositoryRef ref) {
  final remoteDataSource = ref.watch(eventRemoteDataSourceProvider);
  return EventsRepositoryImpl(remoteDataSource: remoteDataSource);
}

// Use case providers
@riverpod
GetEvents getEventsUseCase(GetEventsUseCaseRef ref) {
  return GetEvents(ref.watch(eventsRepositoryProvider));
}

// Controller with state management
@riverpod
class EventsList extends _$EventsList {
  int _currentPage = 1;
  List<EventEntity> _allEvents = [];
  bool _hasMorePages = true;

  @override
  FutureOr<List<EventEntity>> build(String clubId) async {
    _currentPage = 1;
    _allEvents = [];
    return _fetchEvents();
  }

  Future<List<EventEntity>> _fetchEvents() async {
    final getEvents = ref.read(getEventsUseCaseProvider);
    final result = await getEvents(GetEventsParams(
      clubId: clubId,
      page: _currentPage,
    ));

    return result.fold(
      (failure) => throw Exception(failure.message),
      (eventsConnection) {
        _allEvents.addAll(eventsConnection.events);
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
}
```

### GraphQL Query Example

```graphql
query GetEvents($clubId: ID!, $filters: EventFilters, $pagination: PaginationInput!) {
  events(clubId: $clubId, filters: $filters, pagination: $pagination) {
    edges {
      node {
        id
        title
        description
        location
        imageUrl
        eventType
        startTime
        endTime
        rsvpDeadline

        # Capacity (Flutter-friendly names)
        capacity
        currentAttendees
        availableSpots

        # Guest policy
        guestPolicy
        maxGuestsPerMember

        # Approval & Payment (Flutter-friendly names)
        requiresApproval
        requiresPayment
        price

        # Cancellation (Flutter-friendly names)
        cancellationDeadline
        cancellationFeePercentage

        # Access
        allowsSubgroupPriority

        # Status
        status
        organizerName
        contactEmail
      }
    }
    pageInfo {
      hasNextPage
      hasPreviousPage
    }
    totalCount
  }
}
```

### Error Handling Strategy

**No-Loop Error Handling** (Critical):
- All API calls use single execution with no automatic retries
- Errors are caught and displayed to users with ErrorDisplay
- Manual retry buttons only (user-initiated)
- RefreshIndicator for pull-to-refresh functionality
- Prevents infinite reconnection loops

```dart
// Controller error handling
Future<void> createRSVP(Map<String, dynamic> input) async {
  state = const AsyncValue.loading();

  state = await AsyncValue.guard(() async {
    final createRSVP = ref.read(createRSVPUseCaseProvider);
    final result = await createRSVP(CreateRSVPParams(input: input));

    return result.fold(
      (failure) => throw Exception(failure.message),
      (rsvp) => rsvp,
    );
  });
}

// UI error display
Widget build(BuildContext context, WidgetRef ref) {
  final eventsState = ref.watch(eventsListProvider(clubId));

  return eventsState.when(
    data: (events) => ListView(...),
    loading: () => const CircularProgressIndicator(),
    error: (error, stackTrace) => ErrorDisplay(
      message: error.toString(),
      onRetry: () => ref.invalidate(eventsListProvider(clubId)),
    ),
  );
}
```

### UI Components

**Events List Page**:
- Paginated event listing (scroll-triggered load more)
- Search bar with real-time filtering
- Filter modal (event types, date range, payment, approval)
- Empty state for no events
- Pull-to-refresh
- Error handling with manual retry

**Event Details Page**:
- Full event information display
- RSVP eligibility card (color-coded)
- Capacity indicator with visual progress bar
- Payment and approval indicators
- RSVP button with state management
- Pull-to-refresh

**RSVP Form Page**:
- Response selection (Yes/No/Maybe)
- Dynamic guest count with +/- controls
- Guest name fields (adjust based on count)
- Dietary restrictions multi-select (9 options)
- Seating preferences and special requests
- Payment notice (if paid)
- Approval notice (if required)
- Form validation
- Success/error dialogs

**My RSVPs Page**:
- Paginated RSVP list
- Status filtering (6 status types)
- Status badges (color-coded with icons)
- Cancel RSVP with confirmation
- Empty state for no RSVPs
- Pull-to-refresh

### Internationalization

**Supported Languages**:
- English (en): 60+ strings
- Swedish (sv): 60+ strings (OSA terminology)
- German (de): 60+ strings (formal address)
- French (fr): 60+ strings (proper conjugations)

**Usage**:
```dart
import 'package:clubland/generated/l10n/l10n.dart';

Text(S.of(context).events)
Text(S.of(context).rsvpToEvent)
Text(S.of(context).confirmed)
```

### Material Design 3

**Status Colors**:
```dart
class RSVPStatusColors {
  static const confirmed = Color(0xFF4CAF50);    // Green
  static const tentative = Color(0xFFFF9800);    // Orange
  static const waitlist = Color(0xFFFF5722);     // Deep Orange
  static const cancelled = Color(0xFF9E9E9E);    // Grey
  static const pendingApproval = Color(0xFF2196F3); // Blue
  static const declined = Color(0xFF757575);     // Dark Grey
}
```

**Priority Colors**:
```dart
class PriorityColors {
  static const subgroup = Color(0xFFFF6B00);     // High priority - Orange
  static const home = Color(0xFF1976D2);         // Medium - Blue
  static const reciprocal = Color(0xFF757575);   // Lower - Grey
}
```

### Running the App

```bash
# Install dependencies
flutter pub get

# Run code generation
dart run build_runner build --delete-conflicting-outputs

# Run the app
flutter run

# Run tests
flutter test

# Run with coverage
flutter test --coverage
```

---

## API Testing

### Prerequisites

**Backend**:
- GraphQL API running and accessible
- Authentication system with valid tokens
- Test events in database
- Test member accounts

**Flutter**:
- Code generation complete: `dart run build_runner build --delete-conflicting-outputs`
- API endpoint configured in GraphQL client
- Authentication tokens properly stored

### Critical Test: No Automatic Retry Loops

**How to Verify**:
1. Disconnect network
2. Attempt to load events
3. Observe error display
4. **WAIT 60 SECONDS** without any user interaction
5. **VERIFY**: App does NOT attempt to reconnect automatically
6. Reconnect network
7. Tap "Retry" button
8. **VERIFY**: App successfully loads data

**Expected Behavior**:
- ✅ Error message displayed with manual retry button
- ✅ NO automatic background reconnection attempts
- ✅ NO timer-based retries
- ✅ User must tap "Retry" or pull-to-refresh

### Test Scenarios

**1. Events List**:
- ✅ Initial load successful
- ✅ Pagination works (scroll to load more)
- ✅ Search filters events by title
- ✅ Filter modal applies filters correctly
- ✅ Pull-to-refresh reloads data
- ❌ Network error → Shows error with retry button

**2. Event Details**:
- ✅ Event information displayed correctly
- ✅ Eligibility check shows status (eligible/waitlist/full/ineligible)
- ✅ RSVP button enabled/disabled based on eligibility
- ✅ Capacity indicator shows correct color
- ❌ Event not found → Shows "Not Found" error

**3. RSVP Form**:
- ✅ Form displays all fields
- ✅ Guest fields adjust based on attendance count
- ✅ Dietary restrictions multi-select works
- ✅ Submit success → Success dialog
- ✅ Submit error → Error dialog
- ✅ Form validation prevents invalid submission

**4. My RSVPs**:
- ✅ RSVPs load with correct status badges
- ✅ Status filtering works
- ✅ Cancel RSVP shows confirmation dialog
- ✅ Cancel success → RSVP removed/updated
- ❌ Cancel error → Error snackbar

**5. Error Handling**:
- ❌ No internet → "Connection Error" with retry button
- ❌ Timeout → "Request Timeout" with retry button
- ❌ Invalid auth → "Authentication Required" (no retry)
- ❌ Server error → "Server Error" with retry button

### Test Data Requirements

**Events**:
1. Basic event (capacity: 50, current: 20, available)
2. Nearly full event (capacity: 30, current: 27, orange indicator)
3. Full event (capacity: 20, current: 20, red indicator)
4. Paid event (price: $75.50, payment indicator)
5. Approval-required event (approval indicator)
6. Past deadline event (RSVP button disabled)
7. Finding Friends event (subgroup priority badge)

**RSVPs**:
1. Confirmed RSVP (green badge with checkmark)
2. Tentative RSVP (orange badge with question mark)
3. Pending approval RSVP (amber badge with clock)
4. Waitlist RSVP (blue badge with hourglass, position shown)
5. Cancelled RSVP (red badge with cancel icon)

### GraphQL Playground Testing

```graphql
# Test event query
query TestEvent {
  event(id: "event-123") {
    id
    title
    location
    imageUrl
    capacity
    currentAttendees
    requiresApproval
    requiresPayment
    price
    cancellationDeadline
  }
}

# Test RSVP eligibility
query TestEligibility {
  checkRSVPEligibility(eventId: "event-123", memberId: "member-456") {
    eligible
    reason
    wouldBeWaitlisted
    availableSpots
    priority
  }
}

# Test create RSVP
mutation TestCreateRSVP {
  createRSVP(input: {
    eventId: "event-123"
    memberId: "member-456"
    clubId: "club-789"
    response: YES
    attendanceCount: 2
    guestNames: ["John Doe"]
    dietaryRestrictions: ["Vegetarian"]
  }) {
    id
    status
    attendanceCount
    waitlistPosition
  }
}
```

### Success Criteria

Testing is complete when:
1. ✅ All test cases pass successfully
2. ✅ Error handling works without retry loops
3. ✅ No crashes or unhandled exceptions
4. ✅ UI displays correctly in all states (loading, data, error, empty)
5. ✅ Translations display correctly (test with language switcher)
6. ✅ Navigation flows work seamlessly
7. ✅ Form validations prevent invalid submissions
8. ✅ API payloads match expected formats
9. ✅ Performance is acceptable (< 2s for list load)

---

## Quick Reference

### File Locations

**Flutter**:
- Domain: `lib/features/events/domain/`
- Data: `lib/features/events/data/`
- Presentation: `lib/features/events/presentation/`
- Tests: `test/unit/features/events/` and `test/widget/features/events/`

**Backend**:
- GraphQL Schema: `services/api-gateway/graph/schema/event_rsvp.graphql`
- Resolvers: `services/api-gateway/graph/resolvers/event_rsvp.resolvers.go`

### Key Commands

**Flutter**:
```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
flutter test
flutter analyze --fatal-infos --fatal-warnings
```

**Backend**:
```bash
cd services/api-gateway/
go generate ./...
go build -o api-gateway cmd/server/main.go
docker build -t clubland/api-gateway:latest .
```

### Documentation Files

- `EVENTS_RSVP_IMPLEMENTATION.md` - Implementation tracking
- `EVENTS_RSVP_CONSOLIDATED_STATUS.md` - Status report
- `FLUTTER_EVENT_FIELD_MAPPING.md` - Field mapping reference
- `EVENTS_RSVP_API_TESTING.md` - Testing procedures

---

**Document Version**: 1.0
**Last Updated**: November 12, 2025
**Maintained By**: Claude (AI Assistant)
**Status**: Ready for API Integration Testing
