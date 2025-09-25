# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Clubland is a premium End User Flutter application for the Reciprocal Clubs platform. It provides passwordless authentication, club discovery, booking management, social features, and real-time visit tracking across mobile, web, and desktop platforms.

## Development Commands

### Essential Commands
- **Run the app (production)**: `flutter run`
- **Run with simple main**: `flutter run --target lib/simple_main.dart`
- **Hot reload**: Press `r` in the terminal while app is running
- **Hot restart**: Press `R` in the terminal while app is running
- **Run on specific platform**: `flutter run -d <device_id>`

### Code Generation
- **Generate all code**: `dart run build_runner build --delete-conflicting-outputs`
- **Watch for changes**: `dart run build_runner watch --delete-conflicting-outputs`
- **Clean generated files**: `dart run build_runner clean`
- **Generate GraphQL code only**: `flutter packages pub run graphql_codegen`

### Building
- **Build Android APK**: `flutter build apk`
- **Build Android Bundle**: `flutter build appbundle`
- **Build iOS**: `flutter build ios`
- **Build web**: `flutter build web`

### Testing and Quality
- **Run all tests**: `flutter test`
- **Run unit tests**: `flutter test test/unit/`
- **Run widget tests**: `flutter test test/widget/`
- **Run integration tests**: `flutter test integration_test/`
- **Test with coverage**: `flutter test --coverage`
- **Analyze code**: `flutter analyze`
- **Format code**: `dart format .`
- **Check dependencies**: `flutter pub outdated`

### Package Management
- **Install dependencies**: `flutter pub get`
- **Upgrade dependencies**: `flutter pub upgrade`
- **Clean build cache**: `flutter clean`

## Project Architecture

This project follows Clean Architecture principles with feature-based organization:

### Core Architecture Layers
- **Presentation Layer**: UI widgets, controllers (Riverpod), and state management
- **Domain Layer**: Business logic, entities, and use cases
- **Data Layer**: Repositories, data sources (remote/local), and models

### State Management
- **Primary**: Riverpod with AsyncNotifier pattern
- **Code Generation**: riverpod_generator for type-safe providers
- **Global State**: App configuration, authentication, connectivity

### Data Architecture
- **API**: GraphQL with type-safe code generation
- **Authentication**: Hanko passwordless + JWT tokens
- **Local Storage**: Hive for offline-first architecture
- **Cache Strategy**: Multi-layer caching with TTL and invalidation

## Project Structure

```
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
│   │   ├── api_constants.dart          # API endpoints
│   │   ├── app_constants.dart          # App-wide constants
│   │   └── storage_keys.dart           # Local storage keys
│   ├── errors/
│   │   ├── exceptions.dart             # Custom exceptions
│   │   ├── failures.dart               # Failure classes
│   │   └── error_handler.dart          # Global error handling
│   ├── network/
│   │   ├── graphql_client.dart         # GraphQL client setup
│   │   ├── graphql_links.dart          # Auth, HTTP, WebSocket links
│   │   └── network_info.dart           # Connectivity checking
│   ├── storage/
│   │   ├── local_storage.dart          # Hive configuration
│   │   ├── secure_storage.dart         # Flutter Secure Storage
│   │   └── cache_manager.dart          # Caching strategies
│   └── utils/
│       ├── extensions.dart             # Dart extensions
│       ├── validators.dart             # Form validators
│       └── formatters.dart             # Data formatters
├── features/
│   ├── auth/
│   │   ├── data/
│   │   │   ├── models/                 # Data models
│   │   │   ├── repositories/           # Repository implementations
│   │   │   └── sources/                # Remote/local data sources
│   │   ├── domain/
│   │   │   ├── entities/               # Business entities
│   │   │   ├── repositories/           # Repository interfaces
│   │   │   └── usecases/               # Business use cases
│   │   └── presentation/
│   │       ├── controllers/            # Riverpod controllers
│   │       ├── pages/                  # Screen widgets
│   │       └── widgets/                # Feature-specific widgets
│   ├── clubs/                          # Club discovery & details
│   ├── bookings/                       # Reservation management
│   ├── visits/                         # Visit tracking & history
│   ├── social/                         # Social features & feed
│   ├── travel/                         # Trip planning
│   ├── profile/                        # User profile & settings
│   └── home/                           # Home screen & dashboard
├── shared/
│   ├── widgets/                        # Reusable UI components
│   │   ├── buttons/                    # Button variants
│   │   ├── cards/                      # Card layouts
│   │   ├── forms/                      # Form components
│   │   ├── loading/                    # Loading indicators
│   │   └── dialogs/                    # Modal dialogs
│   ├── models/                         # Shared data models
│   └── services/                       # Shared services
├── generated/                          # Generated code (GraphQL, etc.)
├── l10n/                              # Internationalization
└── schema/                            # GraphQL schema files
    ├── auth.graphql
    ├── clubs.graphql
    ├── bookings.graphql
    └── subscriptions.graphql
```

## Key Dependencies

### Production Dependencies
- **State Management**: flutter_riverpod, riverpod_annotation
- **Navigation**: go_router
- **HTTP/GraphQL**: dio, graphql_flutter, gql
- **Authentication**: local_auth, flutter_secure_storage, crypto, encrypt
- **Local Storage**: hive, hive_flutter
- **UI/UX**: cached_network_image, lottie, shimmer
- **Maps**: google_maps_flutter, geolocator
- **Utils**: equatable, freezed_annotation, json_annotation

