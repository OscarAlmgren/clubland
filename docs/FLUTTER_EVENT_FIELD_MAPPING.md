# Flutter Event API Field Mapping Guide

## Overview

This document provides a comprehensive mapping between the Flutter app's Event queries and the backend GraphQL Event type. The backend schema has been updated to support **both the original field names AND Flutter-compatible aliases** for maximum compatibility.

## Schema Updates (November 12, 2025)

The following fields have been **added** to the backend Event type:

### New Fields

- `location: String` - Physical location/venue (e.g., "Main Dining Room", "Tennis Court 1")
- `imageUrl: String` - Event promotional image URL
- `price: Float` - Event price per person (null if free)
- `cancellationDeadline: DateTime` - Deadline for free cancellation

### Flutter Compatibility Aliases

The following **alias fields** have been added so Flutter doesn't need to change field names:

| Flutter Field Name | Backend Original | Backend Alias | Notes |
|-------------------|------------------|---------------|-------|
| `capacity` | `maxCapacity` | `capacity` | Both work identically |
| `currentAttendees` | `currentAttendance` | `currentAttendees` | Both work identically |
| `requiresApproval` | `rsvpMode` | `requiresApproval` | Boolean: true if rsvpMode == "approval_required" |
| `requiresPayment` | `isPaid` | `requiresPayment` | Both work identically |
| `allowsSubgroupPriority` | `subgroupPriority` | `allowsSubgroupPriority` | Both work identically |
| `cancellationFeePercentage` | `cancellationFeePercent` | `cancellationFeePercentage` | Both work identically |

## Complete Event Type Reference

### GraphQL Query Example

```graphql
query GetEvent($id: ID!) {
  event(id: $id) {
    # Core fields
    id
    clubId
    title
    description
    eventType

    # NEW: Location & Image
    location              # NEW FIELD
    imageUrl              # NEW FIELD

    # Timing
    startTime
    endTime
    rsvpDeadline

    # Capacity (use Flutter-friendly names)
    capacity              # ALIAS for maxCapacity
    currentAttendees      # ALIAS for currentAttendance
    availableSpots
    tentativeCount

    # Reciprocal capacity
    reciprocalCapacity
    reciprocalSpotsUsed
    reciprocalSpotsAvailable

    # Waitlist
    waitlistEnabled
    waitlistCount
    reciprocalWaitlistCount

    # Guest policy
    guestPolicy
    maxGuestsPerMember

    # Approval
    requiresApproval      # ALIAS - true if approval_required
    rsvpMode              # "auto_confirm" or "approval_required"

    # Payment (use Flutter-friendly names)
    requiresPayment       # ALIAS for isPaid
    price                 # NEW FIELD - amount per person
    paymentInstructions

    # Access
    allowReciprocalMembers
    allowsSubgroupPriority  # ALIAS for subgroupPriority

    # Cancellation (use Flutter-friendly names)
    cancellationDeadline     # NEW FIELD - DateTime
    cancellationFeePercentage # ALIAS for cancellationFeePercent
    cancellationTerms
    freeCancellationDays

    # Organizer
    organizerId
    organizerName
    contactEmail
    contactPhone

    # Status
    status
    publishedAt
    fullHouseExclusive

    # Data collection
    collectDietaryInfo
    collectSeatingPrefs

    # Attendees
    confirmedAttendees
    tentativeAttendees

    # Relations
    facility {
      id
      name
      facilityType
    }

    # My RSVP (for current user)
    myRSVP {
      id
      response
      status
      attendanceCount
      guestNames
      dietaryRestrictions
      seatingPreferences
      specialRequests
    }

    # Timestamps
    createdAt
    updatedAt
  }
}
```

## Field-by-Field Mapping

### 1. Basic Event Information

| Flutter Field | Backend Field | Type | Notes |
|--------------|---------------|------|-------|
| `id` | `id` | ID! | Unique event identifier |
| `clubId` | `clubId` | ID! | Owning club ID |
| `title` | `title` | String! | Event name |
| `description` | `description` | String! | Event description |
| `eventType` | `eventType` | EventType! | SOCIAL, SPORTING, EDUCATIONAL, MEETING, FUNDRAISER, FINDING_FRIENDS |
| `location` | `location` | String | **NEW** - Physical venue location |
| `imageUrl` | `imageUrl` | String | **NEW** - Event promotional image |

### 2. Timing

| Flutter Field | Backend Field | Type | Notes |
|--------------|---------------|------|-------|
| `startTime` | `startTime` | DateTime! | Event start |
| `endTime` | `endTime` | DateTime! | Event end |
| `rsvpDeadline` | `rsvpDeadline` | DateTime! | Last date to RSVP |

### 3. Capacity Management

