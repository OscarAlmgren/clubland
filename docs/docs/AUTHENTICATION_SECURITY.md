# Authentication & Security Architecture

## Overview

The Clubland platform implements a comprehensive security architecture combining modern passwordless authentication with traditional security controls. The system uses Hanko for WebAuthn/passkey authentication, JWT tokens for session management, and multi-layer security controls for data protection.

## Authentication Architecture

### Hanko WebAuthn Integration

**Passwordless Authentication System**:
- **Primary Method**: WebAuthn passkeys with FIDO2/CTAP2
- **Fallback**: Biometric authentication on mobile devices
- **Session Management**: JWT tokens with automatic refresh
- **Multi-factor**: Optional SMS/email verification for sensitive operations

### Hanko Service Architecture

```text
┌─────────────────────────────────────────────────────────────────────┐
│                        Client Applications                          │
│  ┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐  │
│  │  Clubland App   │    │ Administrator   │    │   Web Portal    │  │
│  │   (Flutter)     │    │  App (Flutter)  │    │   (Flutter)     │  │
│  └─────────────────┘    └─────────────────┘    └─────────────────┘  │
└─────────────────┬───────────────┬───────────────┬─────────────────────┘
                  │               │               │
              WebAuthn API    Admin API       Public API
                  │               │               │
┌─────────────────▼───────────────▼───────────────▼─────────────────────┐
│                        Hanko Services                                │
│  ┌─────────────────────────────────────────────────────────────────┐  │
│  │  Hanko Public API (Port 8000) - Client Authentication          │  │
│  │  • WebAuthn registration/authentication                        │  │
│  │  • Passkey management                                          │  │
│  │  • Session creation                                            │  │
│  └─────────────────────────────────────────────────────────────────┘  │
│  ┌─────────────────────────────────────────────────────────────────┐  │
│  │  Hanko Admin API (Port 8001) - Administrative Operations       │  │
│  │  • User management                                             │  │
│  │  • Configuration management                                    │  │
│  │  • Analytics and reporting                                     │  │
│  └─────────────────────────────────────────────────────────────────┘  │
└─────────────────┬───────────────────────────────────────────────────────┘
                  │ Webhook Events
┌─────────────────▼───────────────────────────────────────────────────────┐
│                    Clubland Auth Service                               │
│  ┌─────────────────────────────────────────────────────────────────┐  │
│  │  • JWT token generation and validation                         │  │
│  │  • User session management                                     │  │
│  │  • RBAC and permissions                                        │  │
│  │  • Multi-tenant authorization                                  │  │
│  └─────────────────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────────────────┘
```

### Deployment Configuration

**Hanko Integration Points**:
```yaml
Services:
  hanko-public:
    image: ghcr.io/teamhanko/hanko:latest
    ports: ["8000:8000"]
    environment:
      - DATABASE_URL=postgresql://clubland_user:password@postgres:5432/clubland_hanko
      - SECRET=your-secret-key
      - PUBLIC_URL=https://auth.clubland.com

  hanko-admin:
    image: ghcr.io/teamhanko/hanko:latest
    ports: ["8001:8001"]
    command: ["hanko", "serve", "admin"]
    environment:
      - DATABASE_URL=postgresql://clubland_user:password@postgres:5432/clubland_hanko

  auth-service:
    image: clubland/auth-service:latest
    ports: ["8081:8081"]
    environment:
      - HANKO_API_URL=http://hanko-public:8000
      - HANKO_WEBHOOK_SECRET=webhook-secret-key
      - JWT_PRIVATE_KEY_PATH=/secrets/jwt-private.pem
      - JWT_PUBLIC_KEY_PATH=/secrets/jwt-public.pem
```

## Authentication Flows

### 1. WebAuthn Registration Flow

```mermaid
sequenceDiagram
    participant App as Clubland App
    participant Gateway as API Gateway
    participant Hanko as Hanko Service
    participant Auth as Auth Service
    participant DB as PostgreSQL

    App->>Gateway: GraphQL: initiateRegistration(email, clubId)
    Gateway->>Hanko: POST /webauthn/registration/initialize
    Hanko->>App: Challenge + publicKeyCredentialCreationOptions
    App->>App: User creates passkey (biometric/PIN)
    App->>Gateway: GraphQL: completeRegistration(authResponse)
    Gateway->>Hanko: POST /webauthn/registration/finalize
    Hanko->>Auth: Webhook: user_created event
    Auth->>DB: CREATE user + club association
    Auth->>Gateway: User profile + JWT tokens
    Gateway->>App: Complete registration response
```

