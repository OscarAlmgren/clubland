# Clubland Backend Integration Guide

## Overview

This is the master guide for integrating with the Reciprocal Clubs Backend. The backend is a **unified Go monolith** (not microservices) with a GraphQL API of 187 resolvers, Hyperledger Fabric integration, and Hanko-based authentication.

**Backend status: 100% complete as of 2026-03-29.**

## Document Structure

### 1. [Architecture Overview](./BACKEND_ARCHITECTURE.md)

- Monolith architecture and internal module structure
- Communication patterns (GraphQL, EventBus, Fabric)
- Multi-tenant design with RLS
- Deployment on K3s

### 2. [API Documentation](./API_DOCUMENTATION.md)

- GraphQL schema and operations
- Authentication and authorization
- Real-time subscriptions
- Flutter client integration patterns

### 3. [Quick Start](./BACKEND_QUICK_START.md)

- Connect to the development backend in minutes
- Environment configuration
- Testing connectivity

### 4. [Flutter GraphQL Guide](./FLUTTER_GRAPHQL_GUIDE.md)

- Type-safe GraphQL operations with `graphql_codegen`
- Riverpod state management integration
- Real-time subscriptions

### 5. [Authentication Complete Guide](./AUTHENTICATION_COMPLETE_GUIDE.md)

- Hanko OIDC / passkeys flow
- JWT token management in Flutter
- Biometric auth integration

### 6. [Events & RSVP](./EVENTS_RSVP_COMPLETE_GUIDE.md)

- Event queries and mutations
- RSVP workflows

### 7. [News Feed Implementation](./BACKEND_NEWSFEED_IMPLEMENTATION_GUIDE.md)

- Unified feed (news posts, events, lunch menus)
- GraphQL types, queries, pagination

## Quick Start

For developers new to the platform:

1. **Start with**: [Architecture Overview](./BACKEND_ARCHITECTURE.md) to understand the monolith
2. **Connect**: [Quick Start](./BACKEND_QUICK_START.md) to verify your dev environment
3. **Build**: [API Documentation](./API_DOCUMENTATION.md) for GraphQL operations
4. **Auth**: [Authentication Complete Guide](./AUTHENTICATION_COMPLETE_GUIDE.md) for Hanko flow

## API Endpoints

| Environment | GraphQL | WebSocket |
| --- | --- | --- |
| **Development** | `http://192.168.0.170:30080/graphql` | `ws://192.168.0.170:30080/graphql` |
| **Production** | `https://api.clubland.com/graphql` | `wss://api.clubland.com/graphql` |

## Schema Source of Truth

The GraphQL schema lives in the backend repo:

```text
reciprocal-clubs-backend/internal/graphql/schema/
```

When the backend schema changes, regenerate Flutter types:

```bash
dart run build_runner build --delete-conflicting-outputs
```

## Implementation Status

The backend is **100% production-ready** (all phases complete, 2026-03-29):

- ✅ **GraphQL API** (187 resolvers): All queries, mutations, and subscriptions live
- ✅ **Multi-Tenancy**: RLS and Club-ID isolation verified
- ✅ **Blockchain Module**: CCAAS chaincode deployed on K3s, full audit trail
- ✅ **Security Hardening**: CouchDB injection fix, MSPID access control, TLS
- ✅ **Observability**: Prometheus metrics, cron scheduler, bidirectional reconciliation
- ✅ **Pilot Prep**: Network policies, monitoring alerts, pilot checklist done

Last Updated: 2026-03-29
