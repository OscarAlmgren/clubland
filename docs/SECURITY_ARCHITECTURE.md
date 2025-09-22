# Security Architecture - Reciprocal Clubs Backend

This document provides a comprehensive overview of the security architecture, threat model, and security controls implemented in the Reciprocal Clubs Backend system.

## Executive Summary

The Reciprocal Clubs Backend implements a defense-in-depth security strategy with multiple layers of protection across network, application, and data tiers. The system supports multi-tenant architecture with strong tenant isolation, blockchain-based audit trails, and comprehensive monitoring and incident response capabilities.

### Current Security Implementation Status (September 2025)

- ✅ **Authentication & Authorization**: Complete Hanko passkey integration with WebAuthn/FIDO2
- ✅ **Multi-tenant Security**: Club-based data isolation with RBAC implementation
- ✅ **Blockchain Audit Trails**: Hyperledger Fabric integration for immutable records
- ✅ **Service Security**: Handler compilation issues resolved, production-ready security controls
- ✅ **Testing Framework**: Comprehensive security testing patterns established
- 🔧 **Infrastructure Security**: Container orchestration security (needs production hardening)
- 📋 **Monitoring & Response**: Security monitoring framework (needs implementation)

## Security Architecture Overview

### Security Layers Diagram

```mermaid
graph TD
    subgraph "External Layer"
        Internet[Internet]
        CDN[Content Delivery Network]
        WAF[Web Application Firewall]
    end
    
    subgraph "Network Layer"
        LB[Load Balancer]
        DMZ[DMZ]
        FW[Firewall]
        VPN[VPN Gateway]
    end
    
    subgraph "Application Layer"
        API[API Gateway]
        AuthN[Authentication]
        AuthZ[Authorization]
        RateLimit[Rate Limiting]
        CORS[CORS Protection]
    end
    
    subgraph "Service Layer"
        AS[Auth Service]
        MS[Member Service]
        RS[Reciprocal Service]
        BS[Blockchain Service]
    end
    
    subgraph "Data Layer"
        DB[Encrypted Database]
        BC[Blockchain]
        Cache[Encrypted Cache]
        Backup[Encrypted Backups]
    end
    
    Internet --> CDN
    CDN --> WAF
    WAF --> LB
    LB --> DMZ
    DMZ --> FW
    FW --> API
    
    API --> AuthN
    AuthN --> AuthZ
    AuthZ --> RateLimit
    RateLimit --> CORS
    
    CORS --> AS
    CORS --> MS
    CORS --> RS
    CORS --> BS
    
    AS --> DB
    MS --> DB
    RS --> DB
    BS --> BC
    
    DB --> Cache
    DB --> Backup
    
    VPN --> DMZ
    
    style Internet fill:#ffebee
    style CDN fill:#e8f5e8
    style WAF fill:#e8f5e8
    style API fill:#e3f2fd
    style AuthN fill:#e3f2fd
    style AuthZ fill:#e3f2fd
    style DB fill:#f3e5f5
    style BC fill:#f3e5f5
```

## Authentication Architecture

### Multi-Tenant Authentication Flow

```mermaid
sequenceDiagram
    participant C as Client
    participant API as API Gateway
    participant Auth as Auth Service
    participant JWT as JWT Processor
    participant DB as Auth Database
    participant Redis as Session Store

    Note over C, Redis: Authentication Phase
    C->>API: Login Request (email, password, club_slug)
    API->>Auth: Validate Credentials
    
    Auth->>DB: Query User + Club Context
    DB->>Auth: User Record + Club Info
    
    Auth->>Auth: Verify Password Hash (bcrypt)
    Auth->>Auth: Check Account Status
    Auth->>Auth: Validate MFA (if enabled)
    
    Auth->>JWT: Generate JWT Token
    Note over JWT: Payload: user_id, club_id, roles, permissions
    JWT->>Auth: Signed JWT (RS256)
    
    Auth->>Redis: Store Refresh Token
    Auth->>API: JWT + Refresh Token
    API->>C: Authentication Success
    
    Note over C, Redis: Request Authorization Phase
    C->>API: API Request + JWT Header
    API->>JWT: Validate JWT Signature
    JWT->>API: JWT Claims + Validation Status
    
    API->>API: Extract Tenant Context
    API->>API: Check Permission Requirements
    
    alt Valid JWT + Permissions
        API->>Service: Forward Request + Context
        Service->>API: Service Response
        API->>C: Response
    else Invalid JWT or Permissions
        API->>C: 401 Unauthorized / 403 Forbidden
    end
```

