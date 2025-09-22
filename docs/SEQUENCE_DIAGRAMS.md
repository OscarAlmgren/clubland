# UML Sequence Diagrams - Reciprocal Clubs Backend

This document provides comprehensive UML sequence diagrams for key system workflows and processes in the Reciprocal Clubs Backend system.

## 1. Authentication Flow

### User Login Sequence

```mermaid
sequenceDiagram
    participant C as Client
    participant AG as API Gateway  
    participant AS as Auth Service
    participant DB as Database
    participant R as Redis

    C->>AG: POST /auth/login
    Note over C,AG: { email, password, club_slug }
    
    AG->>AG: Validate request
    AG->>AS: gRPC: ValidateCredentials()
    
    AS->>DB: Query user by email + club
    DB-->>AS: User data
    
    AS->>AS: Verify password hash
    AS->>AS: Generate JWT + Refresh tokens
    
    AS->>R: Store refresh token
    R-->>AS: OK
    
    AS-->>AG: JWT + Refresh tokens
    AG-->>C: 200 OK + tokens
    
    Note over C,AG: Set Authorization header for subsequent requests
```

### JWT Validation Sequence

```mermaid
sequenceDiagram
    participant C as Client
    participant AG as API Gateway
    participant MS as Member Service
    participant Cache as JWT Cache

    C->>AG: Request with JWT header
    AG->>AG: Extract JWT from header
    
    AG->>Cache: Check JWT validity
    alt JWT in cache
        Cache-->>AG: Valid JWT data
    else JWT not cached
        AG->>AG: Validate JWT signature
        AG->>AG: Check expiration
        AG->>Cache: Cache JWT data
    end
    
    AG->>MS: gRPC call with validated context
    MS->>MS: Process request
    MS-->>AG: Response
    AG-->>C: Response
```

## 2. Member Registration Flow

### New Member Registration Sequence

```mermaid
sequenceDiagram
    participant C as Client
    participant AG as API Gateway
    participant AS as Auth Service
    participant MS as Member Service
    participant NS as Notification Service
    participant NATS as NATS Bus
    participant DB as Database

    C->>AG: POST /members (GraphQL mutation)
    Note over C,AG: createMember mutation
    
    AG->>AG: Validate JWT & permissions
    AG->>MS: gRPC: CreateMember()
    
    MS->>MS: Validate request data
    MS->>DB: Begin transaction
    MS->>DB: Create member record
    MS->>DB: Create profile record
    MS->>DB: Create address record (if provided)
    MS->>DB: Commit transaction
    
    DB-->>MS: Member created successfully
    
    MS->>NATS: Publish "member.created" event
    Note over MS,NATS: Event: member.created with member data
    
    MS-->>AG: Member response
    AG-->>C: 201 Created + Member data
    
    NATS->>NS: Consume "member.created" event
    NS->>NS: Generate welcome email
    NS->>NS: Send welcome notification
    NS->>NATS: Publish "notification.sent" event
```

### Member Profile Update Sequence

```mermaid
sequenceDiagram
    participant C as Client
    participant AG as API Gateway
    participant MS as Member Service
    participant NATS as NATS Bus
    participant DB as Database

    C->>AG: PUT /members/{id}/profile (GraphQL)
    Note over C,AG: updateMemberProfile mutation
    
    AG->>MS: gRPC: UpdateMemberProfile()
    
    MS->>MS: Validate member ownership
    MS->>MS: Validate profile data
    MS->>DB: Begin transaction
    MS->>DB: Update profile record
    MS->>DB: Update member.updated_at
    MS->>DB: Commit transaction
    
    DB-->>MS: Profile updated
    
    MS->>NATS: Publish "member.profile_updated" event
    Note over MS,NATS: Event with profile changes
    
    MS-->>AG: Updated profile
    AG-->>C: 200 OK + Profile data
```

## 3. Club Management Flow

### Club Creation Sequence

