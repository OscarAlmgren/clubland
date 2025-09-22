# Business Logic Sequence Flows for Reciprocal Clubs Platform

## Overview

This document provides comprehensive business logic sequence flows showing how requests initiated from Flutter applications propagate through the microservices architecture. Each flow includes detailed diagrams showing the journey from user action to final state, including all service interactions and communication protocols.

## Platform Architecture Overview

```mermaid
graph TB
    subgraph "Client Applications"
        AdminApp[Administrator App<br/>Flutter]
        UserApp[End User App<br/>Flutter]
    end

    subgraph "API Layer"
        Gateway[API Gateway<br/>GraphQL Endpoint<br/>Port: 8080]
    end

    subgraph "Core Services"
        Auth[Auth Service<br/>gRPC: 50051]
        Member[Member Service<br/>gRPC: 50052]
        Club[Club Service<br/>gRPC: 50053]
        Reciprocal[Reciprocal Service<br/>gRPC: 50054]
        Visit[Visit Service<br/>gRPC: 50055]
        Notification[Notification Service<br/>gRPC: 50056]
        Analytics[Analytics Service<br/>gRPC: 50057]
        Blockchain[Blockchain Service<br/>gRPC: 50058]
        Governance[Governance Service<br/>gRPC: 50059]
    end

    subgraph "Infrastructure"
        PostgreSQL[(PostgreSQL<br/>Primary Database)]
        Redis[(Redis<br/>Cache & Sessions)]
        NATS[NATS<br/>Message Bus]
        Fabric[Hyperledger Fabric<br/>Blockchain Network]
    end

    AdminApp -->|GraphQL Query/Mutation| Gateway
    UserApp -->|GraphQL Query/Mutation| Gateway

    Gateway -->|gRPC| Auth
    Gateway -->|gRPC| Member
    Gateway -->|gRPC| Club
    Gateway -->|gRPC| Reciprocal
    Gateway -->|gRPC| Visit
    Gateway -->|gRPC| Notification
    Gateway -->|gRPC| Analytics
    Gateway -->|gRPC| Blockchain
    Gateway -->|gRPC| Governance

    Auth --> PostgreSQL
    Member --> PostgreSQL
    Club --> PostgreSQL
    Reciprocal --> PostgreSQL
    Visit --> PostgreSQL
    Notification --> PostgreSQL
    Analytics --> PostgreSQL
    Governance --> PostgreSQL

    Auth --> Redis
    Member --> Redis

    Notification --> NATS
    Analytics --> NATS
    Blockchain --> NATS

    Blockchain --> Fabric
```

## Communication Protocols

- **Client ↔ API Gateway**: GraphQL over HTTP/HTTPS + WebSocket for subscriptions
- **API Gateway ↔ Services**: gRPC (Protocol Buffers)
- **Services ↔ Database**: PostgreSQL native protocol
- **Services ↔ Cache**: Redis protocol
- **Services ↔ Message Bus**: NATS protocol
- **Blockchain Service ↔ Fabric**: Hyperledger Fabric SDK

---

## ADMINISTRATOR APP FLOWS

## 1. Member Check-In Flow (Daily Reception Operation)

### Flow Overview: Member Check-In

**Trigger**: Visiting member arrives at reciprocal club
**Initiator**: Club Reception Staff via Administrator App
**End State**: Member checked in with access credentials and blockchain record

### Sequence Diagram: Member Check-In Flow

```mermaid
sequenceDiagram
    participant Admin as Administrator App
    participant Gateway as API Gateway
    participant Auth as Auth Service
    participant Member as Member Service
    participant Reciprocal as Reciprocal Service
    participant Visit as Visit Service
    participant Blockchain as Blockchain Service
    participant Notification as Notification Service
    participant DB as PostgreSQL
    participant Cache as Redis
    participant NATS as NATS Bus
    participant Fabric as Hyperledger Fabric

    Note over Admin,Fabric: Member Check-In Flow

    Admin->>Gateway: GraphQL Query: memberByNumber($memberNumber)
    Gateway->>Auth: gRPC: ValidateToken(jwt)
    Auth->>Cache: Check token validity
    Cache-->>Auth: Token valid
    Auth-->>Gateway: Authentication confirmed

    Gateway->>Member: gRPC: GetMemberByNumber(memberNumber)
    Member->>DB: SELECT member WHERE member_number = ?
    DB-->>Member: Member profile data
    Member->>Cache: Cache member profile
    Member-->>Gateway: Member profile + home club info
    Gateway-->>Admin: Member data with club details

    Note over Admin: Staff reviews member info and reciprocal privileges

    Admin->>Gateway: GraphQL Query: reciprocalAgreements(clubA, clubB)
    Gateway->>Reciprocal: gRPC: ValidateReciprocalAccess(homeClub, visitingClub)
    Reciprocal->>DB: SELECT agreement WHERE club_a = ? AND club_b = ?
    DB-->>Reciprocal: Agreement data
    Reciprocal-->>Gateway: Agreement status + privileges
    Gateway-->>Admin: Reciprocal access validation

    Note over Admin: Staff confirms check-in

    Admin->>Gateway: GraphQL Mutation: recordVisit($input)
    Gateway->>Visit: gRPC: CreateVisit(memberId, clubId, services)
    Visit->>DB: INSERT INTO visits (member_id, club_id, check_in_time)
    DB-->>Visit: Visit record created with ID

    Visit->>NATS: Publish VisitCreated event
    NATS->>Blockchain: Receive visit event
    Blockchain->>Fabric: Submit transaction: recordVisit(visitId, memberId, clubId, timestamp)
    Fabric-->>Blockchain: Transaction ID + block confirmation

    Visit->>DB: UPDATE visits SET blockchain_tx_id = ?

    NATS->>Notification: Receive visit event
    Notification->>DB: INSERT notification for member
    Notification->>Gateway: WebSocket: Send real-time notification

    Visit-->>Gateway: Visit record with blockchain confirmation
    Gateway-->>Admin: Complete visit data + access credentials

    Note over Admin: Display QR code and access permissions to member
```