### Authentication Security Controls

| Control | Implementation | Purpose |
|---------|---------------|---------|
| **Password Policy** | Min 12 chars, complexity rules | Prevent weak passwords |
| **Password Hashing** | bcrypt with cost factor 12 | Protect stored passwords |
| **JWT Signing** | RS256 with 2048-bit keys | Prevent token tampering |
| **Token Expiration** | 1-hour access, 30-day refresh | Limit exposure window |
| **Multi-Factor Auth** | TOTP, SMS, Email codes | Additional authentication factor |
| **Account Lockout** | 5 failed attempts, 15min lockout | Prevent brute force attacks |
| **Session Management** | Redis-based session store | Centralized session control |
| **Refresh Token Rotation** | New token on each refresh | Prevent token replay |

## Authorization Architecture

### Role-Based Access Control (RBAC) Model

```mermaid
erDiagram
    TENANT ||--o{ USER : contains
    USER ||--o{ USER_ROLE : has
    ROLE ||--o{ USER_ROLE : assigned_to
    ROLE ||--o{ ROLE_PERMISSION : grants
    PERMISSION ||--o{ ROLE_PERMISSION : assigned_to
    RESOURCE ||--o{ PERMISSION : protects
    
    TENANT {
        string id PK
        string name
        string slug
        boolean active
        timestamp created_at
    }
    
    USER {
        string id PK
        string tenant_id FK
        string email
        string password_hash
        boolean active
        timestamp last_login
    }
    
    ROLE {
        string id PK
        string tenant_id FK
        string name
        string description
        string scope
    }
    
    PERMISSION {
        string id PK
        string name
        string resource
        string action
        string conditions
    }
    
    RESOURCE {
        string id PK
        string name
        string type
        string endpoint_pattern
    }
    
    USER_ROLE {
        string user_id FK
        string role_id FK
        timestamp assigned_at
        timestamp expires_at
    }
    
    ROLE_PERMISSION {
        string role_id FK
        string permission_id FK
        boolean granted
    }
```

### Authorization Decision Flow

```mermaid
flowchart TD
    Start([Authorization Request]) --> ExtractContext[Extract Request Context]
    ExtractContext --> ValidateJWT{Valid JWT?}
    
    ValidateJWT -->|No| Deny[Return 401 Unauthorized]
    ValidateJWT -->|Yes| ExtractClaims[Extract JWT Claims]
    
    ExtractClaims --> ValidateTenant{Valid Tenant Context?}
    ValidateTenant -->|No| Deny
    ValidateTenant -->|Yes| CheckUserStatus{User Active?}
    
    CheckUserStatus -->|No| Deny
    CheckUserStatus -->|Yes| IdentifyResource[Identify Protected Resource]
    
    IdentifyResource --> LookupPermissions[Lookup Required Permissions]
    LookupPermissions --> GetUserRoles[Get User Roles]
    GetUserRoles --> GetRolePermissions[Get Role Permissions]
    
    GetRolePermissions --> EvaluatePermissions{Has Required Permissions?}
    EvaluatePermissions -->|No| CheckResourceOwnership{Check Resource Ownership?}
    
    CheckResourceOwnership -->|Yes| ValidateOwnership{Is Resource Owner?}
    ValidateOwnership -->|No| Deny2[Return 403 Forbidden]
    ValidateOwnership -->|Yes| CheckConditions
    
    EvaluatePermissions -->|Yes| CheckConditions[Check Permission Conditions]
    CheckResourceOwnership -->|No| Deny2
    
    CheckConditions --> EvaluateConditions{Conditions Met?}
    EvaluateConditions -->|No| Deny2
    EvaluateConditions -->|Yes| LogAccess[Log Access Grant]
    
    LogAccess --> Allow[Return 200 Authorized]
    
    Deny --> LogDenial[Log Access Denial]
    Deny2 --> LogDenial
    LogDenial --> End([End])
    Allow --> End
    
    style Start fill:#e1f5fe
    style Allow fill:#e8f5e8
    style Deny fill:#ffebee
    style Deny2 fill:#ffebee
    style End fill:#f5f5f5
```

