# Hanko Authentication Service Deployment

This document explains how to deploy the Hanko authentication service in the Reciprocal Clubs Platform using Kubernetes or Podman.

## Overview

Hanko provides passwordless authentication using WebAuthn (passkeys) for the Reciprocal Clubs Platform. It integrates with our existing PostgreSQL database and provides both public and admin APIs.

## Architecture

- **Hanko Public API** (Port 8000): Used by client applications for authentication
- **Hanko Admin API** (Port 8001): Used for administrative operations
- **Database**: Shares PostgreSQL with other platform services
- **Redis**: Used for rate limiting and session storage

## Kubernetes Deployment

### Prerequisites

- Kubernetes cluster with Ingress controller
- PostgreSQL and Redis services deployed
- Persistent volumes available

### Deployment Steps

1. **Create namespace and base configuration:**

   ```bash
   kubectl apply -f deployments/k8s/config/namespace.yaml
   ```

2. **Deploy infrastructure services:**

   ```bash
   kubectl apply -f deployments/k8s/infrastructure/postgres.yaml
   kubectl apply -f deployments/k8s/infrastructure/redis.yaml
   kubectl apply -f deployments/k8s/infrastructure/nats.yaml
   ```

3. **Deploy Hanko service:**

   ```bash
   kubectl apply -f deployments/k8s/infrastructure/hanko.yaml
   ```

4. **Verify deployment:**

   ```bash
   kubectl get pods -n reciprocal-clubs -l app=hanko
   kubectl get services -n reciprocal-clubs -l app=hanko
   ```

### Configuration

The Hanko configuration is stored in a ConfigMap and includes:

- Database connection to PostgreSQL
- Redis configuration for rate limiting
- WebAuthn settings for passkey authentication
- CORS settings for frontend integration
- Webhook configuration for auth events

### Accessing Hanko

- **Internal (within cluster):**
  - Public API: `http://hanko-service:8000`
  - Admin API: `http://hanko-service:8001`

- **External (via Ingress):**
  - Public API: `http://auth.reciprocal-clubs.local`
  - Admin API: `http://auth-admin.reciprocal-clubs.local`

## Podman Deployment

### Podman Prerequisites

- Podman installed and configured
- Shared network configured

### Podman Deployment Steps

1. **Setup configuration directory:**

   ```bash
   mkdir -p ~/.config/reciprocal-clubs/hanko
   cp config/podman/hanko-config.yaml ~/.config/reciprocal-clubs/hanko/config.yaml
   ```

2. **Start infrastructure services:**

   ```bash
   cd deployments/podman-quadlets
   ./podman-compose.sh infra
   ```

3. **Deploy using Quadlets (systemd):**

   ```bash
   # Copy quadlet files to systemd directory
   cp *.container ~/.config/containers/systemd/

   # Reload systemd and start services
   systemctl --user daemon-reload
   systemctl --user start hanko-migrate.service
   systemctl --user start hanko.service
   ```

4. **Or deploy using compose script:**

   ```bash
   ./podman-compose.sh up
   ```

### Manual Deployment

```bash
# Run migration
podman run --rm \
  --name reciprocal-hanko-migrate \
  --network reciprocal-clubs \
  -v ~/.config/reciprocal-clubs/hanko/config.yaml:/etc/config/config.yaml:ro \
  teamhanko/hanko:latest \
  migrate up --config /etc/config/config.yaml

# Start Hanko service
podman run -d \
  --name reciprocal-hanko \
  --network reciprocal-clubs \
  -p 8000:8000 \
  -p 8001:8001 \
  -e PASSWORD_ENABLED=true \
  -v ~/.config/reciprocal-clubs/hanko/config.yaml:/etc/config/config.yaml:ro \
  teamhanko/hanko:latest \
  serve --config /etc/config/config.yaml all
```

## Hanko Service Configuration

### Environment Variables

- `PASSWORD_ENABLED=true`: Enable password authentication alongside passkeys
- Database connection configured via config file
- Redis connection for rate limiting

### Config File Locations

- **Kubernetes**: ConfigMap in `hanko-config`
- **Podman**: `~/.config/reciprocal-clubs/hanko/config.yaml`
- **Development**: `config/hanko/config.yaml`

## Integration with Auth Service

The auth service automatically connects to Hanko when deployed with the following environment variables:

- `AUTH_SERVICE_HANKO_BASE_URL`: Points to Hanko public API
- `AUTH_SERVICE_HANKO_API_KEY`: Optional API key for enhanced features

### Webhooks

Hanko is configured to send webhook events to the auth service for:

- User creation/updates/deletion
- Session creation/deletion

## Health Checks

### Kubernetes

```bash
kubectl get pods -n reciprocal-clubs -l app=hanko
kubectl logs -n reciprocal-clubs deployment/hanko
```

### Podman

```bash
podman ps --filter name=reciprocal-hanko
podman logs reciprocal-hanko
curl http://localhost:8000/health
```

## Troubleshooting

### Common Issues

1. **Migration fails**: Check PostgreSQL connection and permissions
2. **Service won't start**: Verify configuration file syntax
3. **CORS errors**: Update allowed origins in configuration
4. **Auth integration fails**: Check webhook URL configuration

### Logs

- **Kubernetes**: `kubectl logs -n reciprocal-clubs deployment/hanko`
- **Podman**: `podman logs reciprocal-hanko`

### Database Issues

Check if Hanko tables are created:

```sql
\c reciprocal_clubs
\dt hanko*
```

## Security Considerations

- Use HTTPS in production
- Configure proper CORS origins
- Set secure cookie settings
- Use proper secret management for production deployments
- Rotate API keys regularly

## Monitoring

Health check endpoint: `GET /health`

- Returns 200 OK when service is healthy
- Includes database connectivity status

Both Kubernetes and Podman deployments include health checks and restart policies for high availability.