### 2. WebAuthn Authentication Flow

```mermaid
sequenceDiagram
    participant App as Clubland App
    participant Gateway as API Gateway
    participant Hanko as Hanko Service
    participant Auth as Auth Service
    participant DB as PostgreSQL

    App->>Gateway: GraphQL: initiateLogin(email)
    Gateway->>Hanko: POST /webauthn/login/initialize
    Hanko->>App: Challenge + allowCredentials
    App->>App: User authenticates with passkey
    App->>Gateway: GraphQL: completeLogin(authResponse)
    Gateway->>Hanko: POST /webauthn/login/finalize
    Hanko->>Auth: Webhook: user_authenticated event
    Auth->>DB: FIND user + validate club membership
    Auth->>Gateway: User profile + JWT + refresh token
    Gateway->>App: Authentication success response
```

### 3. JWT Token Management

**Token Structure**:
```json
{
  "header": {
    "alg": "RS256",
    "typ": "JWT",
    "kid": "clubland-key-1"
  },
  "payload": {
    "sub": "user_123",
    "iss": "https://api.clubland.com",
    "aud": "clubland-app",
    "exp": 1727257200,
    "iat": 1727253600,
    "club_id": "club_456",
    "roles": ["member", "user"],
    "permissions": [
      "visit:create",
      "profile:read",
      "profile:update"
    ],
    "session_id": "sess_789"
  }
}
```

**Token Refresh Flow**:
```graphql
# Automatic token refresh
mutation RefreshToken($refreshToken: String!) {
  refreshToken(refreshToken: $refreshToken) {
    token
    refreshToken
    expiresAt
    user {
      id
      roles
      permissions
    }
  }
}
```

## Role-Based Access Control (RBAC)

### Permission Model

```text
Roles and Permissions:
├── SuperAdmin (Platform Level)
│   ├── club:create, club:delete, club:modify
│   ├── agreement:override, system:admin
│   ├── audit:access, user:manage:all
│   └── blockchain:admin, analytics:full
│
├── ClubAdmin (Club Specific)
│   ├── member:create, member:modify, member:suspend
│   ├── agreement:create, agreement:approve
│   ├── visit:verify, financial:access
│   ├── staff:manage, club:settings
│   └── reports:generate, audit:club
│
├── ClubStaff (Limited Operations)
│   ├── member:check_in, visit:record
│   ├── reservation:manage, guest:services
│   ├── reports:basic, support:contact
│   └── equipment:manage, events:assist
│
└── Member (Self-Service)
    ├── profile:edit, reservation:create
    ├── visit:self_check_in, social:interact
    ├── travel:plan, review:write
    └── friends:connect, notifications:manage
```

### Authorization Implementation

**GraphQL Directive-Based Authorization**:
```graphql
type Member {
  id: ID!
  memberNumber: String!
  profile: MemberProfile! @auth(requires: "member:read")

  # Sensitive data requires elevated permissions
  financialInfo: FinancialInfo @auth(requires: "member:financial:read")
  privateNotes: [Note!] @auth(requires: "admin:notes:read")

  # Self-access or admin access
  personalData: PersonalData @auth(
    requires: "member:personal:read"
    allowSelf: true
  )
}

# Multi-tenant authorization
type Query {
  members(clubId: ID!): [Member!] @auth(
    requires: "member:list"
    tenant: "clubId"
  )
}
```

**Middleware Authorization**:
```go
func AuthorizationMiddleware(permissions []string, allowSelf bool) gin.HandlerFunc {
    return func(c *gin.Context) {
        claims := c.MustGet("claims").(*jwt.Claims)

        // Check tenant isolation
        if !validateTenantAccess(claims.ClubID, c) {
            c.AbortWithStatusJSON(403, gin.H{"error": "Insufficient tenant access"})
            return
        }

        // Check permissions
        if !hasPermissions(claims.Permissions, permissions) {
            if allowSelf && isSelfAccess(claims.UserID, c) {
                c.Next()
                return
            }
            c.AbortWithStatusJSON(403, gin.H{"error": "Insufficient permissions"})
            return
        }

        c.Next()
    }
}
```

