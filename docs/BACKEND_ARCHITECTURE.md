# Clubland Backend Architecture

## Executive Summary

The Clubland Backend is a comprehensive microservices-based system built for managing private blockchain-based reciprocal club memberships. The system leverages Hyperledger Fabric for immutable transaction records and provides a multi-tenant architecture supporting multiple clubs with cross-club reciprocal agreements.

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
| **API Gateway** | 🟡 95% | GraphQL/REST entry point, advanced middleware | Go, gqlgen, GraphQL, Prometheus |
| **Auth Service** | 🟡 90% | Multi-tenant authentication, RBAC, Hanko integration | Go, JWT, bcrypt, WebAuthn |
| **Member Service** | 🟢 100% | Comprehensive member management, profiles, lifecycle | Go, gRPC, PostgreSQL, GORM, 25+ Metrics |
| **Reciprocal Service** | 🟢 95% | Cross-club agreements, visit verification | Go, gRPC, Blockchain |
| **Blockchain Service** | 🟢 95% | Hyperledger Fabric integration | Go, Fabric SDK |
| **Notification Service** | 🟢 95% | Multi-channel notifications | Go, Templates, SMTP/SMS |
| **Analytics Service** | 🟢 100% | Usage analytics, reporting, external integrations | Go, Time-series DB, S3 |
| **Governance Service** | 🟢 95% | Network governance, voting | Go, Smart Contracts |

**Legend**: 🟢 Production Ready, 🟡 Near Complete, 🔴 In Development

**Overall Status**: **89% Production Ready** - 6 of 8 services fully complete

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
│ │Notification │ │ Analytics   │ │ Governance  │ │   Future    │     │
│ │   Service   │ │   Service   │ │   Service   │ │   Services  │     │
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

## Communication Architecture

### Protocol Stack

**Communication Protocols**:

- **Client ↔ API Gateway**: GraphQL over HTTP/HTTPS + WebSocket subscriptions
- **Gateway ↔ Services**: gRPC (Protocol Buffers)
- **Services ↔ Database**: PostgreSQL native protocol
- **Services ↔ Message Bus**: NATS protocol
- **Blockchain Integration**: Hyperledger Fabric SDK

**Key Integration Patterns**:

1. **Synchronous**: gRPC for real-time operations (member lookup, authentication)
2. **Asynchronous**: NATS for event broadcasting and saga orchestration
3. **Real-time**: WebSocket subscriptions for live updates (notifications, visit status)

### Event-Driven Architecture

**NATS Message Bus Configuration**:

```yaml
Event Categories:
  - Domain Events: Business logic changes (member.created, visit.recorded)
  - Integration Events: Cross-service coordination (payment.processed)
  - System Events: Infrastructure notifications (service.started, error.occurred)

Message Patterns:
  - Publish/Subscribe: Broadcast notifications to multiple subscribers
  - Request/Reply: Synchronous-style communication over async transport
  - Queue Groups: Load balancing across service instances
```

## Technology Stack

### Backend Services

- **Language**: Go 1.21+ with modern concurrency patterns
- **API Gateway**: GraphQL with gqlgen schema-first development
- **Authentication**: Hanko WebAuthn service + JWT tokens
- **Database**: PostgreSQL 15+ with multi-tenant row-level security
- **Caching**: Redis clusters for sessions and performance
- **Messaging**: NATS JetStream for event-driven architecture
- **Blockchain**: Hyperledger Fabric for immutable audit trails

### Infrastructure

- **Containers**: Docker/Podman with distroless base images
- **Orchestration**: Kubernetes with horizontal pod autoscaling
- **Monitoring**: Prometheus, Grafana, Jaeger for observability
- **Security**: TLS 1.3, mTLS service mesh, encrypted storage

## Data Architecture

### Multi-Tenant Database Design

**Data Partitioning Strategy**:

- Club-based data isolation with tenant ID in all entities
- Row-level security policies for data separation
- Shared reference data (countries, currencies)

**Consistency Models**:

- **Strong Consistency**: Within service boundaries via ACID transactions
- **Eventual Consistency**: Cross-service via event sourcing
- **Immutable Audit Trail**: Blockchain integration for critical operations

### Service Data Ownership

```sql
-- Member Service Example
CREATE TABLE members (
    id SERIAL PRIMARY KEY,
    club_id INTEGER NOT NULL, -- Tenant isolation
    member_number VARCHAR(50) UNIQUE NOT NULL,
    membership_type membership_type_enum DEFAULT 'REGULAR',
    status member_status_enum DEFAULT 'ACTIVE',
    blockchain_identity VARCHAR(255),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Multi-tenant isolation policy
CREATE POLICY tenant_isolation ON members
FOR ALL TO authenticated_user
USING (club_id = current_setting('app.current_tenant_id'));
```

