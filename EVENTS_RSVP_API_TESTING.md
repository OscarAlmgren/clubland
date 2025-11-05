# Events & RSVP API Integration Testing Guide

**Feature**: Events & RSVP User Journey
**Branch**: `claude/implement-rsvp-event-journey-011CUptJFDZPNb9FtLRwGwZE`
**Document Version**: 1.0
**Last Updated**: November 5, 2025

---

## 📋 Overview

This document provides comprehensive procedures for testing the Events & RSVP feature with the live backend API. The feature has been implemented with robust error handling and no automatic retry loops, making it safe to test with a production-like environment.

---

## 🎯 Prerequisites

### Backend Requirements

- **GraphQL API**: Running and accessible
- **Authentication**: Working auth system with valid tokens
- **Test Data**: Events created in the database with various configurations
- **Test Users**: Multiple member accounts for testing different scenarios

### Frontend Setup

1. **Code Generation** (if not done):
   ```bash
   flutter pub get
   dart run build_runner build --delete-conflicting-outputs
   ```

2. **Environment Configuration**:
   - Update API endpoint in environment configuration
   - Ensure GraphQL client is configured for your backend
   - Verify authentication tokens are properly stored

3. **Run the App**:
   ```bash
   flutter run
   # Or with specific device:
   flutter run -d <device_id>
   ```

---

## 🧪 Test Scenarios

### 1. Events List Page Testing

**Route**: `/events/:clubId`

#### Test Case 1.1: Initial Load
**Steps**:
1. Navigate to Events List page
2. Observe loading indicator
3. Verify events are displayed

**Expected Results**:
- ✅ Loading spinner appears during fetch
- ✅ Events display with correct information (title, date, location, type)
- ✅ Capacity indicators show correct colors (green, orange, red)
- ✅ Event type badges display with correct colors

**Error Scenarios to Test**:
- ❌ No internet connection → Shows "Connection Error" with retry button
- ❌ Server timeout → Shows "Request Timeout" with retry button
- ❌ Server error → Shows "Server Error" with retry button
- ❌ Invalid token → Shows "Authentication Required" (no retry)

#### Test Case 1.2: Pagination
**Steps**:
1. Scroll to bottom of events list
2. Observe loading indicator at bottom
3. Verify new events are appended

**Expected Results**:
- ✅ More events load when scrolling to 90% of list
- ✅ Loading indicator appears at bottom during pagination
- ✅ No duplicate events
- ✅ Pagination stops when no more events available

**Error Scenarios to Test**:
- ❌ Network error during pagination → Shows error, does NOT retry automatically
- ❌ User must manually retry with pull-to-refresh

#### Test Case 1.3: Search
**Steps**:
1. Enter search text in search bar
2. Observe search results
3. Clear search and verify all events return

**Expected Results**:
- ✅ Search filters events by title
- ✅ Empty state shown if no results found
- ✅ Clear button removes search filter

#### Test Case 1.4: Filtering
**Steps**:
1. Tap filter icon
2. Select event type filter (e.g., "Dining")
3. Apply filter
4. Verify only dining events shown

**Expected Results**:
- ✅ Filter modal opens with all filter options
- ✅ Event types: Social, Dining, Sports, Cultural, Educational, Networking, Family, Special, Finding Friends
- ✅ Payment filter: All, Free, Paid
- ✅ Approval filter: All, No Approval, Requires Approval
- ✅ Clear filters button removes all filters

#### Test Case 1.5: Pull-to-Refresh
**Steps**:
1. Pull down on events list
2. Observe refresh indicator
3. Verify events are reloaded

**Expected Results**:
- ✅ Refresh indicator appears
- ✅ Events reload from server
- ✅ List scrolls back to top

---

### 2. Event Details Page Testing

**Route**: `/events/:clubId/event/:eventId`

#### Test Case 2.1: Load Event Details
**Steps**:
1. Tap on an event card from list
2. Observe event details page load
3. Verify all information is displayed

