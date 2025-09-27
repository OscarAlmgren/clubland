# Clubland: Premium Reciprocal Clubs Flutter Application

## Executive Summary

**Clubland** is a sophisticated Flutter-based mobile and web application that connects premium private club members through a blockchain-powered reciprocal network. The platform enables members to discover, visit, and enjoy reciprocal privileges at partner clubs worldwide while maintaining secure, verifiable records of all interactions on Hyperledger Fabric blockchain.

### Key Value Propositions

- **Global Access**: Seamless reciprocal privileges across premium private clubs worldwide
- **Blockchain Security**: Immutable visit verification and audit trails via Hyperledger Fabric
- **Passwordless Authentication**: Modern WebAuthn/passkey integration via Hanko
- **Real-time Experience**: Live updates, social features, and instant notifications
- **Enterprise-grade**: Multi-tenant architecture supporting multiple club networks

## Quick Start

### Prerequisites

- **Flutter SDK**: 3.16.0+
- **Dart SDK**: 3.9.2+
- **Development Tools**: Android Studio, Xcode (for iOS), VS Code

### Installation

1. **Clone the repository**:

   ```bash
   git clone https://github.com/your-org/clubland.git
   cd clubland
   ```

2. **Install dependencies**:

   ```bash
   flutter pub get
   ```

3. **Generate code**:

   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

4. **Run the application**:

   ```bash
   # Production mode
   flutter run

   # With simplified main
   flutter run --target lib/simple_main.dart
   ```

### Development Commands

```bash
# Essential Development
flutter run                    # Run the app
flutter test                   # Run all tests
flutter analyze               # Analyze code quality
dart format .                 # Format code

# Code Generation
dart run build_runner build --delete-conflicting-outputs
dart run build_runner watch --delete-conflicting-outputs

# Building
flutter build apk            # Android APK
flutter build appbundle      # Android Bundle
flutter build ios           # iOS
flutter build web           # Web
```

## System Architecture

### High-Level Architecture

```text
┌─────────────────────────────────────────────────────────────────────┐
│                        Client Applications                          │
│  ┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐  │
│  │  Clubland App   │    │ Administrator   │    │   Web Portal    │  │
│  │   (Flutter)     │    │  App (Flutter)  │    │   (Flutter)     │  │
│  └─────────────────┘    └─────────────────┘    └─────────────────┘  │
└─────────────────┬───────────────┬───────────────┬─────────────────────┘
                  │               │               │
           GraphQL/WebSocket Connections over HTTPS
                  │               │               │
┌─────────────────▼───────────────▼───────────────▼─────────────────────┐
│                        API Gateway Layer                              │
│  ┌─────────────────────────────────────────────────────────────────┐  │
│  │  GraphQL Schema Stitching • Authentication • Rate Limiting     │  │
│  │  Real-time Subscriptions • Request/Response Transformation     │  │
│  └─────────────────────────────────────────────────────────────────┘  │
└─────────────────┬───────────────────────────────────────────────────────┘
                  │ gRPC Inter-service Communication
┌─────────────────▼───────────────────────────────────────────────────────┐
│                    Microservices Ecosystem                             │
│  ┌─────────────┐ ┌─────────────┐ ┌─────────────┐ ┌─────────────┐        │
│  │    Auth     │ │   Member    │ │    Club     │ │ Reciprocal  │        │
│  │   Service   │ │   Service   │ │   Service   │ │   Service   │        │
│  └─────────────┘ └─────────────┘ └─────────────┘ └─────────────┘        │
│  ┌─────────────┐ ┌─────────────┐ ┌─────────────┐ ┌─────────────┐        │
│  │    Visit    │ │ Blockchain  │ │ Analytics   │ │ Governance  │        │
│  │   Service   │ │   Service   │ │   Service   │ │   Service   │        │
│  └─────────────┘ └─────────────┘ └─────────────┘ └─────────────┘        │
└─────────────────────────────────────────────────────────────────────────┘
```

### Technology Stack

