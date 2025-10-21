# Reciprocal Clubs Backend - Flutter Integration Guide

**Backend Server**: henrybook (192.168.0.170)
**Deployment Status**: ✅ FULLY OPERATIONAL - All 8 Services Running
**Last Updated**: October 20, 2025

---

## Quick Start - API Access

### Base URLs

```dart
// HTTP/REST API
const String apiBaseUrl = 'http://192.168.0.170:30080';

// GraphQL API
const String graphqlUrl = 'http://192.168.0.170:30080/graphql';

// gRPC (if needed)
const String grpcUrl = '192.168.0.170:30090';
```

### Health Check Endpoint

```dart
// Test backend connectivity
GET http://192.168.0.170:30080/health

// Expected Response:
{
  "status": "healthy",
  "timestamp": "2025-10-20T12:00:00Z",
  "version": "v0.1.0-beta",
  "services": {
    "database": "healthy",
    "redis": "healthy",
    "nats": "healthy"
  }
}
```

---

## Available Services (8 Microservices)

### 1. API Gateway (Your Main Entry Point)
- **HTTP**: `http://192.168.0.170:30080`
- **GraphQL**: `http://192.168.0.170:30080/graphql`
- **gRPC**: `192.168.0.170:30090`
- **Purpose**: Single entry point for all backend operations
- **Features**: GraphQL API, REST endpoints, authentication, rate limiting

### 2. Authentication Service
- **Endpoint**: Via API Gateway
- **Features**: Passkey authentication (WebAuthn/FIDO2), JWT tokens, multi-tenant
- **Key Operations**: Login, register, token refresh, user management

### 3. Member Service
- **Endpoint**: Via API Gateway
- **Features**: Member profile management, club membership
- **Key Operations**: Create/update members, membership management, profile queries

### 4. Reciprocal Service
- **Endpoint**: Via API Gateway
- **Features**: Club agreements, visit management
- **Key Operations**: Create agreements, request/confirm visits, check-in/check-out, QR codes

### 5. Blockchain Service
- **Endpoint**: Via API Gateway
- **Features**: Hyperledger Fabric integration, immutable records
- **Key Operations**: Record transactions, query blockchain history

### 6. Notification Service
- **Endpoint**: Via API Gateway
- **Features**: Multi-channel notifications (email, SMS, push, in-app)
- **Key Operations**: Send notifications, manage preferences, templates

### 7. Analytics Service
- **Endpoint**: Via API Gateway
- **Features**: Usage analytics, reporting, dashboards
- **Key Operations**: Track events, generate reports, export data

### 8. Governance Service
- **Endpoint**: Via API Gateway
- **Features**: Proposals, voting, governance policies
- **Key Operations**: Create proposals, vote, manage policies

---

## API Integration Examples

### GraphQL Setup (Recommended)

```dart
// pubspec.yaml
dependencies:
  graphql_flutter: ^5.1.0

// graphql_client.dart
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLService {
  static final HttpLink httpLink = HttpLink(
    'http://192.168.0.170:30080/graphql',
  );

  static final AuthLink authLink = AuthLink(
    getToken: () async => 'Bearer ${await getStoredToken()}',
  );

  static final Link link = authLink.concat(httpLink);

  static final GraphQLClient client = GraphQLClient(
    cache: GraphQLCache(),
    link: link,
  );
}
```

### REST API Setup (Alternative)

```dart
// pubspec.yaml
dependencies:
  dio: ^5.4.0

// api_service.dart
import 'package:dio/dio.dart';

class ApiService {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://192.168.0.170:30080',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );

  // Add JWT token to requests
  static void setAuthToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  // Health check
  static Future<Map<String, dynamic>> checkHealth() async {
    final response = await _dio.get('/health');
    return response.data;
  }
}
```

---

## Authentication Flow

### 1. Register User

```dart
// GraphQL Mutation
const String registerMutation = '''
  mutation RegisterUser(\$input: RegisterInput!) {
    register(input: \$input) {
      user {
        id
        email
        clubId
        roles
      }
      accessToken
      refreshToken
    }
  }
''';

// Usage
final result = await GraphQLService.client.mutate(
  MutationOptions(
    document: gql(registerMutation),
    variables: {
      'input': {
        'email': 'user@example.com',
        'password': 'SecurePass123!',
        'clubId': 'club-uuid',
        'firstName': 'John',
        'lastName': 'Doe',
      }
    },
  ),
);
```

### 2. Login (Passkey Authentication)