### Member Check-In: Detailed Flow Steps

1. **Authentication & Authorization**
   - Administrator App sends GraphQL query with JWT token
   - API Gateway validates token via Auth Service (gRPC)
   - Auth Service checks Redis cache for token validity
   - Permission validation for `visit_manage` capability

2. **Member Lookup**
   - GraphQL query: `memberByNumber($memberNumber)`
   - API Gateway calls Member Service via gRPC
   - Member Service queries PostgreSQL for member profile
   - Results cached in Redis for performance
   - Returns member profile + home club information

3. **Reciprocal Agreement Validation**
   - GraphQL query: `reciprocalAgreements` with club filters
   - API Gateway calls Reciprocal Service via gRPC
   - Service validates agreement between home club and visiting club
   - Checks agreement status, expiry, and usage limits
   - Returns permitted services and any restrictions

4. **Visit Record Creation**
   - GraphQL mutation: `recordVisit($input)`
   - API Gateway calls Visit Service via gRPC
   - Visit Service creates record in PostgreSQL
   - Publishes `VisitCreated` event to NATS message bus

5. **Blockchain Integration**
   - Blockchain Service receives event from NATS
   - Submits transaction to Hyperledger Fabric network
   - Records immutable visit proof on blockchain
   - Updates visit record with transaction ID

6. **Real-time Notifications**
   - Notification Service receives event from NATS
   - Creates notification record for member
   - Sends real-time update via GraphQL subscription
   - Updates club dashboard with new visitor

## 2. Member Profile Update Flow (Backoffice Operation)

### Flow Overview: Member Profile Update

**Trigger**: Administrator needs to update member information
**Initiator**: Club Administrator via Administrator App
**End State**: Member profile updated with audit trail and blockchain record

### Sequence Diagram: Member Profile Update Flow

```mermaid
sequenceDiagram
    participant Admin as Administrator App
    participant Gateway as API Gateway
    participant Auth as Auth Service
    participant Member as Member Service
    participant Audit as Audit Service
    participant Blockchain as Blockchain Service
    participant DB as PostgreSQL
    participant Cache as Redis
    participant NATS as NATS Bus
    participant Fabric as Hyperledger Fabric

    Note over Admin,Fabric: Member Profile Update Flow

    Admin->>Gateway: GraphQL Query: member($id)
    Gateway->>Auth: gRPC: ValidatePermission(jwt, "member_write")
    Auth-->>Gateway: Permission granted

    Gateway->>Member: gRPC: GetMember(memberId)
    Member->>Cache: Check member cache
    alt Cache Miss
        Member->>DB: SELECT member WHERE id = ?
        DB-->>Member: Current member data
        Member->>Cache: Cache member data
    end
    Member-->>Gateway: Current member profile
    Gateway-->>Admin: Member profile for editing

    Note over Admin: Administrator updates member information

    Admin->>Gateway: GraphQL Mutation: updateMember($id, $input)
    Gateway->>Member: gRPC: UpdateMember(memberId, profileData)

    Member->>DB: BEGIN TRANSACTION
    Member->>DB: UPDATE members SET profile = ? WHERE id = ?
    Member->>DB: INSERT INTO member_audit_log (member_id, changes, admin_id)

    Member->>NATS: Publish MemberUpdated event
    NATS->>Blockchain: Receive member update event
    Blockchain->>Fabric: Submit transaction: updateMemberRecord(memberId, changeHash, adminId)
    Fabric-->>Blockchain: Transaction confirmed

    Member->>DB: UPDATE members SET blockchain_hash = ?, updated_at = NOW()
    Member->>DB: COMMIT TRANSACTION

    Member->>Cache: Invalidate member cache
    Member->>Cache: Cache updated member data

    NATS->>Audit: Receive member update event
    Audit->>DB: INSERT INTO audit_trail (entity_type, entity_id, action, admin_id)

    Member-->>Gateway: Updated member profile + blockchain confirmation
    Gateway-->>Admin: Success response with updated data

    Note over Gateway: Real-time update via GraphQL subscription
    Gateway->>Admin: Subscription: memberUpdated event
```