**Frontend (Flutter)**:

- **Framework**: Flutter 3.x with Dart 3.x
- **State Management**: Riverpod with AsyncNotifier pattern
- **Routing**: Go Router for declarative navigation
- **HTTP Client**: GraphQL Flutter with type-safe code generation
- **Local Storage**: Hive for offline-first architecture
- **Authentication**: Local biometric authentication with secure storage
- **Internationalization**: Multi-language support (English/Swedish) with ARB files
- **Real-time**: WebSocket subscriptions with auto-reconnection

**Backend Services**:

- **Language**: Go 1.25+ with modern concurrency patterns
- **API Gateway**: GraphQL with gqlgen schema-first development
- **Database**: PostgreSQL 15+ with multi-tenant row-level security
- **Caching**: Redis clusters for sessions and performance
- **Messaging**: NATS JetStream for event-driven architecture
- **Blockchain**: Hyperledger Fabric for immutable audit trails

## Project Structure

```text
lib/
├── main.dart                           # Main entry point
├── simple_main.dart                    # Simplified entry point
├── app/
│   ├── app.dart                        # Main app configuration
│   ├── router/
│   │   ├── app_router.dart             # Go Router configuration
│   │   └── route_paths.dart            # Route constants
│   └── themes/
│       ├── app_theme.dart              # Theme configuration
│       ├── colors.dart                 # Color scheme
│       └── text_styles.dart            # Typography
├── core/
│   ├── constants/
│   ├── errors/                         # Error handling framework
│   ├── network/                        # GraphQL client setup
│   ├── storage/                        # Local storage & caching
│   └── utils/
├── features/
│   ├── auth/                           # Authentication & security
│   ├── clubs/                          # Club discovery & details
│   ├── bookings/                       # Reservation management
│   ├── visits/                         # Visit tracking & history
│   ├── social/                         # Social features & feed
│   ├── travel/                         # Trip planning
│   ├── profile/                        # User profile & settings
│   └── home/                           # Home screen & dashboard
├── shared/
│   ├── widgets/                        # Reusable UI components
│   ├── models/                         # Shared data models
│   └── services/                       # Shared services
├── generated/                          # Generated code (GraphQL, l10n)
│   └── l10n/                          # Generated localization code
└── l10n/                              # Internationalization (ARB files)
    ├── intl_en.arb                    # English translations
    └── intl_sv.arb                    # Swedish translations
```

## Backend Integration

### API Endpoints

- **Production**: `https://api.clubland.com/graphql`
- **Staging**: `https://staging-api.clubland.com/graphql`
- **Development**: `https://dev-api.clubland.com/graphql`
- **WebSocket**: `wss://api.clubland.com/graphql` (real-time subscriptions)

### GraphQL Integration

The application uses type-safe GraphQL integration with code generation:

```yaml
# GraphQL dependencies
dependencies:
  graphql_flutter: ^5.1.2
  gql: ^1.0.1

dev_dependencies:
  graphql_codegen: ^1.1.1
  build_runner: ^2.4.7
```

**Key Operations**:

```graphql
# Authentication
query Me {
  me {
    id email firstName lastName
    clubMembership { club { name } memberNumber tier }
  }
}

# Club Discovery
query SearchClubs($location: LocationInput!, $radius: Int!) {
  searchClubs(location: $location, radius: $radius) {
    id name description location { address }
    reciprocalAccess { type fees }
  }
}

# Real-time Updates
subscription VisitUpdates {
  visitStatusChanged {
    id status club { name }
  }
}
```

### Authentication Architecture

**Security Features**:

- **Primary**: Local biometric authentication (Face ID, Touch ID, Windows Hello)
- **Encryption**: Custom encryption service for sensitive data
- **Storage**: FlutterSecureStorage for tokens and credentials
- **Session**: Secure session management with encrypted local data

**Authentication Flow**:

1. User initiates authentication
2. Biometric/PIN verification required
3. Encrypted credentials retrieved from secure storage
4. Session established with encrypted local data
5. App maintains secure session state

