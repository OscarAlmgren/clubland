# Reciprocal Clubs Backend - Architecture Documentation

## Executive Summary

The Reciprocal Clubs Backend is a comprehensive microservices-based system built for managing private blockchain-based reciprocal club memberships. The system leverages Hyperledger Fabric for immutable transaction records and provides a multi-tenant architecture supporting multiple clubs with cross-club reciprocal agreements.

## System Overview

### Architecture Paradigm

- **Microservices Architecture**: Loosely coupled services with domain-specific responsibilities
- **Event-Driven Communication**: NATS message bus for asynchronous inter-service communication
- **Multi-Tenant Design**: Club-based data partitioning with tenant-aware authorization
- **Blockchain Integration**: Hyperledger Fabric for immutable audit trails and cross-club transactions
- **API-First Design**: GraphQL gateway with RESTful service endpoints

### Core Principles

1. **Domain Isolation**: Each service owns its data and business logic
2. **Fail-Fast**: Comprehensive input validation and error handling
3. **Observability**: Structured logging, metrics, and distributed tracing
4. **Security by Design**: Multi-layer security with JWT, RBAC, and tenant isolation
5. **Scalability**: Horizontal scaling with stateless services and connection pooling

## Service Architecture

### Service Catalog

| Service | Status | Purpose | Technology Stack |
|---------|---------|---------|------------------|
| **API Gateway** | 🟡 Partial | GraphQL/REST entry point, advanced middleware | Go, gqlgen, GraphQL, Prometheus |
| **Auth Service** | 🟢 Complete | Multi-tenant authentication, RBAC, Hanko integration | Go, JWT, bcrypt, WebAuthn |
| **Member Service** | 🟢 Complete | Comprehensive member management, profiles, lifecycle | Go, gRPC, PostgreSQL, GORM, 25+ Metrics |
| **Reciprocal Service** | 🟢 Complete | Cross-club agreements, visit verification | Go, gRPC, Blockchain |
| **Blockchain Service** | 🟢 Complete | Hyperledger Fabric integration | Go, Fabric SDK |
| **Notification Service** | 🔴 Partial | Multi-channel notifications | Go, Templates, SMTP/SMS |
| **Analytics Service** | 🟡 Handlers Fixed | Usage analytics, reporting, external integrations | Go, Time-series DB, S3 |
| **Governance Service** | 🔴 Partial | Network governance, voting | Go, Smart Contracts |

**Legend**: 🟢 Complete, 🟡 Handlers Fixed/Partial, 🔴 Needs Implementation

**Current Implementation Status**: 4 out of 8 services fully production-ready (50% completion). All service handlers now compile cleanly after recent fixes. Handler compilation issues resolved across Auth and Analytics services.

### Service Interaction Model

```text
┌─────────────────────────────────────────────────────────────────────┐
│                            Client Layer                             │
├─────────────────────────────────────────────────────────────────────┤
│  Web App        Mobile App       Admin Portal      Third-party APIs │
└─────────────────┬───────────────────────────────────────────────────┘
                  │ HTTP/GraphQL/WebSocket
┌─────────────────▼───────────────────────────────────────────────────┐
│                        API Gateway Layer                            │
├─────────────────────────────────────────────────────────────────────┤
│ • GraphQL Schema Stitching   • Authentication Middleware            │
│ • Rate Limiting              • Request/Response Transformation      │
│ • Load Balancing             • CORS & Security Headers              │
└─────────────────┬───────────────────────────────────────────────────┘
                  │ gRPC/HTTP
┌─────────────────▼───────────────────────────────────────────────────┐
│                      Business Services Layer                        │
├─────────────────────────────────────────────────────────────────────┤
│ ┌─────────────┐ ┌─────────────┐ ┌─────────────┐ ┌─────────────┐     │
│ │    Auth     │ │   Member    │ │ Reciprocal  │ │ Blockchain  │     │
│ │   Service   │ │   Service   │ │   Service   │ │   Service   │     │
│ └─────────────┘ └─────────────┘ └─────────────┘ └─────────────┘     │
│                                                                     │
│ ┌─────────────┐ ┌─────────────┐ ┌─────────────┐ ┌─────────────┐     │
│ │Notification │ │ Analytics   │ │ Governance  │ │ (Future     │     │
│ │   Service   │ │   Service   │ │   Service   │ │   Services) │     │
│ └─────────────┘ └─────────────┘ └─────────────┘ └─────────────┘     │
└─────────────────┬───────────────────────────────────────────────────┘
                  │ NATS Event Bus
┌─────────────────▼───────────────────────────────────────────────────┐
│                      Infrastructure Layer                           │
├─────────────────────────────────────────────────────────────────────┤
│ ┌─────────────┐ ┌─────────────┐ ┌─────────────┐ ┌─────────────┐     │
│ │ PostgreSQL  │ │    NATS     │ │ Hyperledger │ │  Prometheus │     │
│ │  Databases  │ │  Msg. Bus   │ │   Fabric    │ │ & Grafana   │     │
│ └─────────────┘ └─────────────┘ └─────────────┘ └─────────────┘     │
└─────────────────────────────────────────────────────────────────────┘
```