| Flutter Field | Backend Field | Type | Notes |
|--------------|---------------|------|-------|
| `capacity` | `capacity` OR `maxCapacity` | Int! | **ALIAS** - Use either name |
| `currentAttendees` | `currentAttendees` OR `currentAttendance` | Int! | **ALIAS** - Use either name |
| `availableSpots` | `availableSpots` | Int! | Calculated: maxCapacity - currentAttendance |
| `tentativeCount` | `tentativeCount` | Int! | Number of "Maybe" RSVPs |

### 4. Approval & Payment

| Flutter Field | Backend Field | Type | Notes |
|--------------|---------------|------|-------|
| `requiresApproval` | `requiresApproval` OR `rsvpMode` | Boolean! / String! | **ALIAS** - Boolean true if rsvpMode == "approval_required" |
| `requiresPayment` | `requiresPayment` OR `isPaid` | Boolean! | **ALIAS** - Use either name |
| `price` | `price` | Float | **NEW** - Price per person (null if free) |
| `paymentInstructions` | `paymentInstructions` | String | Payment details |

### 5. Cancellation Policy

| Flutter Field | Backend Field | Type | Notes |
|--------------|---------------|------|-------|
| `cancellationDeadline` | `cancellationDeadline` | DateTime | **NEW** - Deadline for free cancellation |
| `cancellationFeePercentage` | `cancellationFeePercentage` OR `cancellationFeePercent` | Int! | **ALIAS** - Use either name (0-100) |
| `freeCancellationDays` | `freeCancellationDays` | Int! | Days before event for free cancellation |
| `cancellationTerms` | `cancellationTerms` | String | Detailed cancellation policy |

### 6. Guest & Access Policies

| Flutter Field | Backend Field | Type | Notes |
|--------------|---------------|------|-------|
| `guestPolicy` | `guestPolicy` | GuestPolicy! | MEMBERS_ONLY, MALE_GUESTS, FEMALE_GUESTS, FRIENDS_FAMILY |
| `maxGuestsPerMember` | `maxGuestsPerMember` | Int! | Maximum guests allowed |
| `allowReciprocalMembers` | `allowReciprocalMembers` | Boolean! | Can reciprocal members attend? |
| `allowsSubgroupPriority` | `allowsSubgroupPriority` OR `subgroupPriority` | Boolean! | **ALIAS** - Use either name |

### 7. Waitlist

| Flutter Field | Backend Field | Type | Notes |
|--------------|---------------|------|-------|
| `waitlistEnabled` | `waitlistEnabled` | Boolean! | Is waitlist active? |
| `waitlistCount` | `waitlistCount` | Int! | Total on waitlist |
| `reciprocalWaitlistCount` | `reciprocalWaitlistCount` | Int! | Reciprocal members on waitlist |

### 8. Organizer Information

| Flutter Field | Backend Field | Type | Notes |
|--------------|---------------|------|-------|
| `organizerId` | `organizerId` | ID! | Organizer member ID |
| `organizerName` | `organizerName` | String! | Organizer display name |
| `contactEmail` | `contactEmail` | String! | Contact email |
| `contactPhone` | `contactPhone` | String | Contact phone (optional) |

### 9. Attendee Counts

| Flutter Field | Backend Field | Type | Notes |
|--------------|---------------|------|-------|
| `confirmedAttendees` | `confirmedAttendees` | Int! | Number of confirmed RSVPs |
| `tentativeAttendees` | `tentativeAttendees` | Int! | Number of tentative RSVPs |

### 10. Status & Metadata

| Flutter Field | Backend Field | Type | Notes |
|--------------|---------------|------|-------|
| `status` | `status` | BookingStatus! | PENDING, CONFIRMED, CHECKED_IN, COMPLETED, CANCELLED, NO_SHOW |
| `publishedAt` | `publishedAt` | DateTime | When event was published (null if draft) |
| `createdAt` | `createdAt` | DateTime! | Creation timestamp |
| `updatedAt` | `updatedAt` | DateTime! | Last update timestamp |

## Enum Types

### EventType

```graphql
enum EventType {
  SOCIAL
  SPORTING
  EDUCATIONAL
  MEETING
  FUNDRAISER
  FINDING_FRIENDS
}
```

### GuestPolicy

```graphql
enum GuestPolicy {
  MEMBERS_ONLY
  MALE_GUESTS
  FEMALE_GUESTS
  FRIENDS_FAMILY
}
```

### BookingStatus

```graphql
enum BookingStatus {
  PENDING
  CONFIRMED
  CHECKED_IN
  COMPLETED
  CANCELLED
  NO_SHOW
}
```

### RSVPStatus

```graphql
enum RSVPStatus {
  CONFIRMED          # Yes, confirmed
  TENTATIVE          # Maybe
  PENDING_APPROVAL   # Awaiting organizer approval
  WAITLIST           # On waitlist
  CANCELLED          # Member cancelled
  DECLINED           # Organizer declined
}
```

### RSVPResponse

```graphql
enum RSVPResponse {
  YES
  MAYBE
  NO
}
```

## Flutter Migration Strategies

### Option 1: No Changes Required (Recommended)