## Data Protection Architecture

### Encryption Strategy

```mermaid
graph TD
    subgraph "Data in Transit"
        TLS[TLS 1.3 Encryption]
        mTLS[Mutual TLS for Services]
        VPN[IPSec VPN]
    end
    
    subgraph "Data at Rest"
        DBE[Database Encryption - AES-256]
        FLE[Field-Level Encryption - PII]
        BackupE[Backup Encryption - AES-256]
        CacheE[Cache Encryption - Redis AUTH]
    end
    
    subgraph "Data in Processing"
        AppE[Application-Level Encryption]
        KeyVault[Key Management Service]
        HSM[Hardware Security Module]
    end
    
    subgraph "Key Management"
        KEK[Key Encryption Keys]
        DEK[Data Encryption Keys]
        Rotation[Automated Key Rotation]
    end
    
    Client --> TLS
    TLS --> mTLS
    mTLS --> Services
    
    Services --> DBE
    Services --> FLE
    Services --> CacheE
    
    DBE --> BackupE
    
    AppE --> KeyVault
    KeyVault --> HSM
    
    KEK --> DEK
    DEK --> Rotation
    
    style TLS fill:#e8f5e8
    style mTLS fill:#e8f5e8
    style DBE fill:#e3f2fd
    style FLE fill:#e3f2fd
    style KeyVault fill:#f3e5f5
    style HSM fill:#f3e5f5
```

### Field-Level Encryption Schema

| Data Type | Encryption Method | Key Type | Rotation Period |
|-----------|------------------|----------|-----------------|
| **PII (Names, Addresses)** | AES-256-GCM | DEK | 90 days |
| **Financial Data** | AES-256-GCM | DEK | 60 days |
| **Authentication Data** | bcrypt + salt | N/A | N/A |
| **Session Data** | AES-256-CBC | KEK | 30 days |
| **Audit Logs** | AES-256-GCM | DEK | 180 days |
| **Backup Data** | AES-256-XTS | KEK | 365 days |

## Network Security Architecture

### Network Segmentation Model

```mermaid
graph TD
    subgraph "Internet Zone"
        Internet[Internet Users]
        CDN[Content Delivery Network]
    end
    
    subgraph "DMZ Zone"
        WAF[Web Application Firewall]
        LB[Load Balancer]
        RevProxy[Reverse Proxy]
    end
    
    subgraph "Application Zone"
        API[API Gateway]
        Services[Microservices]
    end
    
    subgraph "Data Zone"
        PrimaryDB[(Primary Database)]
        ReadDB[(Read Replicas)]
        Cache[(Redis Cache)]
    end
    
    subgraph "Management Zone"
        Monitor[Monitoring Stack]
        Logging[Log Aggregation]
        Backup[Backup Systems]
    end
    
    subgraph "Blockchain Zone"
        Fabric[Hyperledger Fabric]
        Peers[Fabric Peers]
        Orderer[Orderer Nodes]
    end
    
    Internet --> CDN
    CDN --> WAF
    WAF --> LB
    LB --> RevProxy
    RevProxy --> API
    API --> Services
    
    Services --> PrimaryDB
    Services --> ReadDB
    Services --> Cache
    Services --> Fabric
    
    Services --> Monitor
    Services --> Logging
    
    PrimaryDB --> Backup
    ReadDB --> Backup
    
    Fabric --> Peers
    Fabric --> Orderer
    
    style Internet fill:#ffebee
    style DMZ fill:#fff3e0
    style Application fill:#e3f2fd
    style Data fill:#e8f5e8
    style Management fill:#f3e5f5
    style Blockchain fill:#fce4ec
```

### Network Security Controls