## Key Features

### 1. Member Authentication

- Biometric authentication (Face ID, Touch ID, Windows Hello)
- Secure credential storage with encryption
- Session management with automatic renewal
- Multi-factor authentication support

### 2. Club Discovery & Booking

- Location-based club search with GPS integration
- Reciprocal access verification and privileges
- Real-time availability checking
- Seamless reservation management with QR codes

### 3. Self-Service Check-in

- GPS geofencing for automatic club detection
- QR code scanning for instant access
- Digital access badges with permissions
- Blockchain-verified visit records

### 4. Social Features

- Visit reviews and photo sharing
- Social activity feed with friend connections
- Achievement system with points and badges
- Recommendation engine for clubs and activities

### 5. Travel Planning

- AI-powered destination recommendations
- Compatible companion matching
- Multi-club itinerary planning
- Integrated booking and confirmation management

### 6. Internationalization

- **Multi-language Support**: English and Swedish with 80+ translation keys
- **Real-time Language Switching**: Instant language changes without app restart
- **System Locale Detection**: Automatic fallback to device language if supported
- **Persistent Preferences**: Language selection saved across app sessions
- **Type-safe Translations**: Generated S.dart class for compile-time safety

## Development Workflow

### Code Generation

1. **Update GraphQL schemas** in `lib/schema/`
2. **Run code generation**:

   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

3. **Update data models** if schema changes affect types
4. **Update tests** to reflect changes

### Feature Development

1. **Create feature branch** from main
2. **Implement following Clean Architecture layers**: Domain → Data → Presentation
3. **Write tests** for each layer
4. **Generate code** if needed
5. **Test on multiple platforms**
6. **Submit PR** with comprehensive tests

### Testing Strategy

```bash
# Run all tests
flutter test

# Run specific test suites
flutter test test/unit/
flutter test test/widget/
flutter test integration_test/

# Run with coverage
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
```

**Test Coverage Goals**:

- **Unit Tests**: 80%+ coverage for business logic
- **Widget Tests**: 70%+ coverage for critical components
- **Integration Tests**: 100% coverage of core user journeys

## Environment Configuration

The application uses environment-aware configuration:

```dart
// Environment detection and validation
EnvironmentConfig.initialize();
EnvironmentConfig.validateConfig();

// Configuration management
class EnvironmentConfig {
  static Environment get currentEnvironment => _environment;
  static String get apiUrl => _config.apiUrl;
  static String get wsUrl => _config.wsUrl;
}
```

**Environment Variables**:

- `ENVIRONMENT`: Current environment (development/staging/production)
- `API_URL`: Backend GraphQL endpoint
- `WS_URL`: WebSocket endpoint for real-time features

## Security Considerations

### Data Protection

- **Encryption**: All sensitive data encrypted at rest using AES-256
- **Secure Storage**: FlutterSecureStorage for tokens and credentials
- **Biometric Auth**: Required for sensitive operations
- **Network Security**: Certificate pinning and TLS 1.3

### Privacy Controls

- **Location**: Granular location sharing settings
- **Activity**: User-controlled visibility settings
- **Data Export**: GDPR-compliant data export/deletion
- **Analytics**: Privacy-respecting usage analytics with opt-out

## Performance Optimization

### Target Metrics

- **App Launch Time**: < 2 seconds
- **Search Results**: < 1.5 seconds
- **Image Loading**: Progressive with multi-layer caching
- **Battery Usage**: Optimized background processing

### Optimization Strategies

- **Lazy Loading**: Data loaded on demand
- **Image Caching**: Multi-layer cache with CDN integration
- **Code Splitting**: Dynamic imports for large features
- **Bundle Optimization**: Tree shaking and minification

## Monitoring & Analytics

### Error Tracking

- **Crashes**: Comprehensive crash reporting
- **Performance**: Real-time performance monitoring
- **User Analytics**: Privacy-respecting usage analytics

### Logging Strategy