## Data Architecture

### Database Design Strategy

**Multi-Tenant Data Partitioning**:

- Each club maintains isolated data partitions
- Tenant ID (club_id) in all domain entities
- Row-level security policies for data isolation
- Shared reference data (countries, currencies, etc.)

**Data Consistency Model**:

- **Strong Consistency**: Within service boundaries via ACID transactions
- **Eventual Consistency**: Cross-service via event sourcing
- **Immutable Audit Trail**: Blockchain integration for critical operations

### Service Data Ownership

| Service | Database | Owned Entities | Relationships |
|---------|----------|----------------|---------------|
| Auth | `auth_db` | Users, Roles, Sessions, Tenants | → Member (auth_user_id) |
| Member | `member_db` | Members, Profiles, Addresses, Clubs | ← Auth, → Reciprocal |
| Reciprocal | `reciprocal_db` | Agreements, Visits, Verifications | ← Member, → Blockchain |
| Blockchain | `blockchain_db` | Transactions, Blocks, Events | ← All Services |
| Notification | `notification_db` | Templates, Queues, Delivery Status | ← All Services |
| Analytics | `analytics_db` | Metrics, Reports, Aggregations | ← All Services |
| Governance | `governance_db` | Proposals, Votes, Policies | ← All Services |

### Database Schema Highlights

**Member Service Schema** (✅ Fully Implemented):

```sql
-- Comprehensive member management with full lifecycle support
CREATE TABLE members (
    id SERIAL PRIMARY KEY,
    club_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    member_number VARCHAR(50) UNIQUE NOT NULL,
    membership_type membership_type_enum DEFAULT 'REGULAR',
    status member_status_enum DEFAULT 'ACTIVE',
    blockchain_identity VARCHAR(255),
    profile_id INTEGER REFERENCES member_profiles(id),
    joined_at TIMESTAMP DEFAULT NOW(),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    deleted_at TIMESTAMP,
    UNIQUE(club_id, user_id),
    INDEX idx_member_club_id (club_id),
    INDEX idx_member_user_id (user_id),
    INDEX idx_member_number (member_number),
    INDEX idx_member_status (status)
);

CREATE TABLE member_profiles (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    phone_number VARCHAR(20),
    address_id INTEGER REFERENCES addresses(id),
    emergency_contact_id INTEGER REFERENCES emergency_contacts(id),
    preferences_id INTEGER REFERENCES member_preferences(id),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE addresses (
    id SERIAL PRIMARY KEY,
    street VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    postal_code VARCHAR(20) NOT NULL,
    country VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE emergency_contacts (
    id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    relationship VARCHAR(100),
    phone_number VARCHAR(20) NOT NULL,
    email VARCHAR(255),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE member_preferences (
    id SERIAL PRIMARY KEY,
    email_notifications BOOLEAN DEFAULT true,
    sms_notifications BOOLEAN DEFAULT false,
    push_notifications BOOLEAN DEFAULT true,
    marketing_emails BOOLEAN DEFAULT false,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- Enums for comprehensive member management
CREATE TYPE membership_type_enum AS ENUM (
    'REGULAR', 'VIP', 'CORPORATE', 'STUDENT', 'SENIOR'
);

CREATE TYPE member_status_enum AS ENUM (
    'ACTIVE', 'SUSPENDED', 'EXPIRED', 'PENDING'
);
```

**Member Service Features** (✅ Production Ready):