```mermaid
sequenceDiagram
    participant A as Admin Client
    participant AG as API Gateway
    participant AS as Auth Service  
    participant MS as Member Service
    participant NATS as NATS Bus
    participant DB as Database

    A->>AG: POST /clubs (GraphQL mutation)
    Note over A,AG: createClub mutation with admin user
    
    AG->>AS: Validate super-admin permissions
    AS-->>AG: Permission granted
    
    AG->>MS: gRPC: CreateClub()
    
    MS->>MS: Validate club data
    MS->>MS: Generate unique slug
    MS->>DB: Begin transaction
    MS->>DB: Create club record
    MS->>DB: Create initial admin member
    MS->>DB: Create admin profile
    MS->>DB: Commit transaction
    
    DB-->>MS: Club & admin created
    
    MS->>NATS: Publish "club.created" event
    MS->>NATS: Publish "member.created" event
    Note over MS,NATS: Initial club setup events
    
    MS-->>AG: Club data + admin member
    AG-->>A: 201 Created + Club details
```

### Club Settings Update Sequence

```mermaid
sequenceDiagram
    participant A as Admin
    participant AG as API Gateway
    participant MS as Member Service
    participant NATS as NATS Bus
    participant DB as Database

    A->>AG: PUT /clubs/{id}/settings
    
    AG->>MS: gRPC: UpdateClubSettings()
    
    MS->>MS: Validate club admin permissions
    MS->>MS: Validate settings data
    MS->>DB: Update club settings
    
    DB-->>MS: Settings updated
    
    MS->>NATS: Publish "club.settings_updated" event
    Note over MS,NATS: Settings change event
    
    MS-->>AG: Updated club data
    AG-->>A: 200 OK + Club settings
```

## 4. Reciprocal Agreement Flow

### Agreement Creation Sequence

```mermaid
sequenceDiagram
    participant A1 as Club A Admin
    participant AG as API Gateway
    participant RS as Reciprocal Service
    participant BS as Blockchain Service
    participant NS as Notification Service
    participant NATS as NATS Bus
    participant HF as Hyperledger Fabric

    A1->>AG: POST /reciprocal/agreements
    Note over A1,AG: Propose new reciprocal agreement
    
    AG->>RS: gRPC: CreateReciprocalAgreement()
    
    RS->>RS: Validate clubs & permissions
    RS->>RS: Create agreement draft
    
    RS->>BS: Record agreement proposal on blockchain
    BS->>HF: Submit transaction to Fabric
    HF-->>BS: Transaction committed
    BS-->>RS: Blockchain transaction ID
    
    RS->>NATS: Publish "reciprocal.agreement_proposed" event
    
    NATS->>NS: Send notification to Club B admin
    NS->>NS: Generate agreement notification
    NS->>NS: Send email to Club B admin
    
    RS-->>AG: Agreement proposal created
    AG-->>A1: 201 Created + Agreement details
```

### Agreement Approval Sequence

```mermaid
sequenceDiagram
    participant A2 as Club B Admin
    participant AG as API Gateway
    participant RS as Reciprocal Service
    participant BS as Blockchain Service
    participant NATS as NATS Bus
    participant HF as Hyperledger Fabric

    A2->>AG: PUT /reciprocal/agreements/{id}/approve
    
    AG->>RS: gRPC: ApproveReciprocalAgreement()
    
    RS->>RS: Validate approval permissions
    RS->>RS: Update agreement status
    
    RS->>BS: Record approval on blockchain
    BS->>HF: Submit approval transaction
    HF-->>BS: Transaction committed
    BS-->>RS: Approval transaction ID
    
    RS->>NATS: Publish "reciprocal.agreement_approved" event
    Note over RS,NATS: Agreement now active
    
    RS-->>AG: Agreement approved
    AG-->>A2: 200 OK + Active agreement
```

## 5. Visit Verification Flow

### Visit Recording Sequence