### Member Profile Update: Detailed Flow Steps

1. **Permission Validation**
   - Administrator App requests member data for editing
   - API Gateway validates `member_write` permission via Auth Service
   - Auth Service checks role-based access control (RBAC)

2. **Current Data Retrieval**
   - GraphQL query: `member($id)` for existing profile
   - Member Service checks Redis cache first
   - On cache miss, queries PostgreSQL and caches result
   - Returns complete member profile to Administrator

3. **Profile Update Transaction**
   - GraphQL mutation: `updateMember($id, $input)`
   - Member Service starts database transaction
   - Updates member profile in PostgreSQL
   - Creates audit log entry with change details

4. **Blockchain Record**
   - Publishes `MemberUpdated` event to NATS
   - Blockchain Service creates hash of changes
   - Submits immutable record to Hyperledger Fabric
   - Updates member record with blockchain confirmation

5. **Cache Management**
   - Invalidates old member cache entry
   - Caches updated member profile
   - Ensures data consistency across requests

6. **Audit Trail**
   - Audit Service receives event and creates compliance record
   - Tracks administrator action with timestamp
   - Maintains full change history for regulatory compliance

## 3. Reciprocal Agreement Creation Flow (Advanced Operation)

### Reciprocal Agreement Transaction Flow Overview

**Trigger**: Club Manager initiates new reciprocal partnership
**Initiator**: Club Manager via Administrator App
**End State**: Agreement created, pending approval, with blockchain proposal

### Sequence Diagram: Reciprocal Agreement Creation Flow

```mermaid
sequenceDiagram
    participant Admin as Administrator App
    participant Gateway as API Gateway
    participant Auth as Auth Service
    participant Club as Club Service
    participant Reciprocal as Reciprocal Service
    participant Governance as Governance Service
    participant Blockchain as Blockchain Service
    participant Notification as Notification Service
    participant DB as PostgreSQL
    participant NATS as NATS Bus
    participant Fabric as Hyperledger Fabric

    Note over Admin,Fabric: Reciprocal Agreement Creation Flow

    Admin->>Gateway: GraphQL Query: clubs (for partner selection)
    Gateway->>Auth: gRPC: ValidatePermission(jwt, "agreement_create")
    Auth-->>Gateway: Permission granted

    Gateway->>Club: gRPC: GetAvailableClubs(excludeCurrentClub)
    Club->>DB: SELECT clubs WHERE allow_reciprocal = true
    DB-->>Club: Available partner clubs
    Club-->>Gateway: Partner club options
    Gateway-->>Admin: List of potential partner clubs

    Note over Admin: Manager selects partner and defines terms

    Admin->>Gateway: GraphQL Mutation: createReciprocalAgreement($input)
    Gateway->>Reciprocal: gRPC: CreateAgreement(clubA, clubB, terms)

    Reciprocal->>DB: BEGIN TRANSACTION
    Reciprocal->>DB: INSERT INTO agreements (club_a, club_b, terms, status='PENDING')

    alt Business Rules Validation
        Reciprocal->>DB: Check existing agreements
        Reciprocal->>DB: Validate term conflicts
        Note over Reciprocal: Ensure no conflicting agreements exist
    end

    Reciprocal->>NATS: Publish AgreementCreated event

    NATS->>Governance: Receive agreement event
    Governance->>DB: INSERT INTO proposals (type='AGREEMENT', agreement_id)
    Governance->>DB: INSERT INTO approval_workflow (proposal_id, approvers)

    NATS->>Blockchain: Receive agreement event
    Blockchain->>Fabric: Submit proposal: createAgreementProposal(agreementId, terms, participants)
    Fabric-->>Blockchain: Proposal transaction ID

    NATS->>Notification: Receive agreement event
    Notification->>DB: INSERT notifications for partner club admins
    Notification->>Gateway: WebSocket: Send real-time notification to partner club

    Reciprocal->>DB: UPDATE agreements SET blockchain_proposal_id = ?
    Reciprocal->>DB: COMMIT TRANSACTION

    Reciprocal-->>Gateway: Agreement created with pending status
    Gateway-->>Admin: Success response with agreement ID

    Note over Gateway: Real-time updates via subscriptions
    Gateway->>Admin: Subscription: agreementUpdated event
```

### Club Discovery and Booking: Step-by-Step Details

1. **Authorization & Partner Discovery**
   - Validates `agreement_create` permission
   - Club Service queries available reciprocal partners
   - Filters clubs that allow reciprocal agreements
   - Returns potential partner options to Administrator

2. **Agreement Creation**
   - GraphQL mutation: `createReciprocalAgreement($input)`
   - Reciprocal Service validates business rules
   - Checks for existing agreements between clubs
   - Creates agreement record with PENDING status

3. **Governance Workflow**
   - Publishes event to NATS message bus
   - Governance Service creates approval proposal
   - Sets up approval workflow with required approvers
   - Tracks voting and approval process

4. **Blockchain Proposal**
   - Blockchain Service receives creation event
   - Submits proposal to Hyperledger Fabric network
   - Creates immutable record of proposed agreement
   - Links blockchain proposal to database record