**Expected Results**:
- ✅ Event title, date, time, location displayed
- ✅ Event description shown
- ✅ Capacity indicator shows current attendance
- ✅ Event type, organizer, guest policy displayed
- ✅ RSVP and cancellation deadlines shown (if applicable)
- ✅ Payment amount shown (if paid event)
- ✅ Approval requirement indicator shown (if required)

#### Test Case 2.2: RSVP Eligibility Check
**Steps**:
1. Observe eligibility card at top of details page
2. Verify eligibility status is correct

**Expected Results**:
- ✅ **Eligible**: Green card with "You can RSVP" message
- ✅ **Waitlist**: Blue card with waitlist position
- ✅ **Full**: Red card with "Event is full" message
- ✅ **Ineligible**: Grey card with reason (e.g., "Outstanding dues")
- ✅ **Priority indicated**: Shows priority level (Subgroup=1, Home=2, Reciprocal=3)

#### Test Case 2.3: Navigate to RSVP Form
**Steps**:
1. Tap "RSVP Now" button (when eligible)
2. Verify RSVP form page opens

**Expected Results**:
- ✅ RSVP form opens with event summary at top
- ✅ Button disabled when event full or past deadline
- ✅ Button shows "Already RSVP'd" when user has existing RSVP

**Error Scenarios to Test**:
- ❌ Event not found → Shows "Not Found" error (no retry)
- ❌ Network error → Shows "Connection Error" with retry
- ❌ Eligibility check fails → Shows error on eligibility card

---

### 3. RSVP Form Page Testing

**Route**: Navigate from Event Details (via Navigator.push)

#### Test Case 3.1: Form Display
**Steps**:
1. Open RSVP form
2. Verify all form fields are present

**Expected Results**:
- ✅ Event summary card at top
- ✅ Response selection: Yes, No, Maybe (segmented buttons)
- ✅ Attendance count with +/- controls
- ✅ Guest name fields (dynamic based on count)
- ✅ Dietary restrictions chips (9 options)
- ✅ Seating preferences text field
- ✅ Special requests text field
- ✅ Payment notice card (if paid event)
- ✅ Approval notice card (if requires approval)

#### Test Case 3.2: Dynamic Guest Fields
**Steps**:
1. Set attendance count to 1 → No guest fields
2. Increase to 2 → 1 guest name field appears
3. Increase to 3 → 2 guest name fields
4. Decrease to 1 → Guest fields disappear

**Expected Results**:
- ✅ Guest name fields match attendance count - 1
- ✅ Fields have validation (required)
- ✅ Max guests respected (from event.maxGuests)

#### Test Case 3.3: Submit RSVP - Success
**Steps**:
1. Select "Yes" response
2. Fill in guest names (if multiple attendees)
3. Select dietary restrictions (optional)
4. Add seating preferences (optional)
5. Tap "Submit RSVP"
6. Observe success dialog

**Expected Results**:
- ✅ Loading indicator during submission
- ✅ Success dialog appears with checkmark icon
- ✅ Message indicates confirmation or pending approval
- ✅ "Done" button returns to event details
- ✅ Error dialog NOT shown

**API Payload Verification**:
```graphql
{
  eventId: "event-123",
  memberId: "member-456",
  clubId: "club-789",
  response: "yes",
  attendanceCount: 2,
  guestNames: ["John Doe"],
  dietaryRestrictions: ["Vegetarian", "Gluten-Free"],
  seatingPreferences: ["Near window"],
  specialRequests: ["Wheelchair accessible"]
}
```

#### Test Case 3.4: Submit RSVP - Error
**Steps**:
1. Simulate error (e.g., disconnect network)
2. Fill form and submit
3. Observe error dialog

**Expected Results**:
- ✅ Error dialog appears with error icon
- ✅ Error message explains what went wrong
- ✅ "Close" button dismisses dialog
- ✅ Form state preserved (can retry)
- ✅ NO automatic retry attempts

#### Test Case 3.5: Form Validation
**Steps**:
1. Leave guest names empty
2. Try to submit
3. Observe validation errors

**Expected Results**:
- ✅ Guest name fields show "Please enter guest name" error
- ✅ Form does not submit with validation errors

---

### 4. My RSVPs Page Testing

**Route**: `/my-rsvps/:clubId`