| Zone | Ingress Rules | Egress Rules | Monitoring |
|------|--------------|--------------|------------|
| **DMZ** | HTTP/HTTPS (80,443) | App Zone (8080-8087) | WAF Logs, DDoS Detection |
| **Application** | DMZ (8080-8087) | Data Zone (5432,6379) | Request Logs, Error Rates |
| **Data** | App Zone Only | Backup Zone (443) | Connection Monitoring |
| **Management** | Admin VPN Only | All Zones (Monitoring) | Admin Activity Logs |
| **Blockchain** | App Zone (7051,7053) | Peer Network (7051) | Transaction Monitoring |

## Blockchain Security Architecture

### Hyperledger Fabric Security Model

```mermaid
graph TD
    subgraph "Certificate Authority (CA)"
        RootCA[Root CA]
        IntermediateCA[Intermediate CA]
        TLS_CA[TLS CA]
    end
    
    subgraph "Organizations"
        ClubOrg1[Club Organization 1]
        ClubOrg2[Club Organization 2]
        SystemOrg[System Organization]
    end
    
    subgraph "Network Components"
        Orderer[Orderer Service]
        Peer1[Peer 1]
        Peer2[Peer 2]
        Chaincode[Smart Contracts]
    end
    
    subgraph "Security Features"
        MSP[Membership Service Provider]
        ACL[Access Control Lists]
        Endorsement[Endorsement Policies]
        Encryption[Channel Encryption]
    end
    
    RootCA --> IntermediateCA
    IntermediateCA --> TLS_CA
    
    IntermediateCA --> ClubOrg1
    IntermediateCA --> ClubOrg2
    IntermediateCA --> SystemOrg
    
    ClubOrg1 --> Peer1
    ClubOrg2 --> Peer2
    SystemOrg --> Orderer
    
    Peer1 --> Chaincode
    Peer2 --> Chaincode
    
    MSP --> ACL
    ACL --> Endorsement
    Endorsement --> Encryption
    
    TLS_CA --> Peer1
    TLS_CA --> Peer2
    TLS_CA --> Orderer
    
    style RootCA fill:#e8f5e8
    style IntermediateCA fill:#e8f5e8
    style MSP fill:#e3f2fd
    style ACL fill:#e3f2fd
    style Chaincode fill:#fce4ec
```

### Blockchain Security Controls

| Component | Security Measure | Implementation |
|-----------|-----------------|----------------|
| **Certificate Management** | X.509 PKI Infrastructure | Hyperledger Fabric CA |
| **Channel Encryption** | AES-256 Channel Encryption | Fabric Native |
| **Access Control** | MSP-based Identity Management | Fabric MSP |
| **Endorsement Policy** | Multi-signature Requirements | Custom Policies |
| **Chaincode Security** | Sandboxed Execution | Docker Containers |
| **Transaction Privacy** | Private Data Collections | Fabric PDC |
| **Audit Trail** | Immutable Transaction Log | Blockchain Ledger |

## Security Monitoring and Incident Response

### Security Monitoring Architecture

```mermaid
graph TD
    subgraph "Data Sources"
        AppLogs[Application Logs]
        SysLogs[System Logs]
        NetLogs[Network Logs]
        AuditLogs[Audit Logs]
        Metrics[Security Metrics]
    end
    
    subgraph "Collection Layer"
        LogShipper[Log Shippers]
        MetricsAgent[Metrics Agents]
        SIEM[SIEM Collector]
    end
    
    subgraph "Processing Layer"
        LogParser[Log Parser]
        Correlator[Event Correlator]
        Analyzer[Security Analyzer]
        MLEngine[ML Threat Detection]
    end
    
    subgraph "Storage Layer"
        LogStore[Log Storage]
        MetricStore[Metric Storage]
        ThreatDB[Threat Intelligence DB]
    end
    
    subgraph "Response Layer"
        AlertManager[Alert Manager]
        Orchestrator[Response Orchestrator]
        Notification[Notification System]
        Remediation[Automated Remediation]
    end
    
    AppLogs --> LogShipper
    SysLogs --> LogShipper
    NetLogs --> LogShipper
    AuditLogs --> SIEM
    Metrics --> MetricsAgent
    
    LogShipper --> LogParser
    MetricsAgent --> Analyzer
    SIEM --> Correlator
    
    LogParser --> LogStore
    Correlator --> ThreatDB
    Analyzer --> MetricStore
    MLEngine --> ThreatDB
    
    LogStore --> AlertManager
    MetricStore --> AlertManager
    ThreatDB --> AlertManager
    
    AlertManager --> Orchestrator
    Orchestrator --> Notification
    Orchestrator --> Remediation
    
    style SIEM fill:#e8f5e8
    style MLEngine fill:#e3f2fd
    style AlertManager fill:#fff3e0
    style Remediation fill:#ffebee
```