5. **Notification Distribution**
   - Notification Service sends alerts to partner club
   - Creates real-time notifications via GraphQL subscriptions
   - Ensures all stakeholders are informed of new proposal

## 4. Financial Transaction Processing Flow

### Financial Transaction Flow Overview

**Trigger**: Service usage requires payment processing
**Initiator**: Administrator App during checkout or billing
**End State**: Transaction completed with blockchain record and updated balances

### Sequence Diagram: Financial Transaction Processing Flow

```mermaid
sequenceDiagram
    participant Admin as Administrator App
    participant Gateway as API Gateway
    participant Auth as Auth Service
    participant Member as Member Service
    participant Payment as Payment Service
    participant Blockchain as Blockchain Service
    participant Notification as Notification Service
    participant DB as PostgreSQL
    participant Cache as Redis
    participant NATS as NATS Bus
    participant Fabric as Hyperledger Fabric
    participant PaymentGW as External Payment Gateway

    Note over Admin,PaymentGW: Financial Transaction Processing Flow

    Admin->>Gateway: GraphQL Query: member($id) { account { balance } }
    Gateway->>Member: gRPC: GetMemberAccount(memberId)
    Member->>DB: SELECT account_balance, transaction_history
    DB-->>Member: Current balance and history
    Member-->>Gateway: Account information
    Gateway-->>Admin: Member account details

    Note over Admin: Administrator initiates transaction

    Admin->>Gateway: GraphQL Mutation: processPayment($input)
    Gateway->>Auth: gRPC: ValidatePermission(jwt, "payment_process")
    Auth-->>Gateway: Permission granted

    Gateway->>Payment: gRPC: ProcessTransaction(memberId, amount, services)
    Payment->>DB: BEGIN TRANSACTION
    Payment->>DB: INSERT INTO transactions (member_id, amount, type, status='PENDING')

    alt Payment Method: External Gateway
        Payment->>PaymentGW: Process payment via external provider
        PaymentGW-->>Payment: Payment confirmation or failure
    else Payment Method: Account Balance
        Payment->>DB: SELECT account_balance WHERE member_id = ?
        Payment->>DB: UPDATE account_balance SET balance = balance - amount
    end

    alt Payment Successful
        Payment->>DB: UPDATE transactions SET status='COMPLETED'
        Payment->>NATS: Publish TransactionCompleted event

        NATS->>Blockchain: Receive transaction event
        Blockchain->>Fabric: Submit transaction: recordPayment(transactionId, memberId, amount, timestamp)
        Fabric-->>Blockchain: Transaction confirmed on blockchain

        Payment->>DB: UPDATE transactions SET blockchain_tx_id = ?

        NATS->>Member: Receive transaction event
        Member->>Cache: Invalidate member balance cache
        Member->>Cache: Cache updated balance

        NATS->>Notification: Receive transaction event
        Notification->>DB: INSERT notification (transaction receipt)
        Notification->>Gateway: WebSocket: Send receipt notification

        Payment->>DB: COMMIT TRANSACTION
    else Payment Failed
        Payment->>DB: UPDATE transactions SET status='FAILED', error_message = ?
        Payment->>DB: ROLLBACK TRANSACTION
    end

    Payment-->>Gateway: Transaction result with blockchain confirmation
    Gateway-->>Admin: Payment processing result

    Note over Gateway: Real-time update via subscription
    Gateway->>Admin: Subscription: transactionStatusChanged event
```

### Financial Transaction Detailed Flow Steps

1. **Account Information Retrieval**
   - GraphQL query for member account balance
   - Member Service retrieves current balance and transaction history
   - Cached balance information for performance

2. **Payment Authorization**
   - Validates `payment_process` permission
   - Ensures administrator can process financial transactions
   - Confirms member account access rights

3. **Transaction Processing**
   - GraphQL mutation: `processPayment($input)`
   - Payment Service initiates database transaction
   - Processes payment via external gateway or account balance
   - Handles both successful and failed payment scenarios

4. **Blockchain Financial Record**
   - Publishes transaction event to NATS
   - Blockchain Service creates immutable payment record
   - Links blockchain transaction ID to database record
   - Ensures financial audit trail compliance

5. **Balance Updates & Notifications**
   - Updates member account balance
   - Invalidates and refreshes cache
   - Sends receipt notification to member
   - Real-time updates via GraphQL subscriptions

---

## END USER APP FLOWS

## 1. Club Discovery and Booking Flow

### Club Discovery and Booking: Flow Overview

**Trigger**: Member searches for clubs while traveling
**Initiator**: Member via End User App
**End State**: Club discovered, reservation made, confirmation received

### Sequence Diagram: Club Discovery and Booking