```dart
// REST API Example
Future<Map<String, dynamic>> login(String email, String password) async {
  final response = await ApiService._dio.post(
    '/api/v1/auth/login',
    data: {
      'email': email,
      'password': password,
    },
  );

  // Store tokens
  final accessToken = response.data['accessToken'];
  final refreshToken = response.data['refreshToken'];

  await secureStorage.write(key: 'access_token', value: accessToken);
  await secureStorage.write(key: 'refresh_token', value: refreshToken);

  ApiService.setAuthToken(accessToken);

  return response.data;
}
```

### 3. Token Refresh

```dart
Future<void> refreshToken() async {
  final refreshToken = await secureStorage.read(key: 'refresh_token');

  final response = await ApiService._dio.post(
    '/api/v1/auth/refresh',
    data: {'refreshToken': refreshToken},
  );

  final newAccessToken = response.data['accessToken'];
  await secureStorage.write(key: 'access_token', value: newAccessToken);
  ApiService.setAuthToken(newAccessToken);
}
```

---

## Common GraphQL Operations

### Query Members

```dart
const String getMembersQuery = '''
  query GetMembers(\$clubId: ID!) {
    members(clubId: \$clubId) {
      id
      firstName
      lastName
      email
      membershipStatus
      joinedAt
    }
  }
''';
```

### Create Reciprocal Agreement

```dart
const String createAgreementMutation = '''
  mutation CreateAgreement(\$input: AgreementInput!) {
    createAgreement(input: \$input) {
      id
      initiatingClubId
      reciprocalClubId
      status
      terms
      createdAt
    }
  }
''';
```

### Request Visit

```dart
const String requestVisitMutation = '''
  mutation RequestVisit(\$input: VisitRequestInput!) {
    requestVisit(input: \$input) {
      id
      memberId
      hostClubId
      status
      visitDate
      qrCode
    }
  }
''';
```

---

## REST API Endpoints (Examples)

### Authentication
```
POST   /api/v1/auth/register
POST   /api/v1/auth/login
POST   /api/v1/auth/refresh
POST   /api/v1/auth/logout
GET    /api/v1/auth/me
```

### Members
```
GET    /api/v1/members?clubId={id}
POST   /api/v1/members
GET    /api/v1/members/{id}
PUT    /api/v1/members/{id}
DELETE /api/v1/members/{id}
```

### Reciprocal Agreements
```
GET    /api/v1/agreements?clubId={id}
POST   /api/v1/agreements
GET    /api/v1/agreements/{id}
PUT    /api/v1/agreements/{id}/approve
PUT    /api/v1/agreements/{id}/reject
```

### Visits
```
GET    /api/v1/visits?memberId={id}
POST   /api/v1/visits
GET    /api/v1/visits/{id}
PUT    /api/v1/visits/{id}/confirm
PUT    /api/v1/visits/{id}/check-in
PUT    /api/v1/visits/{id}/check-out
```

### Notifications
```
POST   /api/v1/notifications/send
GET    /api/v1/notifications?userId={id}
PUT    /api/v1/notifications/{id}/read
```

### Analytics
```
GET    /api/v1/analytics/events?clubId={id}
POST   /api/v1/analytics/track
GET    /api/v1/analytics/reports/usage
```

---

## Multi-Tenant Architecture

All API requests require `clubId` for tenant isolation:

```dart
// Example: Query data for specific club
final result = await GraphQLService.client.query(
  QueryOptions(
    document: gql(getMembersQuery),
    variables: {
      'clubId': 'club-uuid-123', // Required for tenant isolation
    },
  ),
);

// Headers (auto-added from JWT)
{
  'Authorization': 'Bearer eyJhbGc...',  // Contains clubId claim
  'X-Club-ID': 'club-uuid-123',          // Optional explicit header
}
```

---

## Error Handling

### GraphQL Errors

```dart
final result = await GraphQLService.client.query(queryOptions);

if (result.hasException) {
  // Handle GraphQL errors
  if (result.exception?.graphqlErrors != null) {
    for (var error in result.exception!.graphqlErrors) {
      print('GraphQL Error: ${error.message}');
      // Error codes: UNAUTHENTICATED, FORBIDDEN, NOT_FOUND, etc.
    }
  }

  // Handle network errors
  if (result.exception?.linkException != null) {
    print('Network Error: ${result.exception!.linkException}');
  }
}
```

### REST API Errors

```dart
try {
  final response = await ApiService._dio.get('/api/v1/members');
} on DioException catch (e) {
  if (e.response != null) {
    // Server error with response
    final statusCode = e.response?.statusCode;
    final message = e.response?.data['message'];

    switch (statusCode) {
      case 401:
        // Unauthorized - refresh token or re-login
        await refreshToken();
        break;
      case 403:
        // Forbidden - user lacks permissions
        showError('Access denied');
        break;
      case 404:
        // Not found
        showError('Resource not found');
        break;
      case 500:
        // Server error
        showError('Server error - please try again');
        break;
    }
  } else {
    // Network error (no response)
    showError('Network error - check connection');
  }
}
```

