# Clubland Backend Architecture

## Executive Summary

The Clubland Backend is a **unified Go monolith** for managing blockchain-based reciprocal club memberships. It provides a multi-tenant architecture with club-based data isolation, a GraphQL API (187 resolvers), and Hyperledger Fabric integration for immutable audit trails.

**Status: 100% complete as of 2026-03-29** — all phases including security hardening, blockchain metrics, TLS, and pilot preparation are done.

## System Overview

### Architecture Paradigm

- **Monolith Architecture**: Single Go binary with domain-separated internal modules
- **Event-Driven (Internal)**: Internal EventBus for asynchronous cross-module communication
- **Multi-Tenant Design**: Club-based data partitioning with row-level security (RLS)
- **Blockchain Integration**: Hyperledger Fabric 2.5 for immutable audit trails and cross-club transactions
- **API-First Design**: GraphQL (76 Queries, 100 Mutations) + REST handlers for ops/identity/membership

### Core Principles

1. **Strict Isolation**: Every repository call uses `clubID` from context — no cross-tenant data leaks
2. **Blockchain Integration**: All blockchain interactions go through `internal/modules/blockchain` → `shared/fabric` gateway
3. **Event-Driven**: Internal `EventBus` for cross-module communication (keeps monolith decoupled)
4. **Error Handling**: `internal/shared/errors` — never return raw Go errors to the GraphQL layer
5. **Chaincode Determinism**: All chaincode timestamps use `ctx.GetStub().GetTxTimestamp()`, never `time.Now()`

## Module Architecture

```text
reciprocal-clubs-backend/
├── cmd/platform/          # App entry point
├── config/                # YAML configs (config.yaml, config.production.yaml, config.pilot.yaml)
├── chaincode/             # Smart contracts (reciprocal-clubs Go contract)
├── internal/
│   ├── api/               # REST handlers (Identity, Membership, Ops)
│   ├── graphql/           # Resolvers & Schema (76 Queries, 100 Mutations)
│   ├── modules/           # Domain logic
│   │   ├── identity/      # User management, auth, RBAC
│   │   ├── membership/    # Member lifecycle, profiles
│   │   ├── operations/    # Bookings, visits, reciprocal agreements
│   │   ├── platform/      # Club management, news, events, lunch menus
│   │   └── blockchain/    # Fabric service, LOI workflows, reconciliation
│   └── shared/            # Shared infra
│       ├── database/      # PostgreSQL 16 with RLS
│       ├── eventbus/      # Internal EventBus
│       ├── fabric/        # Hyperledger Fabric Gateway SDK client
│       ├── scheduler/     # Cron scheduler
│       └── monitoring/    # Prometheus metrics
├── fabric/                # Fabric network config & crypto-material
├── k3s/                   # K8s manifests (00-12: Postgres → Fabric Lifecycle → Monitoring → Network Policies)
└── scripts/               # Management scripts
```

## Communication Architecture

### Protocol Stack

- **Client ↔ Backend**: GraphQL over HTTP/HTTPS + WebSocket subscriptions
- **Backend ↔ Database**: PostgreSQL 16 native protocol (RLS enforced)
- **Backend ↔ Fabric**: Hyperledger Fabric Gateway SDK (gRPC to peer/orderer)
- **Internal modules**: In-process calls + internal EventBus

### Internal Event-Driven Architecture

The monolith uses an internal **EventBus** for cross-module communication instead of an external message broker. This keeps modules decoupled while avoiding network hops.

```text
                  ┌─────────────────┐
   Flutter App ──→│   GraphQL API   │
                  │  (187 resolvers)│
                  └────────┬────────┘
                           │ in-process
              ┌────────────┼───────────────┐
              ▼            ▼               ▼
     ┌──────────────┐ ┌──────────┐ ┌────────────┐
     │   identity   │ │membership│ │ operations │
     │   module     │ │ module   │ │  module    │
     └──────┬───────┘ └────┬─────┘ └─────┬──────┘
            │              │             │
            └──────────────┼─────────────┘
                     EventBus (internal)
                           │
                    ┌──────▼──────┐
                    │ blockchain  │
                    │  module     │
                    └──────┬──────┘
                           │ Fabric Gateway SDK
                    ┌──────▼──────┐
                    │ Hyperledger │
                    │   Fabric    │
                    └─────────────┘
```

## Technology Stack

### Backend

