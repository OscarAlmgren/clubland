# Backend Quick Start Guide

Get connected to the Clubland backend in under 10 minutes.

## Overview

This guide covers the essential steps to connect your Flutter app to the Clubland backend GraphQL API. For detailed API operations and advanced features, see [BACKEND_INTEGRATION_GUIDE.md](./BACKEND_INTEGRATION_GUIDE.md).

## Prerequisites

### Required Tools

```bash
# Verify Flutter installation
flutter --version  # Requires 3.37.0+ (beta)

# Verify Dart installation
dart --version     # Requires 3.10.0+

# Install dependencies
flutter pub get
```

### Backend Environments

| Environment | GraphQL Endpoint | WebSocket | Status |
|-------------|------------------|-----------|--------|
| **Development** | `http://192.168.0.170:30080/graphql` | `ws://192.168.0.170:30080/graphql` | Local Network |
| **Staging** | `https://staging-api.clubland.com/graphql` | `wss://staging-api.clubland.com/graphql` | Cloud |
| **Production** | `https://api.clubland.com/graphql` | `wss://api.clubland.com/graphql` | Cloud |

## Network Setup

### Local Development (Henrybook Server)

**Critical: All devices must be on the same WiFi network**

1. **Verify Server Connectivity**

```bash
# Test server availability
ping 192.168.0.170

# Check health endpoint
curl http://192.168.0.170:30080/health
```

Expected response:
```json
{
  "status": "healthy",
  "timestamp": "2025-11-12T10:00:00Z",
  "version": "v0.1.1",
  "services": {
    "database": "healthy",
    "redis": "healthy",
    "nats": "healthy"
  }
}
```

2. **Test GraphQL Endpoint**

```bash
# Simple GraphQL query test
curl -X POST http://192.168.0.170:30080/graphql \
  -H "Content-Type: application/json" \
  -d '{"query":"{ __typename }"}'
```

Expected response:
```json
{
  "data": {
    "__typename": "Query"
  }
}
```

3. **Access GraphiQL Playground** (Development Only)

Open in browser:
```
http://192.168.0.170:30080/graphql
```

Test a sample query:
```graphql
query TestConnection {
  __type(name: "Query") {
    name
    fields {
      name
    }
  }
}
```

## GraphQL Client Configuration

### 1. Environment Configuration

Your app is pre-configured in `lib/core/config/environment_config.dart`:

```dart
// Default configuration points to Henrybook server
static String get apiBaseUrl => const String.fromEnvironment(
  'API_BASE_URL',
  defaultValue: 'http://192.168.0.170:30080',
);

static String get graphqlEndpoint => const String.fromEnvironment(
  'GRAPHQL_ENDPOINT',
  defaultValue: 'http://192.168.0.170:30080/graphql',
);
```

**Override for different environments:**

```bash
# Staging
flutter run --dart-define=ENVIRONMENT=staging \
  --dart-define=API_BASE_URL=https://staging-api.clubland.com

# Production
flutter run --dart-define=ENVIRONMENT=production \
  --dart-define=API_BASE_URL=https://api.clubland.com
```

### 2. GraphQL Client Setup

The GraphQL client is configured in `lib/core/network/graphql_client.dart`:

```dart
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:clubland/core/config/environment_config.dart';

// Initialize GraphQL client
final GraphQLClient graphQLClient = GraphQLClient(
  link: HttpLink(
    EnvironmentConfig.graphqlEndpoint,
    defaultHeaders: {
      'Content-Type': 'application/json',
    },
  ),
  cache: GraphQLCache(store: InMemoryStore()),
);
```

### 3. Type-Safe GraphQL Operations

The app uses `graphql_codegen` for type-safe GraphQL operations:

**GraphQL Operation File** (`lib/graphql/auth/login.graphql`):
```graphql
mutation Login($email: String!, $password: String!) {
  login(input: { email: $email, password: $password }) {
    token
    refreshToken
    user {
      id
      email
      firstName
      lastName
    }
    expiresAt
  }
}
```

**Generated Code Usage**:
```dart
import 'package:clubland/core/graphql/graphql_api.dart';

// Execute mutation with type-safe variables
final result = await client.mutate(
  MutationOptions(
    document: documentNodeMutationLogin,
    variables: Variables$Mutation$Login(
      email: 'user@example.com',
      password: 'secure_password',
    ).toJson(),
  ),
);

// Type-safe response parsing
if (!result.hasException) {
  final data = Mutation$Login.fromJson(result.data!);
  final token = data.login.token;
  final user = data.login.user;
  print('Logged in as: ${user.firstName} ${user.lastName}');
}
```

### 4. Authentication Headers

For authenticated requests, add JWT token to headers:

```dart
import 'package:graphql_flutter/graphql_flutter.dart';

final authLink = AuthLink(
  getToken: () async {
    final token = await secureStorage.read(key: 'auth_token');
    return token != null ? 'Bearer $token' : null;
  },
);

final link = authLink.concat(httpLink);

final client = GraphQLClient(
  link: link,
  cache: GraphQLCache(store: InMemoryStore()),
);
```

## Health Checks