```mermaid
sequenceDiagram
    participant User as End User App
    participant Gateway as API Gateway
    participant Auth as Auth Service
    participant Club as Club Service
    participant Reciprocal as Reciprocal Service
    participant Booking as Booking Service
    participant Notification as Notification Service
    participant DB as PostgreSQL
    participant Cache as Redis
    participant NATS as NATS Bus
    participant Maps as Maps API

    Note over User,Maps: Club Discovery and Booking Flow

    User->>Gateway: GraphQL Query: clubs (with location filter)
    Gateway->>Auth: gRPC: ValidateToken(jwt)
    Auth-->>Gateway: User authenticated

    Gateway->>Club: gRPC: SearchClubs(location, radius, filters)
    Club->>Cache: Check cached club data by location
    alt Cache Miss
        Club->>DB: SELECT clubs WHERE ST_DWithin(location, point, radius)
        Club->>Maps: Get distance calculations
        Maps-->>Club: Distance and travel time data
        Club->>Cache: Cache search results
    end
    Club-->>Gateway: Nearby clubs with distance data

    Note over User: Member selects club and views details

    User->>Gateway: GraphQL Query: club($id) { details, facilities }
    Gateway->>Club: gRPC: GetClubDetails(clubId)
    Club->>Cache: Check club details cache
    Club->>DB: SELECT club_details, facilities, policies
    Club->>Cache: Cache detailed club information
    Club-->>Gateway: Complete club information

    User->>Gateway: GraphQL Query: reciprocalAgreements(userClub, targetClub)
    Gateway->>Reciprocal: gRPC: CheckReciprocalAccess(userClubId, targetClubId)
    Reciprocal->>DB: SELECT agreement WHERE clubs match AND status='ACTIVE'
    DB-->>Reciprocal: Agreement terms and privileges
    Reciprocal-->>Gateway: Access rights and restrictions
    Gateway-->>User: Club details + reciprocal access info

    Note over User: Member decides to make reservation

    User->>Gateway: GraphQL Query: checkAvailability($clubId, $service, $date)
    Gateway->>Booking: gRPC: CheckServiceAvailability(clubId, service, dateTime)
    Booking->>DB: SELECT bookings WHERE club_id = ? AND service = ? AND date = ?
    Booking->>Cache: Check capacity and availability cache
    DB-->>Booking: Current bookings and capacity
    Booking-->>Gateway: Available time slots
    Gateway-->>User: Availability options

    User->>Gateway: GraphQL Mutation: createReservation($input)
    Gateway->>Booking: gRPC: CreateReservation(memberId, clubId, service, dateTime)
    Booking->>DB: BEGIN TRANSACTION
    Booking->>DB: INSERT INTO reservations (member_id, club_id, service, date_time)
    Booking->>DB: UPDATE capacity_tracking SET booked_slots = booked_slots + 1

    Booking->>NATS: Publish ReservationCreated event

    NATS->>Notification: Receive reservation event
    Notification->>DB: INSERT confirmation notification
    Notification->>Gateway: WebSocket: Send confirmation to user
    Notification->>DB: INSERT notification for club staff

    Booking->>Cache: Update availability cache
    Booking->>DB: COMMIT TRANSACTION

    Booking-->>Gateway: Reservation confirmation with details
    Gateway-->>User: Reservation confirmed with QR code

    Note over User: Receives confirmation and access details
```

### Club Discovery and Booking: Detailed Flow Steps

1. **Location-Based Club Search**
   - GraphQL query with geographic filters
   - Club Service uses PostGIS for spatial queries
   - Integrates with Maps API for distance calculations
   - Results cached by location for performance

2. **Club Details & Reciprocal Access**
   - Retrieves comprehensive club information
   - Checks reciprocal agreement status between clubs
   - Returns access privileges and any restrictions
   - Cached club data for faster subsequent requests

3. **Availability Checking**
   - GraphQL query: `checkAvailability` with service parameters
   - Booking Service queries current reservations
   - Calculates available capacity and time slots
   - Real-time availability checking

4. **Reservation Creation**
   - GraphQL mutation: `createReservation($input)`
   - Booking Service creates reservation record
   - Updates capacity tracking in real-time
   - Publishes event for notifications

5. **Confirmation & Notifications**
   - Sends confirmation to member via GraphQL subscription
   - Notifies club staff of new reservation
   - Generates QR code for club access
   - Updates cached availability data

## 2. Self-Service Check-In Flow

### Self-Service Check-In: Flow Overview

**Trigger**: Member arrives at reciprocal club
**Initiator**: Member via End User App (location-based or QR scan)
**End State**: Member checked in with digital access badge

### Sequence Diagram