### Incident Response Workflow

```mermaid
flowchart TD
    Detection[Security Event Detection] --> Classification{Classify Threat Level}
    
    Classification -->|Low| LogEvent[Log Event]
    Classification -->|Medium| CreateTicket[Create Security Ticket]
    Classification -->|High| TriggerAlert[Trigger Security Alert]
    Classification -->|Critical| InitiateResponse[Initiate Incident Response]
    
    LogEvent --> Monitor[Continue Monitoring]
    
    CreateTicket --> AssignAnalyst[Assign Security Analyst]
    AssignAnalyst --> Investigate[Investigate Event]
    
    TriggerAlert --> NotifyTeam[Notify Security Team]
    NotifyTeam --> AssignLead[Assign Incident Lead]
    AssignLead --> Investigate
    
    InitiateResponse --> ActivateIRT[Activate Incident Response Team]
    ActivateIRT --> ContainThreat[Contain Threat]
    
    Investigate --> DetermineImpact{Determine Impact}
    
    DetermineImpact -->|No Impact| CloseTicket[Close Ticket]
    DetermineImpact -->|Limited Impact| Mitigate[Apply Mitigation]
    DetermineImpact -->|Significant Impact| EscalateResponse[Escalate Response]
    
    ContainThreat --> AssessScope[Assess Breach Scope]
    AssessScope --> NotifyStakeholders[Notify Stakeholders]
    NotifyStakeholders --> BeginRecovery[Begin Recovery Process]
    
    Mitigate --> ImplementFix[Implement Fix]
    ImplementFix --> ValidateFix[Validate Fix]
    ValidateFix --> DocumentLessons[Document Lessons Learned]
    
    EscalateResponse --> ActivateIRT
    
    BeginRecovery --> RestoreServices[Restore Services]
    RestoreServices --> ValidateRecovery[Validate Recovery]
    ValidateRecovery --> PostIncidentReview[Post-Incident Review]
    
    CloseTicket --> Monitor
    DocumentLessons --> Monitor
    PostIncidentReview --> UpdateProcedures[Update Security Procedures]
    UpdateProcedures --> Monitor
    
    style Detection fill:#e1f5fe
    style InitiateResponse fill:#ffebee
    style ContainThreat fill:#fff3e0
    style Monitor fill:#e8f5e8
```

## Threat Model and Risk Assessment

### STRIDE Threat Analysis

| Threat Category | Potential Threats | Mitigation Strategies |
|----------------|-------------------|----------------------|
| **Spoofing** | Identity spoofing, JWT forgery | Multi-factor authentication, JWT signature validation, certificate pinning |
| **Tampering** | Data modification, message tampering | Digital signatures, checksums, blockchain immutability, input validation |
| **Repudiation** | Denial of actions, transaction disputes | Digital signatures, audit logs, blockchain records, non-repudiation protocols |
| **Information Disclosure** | Data breaches, unauthorized access | Encryption, access controls, data classification, network segmentation |
| **Denial of Service** | Service disruption, resource exhaustion | Rate limiting, DDoS protection, load balancing, resource monitoring |
| **Elevation of Privilege** | Unauthorized access escalation | Least privilege, regular access reviews, privilege separation, monitoring |

### Risk Assessment Matrix

| Risk | Probability | Impact | Risk Level | Mitigation Priority |
|------|------------|--------|------------|-------------------|
| **Data Breach** | Medium | Critical | High | P0 - Immediate |
| **Account Takeover** | High | High | High | P0 - Immediate |
| **Service Disruption** | Medium | High | Medium | P1 - High |
| **Insider Threat** | Low | High | Medium | P1 - High |
| **Supply Chain Attack** | Low | Critical | Medium | P2 - Medium |
| **Blockchain Attack** | Very Low | Critical | Low | P2 - Medium |
| **Social Engineering** | Medium | Medium | Medium | P2 - Medium |