```mermaid
sequenceDiagram
    participant M as Member App
    participant AG as API Gateway
    participant RS as Reciprocal Service
    participant MS as Member Service
    participant BS as Blockchain Service
    participant NATS as NATS Bus
    participant HF as Hyperledger Fabric

    M->>AG: POST /visits/record
    Note over M,AG: QR code scan or location check-in
    
    AG->>RS: gRPC: RecordVisit()
    
    RS->>MS: Verify member exists and is active
    MS-->>RS: Member verified
    
    RS->>RS: Verify reciprocal agreement exists
    RS->>RS: Validate visit rules & limits
    
    RS->>BS: Record visit on blockchain
    BS->>HF: Submit visit transaction
    HF-->>BS: Transaction committed
    BS-->>RS: Visit transaction ID
    
    RS->>RS: Create visit record
    RS->>NATS: Publish "visit.recorded" event
    
    RS-->>AG: Visit recorded successfully
    AG-->>M: 201 Created + Visit details
    
    Note over M,AG: Visit benefits activated
```

### Visit Verification Sequence

```mermaid
sequenceDiagram
    participant S as Staff App
    participant AG as API Gateway
    participant RS as Reciprocal Service
    participant BS as Blockchain Service
    participant HF as Hyperledger Fabric

    S->>AG: GET /visits/{id}/verify
    Note over S,AG: Staff verifies visit authenticity
    
    AG->>RS: gRPC: VerifyVisit()
    
    RS->>BS: Query blockchain for visit transaction
    BS->>HF: Query transaction by ID
    HF-->>BS: Transaction details
    BS-->>RS: Verified transaction data
    
    RS->>RS: Compare visit data with blockchain
    RS->>RS: Validate signatures & timestamps
    
    RS-->>AG: Visit verification result
    AG-->>S: 200 OK + Verification status
    
    Note over S,AG: Visit authenticity confirmed
```

## 6. Notification Flow

### Multi-Channel Notification Sequence

```mermaid
sequenceDiagram
    participant NATS as NATS Bus
    participant NS as Notification Service
    participant TP as Template Processor
    participant ES as Email Service
    participant SMS as SMS Service
    participant PS as Push Service
    participant DB as Database

    NATS->>NS: Event: member.status_changed
    Note over NATS,NS: Member status changed to active
    
    NS->>NS: Determine notification type
    NS->>NS: Get member preferences
    NS->>DB: Query notification templates
    DB-->>NS: Template data
    
    NS->>TP: Process email template
    TP-->>NS: Rendered email HTML
    
    NS->>TP: Process SMS template  
    TP-->>NS: Rendered SMS text
    
    par Email Notification
        NS->>ES: Send email
        ES-->>NS: Email sent
    and SMS Notification  
        NS->>SMS: Send SMS
        SMS-->>NS: SMS sent
    and Push Notification
        NS->>PS: Send push notification
        PS-->>NS: Push sent
    end
    
    NS->>DB: Record delivery status
    NS->>NATS: Publish "notification.sent" events
```

## 7. Analytics Data Collection Flow

### Event Processing Sequence

```mermaid
sequenceDiagram
    participant Services as Various Services
    participant NATS as NATS Bus
    participant AS as Analytics Service
    participant TS as Time Series DB
    participant AG as Aggregator

    Services->>NATS: Publish domain events
    Note over Services,NATS: visit.recorded, member.created, etc.
    
    NATS->>AS: Consume events
    
    AS->>AS: Transform event to metrics
    AS->>AS: Apply privacy filters
    AS->>AS: Anonymize PII data
    
    AS->>TS: Store raw metrics
    TS-->>AS: Metrics stored
    
    AS->>AG: Trigger aggregation
    AG->>AG: Calculate hourly aggregates
    AG->>AG: Calculate daily aggregates
    AG->>AG: Calculate monthly aggregates
    
    AG->>TS: Store aggregated data
    TS-->>AG: Aggregates stored
    
    AS->>NATS: Publish "analytics.processed" event
```

## 8. Governance Voting Flow

### Proposal Creation and Voting Sequence