```mermaid
sequenceDiagram
    participant User as End User App
    participant Gateway as API Gateway
    participant Auth as Auth Service
    participant Location as Location Service
    participant Reciprocal as Reciprocal Service
    participant Visit as Visit Service
    participant Blockchain as Blockchain Service
    participant Notification as Notification Service
    participant DB as PostgreSQL
    participant NATS as NATS Bus
    participant Fabric as Hyperledger Fabric

    Note over User,Fabric: Self-Service Check-In Flow

    User->>User: GPS detects proximity to club OR QR code scanned
    User->>Gateway: GraphQL Query: nearbyClubs($lat, $lng)
    Gateway->>Location: gRPC: FindClubByLocation(latitude, longitude, radius)
    Location->>DB: SELECT clubs WHERE ST_DWithin(location, point, geofence_radius)
    DB-->>Location: Clubs within geofence
    Location-->>Gateway: Nearby club options
    Gateway-->>User: Available clubs for check-in

    Note over User: Member selects club for check-in

    User->>Gateway: GraphQL Mutation: initiateCheckIn($clubId, $location)
    Gateway->>Auth: gRPC: ValidateUser(jwt) and GetUserClub()
    Auth-->>Gateway: User verified with home club info

    Gateway->>Reciprocal: gRPC: ValidateReciprocalAccess(userClubId, targetClubId)
    Reciprocal->>DB: SELECT agreement WHERE club_a = ? AND club_b = ? AND status = 'ACTIVE'
    DB-->>Reciprocal: Agreement validation
    alt Access Denied
        Reciprocal-->>Gateway: Access denied - no valid agreement
        Gateway-->>User: Error: No reciprocal access available
    else Access Granted
        Reciprocal-->>Gateway: Access granted with service privileges

        Gateway->>Visit: gRPC: CreateSelfCheckIn(memberId, clubId, location, services)
        Visit->>DB: BEGIN TRANSACTION
        Visit->>DB: INSERT INTO visits (member_id, club_id, check_in_time, method='SELF_SERVICE')

        Visit->>NATS: Publish VisitCheckInStarted event

        NATS->>Blockchain: Receive check-in event
        Blockchain->>Fabric: Submit transaction: recordSelfCheckIn(visitId, memberId, clubId, gpsLocation, timestamp)
        Fabric-->>Blockchain: Transaction confirmed

        Visit->>DB: UPDATE visits SET blockchain_tx_id = ?, access_code = ?
        Visit->>DB: COMMIT TRANSACTION

        NATS->>Notification: Receive check-in event
        Notification->>DB: INSERT notification for club staff (optional)
        Notification->>Gateway: WebSocket: Send welcome message to user

        Visit-->>Gateway: Check-in completed with access credentials
        Gateway-->>User: Digital access badge with QR code and club info
    end

    Note over User: Displays digital badge and club access information
```

### Detailed Flow Steps

1. **Location Detection**
   - End User App uses GPS to detect club proximity
   - Alternative: QR code scanning at club entrance
   - Location Service validates club geofence boundaries
   - Returns available clubs for check-in

2. **Access Validation**
   - Validates user authentication and home club
   - Reciprocal Service checks agreement status
   - Verifies member has reciprocal access privileges
   - Returns permitted services and restrictions

3. **Self-Service Check-In**
   - GraphQL mutation: `initiateCheckIn($clubId, $location)`
   - Visit Service creates check-in record
   - Generates unique access code for member
   - Records GPS location for verification

4. **Blockchain Verification**
   - Publishes check-in event to NATS
   - Blockchain Service records immutable check-in proof
   - Links GPS coordinates and timestamp to blockchain
   - Provides tamper-proof visit verification

5. **Digital Access Badge**
   - Generates QR code for club access
   - Provides club information and contact details
   - Optional notification to club staff
   - Real-time welcome message via subscription

## 3. Social Features and Activity Sharing Flow

### Flow Overview

**Trigger**: Member completes visit and wants to share experience
**Initiator**: Member via End User App
**End State**: Review posted, social connections notified, points awarded

### Sequence Diagram

```mermaid
sequenceDiagram
    participant User as End User App
    participant Gateway as API Gateway
    participant Auth as Auth Service
    participant Visit as Visit Service
    participant Social as Social Service
    participant Notification as Notification Service
    participant Analytics as Analytics Service
    participant Gamification as Gamification Service
    participant DB as PostgreSQL
    participant Cache as Redis
    participant NATS as NATS Bus
    participant CDN as Content Delivery Network

    Note over User,CDN: Social Features and Activity Sharing Flow

    User->>Gateway: GraphQL Query: myVisits { recent, unreviewed }
    Gateway->>Visit: gRPC: GetUserVisits(userId, status='COMPLETED')
    Visit->>DB: SELECT visits WHERE member_id = ? AND status = 'CHECKED_OUT'
    DB-->>Visit: Recent completed visits
    Visit-->>Gateway: Visit history with review status
    Gateway-->>User: Visits available for review

    Note over User: Member selects visit to review and rate

    User->>Gateway: GraphQL Mutation: createVisitReview($input)
    Gateway->>Auth: gRPC: ValidateUser(jwt)
    Auth-->>Gateway: User authenticated

    Gateway->>Social: gRPC: CreateReview(visitId, rating, review, photos)
    Social->>DB: BEGIN TRANSACTION
    Social->>DB: INSERT INTO reviews (visit_id, member_id, rating, content, photos)

    alt Photo Upload
        Social->>CDN: Upload photos to content delivery network
        CDN-->>Social: Photo URLs
        Social->>DB: UPDATE reviews SET photo_urls = ?
    end

    Social->>NATS: Publish ReviewCreated event

    NATS->>Analytics: Receive review event
    Analytics->>DB: UPDATE club_ratings SET average_rating = ?, review_count = ?
    Analytics->>Cache: Update club rating cache

    NATS->>Gamification: Receive review event
    Gamification->>DB: INSERT points_earned (member_id, action='REVIEW', points=10)
    Gamification->>DB: UPDATE member_points SET total_points = total_points + 10

    NATS->>Notification: Receive review event
    Notification->>DB: SELECT member_connections WHERE member_id = ?
    Notification->>DB: INSERT notifications for connected members
    Notification->>Gateway: WebSocket: Send notifications to social connections

    Social->>DB: COMMIT TRANSACTION
    Social-->>Gateway: Review created successfully
    Gateway-->>User: Review posted with points earned

    Note over User: Member decides to share on social feed

    User->>Gateway: GraphQL Mutation: shareActivity($reviewId, $message, $privacy)
    Gateway->>Social: gRPC: ShareActivity(reviewId, message, privacyLevel)
    Social->>DB: INSERT INTO activity_feed (member_id, type='REVIEW_SHARE', content_id)
    Social->>NATS: Publish ActivityShared event

    NATS->>Notification: Receive activity share event
    Notification->>DB: SELECT followers WHERE following_member_id = ?
    Notification->>DB: INSERT feed_notifications for followers
    Notification->>Gateway: WebSocket: Update social feeds in real-time

    Social-->>Gateway: Activity shared successfully
    Gateway-->>User: Shared to social feed

    Note over Gateway: Real-time feed updates via subscriptions
    Gateway->>User: Subscription: socialActivityUpdated event
```