- **Complete CRUD Operations**: Create, read, update, delete members and profiles
- **Member Lifecycle Management**: Active, suspended, expired, pending status transitions
- **Profile Management**: Comprehensive member profiles with addresses and emergency contacts
- **Membership Types**: Support for Regular, VIP, Corporate, Student, Senior memberships
- **Multi-tenant Support**: Club-based data isolation and tenant-aware operations
- **Auto-generated Member Numbers**: Unique member numbering per club
- **Blockchain Integration**: Optional blockchain identity for members
- **Event Publishing**: Domain events for member lifecycle changes
- **Comprehensive Metrics**: 25+ Prometheus metrics for monitoring
- **Health Checks**: Database connectivity and service health monitoring
- **gRPC API**: 14 RPC methods for all member operations
- **HTTP REST API**: RESTful endpoints with proper middleware
- **Unit Testing**: Comprehensive test coverage for service and repository layers

## Communication Architecture

### Synchronous Communication (gRPC)

- **API Gateway → Services**: Request/response for real-time operations
- **Service-to-Service**: Direct calls for immediate data needs
- **Authentication**: JWT validation across all service calls
- **Load Balancing**: Service discovery and client-side load balancing

### Asynchronous Communication (NATS)

- **Event Broadcasting**: Domain events published to interested services
- **Saga Orchestration**: Multi-service transaction coordination
- **Notification Delivery**: Decoupled notification processing
- **Analytics Data Pipeline**: Event streaming for metrics collection

### Event Schema Design

**Domain Events Structure**:

```go
type DomainEvent struct {
    ID           string                 `json:"id"`
    Type         string                 `json:"type"`
    Source       string                 `json:"source"`
    TenantID     string                 `json:"tenant_id"`
    Timestamp    time.Time             `json:"timestamp"`
    Version      string                 `json:"version"`
    Data         map[string]interface{} `json:"data"`
    Metadata     EventMetadata         `json:"metadata"`
}

type EventMetadata struct {
    CorrelationID string `json:"correlation_id"`
    CausationID   string `json:"causation_id"`
    UserID        string `json:"user_id,omitempty"`
    IPAddress     string `json:"ip_address,omitempty"`
    UserAgent     string `json:"user_agent,omitempty"`
}
```

**Key Event Types**:

- `member.created`, `member.updated`, `member.status_changed`
- `club.created`, `club.settings_updated`
- `reciprocal.agreement_created`, `reciprocal.visit_recorded`
- `blockchain.transaction_committed`
- `auth.user_logged_in`, `auth.permission_granted`

## Security Architecture

### Authentication & Authorization Flow

```text
┌──────────────┐    1. Login Request    ┌─────────────┐
│   Client     │ ──────────────────────►│API Gateway  │
└──────────────┘                        └─────────────┘
                                                │
                                                │ 2. Forward Auth
                                                ▼
                                        ┌─────────────┐
                                        │Auth Service │
                                        └─────────────┘
                                                │
                                                │ 3. Validate Credentials
                                                ▼
                                        ┌─────────────┐
                                        │ Database    │
                                        └─────────────┘
                                                │
                ┌──────────────┐                │ 4. Generate JWT
                │   Client     │ ◄──────────────┘
                └──────────────┘
                        │
                        │ 5. Subsequent Requests (JWT)
                        ▼
                ┌─────────────┐    6. JWT Validation    ┌─────────────┐
                │API Gateway  │ ──────────────────────► │   Service   │
                └─────────────┘                         └─────────────┘
```

### Security Layers

1. **Network Security**:
   - TLS 1.3 for all external communications
   - Internal service mesh with mTLS
   - Network segmentation and firewall rules

2. **Authentication**:
   - JWT tokens with RS256 signing
   - Refresh token rotation
   - Multi-factor authentication support
   - Session management with Redis

3. **Authorization**:
   - Role-Based Access Control (RBAC)
   - Tenant-aware permissions
   - Resource-level access control
   - Dynamic permission evaluation

4. **Data Protection**:
   - Encryption at rest (PostgreSQL TDE)
   - Field-level encryption for PII
   - Data anonymization for analytics
   - GDPR compliance features

## Deployment Architecture

### Container Strategy

- **Base Images**: Distroless images for security
- **Multi-stage Builds**: Optimized image sizes
- **Health Checks**: Comprehensive liveness/readiness probes
- **Resource Limits**: CPU/memory constraints per service

### Kubernetes Deployment Model

```yaml
# Example service deployment structure
apiVersion: apps/v1
kind: Deployment
metadata:
  name: member-service
spec:
  replicas: 3
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxUnavailable: 1
      maxSurge: 1
  template:
    spec:
      containers:
      - name: member-service
        resources:
          requests:
            memory: "256Mi"
            cpu: "250m"
          limits:
            memory: "512Mi"
            cpu: "500m"
        livenessProbe:
          httpGet:
            path: /health/live
            port: 8080
        readinessProbe:
          httpGet:
            path: /health/ready
            port: 8080
```