### Verify Backend Connectivity

**1. Health Check Endpoint**

```bash
curl http://192.168.0.170:30080/health
```

**2. GraphQL Schema Introspection**

```bash
curl -X POST http://192.168.0.170:30080/graphql \
  -H "Content-Type: application/json" \
  -d '{"query":"{ __schema { queryType { name } } }"}'
```

**3. Test Authentication**

```bash
curl -X POST http://192.168.0.170:30080/graphql \
  -H "Content-Type: application/json" \
  -d '{
    "query": "mutation { login(input: { email: \"test@example.com\", password: \"test123\" }) { token user { id email } } }"
  }'
```

### In-App Health Check

Add a health check in your app:

```dart
Future<bool> checkBackendHealth() async {
  try {
    final result = await client.query(
      QueryOptions(
        document: gql('{ __typename }'),
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );
    return !result.hasException;
  } catch (e) {
    print('Backend health check failed: $e');
    return false;
  }
}
```

## Testing on Devices

### Physical Device Setup

**1. Enable USB Debugging (Android)**

- Settings → About phone → Tap "Build number" 7 times
- Settings → System → Developer options → Enable "USB debugging"

**2. Connect Device**

```bash
# Verify device connection
flutter devices

# Expected output:
# Pixel 8 (mobile) • 38131FDJH000R3 • android-arm64 • Android 14 (API 34)
```

**3. Deploy App**

```bash
# Clean build
flutter clean

# Get dependencies
flutter pub get

# Run on device (default: Henrybook server)
flutter run -d 38131FDJH000R3

# Or use device name
flutter run -d "Pixel 8"
```

### Testing Workflow

**Step 1: Verify Network Connection**

Both your device and Henrybook server must be on the same WiFi:

```bash
# From your computer
ping 192.168.0.170

# On device: Settings → WiFi → Check connected network
```

**Step 2: Deploy and Monitor**

```bash
# Deploy with live logs
flutter run -d "Pixel 8"

# In another terminal, watch detailed logs
flutter logs -d "Pixel 8"
```

**Step 3: Test Core Operations**

1. **Authentication**
   - Register a new user
   - Log in
   - Verify token storage

2. **Data Queries**
   - Fetch clubs list
   - View member profiles
   - Browse facilities

3. **Mutations**
   - Create a booking
   - Update user profile
   - Record a visit

4. **Real-time Updates**
   - Test WebSocket subscriptions
   - Verify notification delivery
   - Check live status updates

### iOS Device Setup

**1. Enable Developer Mode**

- Settings → Privacy & Security → Developer Mode → Enable

**2. Trust Developer Certificate**

```bash
# First deployment will prompt on device:
# "Trust Developer on this iPhone?" → Tap "Trust"
```

**3. Deploy**

```bash
# Connect iPhone via USB
flutter devices

# Deploy to iOS device
flutter run -d "iPhone 15 Pro"
```

### Hot Reload During Testing

While the app is running:

```bash
# Hot reload (preserves state)
# Press 'r' in terminal

# Hot restart (fresh state)
# Press 'R' in terminal

# Open DevTools
# Press 'v' in terminal

# Quit
# Press 'q' in terminal
```

## Troubleshooting

### Connection Timeout

**Symptoms**: App hangs on loading, "Network error" messages

**Solutions**:

1. **Verify WiFi connectivity**
   ```bash
   ping 192.168.0.170
   ```

2. **Check backend is running**
   ```bash
   curl http://192.168.0.170:30080/health
   ```

3. **Increase timeout values**
   ```bash
   flutter run --dart-define=CONNECT_TIMEOUT=30000 \
               --dart-define=RECEIVE_TIMEOUT=60000
   ```

4. **Check firewall settings**
   ```bash
   # Ensure port 30080 is accessible
   telnet 192.168.0.170 30080
   ```

### GraphQL Errors

**Symptoms**: "UNAUTHENTICATED", "FORBIDDEN", or empty responses

**Solutions**:

1. **Test in GraphiQL Playground**
   ```
   http://192.168.0.170:30080/graphql
   ```

2. **Verify authentication token**
   ```dart
   final token = await secureStorage.read(key: 'auth_token');
   print('Token: $token');
   ```

3. **Clear app data and reinstall**
   ```bash
   adb uninstall com.reciprocalclubs.clubland
   flutter run -d "Pixel 8"
   ```

4. **Check GraphQL operation syntax**
   ```bash
   # Regenerate GraphQL code
   dart run build_runner build --delete-conflicting-outputs
   ```

### WebSocket Subscription Failures

**Symptoms**: Real-time updates don't work, subscription errors in logs

**Solutions**:

1. **Test WebSocket endpoint**
   ```bash
   # Install wscat if needed: npm install -g wscat
   wscat -c ws://192.168.0.170:30080/graphql
   ```

2. **Verify WebSocket link configuration** in `graphql_client.dart`:
   ```dart
   final wsLink = WebSocketLink(
     'ws://192.168.0.170:30080/graphql',
     config: SocketClientConfig(
       autoReconnect: true,
       inactivityTimeout: const Duration(seconds: 30),
     ),
   );
   ```