### Detailed Flow Steps

1. **Visit History Retrieval**
   - GraphQL query for completed visits
   - Visit Service returns visits available for review
   - Filters out already-reviewed visits
   - Cached visit data for performance

2. **Review Creation**
   - GraphQL mutation: `createVisitReview($input)`
   - Social Service creates review record
   - Handles photo uploads to CDN
   - Links review to specific visit

3. **Analytics & Gamification**
   - Publishes review event to NATS
   - Analytics Service updates club ratings
   - Gamification Service awards points for review
   - Updates member point totals

4. **Social Notifications**
   - Notifies member's social connections
   - Real-time notifications via GraphQL subscriptions
   - Updates activity feeds for followers
   - Maintains privacy settings

5. **Activity Sharing**
   - Optional sharing to social feed
   - GraphQL mutation: `shareActivity` with privacy controls
   - Real-time feed updates for connected members
   - Social engagement tracking

## 4. Travel Planning and Companion Matching Flow

### Flow Overview

**Trigger**: Member planning travel to new destination
**Initiator**: Member via End User App
**End State**: Trip planned with club recommendations and potential travel companions

### Sequence Diagram

```mermaid
sequenceDiagram
    participant User as End User App
    participant Gateway as API Gateway
    participant Auth as Auth Service
    participant Travel as Travel Service
    participant Club as Club Service
    participant Social as Social Service
    participant Recommendation as AI Recommendation Service
    participant Notification as Notification Service
    participant DB as PostgreSQL
    participant Cache as Redis
    participant NATS as NATS Bus
    participant Maps as Maps API
    participant ML as Machine Learning Service

    Note over User,ML: Travel Planning and Companion Matching Flow

    User->>Gateway: GraphQL Mutation: createTravelPlan($destination, $dates, $preferences)
    Gateway->>Auth: gRPC: ValidateUser(jwt) and GetUserPreferences()
    Auth-->>Gateway: User authenticated with travel preferences

    Gateway->>Travel: gRPC: CreateTravelPlan(userId, destination, dateRange, preferences)
    Travel->>DB: INSERT INTO travel_plans (member_id, destination, dates, status='PLANNING')

    Travel->>Club: gRPC: SearchClubsByDestination(city, state, country)
    Club->>Cache: Check destination club cache
    alt Cache Miss
        Club->>DB: SELECT clubs WHERE location LIKE destination
        Club->>Maps: Get clubs with coordinates and amenities
        Maps-->>Club: Geographic data and distances
        Club->>Cache: Cache destination clubs
    end
    Club-->>Travel: Available clubs in destination

    Travel->>Recommendation: gRPC: GetPersonalizedRecommendations(userId, clubs, preferences)
    Recommendation->>ML: Analyze user history and preferences
    ML->>DB: SELECT user_visit_history, preferences, ratings
    ML-->>Recommendation: Personalized club scores
    Recommendation-->>Travel: Ranked club recommendations

    Travel->>Social: gRPC: FindTravelCompanions(destination, dateRange, userProfile)
    Social->>DB: SELECT members WHERE travel_plans overlap AND compatibility_score > threshold
    Social->>ML: Calculate compatibility based on interests and travel style
    ML-->>Social: Compatibility scores for potential companions
    Social-->>Travel: Matched travel companions

    Travel->>DB: UPDATE travel_plans SET recommendations = ?, companions = ?
    Travel->>NATS: Publish TravelPlanCreated event

    NATS->>Notification: Receive travel plan event
    Notification->>DB: INSERT notifications for matched companions
    Notification->>Gateway: WebSocket: Send companion match notifications

    Travel-->>Gateway: Complete travel plan with recommendations
    Gateway-->>User: Travel plan with club recommendations and potential companions

    Note over User: Member reviews and selects preferred clubs/companions

    User->>Gateway: GraphQL Mutation: bookTravelReservations($planId, $selections)
    Gateway->>Travel: gRPC: BookReservations(planId, selectedClubs, selectedDates)

    loop For each selected club
        Travel->>Club: gRPC: CheckAvailability(clubId, service, date)
        Club-->>Travel: Availability confirmed
        Travel->>Club: gRPC: CreateReservation(memberId, clubId, service, date)
        Club-->>Travel: Reservation confirmed
    end

    Travel->>DB: UPDATE travel_plans SET status='CONFIRMED', reservations = ?
    Travel->>NATS: Publish TravelReservationsConfirmed event

    NATS->>Notification: Receive confirmation event
    Notification->>DB: INSERT confirmation notifications
    Notification->>Gateway: WebSocket: Send booking confirmations

    Travel-->>Gateway: All reservations confirmed
    Gateway-->>User: Travel plan confirmed with reservation details

    Note over User: Receives complete itinerary with confirmations
```