### Infrastructure Components

**Core Infrastructure**:

- **Kubernetes Cluster**: Container orchestration
- **PostgreSQL Cluster**: Primary data storage with read replicas
- **NATS Cluster**: Message bus with clustering
- **Redis Cluster**: Session storage and caching
- **Hyperledger Fabric**: Blockchain network

**Monitoring & Observability**:

- **Prometheus**: Metrics collection
- **Grafana**: Metrics visualization
- **Jaeger**: Distributed tracing
- **ELK Stack**: Log aggregation and analysis

## Performance & Scalability

### Performance Characteristics

| Component | Latency Target | Throughput Target | Scalability Model |
|-----------|---------------|------------------|------------------|
| API Gateway | < 100ms | 10k req/s | Horizontal pods |
| Auth Service | < 50ms | 5k req/s | Horizontal pods |
| Member Service | < 200ms | 2k req/s | Horizontal pods |
| Database | < 10ms | 50k ops/s | Read replicas + sharding |
| Message Bus | < 5ms | 100k msg/s | Clustering |

### Scaling Strategies

**Horizontal Scaling**:

- Kubernetes Horizontal Pod Autoscaler (HPA)
- Custom metrics-based scaling
- Database read replicas
- Message bus clustering

**Caching Strategy**:

- Redis for session and frequently accessed data
- Application-level caching with TTL
- Database query result caching
- CDN for static assets

**Database Optimization**:

- Connection pooling with pgBouncer
- Index optimization for query patterns
- Partitioning for large tables
- Async replication for read replicas

## Quality Assurance

### Testing Strategy

**Test Pyramid Implementation**:

```text
      ▲
     / \
    /E2E\     <- End-to-End (Real workflows)
   /Intgr\    <- Integration (Service boundaries)
  /─Unit──\   <- Unit Tests (Business logic)
 /_________\
```

**Coverage Targets**:

- Unit Tests: > 80% code coverage
- Integration Tests: All service boundaries
- E2E Tests: Critical user journeys
- Performance Tests: Load and stress testing

### Code Quality

**Static Analysis**:

- `golangci-lint` for Go code analysis
- `gosec` for security vulnerability scanning
- `goimports` for import organization
- Custom linting rules for domain consistency

**Code Review Process**:

- Mandatory PR reviews
- Automated CI/CD checks
- Architecture decision documentation
- Security review for critical changes

## Technology Stack Deep Dive

### Core Technologies

**Backend Language**: Go 1.25+

- **Rationale**: Performance, concurrency, strong typing
- **Key Libraries**: gRPC, GORM, testify, zerolog

**Database**: PostgreSQL 15+

- **Rationale**: ACID compliance, JSON support, performance
- **Features**: Row-level security, full-text search, extensions

**Message Bus**: NATS

- **Rationale**: Lightweight, high performance, clustering
- **Features**: JetStream, subject hierarchies, authentication

**Blockchain**: Hyperledger Fabric

- **Rationale**: Private networks, chaincode, enterprise features
- **Integration**: Go SDK, event listening, transaction submission

### Development Tools

**Code Generation**:

- `gqlgen` for GraphQL schema-first development
- `protoc` for Protocol Buffer generation
- `mockery` for test mock generation

**Database Migration**:

- Custom migration system with rollback support
- Schema versioning and validation
- Data seeding for development/testing

## Future Architecture Considerations

### Planned Enhancements

1. **Multi-Region Deployment**:
   - Database replication across regions
   - Event sourcing with regional failover
   - CDN integration for global performance

2. **Advanced Security**:
   - OAuth2/OIDC integration
   - SAML for enterprise SSO
   - Zero-trust network model

3. **Performance Optimization**:
   - GraphQL query optimization
   - Database sharding strategies
   - Edge computing for mobile apps

4. **Operational Excellence**:
   - Chaos engineering practices
   - Automated incident response
   - Advanced monitoring and alerting

### Technology Evolution

**Emerging Technologies**:

- **WebAssembly**: For plugin architecture
- **Kubernetes Operators**: For automated operations
- **Service Mesh**: For advanced traffic management
- **Event Streaming**: Apache Kafka for high-volume events

This architecture provides a solid foundation for a scalable, secure, and maintainable reciprocal clubs management system while maintaining flexibility for future enhancements and growth.