## Multi-Factor Authentication (MFA)

### MFA Configuration

**Available Methods**:
```yaml
MFA Methods:
  primary:
    - TOTP (Time-based One-Time Password)
    - SMS (Text message verification)
    - Email (Email verification)

  secondary:
    - Push notifications
    - Hardware tokens (FIDO2/U2F)
    - Backup codes

Enforcement Rules:
  - Required for admin operations
  - Required for financial transactions
  - Optional for regular member activities
  - Required for sensitive profile changes
```

**MFA Flow Implementation**:
```graphql
# Enable MFA
mutation EnableMFA($method: MFAMethod!, $phone: String, $email: String) {
  enableMFA(method: $method, phone: $phone, email: $email) {
    qrCode # For TOTP
    secret # For TOTP setup
    backupCodes
    method
    enabled
  }
}

# Verify MFA during sensitive operations
mutation PerformSensitiveOperation($input: SensitiveOperationInput!, $mfaCode: String!) {
  performSensitiveOperation(input: $input, mfaCode: $mfaCode) {
    success
    result
    message
  }
}
```

## Data Protection & Encryption

### Encryption Strategy

**Multi-Layer Encryption**:
```yaml
Transport Layer:
  - TLS 1.3 for all external communications
  - mTLS for inter-service communications
  - Certificate rotation every 90 days

Application Layer:
  - JWT tokens signed with RS256
  - API payload encryption for sensitive data
  - Field-level encryption for PII

Storage Layer:
  - PostgreSQL TDE (Transparent Data Encryption)
  - AES-256-GCM for application-level encryption
  - Separate encryption keys per tenant/club

Key Management:
  - HashiCorp Vault for secret management
  - Automated key rotation
  - Hardware Security Modules (HSM) for production
```

### Field-Level Encryption

```go
// Sensitive data encryption
type EncryptedField struct {
    Value     string `json:"encrypted_value"`
    Algorithm string `json:"algorithm"`
    KeyID     string `json:"key_id"`
}

// Database schema with encrypted fields
CREATE TABLE members (
    id SERIAL PRIMARY KEY,
    club_id INTEGER NOT NULL,
    member_number VARCHAR(50) NOT NULL,

    -- Encrypted PII fields
    first_name_encrypted TEXT,
    last_name_encrypted TEXT,
    email_encrypted TEXT,
    phone_encrypted TEXT,
    ssn_encrypted TEXT,

    -- Non-sensitive fields
    membership_type membership_type_enum DEFAULT 'REGULAR',
    status member_status_enum DEFAULT 'ACTIVE',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
```

## Security Monitoring & Auditing

### Security Event Logging

**Audit Trail Implementation**:
```go
type SecurityEvent struct {
    ID            string                 `json:"id"`
    Type          SecurityEventType      `json:"type"`
    UserID        string                 `json:"user_id"`
    ClubID        string                 `json:"club_id"`
    IPAddress     string                 `json:"ip_address"`
    UserAgent     string                 `json:"user_agent"`
    Resource      string                 `json:"resource"`
    Action        string                 `json:"action"`
    Result        string                 `json:"result"`
    Risk          RiskLevel              `json:"risk_level"`
    Metadata      map[string]interface{} `json:"metadata"`
    Timestamp     time.Time              `json:"timestamp"`
    BlockchainTxID string                `json:"blockchain_tx_id,omitempty"`
}

type SecurityEventType string
const (
    LOGIN_ATTEMPT SecurityEventType = "login_attempt"
    LOGIN_SUCCESS SecurityEventType = "login_success"
    LOGIN_FAILURE SecurityEventType = "login_failure"
    PASSWORD_CHANGE SecurityEventType = "password_change"
    MFA_ENABLED SecurityEventType = "mfa_enabled"
    PERMISSION_DENIED SecurityEventType = "permission_denied"
    DATA_ACCESS SecurityEventType = "data_access"
    SENSITIVE_OPERATION SecurityEventType = "sensitive_operation"
)
```

### Threat Detection

**Anomaly Detection Rules**:
```yaml
Risk Detection:
  suspicious_activity:
    - Multiple failed login attempts (>5 in 15 minutes)
    - Login from unusual location/device
    - Access to sensitive data outside business hours
    - Bulk data operations by non-admin users

  automatic_responses:
    - Account temporary lockout
    - MFA challenge requirement
    - Administrator notification
    - Session termination

  monitoring_thresholds:
    - Login failure rate > 10% (5-minute window)
    - API error rate > 5% (1-minute window)
    - Response time > 2s (95th percentile)
    - Concurrent sessions per user > 3
```