- **Development**: Verbose logging for debugging
- **Production**: Error and warning logs only
- **Sensitive Data**: Never log tokens, passwords, or PII

## Backend System Status

The backend infrastructure is **89% production-ready** with comprehensive microservices:

- ✅ **Member Service** (100%): Complete CRUD operations with 25+ metrics
- ✅ **Analytics Service** (100%): Full ML and external integrations
- ✅ **API Gateway** (95%): GraphQL with advanced security
- ✅ **Reciprocal Service** (95%): Agreement management with blockchain
- ✅ **Blockchain Service** (95%): Hyperledger Fabric integration
- ✅ **Notification Service** (95%): Multi-channel notifications
- ✅ **Governance Service** (95%): Voting and proposal systems
- 🟡 **Auth Service** (90%): Core complete, advanced features in progress

## Documentation

### Backend Integration Guides

- **[Backend Integration Guide](./docs/BACKEND_INTEGRATION_GUIDE.md)**: Master guide for backend integration
- **[Backend Architecture](./docs/BACKEND_ARCHITECTURE.md)**: System architecture and microservices
- **[GraphQL Integration](./docs/GRAPHQL_INTEGRATION.md)**: API reference and client patterns
- **[Authentication & Security](./docs/AUTHENTICATION_SECURITY.md)**: Security architecture and auth flows

### Development Resources

- **[CLAUDE.md](./CLAUDE.md)**: Claude Code development guide
- **Architecture Decision Records**: Located in `docs/decisions/`
- **API Documentation**: Auto-generated from GraphQL schema
- **Component Storybook**: UI component documentation

## Deployment

### Build Commands

```bash
# Development builds
flutter build apk --debug
flutter build ios --debug

# Production builds
flutter build appbundle --release
flutter build ipa --release
flutter build web --release
```

### Container Deployment

```dockerfile
# Multi-stage Flutter web build
FROM ghcr.io/cirruslabs/flutter:stable AS builder
WORKDIR /app
COPY . .
RUN flutter pub get
RUN flutter build web --release

FROM nginx:alpine
COPY --from=builder /app/build/web /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```

## Contributing

### Development Setup

1. **Install Flutter SDK** 3.16.0+
2. **Clone repository** and install dependencies
3. **Set up environment variables** for development
4. **Run code generation** for GraphQL and models
5. **Run tests** to verify setup

### Code Standards

- **Linting**: `flutter analyze` must pass without warnings
- **Formatting**: `dart format .` for consistent code style
- **Testing**: Minimum 80% test coverage for new code
- **Documentation**: All public APIs must be documented

### Pull Request Process

1. **Create feature branch** from `main`
2. **Implement feature** following clean architecture
3. **Add comprehensive tests** (unit, widget, integration)
4. **Update documentation** if needed
5. **Ensure all checks pass** (tests, linting, formatting)
6. **Submit PR** with clear description and testing notes

## Troubleshooting

### Common Issues

- **Build Failures**: Run `flutter clean` and regenerate code
- **GraphQL Errors**: Check schema files and regenerate types
- **Authentication Issues**: Verify encryption service and secure storage configuration
- **Performance Issues**: Use Flutter Inspector and profiling tools

### Debug Tools

- **Flutter Inspector**: Widget tree and performance analysis
- **DevTools**: Memory, network, and performance profiling
- **GraphQL Playground**: Test API queries directly (development only)
- **State Management**: Riverpod inspector for state debugging

## Support & Community

- **Issues**: Report bugs and feature requests via GitHub Issues
- **Discussions**: Technical discussions via GitHub Discussions
- **Documentation**: Comprehensive guides in `docs/` directory
- **API Reference**: GraphQL schema documentation

## License

This project is proprietary software. All rights reserved.

---

**Clubland** represents the future of premium club networking, combining cutting-edge technology with exceptional user experience to create meaningful connections across the global network of reciprocal clubs.

For technical questions, please refer to the [Backend Integration Guide](./docs/BACKEND_INTEGRATION_GUIDE.md) or contact the development team.