3. **Check backend WebSocket support**
   ```bash
   # Verify API Gateway WebSocket configuration
   kubectl logs -n reciprocal-clubs deployment/api-gateway
   ```

### Code Generation Issues

**Symptoms**: "Undefined name", "Cannot resolve import" errors

**Solutions**:

```bash
# Full code regeneration
flutter clean
flutter pub get
dart run build_runner build --delete-conflicting-outputs

# If issues persist, delete generated files
find lib -name "*.g.dart" -delete
find lib -name "*.graphql.dart" -delete
dart run build_runner build --delete-conflicting-outputs
```

### Performance Issues

**Symptoms**: Slow responses, UI lag, high battery drain

**Solutions**:

1. **Use release build for performance testing**
   ```bash
   flutter build apk --release
   adb install build/app/outputs/flutter-apk/app-release.apk
   ```

2. **Check network latency**
   ```bash
   # Test GraphQL query performance
   time curl -X POST http://192.168.0.170:30080/graphql \
     -H "Content-Type: application/json" \
     -d '{"query":"{ __typename }"}'
   ```

3. **Monitor backend load**
   ```bash
   # Check server resource usage
   kubectl top pods -n reciprocal-clubs
   ```

4. **Enable Flutter performance overlay**
   ```dart
   MaterialApp(
     showPerformanceOverlay: true,
     // ...
   )
   ```

## Quick Commands Reference

### Development

```bash
# Run on device (default: Henrybook server)
flutter run -d "Pixel 8"

# Run with staging environment
flutter run --dart-define=ENVIRONMENT=staging

# Run with custom backend
flutter run --dart-define=API_BASE_URL=http://custom-server:8080

# Watch logs
flutter logs -d "Pixel 8"

# Hot reload (while running)
r

# Hot restart
R
```

### Code Generation

```bash
# Generate all code (GraphQL, Riverpod, i18n)
dart run build_runner build --delete-conflicting-outputs

# Watch mode for development
dart run build_runner watch --delete-conflicting-outputs

# i18n only
dart run intl_utils:generate
```

### Testing Backend

```bash
# Health check
curl http://192.168.0.170:30080/health

# GraphQL playground
open http://192.168.0.170:30080/graphql

# Test query
curl -X POST http://192.168.0.170:30080/graphql \
  -H "Content-Type: application/json" \
  -d '{"query":"{ __typename }"}'

# Check network connectivity
ping 192.168.0.170
telnet 192.168.0.170 30080
```

### Device Management

```bash
# List connected devices
flutter devices
adb devices

# Install APK
adb install build/app/outputs/flutter-apk/app-release.apk

# Uninstall app
adb uninstall com.reciprocalclubs.clubland

# View device logs
adb logcat -s flutter

# Clear app data
adb shell pm clear com.reciprocalclubs.clubland
```

## Performance Expectations

**Local Network (Henrybook Server)**

| Operation | Target Latency | Notes |
|-----------|----------------|-------|
| Health Check | < 50ms | Simple HTTP request |
| GraphQL Query | < 500ms | Average query with joins |
| Mutation | < 1s | Including database writes |
| Subscription | < 100ms | Real-time WebSocket latency |
| App Launch | < 2s | Cold start on device |

**Cloud Deployment**

| Operation | Target Latency | Notes |
|-----------|----------------|-------|
| Health Check | < 200ms | Include CDN latency |
| GraphQL Query | < 1s | Network + processing |
| Mutation | < 2s | Network + database writes |
| Subscription | < 500ms | WebSocket over internet |

## Next Steps

### For API Operations

See [BACKEND_INTEGRATION_GUIDE.md](./BACKEND_INTEGRATION_GUIDE.md) for:
- Complete GraphQL schema reference
- All available queries, mutations, and subscriptions
- Authentication and authorization patterns
- Error handling strategies
- Pagination and filtering
- Real-time subscriptions
- Performance optimization

### For Architecture Details

See [BACKEND_ARCHITECTURE.md](./BACKEND_ARCHITECTURE.md) for:
- Service architecture overview
- Technology stack details
- Deployment strategies
- Monitoring and observability
- Security architecture

### For Advanced Topics

- [AUTHENTICATION_SECURITY.md](./AUTHENTICATION_SECURITY.md) - JWT handling, biometric auth
- [TESTING_DEPLOYMENT.md](./TESTING_DEPLOYMENT.md) - CI/CD, production deployment
- [FLUTTER_INTEGRATION.md](./FLUTTER_INTEGRATION.md) - Advanced Flutter patterns

## Summary

You're now ready to develop with the Clubland backend! Here's what you've set up:

- GraphQL client configured for Henrybook server
- Type-safe GraphQL operations with code generation
- Authentication with JWT tokens
- Real-time updates via WebSocket subscriptions
- Health checks and monitoring
- Device testing workflow

**Quick Start Command:**
```bash
flutter run -d "Pixel 8"
```

Your app will automatically connect to `http://192.168.0.170:30080/graphql` and you can start testing immediately!

For questions or issues, refer to the comprehensive documentation or check the troubleshooting section above.