- **Language**: Go 1.26.1
- **API**: GraphQL with gqlgen (schema-first), REST for ops/identity/membership
- **Authentication**: Hanko (OIDC / passkeys) — backend validates JWTs issued by Hanko
- **Database**: PostgreSQL 16 with multi-tenant row-level security (RLS)
- **Blockchain**: Hyperledger Fabric 2.5 (CCAAS chaincode on K3s)
- **Monitoring**: Prometheus metrics (25+ per module)

### Infrastructure

- **Containers**: Podman (local dev), distroless images
- **Orchestration**: K3s (lightweight Kubernetes)
- **Monitoring**: Prometheus + Grafana
- **Security**: TLS 1.3, MSPID access control, network policies

## Data Architecture

### Multi-Tenant Database Design

All entities carry `club_id` for tenant isolation. PostgreSQL RLS policies enforce this at the database level:

```sql
-- Example: club-isolated members table
CREATE TABLE members (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    club_id UUID NOT NULL REFERENCES clubs(id),  -- Tenant isolation (UUID, not integer)
    ...
);

-- RLS policy enforced by backend context
CREATE POLICY tenant_isolation ON members
FOR ALL TO authenticated_user
USING (club_id = current_setting('app.current_club_id')::uuid);
```

**Important**: Club ID is always a UUID string (e.g. `550e8400-e29b-41d4-a716-446655440001`) — never an integer.

### Consistency Models

- **Strong Consistency**: Within module boundaries via ACID transactions on PostgreSQL
- **Eventual Consistency**: Cross-module via internal EventBus
- **Immutable Audit Trail**: Hyperledger Fabric for critical operations (LOI, cross-club visits)

## Performance & Scalability

### Performance Targets

| Component | Latency (P95) | Notes |
|-----------|---------------|-------|
| GraphQL API | < 100ms | Most queries |
| Auth (JWT validation) | < 50ms | Via Hanko |
| Database queries | < 10ms | With RLS |
| Blockchain operations | < 2s | Fabric commit latency |

## Security Architecture

### Implemented Controls

- **Phase 6-7 Complete**: CouchDB injection fix, MSPID access control, TLS, network policies
- JWT validation (RS256, issued by Hanko)
- Role-based access control (RBAC) per club
- Club-ID isolation enforced at every repository call
- PostgreSQL RLS as second line of defense
- Prometheus monitoring with alert rules

## Deployment Architecture

### Environments

| Environment | Endpoint | Notes |
|-------------|----------|-------|
| **Development** | `http://192.168.0.170:30080/graphql` | K3s on local Henrybook server |
| **Production** | `https://api.clubland.com/graphql` | K3s cloud |

### Key Operational Scripts

| Script | Purpose |
| :--- | :--- |
| `scripts/k3s-fabric-bootstrap.sh [up\|down\|status]` | Bootstrap / teardown Fabric network on K3s |
| `scripts/pilot-health-check.sh [--smoke]` | Pre-pilot ops check |
| `scripts/build-and-push-chaincode.sh` | Build and push chaincode Docker image |
| `scripts/db-start-podman.sh` | Start PostgreSQL locally |
| `scripts/hanko-start-podman.sh` | Start Hanko locally |

## Implementation Status

**All phases complete as of 2026-03-29:**

| Component | Status | Notes |
| :--- | :--- | :--- |
| **GraphQL API** | ✅ 100% | All 187 resolvers (76 Queries, 100 Mutations) |
| **Multi-Tenancy** | ✅ 100% | RLS + Club-ID isolation verified |
| **Blockchain Module** | ✅ 100% | Phases 1-5 done, CCAAS on K3s |
| **Security & Hardening** | ✅ 100% | Phase 6-7: CouchDB fix, MSPID, TLS |
| **Observability** | ✅ 100% | Prometheus, scheduler, reconciliation |
| **Pilot Prep** | ✅ 100% | Network policies, monitoring alerts |

## Next Steps for Flutter Integration

1. **Read**: [BACKEND_QUICK_START.md](./BACKEND_QUICK_START.md) to connect your dev environment
2. **Reference**: [API_DOCUMENTATION.md](./API_DOCUMENTATION.md) for GraphQL schema and operations
3. **Auth flow**: App authenticates via Hanko → receives JWT → sends as `Authorization: Bearer <token>` header
4. **Schema source**: `reciprocal-clubs-backend/internal/graphql/schema/` is the source of truth