---

## Testing Connectivity

### Simple Connectivity Test

```dart
import 'package:dio/dio.dart';

Future<bool> testBackendConnection() async {
  try {
    final dio = Dio();
    final response = await dio.get(
      'http://192.168.0.170:30080/health',
      options: Options(
        sendTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
      ),
    );

    if (response.statusCode == 200 &&
        response.data['status'] == 'healthy') {
      print('✅ Backend connection successful');
      print('Services: ${response.data['services']}');
      return true;
    }

    return false;
  } catch (e) {
    print('❌ Backend connection failed: $e');
    return false;
  }
}

// Call in app initialization
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final isConnected = await testBackendConnection();
  if (!isConnected) {
    // Show error or offline mode
  }

  runApp(MyApp());
}
```

---

## Network Considerations

### Same Network Required
- Backend is on local network: `192.168.0.170`
- Flutter app must be on same network (WiFi) OR use VPN/port forwarding
- Not accessible from outside the local network (behind router firewall)

### Development Options

**Option 1: Same WiFi Network** (Easiest)
- Connect Flutter device to same WiFi as henrybook server
- Use IP: `192.168.0.170:30080`

**Option 2: Android Emulator** (Development)
- Use `10.0.2.2` to access host machine
- Requires port forwarding: `adb reverse tcp:30080 tcp:30080`

**Option 3: iOS Simulator** (Development)
- Simulators can access `localhost` or LAN IPs directly
- Use: `http://192.168.0.170:30080`

**Option 4: VPN/Tunneling** (Remote Access)
- Set up VPN to local network
- Or use ngrok/cloudflare tunnel for testing

---

## Example Flutter App Structure

```
lib/
├── services/
│   ├── api_service.dart          # REST API client
│   ├── graphql_service.dart      # GraphQL client
│   └── auth_service.dart         # Authentication logic
├── models/
│   ├── user.dart
│   ├── member.dart
│   ├── visit.dart
│   └── agreement.dart
├── screens/
│   ├── login_screen.dart
│   ├── member_list_screen.dart
│   ├── visit_request_screen.dart
│   └── agreement_screen.dart
└── main.dart
```

---

## Backend Service Status

```
✅ api-gateway              Running (0 restarts)
✅ auth-service             Running (0 restarts)
✅ member-service           Running (0 restarts)
✅ reciprocal-service       Running (0 restarts)
✅ blockchain-service       Running (0 restarts)
✅ notification-service     Running (0 restarts)
✅ analytics-service        Running (0 restarts)
✅ governance-service       Running (0 restarts)

Infrastructure:
✅ postgres                 Running
✅ redis                    Running
✅ nats                     Running

Blockchain:
✅ fabric-orderer           Running
✅ fabric-peer0             Running
✅ fabric-couchdb0          Running
```

**All 8 microservices + infrastructure fully operational with 0 restarts.**

---

## Troubleshooting

### Connection Issues

```dart
// Test 1: Can you reach the server?
ping 192.168.0.170

// Test 2: Check health endpoint
curl http://192.168.0.170:30080/health

// Test 3: In Flutter
final dio = Dio();
dio.options.connectTimeout = Duration(seconds: 10);
dio.options.receiveTimeout = Duration(seconds: 10);

try {
  final response = await dio.get('http://192.168.0.170:30080/health');
  print('Connected: ${response.data}');
} catch (e) {
  print('Connection failed: $e');
}
```

### Common Issues

**Problem**: Connection timeout
- **Solution**: Check WiFi network, verify IP address, check firewall

**Problem**: 401 Unauthorized
- **Solution**: Check JWT token, refresh token, or re-login

**Problem**: 403 Forbidden
- **Solution**: User lacks permissions, verify clubId and roles

**Problem**: Empty response / null data
- **Solution**: Check GraphQL query syntax, verify clubId parameter

---

## Additional Resources

- **GraphQL Playground**: `http://192.168.0.170:30080/graphql` (web interface)
- **API Documentation**: See backend README.md for full endpoint list
- **Backend Repository**: Contains all service documentation
- **Support**: Check logs via `kubectl logs -n reciprocal-clubs <pod-name>`

---

**Version**: 1.0
**Created**: October 20, 2025
**Backend Version**: v0.1.0-beta
**Compatible Flutter**: 3.0+

---

## Quick Test Checklist

- [ ] Can ping 192.168.0.170
- [ ] Health endpoint returns 200 OK
- [ ] Can create GraphQL client
- [ ] Can authenticate and get JWT token
- [ ] Can query members for a club
- [ ] Can create a visit request
- [ ] Error handling works correctly
- [ ] Token refresh works on 401

**Happy Coding!** 🚀