## API Security Controls

### Rate Limiting

**Multi-Tier Rate Limiting**:
```yaml
Rate Limits:
  anonymous_users:
    requests_per_minute: 100
    burst: 20

  authenticated_users:
    requests_per_minute: 1000
    burst: 100

  premium_users:
    requests_per_minute: 5000
    burst: 500

  admin_users:
    requests_per_minute: 10000
    burst: 1000

# GraphQL specific limits
graphql_limits:
  query_depth: 10
  query_complexity: 1000
  introspection: false # disabled in production
```

### Input Validation & Sanitization

```go
// Comprehensive input validation
type ValidationRules struct {
    Email     *regexp.Regexp `json:"email"`
    Phone     *regexp.Regexp `json:"phone"`
    Name      *regexp.Regexp `json:"name"`
    Password  PasswordPolicy `json:"password"`
}

type PasswordPolicy struct {
    MinLength      int  `json:"min_length"`
    RequireUpper   bool `json:"require_upper"`
    RequireLower   bool `json:"require_lower"`
    RequireDigits  bool `json:"require_digits"`
    RequireSpecial bool `json:"require_special"`
    MaxAge         int  `json:"max_age_days"`
}

// SQL injection prevention with parameterized queries
func GetMemberByID(db *sql.DB, id string) (*Member, error) {
    query := `
        SELECT id, club_id, member_number, status, created_at
        FROM members
        WHERE id = $1 AND club_id = $2
    `
    var member Member
    err := db.QueryRow(query, id, getCurrentClubID()).Scan(
        &member.ID, &member.ClubID, &member.MemberNumber,
        &member.Status, &member.CreatedAt,
    )
    return &member, err
}
```

## Production Security Checklist

### Deployment Security

```yaml
Infrastructure Security:
  - ✅ WAF (Web Application Firewall) configured
  - ✅ DDoS protection enabled
  - ✅ Network segmentation implemented
  - ✅ VPN access for administration
  - ✅ Intrusion detection system active

Application Security:
  - ✅ Security headers configured (HSTS, CSP, etc.)
  - ✅ CORS policies restrictive
  - ✅ Input validation comprehensive
  - ✅ Output encoding implemented
  - ✅ Error messages sanitized

Data Security:
  - ✅ Encryption at rest and in transit
  - ✅ Database access controls
  - ✅ Backup encryption
  - ✅ Data retention policies
  - ✅ GDPR compliance measures

Operational Security:
  - ✅ Security monitoring active
  - ✅ Incident response plan documented
  - ✅ Regular security assessments
  - ✅ Vulnerability management process
  - ✅ Security training completed
```

### Compliance & Regulations

**Regulatory Compliance**:
- **GDPR**: Data protection and privacy rights
- **CCPA**: California Consumer Privacy Act compliance
- **SOC 2**: Security and availability controls
- **PCI DSS**: Payment card industry standards (if handling payments)
- **ISO 27001**: Information security management

## Security Best Practices

### Development Guidelines

```yaml
Secure Coding Practices:
  authentication:
    - Never store passwords in plain text
    - Use strong password hashing (bcrypt, Argon2)
    - Implement proper session management
    - Validate all JWT tokens properly

  authorization:
    - Implement least privilege principle
    - Use role-based access control
    - Validate permissions on every request
    - Implement tenant isolation properly

  data_handling:
    - Encrypt sensitive data at rest
    - Use parameterized queries
    - Sanitize all user inputs
    - Implement proper error handling

  api_security:
    - Use HTTPS everywhere
    - Implement rate limiting
    - Validate Content-Type headers
    - Set security headers properly
```

## Next Steps

1. **Implement**: [GraphQL Integration](./GRAPHQL_INTEGRATION.md) for API authentication
2. **Build**: [Flutter Integration](./FLUTTER_INTEGRATION.md) for client security
3. **Deploy**: [Testing & Deployment](./TESTING_DEPLOYMENT.md) for security validation
4. **Monitor**: [Backend Architecture](./BACKEND_ARCHITECTURE.md) for system security