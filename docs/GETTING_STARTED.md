# Getting Started Guide - Reciprocal Clubs Platform

Welcome to the Reciprocal Clubs Platform! This comprehensive guide will walk you through setting up and running the full platform locally, including how to configure club-specific parameters and customize the system for your needs.

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Quick Start](#quick-start)
3. [Detailed Setup](#detailed-setup)
4. [Configuration Guide](#configuration-guide)
5. [Club Configuration](#club-configuration)
6. [Development Workflow](#development-workflow)
7. [Testing](#testing)
8. [Troubleshooting](#troubleshooting)

## Prerequisites

Before you begin, ensure you have the following installed on your machine:

### Required Software

- **Git** (version 2.20+)
- **Docker** (version 20.10+) and **Docker Compose** (version 2.0+)
- **Podman** (version 4.0+) - *Alternative to Docker*
- **Go** (version 1.25+)
- **Node.js** (version 18+) and **npm** (version 8+)
- **PostgreSQL** (version 14+)
- **Redis** (version 7.0+)

### System Requirements

- **Memory**: Minimum 8GB RAM (16GB recommended)
- **Storage**: At least 20GB free space
- **OS**: Linux, macOS, or Windows with WSL2

## Quick Start

Get the platform running in under 5 minutes:

### 1. Clone the Repository

```bash
git clone https://github.com/reciprocal-clubs-platform/reciprocal-clubs-backend.git
cd reciprocal-clubs-backend
```

### 2. Choose Your Container Engine

#### Option A: Using Docker Compose (Recommended for beginners)

```bash
# Copy environment configuration
cp .env.example .env

# Start all services
docker-compose up -d

# Wait for services to be ready (about 2-3 minutes)
docker-compose logs -f
```

#### Option B: Using Podman Quadlets (Recommended for production)

```bash
# Set up Podman quadlets
make setup-podman

# Start services with Podman
make start-podman

# Check status
make status-podman
```

#### Option C: Using Kubernetes (For advanced users)

```bash
# Apply Kubernetes configurations
kubectl apply -f deployments/k8s/

# Wait for pods to be ready
kubectl get pods -w
```

### 3. Verify Installation

Once the services are running, verify the installation:

```bash
# Check service health
curl http://localhost:8080/health

# Check API endpoints
curl http://localhost:8081/health  # Auth Service
curl http://localhost:8082/health  # Member Service
curl http://localhost:8083/health  # Reciprocal Service
curl http://localhost:8084/health  # Blockchain Service
curl http://localhost:8085/health  # Notification Service
curl http://localhost:8086/health  # Analytics Service
curl http://localhost:8087/health  # Governance Service
```

### 4. Access the Platform

- **API Gateway**: <http://localhost:8080>
- **Member Service**: <http://localhost:8081>
- **Reciprocal Service**: <http://localhost:8082>
- **Blockchain Service**: <http://localhost:8083>
- **Admin Dashboard**: <http://localhost:3000> (if running frontend)
- **PostgreSQL**: localhost:5432
- **Redis**: localhost:6379

## Detailed Setup

### Environment Configuration

The platform uses environment variables for configuration. Copy and customize the environment file:

```bash
cp .env.example .env
```

Edit the `.env` file to configure:

```bash
# Database Configuration
DB_HOST=localhost
DB_PORT=5432
DB_USER=reciprocal_user
DB_PASSWORD=your_secure_password
DB_NAME=reciprocal_clubs

# Redis Configuration
REDIS_URL=redis://localhost:6379

# Blockchain Configuration (Hyperledger Fabric)
FABRIC_CA_URL=http://localhost:7054
FABRIC_PEER_URL=grpc://localhost:7051
FABRIC_ORDERER_URL=grpc://localhost:7050

# JWT Configuration
JWT_SECRET=your_jwt_secret_key
JWT_EXPIRY=24h

# Service Ports
MEMBER_SERVICE_PORT=8081
RECIPROCAL_SERVICE_PORT=8082
BLOCKCHAIN_SERVICE_PORT=8083
NOTIFICATION_SERVICE_PORT=8084
ANALYTICS_SERVICE_PORT=8085
GOVERNANCE_SERVICE_PORT=8086

# External Services
EMAIL_SMTP_HOST=smtp.example.com
EMAIL_SMTP_PORT=587
EMAIL_USERNAME=your_email@example.com
EMAIL_PASSWORD=your_email_password

# Development Settings
LOG_LEVEL=debug
ENVIRONMENT=development
```

### Database Setup

#### Using Docker Compose (Automatic)

If using Docker Compose, PostgreSQL and Redis are automatically configured.

#### Manual Setup

1. **Install and start PostgreSQL**:

   ```bash
   # Ubuntu/Debian
   sudo apt install postgresql postgresql-contrib
   
   # macOS
   brew install postgresql
   brew services start postgresql
   
   # Create database and user
   sudo -u postgres psql
   CREATE DATABASE reciprocal_clubs;
   CREATE USER reciprocal_user WITH ENCRYPTED PASSWORD 'your_password';
   GRANT ALL PRIVILEGES ON DATABASE reciprocal_clubs TO reciprocal_user;
   \q
   ```

2. **Install and start Redis**:

   ```bash
   # Ubuntu/Debian
   sudo apt install redis-server
   sudo systemctl start redis-server
   
   # macOS
   brew install redis
   brew services start redis
   ```

### Building the Services

#### Build All Services

```bash
# Build all microservices
make build-all

# Or build individual services
make build-member-service
make build-reciprocal-service
make build-blockchain-service
make build-notification-service
make build-analytics-service
make build-governance-service
```

#### Running Services Locally

```bash
# Start all services in development mode
make dev-all

# Or start individual services
make dev-member-service
make dev-reciprocal-service
# ... etc
```

### Hyperledger Fabric Setup

The blockchain service uses Hyperledger Fabric. Set up the network:

```bash
# Navigate to blockchain service
cd services/blockchain-service

# Start Fabric network
./scripts/start-fabric-network.sh

# Deploy chaincode
./scripts/deploy-chaincode.sh

# Initialize ledger
./scripts/init-ledger.sh
```

## Configuration Guide

### Service Configuration

Each microservice has its own configuration file in the `config/` directory:

```bash
services/
├── member-service/config/config.yaml
├── reciprocal-service/config/config.yaml
├── blockchain-service/config/config.yaml
├── notification-service/config/config.yaml
├── analytics-service/config/config.yaml
└── governance-service/config/config.yaml
```

### Logging Configuration

Configure logging levels and output formats:

```yaml
# config/logging.yaml
logging:
  level: debug  # trace, debug, info, warn, error, fatal
  format: json  # json, text
  output: stdout  # stdout, file
  file_path: /var/log/reciprocal-clubs/service.log
```

### Security Configuration

Configure authentication and authorization:

```yaml
# config/security.yaml
security:
  jwt:
    secret: ${JWT_SECRET}
    expiry: 24h
    issuer: reciprocal-clubs-platform
  cors:
    allowed_origins: ["http://localhost:3000", "https://yourdomain.com"]
    allowed_methods: ["GET", "POST", "PUT", "DELETE", "OPTIONS"]
    allowed_headers: ["Authorization", "Content-Type"]
  rate_limiting:
    requests_per_minute: 100
    burst_size: 50
```

## Club Configuration

The platform provides comprehensive club configuration capabilities. Here's how to set up and manage club-specific parameters:

### Initial Club Setup

#### 1. Create a Club

```bash
curl -X POST http://localhost:8081/api/v1/clubs \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Pine Valley Golf Club",
    "slug": "pine-valley-gc",
    "description": "A premier private golf club established in 1925",
    "email": "info@pinevalleygc.com",
    "phone": "+1-555-123-4567",
    "website": "https://www.pinevalleygc.com"
  }'
```

#### 2. Initialize Default Configuration

```bash
curl -X POST http://localhost:8081/api/v1/clubs/1/configuration/initialize \
  -H "Content-Type: application/json" \
  -d '{
    "club_name": "Pine Valley Golf Club",
    "country": "US",
    "city": "Pine Valley"
  }'
```

### Comprehensive Club Configuration

The platform supports extensive club configuration parameters:

#### Basic Information

```json
{
  "display_name": "Pine Valley Golf Club",
  "short_name": "PVGC",
  "motto_or_tagline": "Excellence in Golf Since 1925",
  "established_year": 1925,
  "member_capacity": 500,
  "waiting_list_enabled": true
}
```

#### Contact Information

```json
{
  "primary_email": "info@pinevalleygc.com",
  "reservations_email": "reservations@pinevalleygc.com",
  "events_email": "events@pinevalleygc.com",
  "general_phone": "+1-555-123-4567",
  "reservations_phone": "+1-555-123-4568",
  "website": "https://www.pinevalleygc.com"
}
```

#### Location and Geographic Settings

```json
{
  "full_address": "123 Golf Course Road, Pine Valley, NJ 08021, USA",
  "country": "US",
  "country_name": "United States",
  "state": "New Jersey",
  "city": "Pine Valley",
  "postal_code": "08021",
  "timezone": "America/New_York",
  "latitude": 39.7884,
  "longitude": -74.9581
}
```

#### Cultural and Regional Settings

```json
{
  "currency": "USD",
  "language": "en",
  "date_format": "MM/DD/YYYY",
  "time_format": "12h"
}
```

#### Club Classification

```json
{
  "club_type": "private",
  "primary_category": "golf",
  "secondary_categories": ["dining", "social"],
  "specializations": ["Championship Golf Course", "Fine Dining", "Corporate Events"]
}
```

#### Operating Hours

```json
{
  "operating_hours": {
    "monday": {
      "open": true,
      "open_time": "06:00",
      "close_time": "22:00"
    },
    "tuesday": {
      "open": true,
      "open_time": "06:00",
      "close_time": "22:00"
    },
    "wednesday": {
      "open": true,
      "open_time": "06:00",
      "close_time": "22:00"
    },
    "thursday": {
      "open": true,
      "open_time": "06:00",
      "close_time": "22:00"
    },
    "friday": {
      "open": true,
      "open_time": "06:00",
      "close_time": "23:00"
    },
    "saturday": {
      "open": true,
      "open_time": "06:00",
      "close_time": "23:00"
    },
    "sunday": {
      "open": true,
      "open_time": "07:00",
      "close_time": "21:00"
    }
  }
}
```

#### Membership Configuration

```json
{
  "membership_types": [
    {
      "type": "full",
      "name": "Full Golf Membership",
      "description": "Complete access to all club facilities and services",
      "initiation_fee": 50000.00,
      "monthly_fee": 800.00,
      "annual_fee": 9600.00,
      "voting_rights": true,
      "guest_privileges": 4,
      "reciprocal_privileges": true
    },
    {
      "type": "associate",
      "name": "Associate Membership",
      "description": "Limited golf access with full dining privileges",
      "initiation_fee": 25000.00,
      "monthly_fee": 400.00,
      "annual_fee": 4800.00,
      "voting_rights": false,
      "guest_privileges": 2,
      "reciprocal_privileges": true
    }
  ]
}
```

#### Reciprocal Club Settings

```json
{
  "reciprocal_enabled": true,
  "reciprocal_agreement_terms": {
    "max_visits_per_member": 6,
    "max_visits_per_month": 2,
    "advance_booking_required": true,
    "advance_booking_days": 3,
    "guest_allowance": 1,
    "discount_percentage": 10.0
  }
}
```

### Configuration API Endpoints

#### Get Club Configuration

```bash
curl http://localhost:8081/api/v1/clubs/1/configuration
```

#### Update Club Configuration

```bash
curl -X PUT http://localhost:8081/api/v1/clubs/1/configuration \
  -H "Content-Type: application/json" \
  -d @club-config.json
```

#### Get Operating Status

```bash
curl http://localhost:8081/api/v1/clubs/1/operating-status
```

#### Validate Configuration

```bash
curl -X POST http://localhost:8081/api/v1/clubs/configuration/validate \
  -H "Content-Type: application/json" \
  -d @club-config.json
```

#### Get Configuration Template

```bash
curl "http://localhost:8081/api/v1/clubs/configuration/template?club_type=private&country=US"
```

## Development Workflow

### Code Structure

```text
reciprocal-clubs-backend/
├── services/           # Microservices
│   ├── member-service/
│   ├── reciprocal-service/
│   ├── blockchain-service/
│   ├── notification-service/
│   ├── analytics-service/
│   └── governance-service/
├── shared/            # Shared libraries
├── deployments/       # Deployment configurations
│   ├── docker-compose.yml
│   ├── podman-quadlets/
│   └── k8s/
├── docs/             # Documentation
├── scripts/          # Utility scripts
└── tools/            # Development tools
```

### Making Changes

1. **Create a feature branch**:

   ```bash
   git checkout -b feature/your-feature-name
   ```

2. **Make your changes** in the appropriate service directory

3. **Run tests**:

   ```bash
   make test-all
   # Or test specific service
   make test-member-service
   ```

4. **Build and test locally**:

   ```bash
   make build-all
   make dev-all
   ```

5. **Commit and push**:

   ```bash
   git add .
   git commit -m "Add new feature: description"
   git push origin feature/your-feature-name
   ```

### Adding New Club Configuration Parameters

To add new configuration parameters:

1. **Update the model** in `services/member-service/internal/models/club_config.go`
2. **Update validation** in the service layer
3. **Update API documentation**
4. **Add migration** if needed
5. **Update tests**

Example:

```go
// Add to ClubSettings struct
type ClubSettings struct {
    // ... existing fields ...
    
    // New field
    MaxGuestsPerEvent int `json:"max_guests_per_event"`
}

// Update validation
func (c *ClubSettings) Validate() error {
    // ... existing validation ...
    
    if c.MaxGuestsPerEvent < 0 {
        return fmt.Errorf("max guests per event cannot be negative")
    }
    
    return nil
}
```

## Testing

### Running Tests

```bash
# Run all tests
make test-all

# Run tests for specific service
make test-member-service
make test-reciprocal-service

# Run integration tests
make test-integration

# Run with coverage
make test-coverage
```

### Test Data

The platform includes seed data for testing:

```bash
# Load test data
make seed-data

# Load specific test scenarios
make load-test-clubs
make load-test-members
make load-test-agreements
```

### API Testing

Use the provided Postman collection or curl examples:

```bash
# Test member creation
curl -X POST http://localhost:8081/members \
  -H "Content-Type: application/json" \
  -d '{
    "club_id": 1,
    "user_id": 123,
    "membership_type": "REGULAR",
    "profile": {
      "first_name": "John",
      "last_name": "Doe"
    }
  }'

# Test reciprocal agreement
curl -X POST http://localhost:8082/api/v1/agreements \
  -H "Content-Type: application/json" \
  -d '{
    "club_a_id": 1,
    "club_b_id": 2,
    "terms": {...}
  }'
```

## Troubleshooting

### Common Issues

#### 1. Services Won't Start

**Problem**: `dial tcp [::1]:5432: connect: connection refused`

**Solution**:

- Ensure PostgreSQL is running: `sudo systemctl status postgresql`
- Check connection details in `.env` file
- Verify database exists: `psql -h localhost -U reciprocal_user -d reciprocal_clubs`

#### 2. Port Conflicts

**Problem**: `bind: address already in use`

**Solution**:

- Check what's using the port: `lsof -i :8081`
- Kill conflicting process or change port in config
- Update `.env` file with new ports

#### 3. Blockchain Network Issues

**Problem**: Hyperledger Fabric network won't start

**Solution**:

```bash
# Clean up existing network
cd services/blockchain-service
./scripts/cleanup-fabric-network.sh

# Restart network
./scripts/start-fabric-network.sh
```

#### 4. Memory Issues

**Problem**: Out of memory errors

**Solution**:

- Increase Docker memory limit (8GB minimum)
- Close unnecessary applications
- Consider running fewer services simultaneously

#### 5. Database Migration Issues

**Problem**: Migration fails or database schema mismatch

**Solution**:

```bash
# Reset database
make db-reset

# Run migrations
make db-migrate

# Verify schema
make db-status
```

### Getting Help

- **Documentation**: Check the `/docs` directory for detailed documentation
- **Issues**: Create an issue on GitHub with logs and error details
- **Logs**: Check service logs for detailed error information:

  ```bash
  docker-compose logs member-service
  # or
  journalctl -u podman-member-service
  ```

### Performance Optimization

For better performance in development:

1. **Use local databases** instead of containers when possible
2. **Increase container resources** in Docker/Podman
3. **Enable caching** in Redis for frequently accessed data
4. **Use build caches** to speed up rebuilds

### Production Considerations

When deploying to production:

1. **Use proper secrets management** (HashiCorp Vault, Kubernetes secrets)
2. **Configure load balancing** for high availability
3. **Set up monitoring** (Prometheus, Grafana)
4. **Configure backup strategies** for databases
5. **Implement proper logging** and log aggregation
6. **Use TLS/SSL** for all communications
7. **Configure firewalls** and network security

## Next Steps

After getting the platform running:

1. **Explore the APIs**: Use the Swagger documentation at `http://localhost:8080/swagger`
2. **Customize club configurations**: Experiment with different club settings
3. **Set up reciprocal agreements**: Create agreements between clubs
4. **Test member workflows**: Create members and test the full user journey
5. **Integrate with frontend**: Connect a frontend application
6. **Deploy to staging**: Set up a staging environment for testing

## Contributing

We welcome contributions! Please see our [Contributing Guide](CONTRIBUTING.md) for details on:

- Code style guidelines
- Development workflow
- Testing requirements
- Documentation standards
- Pull request process

---

**Need help?** Open an issue on GitHub or reach out to the maintainers. We're here to help you get up and running with the Reciprocal Clubs Platform!