### Development Dependencies
- **Code Generation**: build_runner, freezed, json_serializable, hive_generator
- **GraphQL**: graphql_codegen
- **State Management**: riverpod_generator, riverpod_lint
- **Testing**: mocktail, integration_test, golden_toolkit, alchemist
- **Code Quality**: flutter_lints, very_good_analysis

## Authentication Architecture

### Security Architecture
- **Primary**: Local biometric authentication on mobile devices
- **Encryption**: Custom encryption service for sensitive data
- **Storage**: FlutterSecureStorage for tokens and credentials
- **Session Management**: Secure session management with encrypted storage

### Authentication Flow
1. User initiates authentication
2. Biometric/PIN verification required
3. Encrypted credentials retrieved from secure storage
4. Session established with encrypted local data
5. App maintains secure session state

## GraphQL Integration

### Schema Organization
- **auth.graphql**: Authentication mutations and queries
- **clubs.graphql**: Club discovery, details, and search
- **bookings.graphql**: Reservation management
- **visits.graphql**: Check-in/out and visit tracking
- **subscriptions.graphql**: Real-time updates

### Code Generation
The project uses GraphQL code generation to create type-safe Dart classes:
- Run `dart run build_runner build` after schema changes
- Generated files are in `lib/generated/`
- Never edit generated files manually

### Client Configuration
- **Authentication**: Automatic JWT token injection
- **Caching**: Optimistic updates with cache-first strategy
- **Subscriptions**: WebSocket for real-time features
- **Error Handling**: Comprehensive error categorization

## Testing Strategy

### Test Types
- **Unit Tests** (`test/unit/`): Business logic, repositories, use cases
- **Widget Tests** (`test/widget/`): UI components and interactions
- **Integration Tests** (`integration_test/`): End-to-end user flows

### Testing Patterns
- **Repository Testing**: Mock data sources, test business logic
- **Controller Testing**: Mock repositories, test state management
- **Widget Testing**: Test UI interactions and state changes
- **Golden Tests**: Visual regression testing for components

### Coverage Goals
- Unit tests: 80%+ coverage
- Widget tests: 70%+ coverage for critical components
- Integration tests: 100% coverage of core user journeys

## Development Workflow

### Code Generation Workflow
1. Update GraphQL schema files in `lib/schema/`
2. Run `dart run build_runner build --delete-conflicting-outputs`
3. Update data models if schema changes affect types
4. Update tests to reflect changes

### Feature Development
1. Create feature branch from main
2. Implement following Clean Architecture layers: Domain → Data → Presentation
3. Write tests for each layer
4. Generate code if needed
5. Test on multiple platforms
6. Submit PR with comprehensive tests

### Quality Checks
- **Pre-commit**: Format code, run fast tests
- **PR**: Full test suite, code coverage check
- **Deploy**: Integration tests, build verification

## Build Configuration

### Environment Configuration
The app uses environment configuration to manage different settings:
- **Environment Detection**: Automatic environment detection and validation
- **Configuration Management**: Centralized configuration with validation
- **Logging**: Environment-specific logging levels
- **Encryption**: Built-in encryption service initialization

## Performance Optimization

### Critical Performance Targets
- App launch time: < 2 seconds
- Search results: < 1.5 seconds
- Image loading: Progressive with caching
- Battery usage: Optimized background processing

### Optimization Strategies
- **Lazy Loading**: Load data on demand
- **Image Caching**: Multi-layer image cache
- **Code Splitting**: Dynamic imports for large features
- **Bundle Optimization**: Tree shaking and minification

## Security Considerations

### Data Protection
- **Encryption**: All sensitive data encrypted at rest
- **Secure Storage**: Use FlutterSecureStorage for tokens
- **Biometric Auth**: Required for sensitive operations
- **Network Security**: Certificate pinning, TLS 1.3

### Privacy Controls
- **Location**: Granular location sharing settings
- **Activity**: User-controlled visibility settings
- **Data Export**: GDPR-compliant data export/deletion
- **Analytics**: Opt-out capabilities

## Monitoring and Analytics

### Error Tracking
- **Crashes**: Firebase Crashlytics integration
- **Performance**: Firebase Performance monitoring
- **User Analytics**: Privacy-respecting usage analytics

### Logging Strategy
- **Development**: Verbose logging for debugging
- **Production**: Error and warning logs only
- **Sensitive Data**: Never log tokens, passwords, or PII

## Common Commands for Development

```bash
# Full development setup
flutter clean && flutter pub get && dart run build_runner build

# Run with hot reload (production)
flutter run

# Run tests with coverage
flutter test --coverage && genhtml coverage/lcov.info -o coverage/html

# Format and analyze
dart format . && flutter analyze

# Build for production
flutter build appbundle
```

## Troubleshooting

### Common Issues
- **Build failures**: Run `flutter clean` and regenerate code
- **GraphQL errors**: Check schema files and regenerate
- **Authentication issues**: Verify encryption service and secure storage configuration
- **Performance issues**: Use Flutter Inspector and profiling tools

### Debug Tools
- **Flutter Inspector**: Widget tree and performance analysis
- **DevTools**: Memory, network, and performance profiling
- **GraphQL Playground**: Test API queries directly
- **Redux DevTools**: State management debugging (via Riverpod)