## Compliance and Governance

### Compliance Framework Alignment

| Standard | Applicable Requirements | Implementation Status |
|----------|------------------------|----------------------|
| **GDPR** | Data protection, privacy by design | ✅ Implemented |
| **SOC 2** | Security controls, audit trails | 🟡 In Progress |
| **ISO 27001** | Information security management | 🟡 In Progress |
| **PCI DSS** | Payment card security (if applicable) | 🔄 Planned |
| **NIST Framework** | Cybersecurity framework alignment | ✅ Implemented |

### Security Governance Model

```mermaid
graph TD
    subgraph "Executive Level"
        CISO[Chief Information Security Officer]
        CTO[Chief Technology Officer]
        Board[Board of Directors]
    end
    
    subgraph "Management Level"
        SecManager[Security Manager]
        DevManager[Development Manager]
        OpsManager[Operations Manager]
    end
    
    subgraph "Operational Level"
        SecAnalyst[Security Analysts]
        DevTeam[Development Team]
        OpsTeam[Operations Team]
        Auditor[Security Auditor]
    end
    
    subgraph "Governance Processes"
        Policy[Security Policies]
        Standards[Security Standards]
        Procedures[Security Procedures]
        Training[Security Training]
    end
    
    Board --> CISO
    Board --> CTO
    CISO --> SecManager
    CTO --> DevManager
    CTO --> OpsManager
    
    SecManager --> SecAnalyst
    DevManager --> DevTeam
    OpsManager --> OpsTeam
    SecManager --> Auditor
    
    CISO --> Policy
    SecManager --> Standards
    SecAnalyst --> Procedures
    SecManager --> Training
    
    Policy --> Standards
    Standards --> Procedures
    Procedures --> Training
    
    style Board fill:#e8f5e8
    style CISO fill:#e3f2fd
    style Policy fill:#f3e5f5
    style Training fill:#fff3e0
```

## Security Testing and Validation

### Security Testing Strategy

| Test Type | Frequency | Scope | Tools/Methods |
|-----------|-----------|--------|---------------|
| **Static Code Analysis** | Every commit | All code | SonarQube, gosec |
| **Dynamic Analysis** | Weekly | Running applications | OWASP ZAP, Burp Suite |
| **Penetration Testing** | Quarterly | Full system | External security firm |
| **Vulnerability Scanning** | Daily | Infrastructure | Nessus, OpenVAS |
| **Dependency Scanning** | Every build | Third-party libraries | Snyk, GitHub Security |
| **Container Scanning** | Every image build | Container images | Trivy, Clair |
| **Configuration Review** | Monthly | System configurations | Custom scripts, CIS benchmarks |

## Recommendations and Future Enhancements

### Immediate Security Improvements

1. **Enhanced Monitoring**:
   - Implement User and Entity Behavior Analytics (UEBA)
   - Deploy Security Orchestration and Automated Response (SOAR)
   - Add real-time threat intelligence feeds

2. **Zero Trust Architecture**:
   - Implement micro-segmentation
   - Deploy service mesh with mTLS everywhere
   - Add continuous authentication and authorization

3. **Advanced Threat Protection**:
   - Deploy endpoint detection and response (EDR)
   - Implement deception technology
   - Add behavioral analysis for blockchain transactions

### Long-term Security Roadmap

1. **Quantum-Resistant Cryptography**:
   - Evaluate post-quantum cryptographic algorithms
   - Plan migration strategy for quantum-resistant protocols
   - Implement hybrid classical-quantum systems

2. **Privacy-Enhancing Technologies**:
   - Implement differential privacy for analytics
   - Deploy homomorphic encryption for sensitive computations
   - Add zero-knowledge proof systems for privacy verification

3. **AI-Powered Security**:
   - Deploy machine learning for anomaly detection
   - Implement AI-powered incident response
   - Add predictive security analytics

This security architecture provides a comprehensive foundation for protecting the Reciprocal Clubs Backend system against current and emerging threats while maintaining usability and performance.