### Detailed Flow Steps

1. **Travel Plan Initialization**
   - GraphQL mutation: `createTravelPlan` with destination and preferences
   - Travel Service creates planning record
   - Retrieves user travel preferences and history
   - Initializes recommendation engine

2. **Club Discovery & Recommendations**
   - Searches clubs in destination city/region
   - Uses cached location data when available
   - AI Recommendation Service analyzes user preferences
   - Machine Learning generates personalized club rankings

3. **Companion Matching**
   - Social Service finds members with overlapping travel plans
   - ML Service calculates compatibility scores
   - Considers shared interests, travel style, and preferences
   - Returns potential travel companions

4. **Itinerary Creation**
   - Combines club recommendations with companion matches
   - Creates comprehensive travel plan
   - Publishes event for notification distribution
   - Real-time updates via GraphQL subscriptions

5. **Reservation Booking**
   - Member selects preferred clubs and companions
   - GraphQL mutation: `bookTravelReservations`
   - Batch booking across multiple clubs
   - Confirmation notifications to all parties

---

# CROSS-CUTTING CONCERNS

## Error Handling and Retry Patterns

### Error Propagation Flow

```mermaid
graph TD
    A[Client Error] --> B{Error Type}
    B -->|Network| C[Retry with Backoff]
    B -->|Authentication| D[Refresh Token]
    B -->|Authorization| E[Permission Denied]
    B -->|Validation| F[Client Fix Required]
    B -->|Server| G[Retry with Circuit Breaker]

    C --> H[GraphQL Error Response]
    D --> I[Auth Service Token Refresh]
    E --> H
    F --> H
    G --> J{Service Available?}

    I -->|Success| K[Retry Original Request]
    I -->|Failure| L[Force Re-authentication]

    J -->|Yes| K
    J -->|No| M[Circuit Open - Fallback]

    K --> N[Request Completed]
    L --> O[Redirect to Login]
    M --> P[Cached/Offline Data]
```

## Real-Time Communication Patterns

### GraphQL Subscription Architecture

```mermaid
sequenceDiagram
    participant Client as Flutter App
    participant Gateway as API Gateway
    participant WS as WebSocket Manager
    participant Service as Business Service
    participant NATS as Message Bus
    participant DB as Database

    Client->>Gateway: WebSocket Connection + JWT
    Gateway->>WS: Establish authenticated connection

    Client->>Gateway: GraphQL Subscription: visitStatusChanged($clubId)
    Gateway->>WS: Register subscription with filters

    Note over Service,DB: Business event occurs
    Service->>DB: Update data
    Service->>NATS: Publish domain event
    NATS->>WS: Receive filtered event
    WS->>Gateway: Format GraphQL subscription response
    Gateway->>Client: Real-time update delivered
```

## Security and Authorization Flow

### JWT Token Lifecycle

```mermaid
stateDiagram-v2
    [*] --> Unauthenticated
    Unauthenticated --> Authenticating: Login Request
    Authenticating --> Authenticated: JWT Issued
    Authenticated --> Refreshing: Token Near Expiry
    Refreshing --> Authenticated: New JWT Issued
    Refreshing --> Unauthenticated: Refresh Failed
    Authenticated --> Unauthenticated: Logout
    Authenticated --> Unauthenticated: Token Expired
```

## Performance and Caching Strategy

### Multi-Level Caching Architecture

```mermaid
graph LR
    A[Flutter App] --> B[GraphQL Cache]
    B --> C[API Gateway Cache]
    C --> D[Redis Cache]
    D --> E[PostgreSQL]

    B -.->|Cache Miss| C
    C -.->|Cache Miss| D
    D -.->|Cache Miss| E

    F[Background Jobs] --> D
    G[Event Bus] --> D
    H[Cache Invalidation] --> D
```

This comprehensive documentation provides complete visibility into how requests flow through the Reciprocal Clubs platform, from user initiation through all microservice interactions to final state completion, including all communication protocols and data persistence patterns.