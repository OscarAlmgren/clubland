# User Journey: Member RSVPs to Club Event

## Overview

**Journey**: Member RSVPs to club events with Yes/No/Maybe response
**Category**: Events & Social Engagement
**Actor**: Member (home or reciprocal club)
**Services**: Booking Service, Auth Service, Notification Service, Analytics Service
**Estimated Implementation**: 3-4 days

---

## Quick Summary

Members RSVP to club events with a simple **Yes/No/Maybe** model. The system manages capacity with priority queues (home members first, reciprocal members second), enforces cancellation terms, collects dietary preferences, and sends timely reminders.

---

## Business Requirements

### Event Types

All event types support RSVPs:

- ✅ Social events (galas, mixers, holiday parties)
- ✅ Sporting events (tournaments, competitions)
- ✅ Educational events (workshops, seminars)
- ✅ Club meetings (board meetings, assemblies)
- ✅ Fundraisers
- ✅ **Finding-Friends subgroups** (Vinna Vänner) - with priority for subgroup members

### RSVP Response Model

**Simple 3-state model**:

- ✅ **Yes** - Attending (creates confirmed RSVP)
- ❌ **No** - Not attending (no RSVP record)
- ❓ **Maybe** - Interested (creates tentative RSVP, doesn't count toward capacity)

### Guest Policies (per event)

Event organizer configures:

- **Members-only**: No guests
- **Male guests**: +N male guests allowed
- **Female guests**: +N female guests allowed
- **Friends & Family**: Any guests up to +N
- Guest names are **optional**

### Information Collected

On RSVP form:

- Attendance count (self + guests)
- Guest names (optional)
- Dietary restrictions/preferences
- Special requests:
  - Food/drink preferences
  - Seating preferences ("seat with [name]", "near [group]")
  - Free text for other needs

### Payment Options

Event organizer selects payment method:

- **Free event**: No payment
- **Paid event** with payment instructions in description:
  - Pay at bar/restaurant on arrival
  - Pre-pay to club bank account
  - Add to member's monthly bill

**No automated payment processing** - all payment verification is manual by club back-office.

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

**Adjustable capacity**: Event organizer can increase/decrease capacity after creation.

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

### Access Control

**Club-organized events**:

- Open to all members
- RSVP mode: Auto-confirm or approval-based (organizer choice)

**Finding-Friends subgroup events**:

- Open to all members
- Subgroup members get priority (FCFS within subgroup, then general members)
- RSVP mode: Approval by subgroup organizer (default)

**No restrictions**:

- ❌ No membership tier restrictions
- ❌ No invitation-only events (all club communications go to all members)

**Reciprocal members**: Can RSVP via Priority Queue B if agreement is active

### Full House Management

Event organizer selects venue availability:

- **OTHERS WELCOME**: Non-event members can use club facilities during event
- **FULL HOUSE EXCLUSIVE**: Entire club reserved for event attendees only

---