Your existing Flutter queries should now work without modification since all the fields you're querying now exist as aliases:

```dart
// This query now works!
query GetEvent($id: ID!) {
  event(id: $id) {
    location              // ✅ NOW AVAILABLE
    imageUrl              // ✅ NOW AVAILABLE
    capacity              // ✅ Alias for maxCapacity
    currentAttendees      // ✅ Alias for currentAttendance
    requiresApproval      // ✅ Alias (derived from rsvpMode)
    requiresPayment       // ✅ Alias for isPaid
    price                 // ✅ NOW AVAILABLE
    cancellationDeadline  // ✅ NOW AVAILABLE
    cancellationFeePercentage  // ✅ Alias for cancellationFeePercent
    allowsSubgroupPriority     // ✅ Alias for subgroupPriority
  }
}
```

### Option 2: Use Backend Field Names (Future-Proof)

Migrate to the canonical backend field names for long-term consistency:

```dart
query GetEvent($id: ID!) {
  event(id: $id) {
    location              // Same
    imageUrl              // Same
    maxCapacity           // Changed from 'capacity'
    currentAttendance     // Changed from 'currentAttendees'
    rsvpMode              // Changed from 'requiresApproval' (returns string)
    isPaid                // Changed from 'requiresPayment'
    price                 // Same
    cancellationDeadline  // Same
    cancellationFeePercent // Changed from 'cancellationFeePercentage'
    subgroupPriority      // Changed from 'allowsSubgroupPriority'
  }
}
```

### Option 3: Hybrid Approach

Use Flutter-friendly names in queries but map to backend names in your data models:

```dart
class Event {
  final int maxCapacity;
  final int currentAttendance;

  Event.fromJson(Map<String, dynamic> json)
    : maxCapacity = json['capacity'] ?? json['maxCapacity'],
      currentAttendance = json['currentAttendees'] ?? json['currentAttendance'];
}
```

## Testing Your Queries

### Test Query (Use in GraphQL Playground)

```graphql
query TestFlutterEventQuery {
  events(limit: 1) {
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
    cancellationFeePercentage
    allowsSubgroupPriority
  }
}
```

## Common Issues & Solutions

### Issue 1: "Cannot query field X on type Event"

**Cause**: Backend hasn't regenerated GraphQL schema yet
**Solution**:

1. Backend needs to run: `go generate ./...` in `services/api-gateway/`
2. Or rebuild the api-gateway Docker image
3. Fields have been added to schema file but code generation pending

### Issue 2: Null values for new fields

**Cause**: Database records don't have values for new fields yet
**Solution**:

- `location`: Will be null until events are updated with venue info
- `imageUrl`: Will be null until images are uploaded
- `price`: Will be null for free events (by design)
- `cancellationDeadline`: Will be calculated from `freeCancellationDays` + `startTime`

### Issue 3: Boolean vs String for requiresApproval

**Cause**: Backend has `rsvpMode: String` and `requiresApproval: Boolean` alias
**Solution**: Use `requiresApproval` boolean field for simpler logic

```dart
// ✅ Good
if (event.requiresApproval) {
  showApprovalWarning();
}

// ❌ Avoid
if (event.rsvpMode == "approval_required") {
  showApprovalWarning();
}
```

## Backend Implementation Status

### ✅ Completed (November 12, 2025)

- [x] Updated GraphQL schema with new fields
- [x] Added Flutter compatibility aliases
- [x] Created field mapping documentation

### ⏳ Pending

- [ ] Regenerate GraphQL code with gqlgen (requires Go 1.25.3)
- [ ] Implement resolver logic for new fields
- [ ] Update Event model in api-gateway
- [ ] Add database migrations for new columns
- [ ] Update booking service to populate new fields

### 🔄 Next Steps for Backend Team

1. Install Go 1.25.3 or higher
2. Run `go generate ./...` in `services/api-gateway/`
3. Implement resolver methods in `event_rsvp.resolvers.go`
4. Add database columns for `location`, `imageUrl`, `price`, `cancellationDeadline`
5. Update booking service gRPC proto with new fields
6. Rebuild and deploy api-gateway service

## Related Documentation

- **Event RSVP API Spec**: `docs/EVENT_RSVP_API_SPEC.md`
- **Event RSVP Data Models**: `docs/EVENT_RSVP_DATA_MODELS.md`
- **Flutter Integration Guide**: `docs/FLUTTER_EVENT_RSVP_GUIDE.md`
- **GraphQL Schema**: `services/api-gateway/graph/schema/event_rsvp.graphql`

## Support

For questions or issues:

1. Check this mapping document first
2. Review the GraphQL schema file
3. Test queries in GraphQL Playground (<http://localhost:8080/graphql>)
4. Check backend logs for resolver errors
5. Create an issue in the repository

---

**Last Updated**: November 12, 2025
**Backend Version**: 0.2.0+
**Status**: Schema updated, code generation pending
