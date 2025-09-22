# Hanko Authentication Integration

## Quick Start

The Reciprocal Clubs Platform now includes Hanko authentication service for passwordless authentication using WebAuthn passkeys.

### Docker Compose (Development)

```bash
# Start all services including Hanko
docker-compose up -d

# Hanko will be available at:
# - Public API: http://localhost:8000
# - Admin API: http://localhost:8001
```

### Kubernetes

```bash
# Deploy infrastructure
kubectl apply -f deployments/k8s/config/
kubectl apply -f deployments/k8s/infrastructure/

# Check status
kubectl get pods -n reciprocal-clubs
```

### Podman

```bash
# Using the compose script
cd deployments/podman-quadlets
./podman-compose.sh up

# Or using systemd (copy config first)
mkdir -p ~/.config/reciprocal-clubs/hanko
cp config/podman/hanko-config.yaml ~/.config/reciprocal-clubs/hanko/config.yaml
systemctl --user start hanko.service
```

## Services Overview

| Service | Port | Description |
|---------|------|-------------|
| Hanko Public API | 8000 | Authentication endpoints for client apps |
| Hanko Admin API | 8001 | Administrative operations |
| Auth Service | 8081 | Platform auth service (integrates with Hanko) |

## Authentication Flow

1. **User Registration**: Create user via Hanko API
2. **Passkey Registration**: Register WebAuthn credentials
3. **Authentication**: Login using passkeys
4. **Session Management**: Validate sessions via Hanko
5. **Platform Integration**: Auth service receives webhook events

## Configuration Files

- `config/hanko/config.yaml` - Docker Compose configuration
- `config/podman/hanko-config.yaml` - Podman configuration
- `deployments/k8s/infrastructure/hanko.yaml` - Kubernetes deployment

## Integration Points

- **Database**: Shared PostgreSQL database
- **Network**: All services on same network/namespace
- **Webhooks**: Hanko → Auth Service event notifications
- **Environment**: Auth service configured with Hanko endpoints

## Recent Improvements (September 17, 2025)

### Enhanced Hanko Client

- **Nil-Safe Logging**: Robust error handling with nil checks throughout client
- **Improved Error Handling**: Better HTTP request/response error management
- **Test Coverage**: Complete test suite with proper API endpoint testing
- **WebAuthn Standards**: Updated to use standard WebAuthn API endpoints

### Key Features

- **Passkey Registration**: `/webauthn/registration/initialize`
- **Passkey Authentication**: `/webauthn/authentication/initialize`
- **Session Validation**: `/sessions/validate`
- **User Management**: Full CRUD operations with error handling

### Code Example

```go
// Nil-safe client operations
client := hanko.NewHankoClient(config, logger)

// All operations handle nil logger gracefully
user, err := client.CreateUser(ctx, "user@example.com")
if err != nil {
    // Proper error handling
    log.Printf("Failed to create user: %v", err)
}
```

For detailed deployment instructions, see [HANKO_DEPLOYMENT.md](./HANKO_DEPLOYMENT.md)