#### Test Case 4.1: Load My RSVPs
**Steps**:
1. Navigate to My RSVPs page
2. Observe RSVP list load

**Expected Results**:
- ✅ Loading indicator during fetch
- ✅ RSVPs display with event info
- ✅ Status badges show correct colors and icons
- ✅ Event dates formatted correctly
- ✅ Attendance count shown (e.g., "2 people")

#### Test Case 4.2: Status Filtering
**Steps**:
1. Tap filter icon
2. Select status filter (e.g., "Confirmed")
3. Apply filter
4. Verify only confirmed RSVPs shown

**Expected Results**:
- ✅ Filter modal opens with status chips
- ✅ Statuses: Confirmed, Tentative, Pending Approval, Waitlist, Cancelled, Declined
- ✅ Multiple statuses can be selected
- ✅ "Clear" button removes all filters

#### Test Case 4.3: Cancel RSVP
**Steps**:
1. Find confirmed RSVP
2. Tap "Cancel RSVP" button
3. Confirm cancellation in dialog
4. Observe result

**Expected Results**:
- ✅ Confirmation dialog appears with warning
- ✅ Mentions cancellation fees may apply
- ✅ "Keep RSVP" button dismisses dialog
- ✅ "Cancel RSVP" button proceeds with cancellation
- ✅ Success snackbar appears on success
- ✅ RSVP removed from list or status updated
- ✅ Error snackbar on failure

**API Call Verification**:
```graphql
mutation CancelRSVP {
  cancelRSVP(rsvpId: "rsvp-123", reason: "User initiated") {
    success
    message
    cancellationFee
    refundAmount
  }
}
```

#### Test Case 4.4: Navigate to Event Details
**Steps**:
1. Tap on RSVP card
2. Verify navigation to event details

**Expected Results**:
- ✅ Navigation to event details page
- ✅ Correct event ID passed

---

### 5. Error Handling Testing

#### Test Case 5.1: No Internet Connection
**Steps**:
1. Disable device network
2. Attempt to load events
3. Observe error

**Expected Results**:
- ✅ "Connection Error" displayed with wifi icon
- ✅ Message: "Unable to connect to the server..."
- ✅ "Retry" button available
- ✅ NO automatic retry attempts
- ✅ NO background reconnection loops

#### Test Case 5.2: Server Timeout
**Steps**:
1. Simulate slow network or server delay
2. Observe timeout error

**Expected Results**:
- ✅ "Request Timeout" error after configured timeout
- ✅ Clear error message
- ✅ Retry button available
- ✅ NO automatic retries

#### Test Case 5.3: Invalid Authentication
**Steps**:
1. Use expired or invalid token
2. Attempt API operations

**Expected Results**:
- ✅ "Authentication Required" error
- ✅ Message: "Please log in to access this content"
- ✅ NO retry button (auth issue)
- ✅ Redirect to login (if configured)

#### Test Case 5.4: Server Error (500)
**Steps**:
1. Trigger server error (e.g., malformed request)
2. Observe error handling

**Expected Results**:
- ✅ "Server Error" displayed with cloud icon
- ✅ Technical details shown (if available)
- ✅ Retry button available

---

## 🚨 Critical Error Handling Verification

### IMPORTANT: No Automatic Retry Loops

**What to Verify**:
1. ✅ When an error occurs, the UI displays an error message
2. ✅ The ONLY way to retry is via user action:
   - Manual "Retry" button tap
   - Pull-to-refresh gesture
3. ✅ NO automatic background reconnection attempts
4. ✅ NO timer-based retries every second
5. ✅ Controllers use `AsyncValue.guard` pattern for error catching
6. ✅ Providers are single-execution (no auto-refresh)

**How to Test**:
1. Disconnect network
2. Attempt to load events
3. Observe error display
4. **WAIT 60 SECONDS** without any user interaction
5. **VERIFY**: App does NOT attempt to reconnect automatically
6. Reconnect network
7. Tap "Retry" button
8. **VERIFY**: App successfully loads data

---

## 📊 Test Data Requirements

### Events
Create test events with various configurations:

1. **Basic Event**:
   - Type: Social
   - Capacity: 50
   - Current: 20
   - Guest Policy: Friends & Family
   - Payment: None
   - Approval: No

2. **Nearly Full Event**:
   - Capacity: 30
   - Current: 27 (90%)
   - Color should be orange

3. **Full Event**:
   - Capacity: 20
   - Current: 20 (100%)
   - Color should be red

4. **Paid Event**:
   - Requires Payment: Yes
   - Price: $75.50
   - Payment indicator should display

5. **Approval Required Event**:
   - Requires Approval: Yes
   - Approval indicator should display

6. **Past Deadline Event**:
   - RSVP Deadline: Past date
   - RSVP button should be disabled

7. **Finding Friends Event**:
   - Type: Finding Friends
   - Allows Subgroup Priority: Yes
   - Badge should show "Finding Friends"

### RSVPs
Create test RSVPs with various statuses:

1. **Confirmed RSVP**:
   - Status: Confirmed
   - Response: Yes
   - Badge: Green with checkmark

2. **Tentative RSVP**:
   - Status: Tentative
   - Response: Maybe
   - Badge: Orange with question mark

3. **Pending Approval RSVP**:
   - Status: Pending Approval
   - Badge: Amber with clock

4. **Waitlist RSVP**:
   - Status: Waitlist
   - Position: 3
   - Badge: Blue with hourglass

5. **Cancelled RSVP**:
   - Status: Cancelled
   - Badge: Red with cancel icon

---

## 🐛 Known Issues & Workarounds

### Code Generation Required
**Issue**: Riverpod providers may not be generated
**Solution**: Run `dart run build_runner build --delete-conflicting-outputs` locally

### GraphQL Client Configuration
**Issue**: API endpoint may need adjustment
**Solution**: Update `lib/core/network/graphql_client.dart` with correct endpoint

### Authentication
**Issue**: Test users may not have valid tokens
**Solution**: Implement proper login flow or use test tokens from backend

---

## 📝 Test Report Template

Use this template to document your testing results:

```markdown
# Events & RSVP API Integration Test Report

**Date**: [Date]
**Tester**: [Name]
**Environment**: [Dev/Staging/Prod]
**Branch**: claude/implement-rsvp-event-journey-011CUptJFDZPNb9FtLRwGwZE

## Events List Page
- [ ] Initial load successful
- [ ] Pagination working
- [ ] Search filtering
- [ ] Filter modal
- [ ] Pull-to-refresh
- [ ] Error handling verified

## Event Details Page
- [ ] Event details displayed
- [ ] Eligibility check working
- [ ] RSVP button states correct
- [ ] Error handling verified

## RSVP Form Page
- [ ] Form display complete
- [ ] Dynamic guest fields working
- [ ] Submit success flow
- [ ] Submit error flow
- [ ] Form validation

## My RSVPs Page
- [ ] RSVPs load correctly
- [ ] Status filtering working
- [ ] Cancel RSVP flow
- [ ] Navigation to event details

## Error Handling
- [ ] No internet error display
- [ ] Server timeout handling
- [ ] Invalid auth handling
- [ ] Server error handling
- [ ] **CRITICAL**: No automatic retry loops verified

## Issues Found
[List any issues encountered]

## Notes
[Additional observations]
```

---

## 🎓 API Documentation Reference

### GraphQL Operations Used

**Events & RSVP Queries**:
- `getEvents` - Paginated events list with filters
- `getEventById` - Single event details
- `checkRSVPEligibility` - Validate RSVP eligibility
- `getMyRSVPs` - Member's RSVPs with pagination

**RSVP Mutations**:
- `createRSVP` - Submit new RSVP
- `updateRSVP` - Modify existing RSVP
- `cancelRSVP` - Cancel RSVP with optional reason

**Finding Friends Queries**:
- `getFindingFriendsSubgroups` - Get subgroups for a club

### Expected Response Formats

See inline GraphQL operation files in `lib/graphql/` for detailed schemas.

---

## ✅ Success Criteria

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

**Document Maintained By**: Claude (AI Assistant)
**Questions**: Refer to EVENTS_RSVP_IMPLEMENTATION.md for technical details