## Performance & Scalability

### Performance Targets

| Component | Latency (P95) | Throughput | Availability |
|-----------|---------------|------------|--------------|
| API Gateway | < 100ms | 10k req/s | 99.95% |
| Auth Service | < 50ms | 5k req/s | 99.99% |
| Member Service | < 200ms | 2k req/s | 99.9% |
| Database | < 10ms | 50k ops/s | 99.95% |
| Message Bus | < 5ms | 100k msg/s | 99.9% |

### Scaling Strategies

**Horizontal Scaling**:

- Kubernetes HPA with custom metrics
- Database read replicas and connection pooling
- Redis clustering for sessions and cache
- CDN integration for static assets
- Message bus clustering with NATS

**Resource Management**:

```yaml
Resource Limits (per service):
  Memory: 512Mi - 2Gi
  CPU: 250m - 1000m
  Replicas: 3-10 (auto-scaling)

Health Checks:
  /health: Kubernetes liveness probe
  /ready: Kubernetes readiness probe
  /metrics: Prometheus scraping endpoint
```

## Monitoring & Observability

### Metrics Collection

**Prometheus Metrics (25+ per service)**:

- Request rates, latencies, and error rates
- Business metrics (registrations, visits, transactions)
- Infrastructure metrics (memory, CPU, connections)
- Custom domain metrics (blockchain confirmations, notification delivery)

### Logging Strategy

**Structured Logging**:

```json
{
  "timestamp": "2024-09-25T10:00:00Z",
  "level": "info",
  "service": "member-service",
  "tenant_id": "club_123",
  "correlation_id": "req_abc123",
  "message": "Member registration completed",
  "member_id": "mem_456",
  "duration_ms": 234
}
```

### Distributed Tracing

**Jaeger Integration**:

- Request correlation across services
- Performance bottleneck identification
- Error propagation tracking
- Business transaction tracing

## Security Architecture

### Multi-Layer Security

```text
Internet → CDN → WAF → Load Balancer → API Gateway → Services
                                          ↓
                             JWT + RBAC + Multi-tenant Isolation
                                          ↓
                             Encrypted Database + Blockchain Audit
```

### Security Controls

**Network Security**:

- TLS 1.3 for external communication
- mTLS for inter-service communication
- Network policies and service mesh

**Data Protection**:

- PostgreSQL TDE (Transparent Data Encryption)
- Field-level encryption for PII
- Secure key management with HashiCorp Vault

**Access Control**:

- JWT tokens with RS256 signing
- Role-based access control (RBAC)
- Tenant-aware authorization
- API rate limiting with multiple tiers

## Deployment Architecture

### Container Strategy

**Multi-environment Deployment**:

```yaml
# Production Configuration Example
services:
  member-service:
    image: clubland/member-service:v1.2.0
    environment:
      - ENVIRONMENT=production
      - DB_HOST=postgres-cluster.internal
      - NATS_URL=nats://nats-cluster:4222
      - BLOCKCHAIN_URL=fabric-peer:7051
    resources:
      limits:
        memory: 1Gi
        cpu: 500m
      requests:
        memory: 512Mi
        cpu: 250m
    replicas: 3
```

### Environment Management

**Configuration Management**:

```go
type Config struct {
    Environment   string `env:"ENVIRONMENT" envDefault:"development"`
    Database      DatabaseConfig
    NATS          NATSConfig
    Blockchain    BlockchainConfig
    Auth          AuthConfig
    Monitoring    MonitoringConfig
}
```

## Future Architecture Considerations

### Planned Enhancements

**Short-term (3-6 months)**:

- Complete Auth Service advanced features (MFA, password recovery)
- Enhanced analytics with real-time ML predictions
- Advanced monitoring with custom dashboards
- API Gateway optimization and caching improvements

**Medium-term (6-12 months)**:

- Service mesh migration (Istio/Linkerd)
- Event sourcing implementation
- Advanced blockchain features (private data collections)
- Multi-region deployment strategy

**Long-term (12+ months)**:

- Microservice decomposition (if needed based on scale)
- Event streaming with Apache Kafka
- Advanced AI/ML integration
- Global CDN and edge computing

## Next Steps

1. **Review**: [GraphQL Integration Guide](./GRAPHQL_INTEGRATION.md) for API details
2. **Implement**: [Authentication & Security](./AUTHENTICATION_SECURITY.md) for user management
3. **Build**: [Business Process Integration](./BUSINESS_PROCESSES.md) for workflows
4. **Deploy**: [Testing & Deployment](./TESTING_DEPLOYMENT.md) for production readiness