```mermaid
sequenceDiagram
    participant A as Admin
    participant AG as API Gateway
    participant GS as Governance Service
    participant BS as Blockchain Service
    participant NS as Notification Service
    participant NATS as NATS Bus
    participant HF as Hyperledger Fabric

    A->>AG: POST /governance/proposals
    Note over A,AG: Create new governance proposal
    
    AG->>GS: gRPC: CreateProposal()
    
    GS->>GS: Validate proposal data
    GS->>BS: Record proposal on blockchain
    BS->>HF: Submit proposal transaction
    HF-->>BS: Transaction committed
    BS-->>GS: Proposal transaction ID
    
    GS->>NATS: Publish "proposal.created" event
    
    NATS->>NS: Notify eligible voters
    NS->>NS: Send voting notifications
    
    GS-->>AG: Proposal created
    AG-->>A: 201 Created + Proposal details
    
    Note over AG: Voting period begins
    
    loop Voting Period
        participant V as Voter
        V->>AG: POST /governance/proposals/{id}/vote
        AG->>GS: gRPC: CastVote()
        
        GS->>GS: Validate voter eligibility
        GS->>BS: Record vote on blockchain
        BS->>HF: Submit vote transaction
        HF-->>BS: Vote recorded
        BS-->>GS: Vote transaction ID
        
        GS->>NATS: Publish "vote.cast" event
        GS-->>AG: Vote recorded
        AG-->>V: 200 OK + Vote confirmation
    end
    
    Note over AG: Voting period ends, tally votes
    
    GS->>GS: Calculate voting results
    GS->>BS: Record final results on blockchain
    BS->>HF: Submit results transaction
    HF-->>BS: Results recorded
    
    GS->>NATS: Publish "proposal.completed" event
    NATS->>NS: Notify all participants of results
```

## 9. Error Handling and Recovery Flow

### Service Failure Recovery Sequence

```mermaid
sequenceDiagram
    participant C as Client
    participant AG as API Gateway
    participant MS as Member Service
    participant DB as Database
    participant NATS as NATS Bus
    participant Monitor as Monitoring

    C->>AG: Request member data
    AG->>MS: gRPC: GetMember()
    
    MS->>DB: Query member
    Note over DB: Database connection fails
    DB-xMS: Connection timeout
    
    MS->>Monitor: Log error metric
    MS->>MS: Increment retry counter
    
    alt Retry within limit
        MS->>DB: Retry query with backoff
        DB-->>MS: Member data (success)
        MS-->>AG: Member response
        AG-->>C: 200 OK + Member data
    else Retry limit exceeded
        MS->>NATS: Publish "service.error" event
        MS-->>AG: 503 Service Unavailable
        AG-->>C: 503 Service Unavailable
        
        NATS->>Monitor: Trigger alert
        Note over Monitor: Alert operations team
    end
```

## 10. Cross-Service Transaction Flow (Saga Pattern)

### Distributed Transaction Coordination

```mermaid
sequenceDiagram
    participant C as Client
    participant AG as API Gateway
    participant SO as Saga Orchestrator
    participant AS as Auth Service
    participant MS as Member Service
    participant BS as Blockchain Service
    participant NATS as NATS Bus

    C->>AG: Complex operation request
    Note over C,AG: E.g., Transfer member between clubs
    
    AG->>SO: Start saga transaction
    SO->>NATS: Publish "saga.started" event
    
    Note over SO: Step 1: Validate permissions
    SO->>AS: Validate transfer permissions
    AS-->>SO: Permissions valid
    SO->>NATS: Publish "saga.step_completed" event
    
    Note over SO: Step 2: Update member record
    SO->>MS: Update member club association
    MS-->>SO: Member updated
    SO->>NATS: Publish "saga.step_completed" event
    
    Note over SO: Step 3: Record on blockchain
    SO->>BS: Record transfer transaction
    
    alt Blockchain success
        BS-->>SO: Transaction recorded
        SO->>NATS: Publish "saga.completed" event
        SO-->>AG: Transaction successful
        AG-->>C: 200 OK + Transfer confirmed
    else Blockchain failure
        BS-xSO: Transaction failed
        
        Note over SO: Compensating actions
        SO->>MS: Revert member update (compensate)
        MS-->>SO: Member reverted
        
        SO->>NATS: Publish "saga.compensated" event
        SO-->>AG: Transaction failed
        AG-->>C: 400 Bad Request + Error details
    end
```

These sequence diagrams provide a comprehensive view of the key workflows in the Reciprocal Clubs Backend system, showing how different services interact to accomplish complex business processes while maintaining data consistency and providing robust error handling.
