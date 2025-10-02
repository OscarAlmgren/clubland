# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Clubland is a premium End User Flutter application for the Reciprocal Clubs platform. It provides passwordless authentication, club discovery, booking management, social features, and real-time visit tracking across mobile, web, and desktop platforms.

## Requirements

- **Flutter**: 3.37.0+ (beta channel for latest packages)
- **Dart**: 3.10.0+ (required for macro support)
- **SDK**: ^3.9.2 (minimum supported version)

## Development Commands

### Essential Commands

- **Run the app (production)**: `flutter run`
- **Run with simple main**: `flutter run --target lib/simple_main.dart`
- **Hot reload**: Press `r` in the terminal while app is running
- **Hot restart**: Press `R` in the terminal while app is running
- **Run on specific platform**: `flutter run -d <device_id>`
- **Run with environment**: `flutter run --dart-define=ENVIRONMENT=development`

### Code Generation

- **Generate all code**: `dart run build_runner build --delete-conflicting-outputs`
- **Watch for changes**: `dart run build_runner watch --delete-conflicting-outputs`
- **Clean generated files**: `dart run build_runner clean`
- **Generate internationalization**: `dart run intl_utils:generate`

### Building

- **Build Android APK**: `flutter build apk --release --dart-define=ENVIRONMENT=production`
- **Build Android Bundle**: `flutter build appbundle --release --dart-define=ENVIRONMENT=production`
- **Build iOS**: `flutter build ios --release --dart-define=ENVIRONMENT=production`
- **Build web**: `flutter build web --release --dart-define=ENVIRONMENT=production`

### Testing and Quality

- **Run all tests**: `flutter test`
- **Run unit tests**: `flutter test test/unit/`
- **Run widget tests**: `flutter test test/widget/`
- **Run integration tests**: `flutter test integration_test/`
- **Test with coverage**: `flutter test --coverage`
- **Generate coverage report**: `genhtml coverage/lcov.info -o coverage/html`
- **Analyze code**: `flutter analyze --fatal-infos --fatal-warnings`
- **Format code**: `dart format .`
- **Run custom lints**: `dart run custom_lint`
- **Check dependencies**: `flutter pub outdated`

### Package Management

- **Install dependencies**: `flutter pub get`
- **Upgrade dependencies**: `flutter pub upgrade`
- **Clean build cache**: `flutter clean`

### Code Generation (Riverpod & Drift)

- **Generate all code**: `dart run build_runner build --delete-conflicting-outputs`
- **Watch for changes**: `dart run build_runner watch --delete-conflicting-outputs`
- **Clean generated files**: `dart run build_runner clean`

### Storage Architecture

- **Simple Data**: SharedPreferences-based multi-prefix storage system using TypedLocalStorage
- **Structured Data**: Drift SQL database for complex queries and relationships
- **Secure Data**: Flutter Secure Storage for sensitive information
- **Storage Manager**: Centralized StorageManager class managing multiple storage prefixes:
  - User data, clubs, bookings, visits, social, cache, settings, offline data
  - Automatic initialization and cleanup
  - Size monitoring and batch operations

### Deployment

- **Deploy web to staging**: `./scripts/deploy.sh web staging`
- **Deploy web to production**: `./scripts/deploy.sh web production`
- **Build all platforms**: `./scripts/deploy.sh all production`
- **Setup GitHub secrets**: `./scripts/setup-secrets.sh`

## Project Architecture

This project follows Clean Architecture principles with feature-based organization:

### Core Architecture Layers

- **Presentation Layer**: UI widgets, controllers (Riverpod), and state management
- **Domain Layer**: Business logic, entities, and use cases
- **Data Layer**: Repositories, data sources (remote/local), and models

### Architecture Flow Diagram

```mermaid
graph TB
    subgraph "Presentation Layer"
        UI[UI Widgets]
        Controllers[Riverpod Controllers]
        Pages[Feature Pages]
        Widgets[Shared Widgets]
    end

    subgraph "Domain Layer"
        Entities[Business Entities]
        UseCases[Use Cases]
        Repositories[Repository Interfaces]
    end

    subgraph "Data Layer"
        RepoImpl[Repository Implementations]
        RemoteDS[Remote Data Sources]
        LocalDS[Local Data Sources]
        Models[Data Models]
    end

    subgraph "Core Services"
        Router[App Router]
        Auth[Authentication]
        Storage[Local Storage]
        Network[Network Client]
        I18n[Internationalization]
    end

    subgraph "External Services"
        GraphQL[GraphQL API]
        Firebase[Firebase Services]
        SecureStorage[Secure Storage]
        SharedPrefs[Shared Preferences]
    end

    UI --> Controllers
    Controllers --> UseCases
    UseCases --> Repositories
    Repositories --> RepoImpl
    RepoImpl --> RemoteDS
    RepoImpl --> LocalDS
    RemoteDS --> GraphQL
    LocalDS --> Storage
    Auth --> SecureStorage
    I18n --> SharedPrefs
    Router --> Pages
    Pages --> Widgets

    style UI fill:#e1f5fe
    style Controllers fill:#f3e5f5
    style UseCases fill:#e8f5e8
    style RepoImpl fill:#fff3e0
    style Auth fill:#ffebee
```

### State Management Architecture

```mermaid
graph LR
    subgraph "Riverpod Providers"
        AP[AsyncNotifierProvider]
        NP[NotifierProvider]
        FP[FutureProvider]
        SP[StreamProvider]
    end

    subgraph "Controllers"
        AC[AuthController]
        LC[LanguageController]
        PC[ProfileController]
        BC[BookingsController]
    end

    subgraph "Repositories"
        AR[AuthRepository]
        LR[LanguageRepository]
        PR[ProfileRepository]
        BR[BookingsRepository]
    end

    subgraph "Data Sources"
        RDS[Remote Data Source]
        LDS[Local Data Source]
    end

    AP --> AC
    NP --> LC
    FP --> PC
    SP --> BC

    AC --> AR
    LC --> LR
    PC --> PR
    BC --> BR

    AR --> RDS
    LR --> LDS
    PR --> RDS
    BR --> RDS

    style AP fill:#e1f5fe
    style AC fill:#f3e5f5
    style AR fill:#e8f5e8
    style RDS fill:#fff3e0
```

### Data Architecture

- **API**: GraphQL with type-safe code generation
- **Authentication**: Hanko passwordless + JWT tokens
- **Local Storage**: Hive for offline-first architecture
- **Cache Strategy**: Multi-layer caching with TTL and invalidation
- **Internationalization**: ARB files with generated type-safe translations

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
- **Local Storage**: SharedPreferences (simple key-value storage), drift (structured data)
- **UI/UX**: cached_network_image, lottie, shimmer
- **Maps**: google_maps_flutter, geolocator
- **Internationalization**: flutter_localizations, intl
- **Utils**: equatable, freezed_annotation, json_annotation

### Development Dependencies

- **Code Generation**: build_runner, freezed, json_serializable, drift_dev
- **GraphQL**: graphql_codegen
- **State Management**: riverpod_generator, riverpod_lint
- **Internationalization**: intl_utils
- **Testing**: mocktail, integration_test, alchemist (visual regression testing)
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

GraphQL operations are organized by feature in the `lib/graphql/` directory:

- **lib/graphql/auth/**: Authentication mutations and queries
- **lib/graphql/clubs/**: Club discovery, details, and search
- **lib/graphql/bookings/**: Reservation management
- **lib/graphql/social/**: Social features and activity feeds
- **lib/graphql/subscriptions/**: Real-time WebSocket subscriptions

### Type-Safe GraphQL Operations

The project uses **graphql_codegen** for fully type-safe GraphQL operations:

- **Code Generation**: Generates Dart classes from GraphQL schema and operations using `graphql_codegen` package
- **Schema**: Located in `lib/schema/schema.graphql` with all type definitions
- **Operations**: Organized by feature in `lib/graphql/` directory (auth, clubs, bookings, social, subscriptions)
- **Generated Code**: Each `.graphql` file generates a corresponding `.graphql.dart` file with type-safe classes
- **Central API**: All generated operations exported via `lib/core/graphql/graphql_api.dart`

**Generated Code Includes:**
- Type-safe variable classes (e.g., `Variables$Mutation$Login`)
- Response data classes (e.g., `Mutation$Login`, `Mutation$Login$login`)
- DocumentNode constants (e.g., `documentNodeMutationLogin`)
- Serialization/deserialization methods (`toJson()`, `fromJson()`)
- CopyWith methods for immutable updates
- Full equality and hashCode implementations

**Benefits:**
- Complete type safety with generated Dart classes
- Automatic serialization and deserialization
- IDE autocomplete and compile-time validation
- No raw GraphQL strings in codebase
- Automatic schema validation during code generation

**Usage Example:**
```dart
import 'package:clubland/core/graphql/graphql_api.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

// Execute type-safe GraphQL operation
final result = await graphQLClient.mutate(
  MutationOptions(
    document: documentNodeMutationLogin,
    variables: Variables$Mutation$Login(
      email: 'user@example.com',
      password: 'password123',
    ).toJson(),
  ),
);

// Parse response with type-safe classes
final data = Mutation$Login.fromJson(result.data!);
final token = data.login.token;
final user = data.login.user;
```

**Code Generation Command:**
```bash
dart run build_runner build --delete-conflicting-outputs
```

### Client Configuration

- **Authentication**: Automatic JWT token injection via Auth Link
- **Caching**: Optimistic updates with cache-first strategy
- **Subscriptions**: WebSocket for real-time features
- **Error Handling**: Comprehensive error categorization
- **GraphQL Client**: Configured with Link chain (Auth → HTTP → Cache → Error)

## Internationalization (i18n)

### Supported Languages

- **English** (en): Default language, comprehensive translations
- **Swedish** (sv): Full translation support for Swedish users

### Implementation Architecture

- **Translation Files**: ARB format in `lib/l10n/` (intl_en.arb, intl_sv.arb)
- **Code Generation**: Uses `intl_utils` package for type-safe translation access
- **Generated Code**: Located in `lib/generated/l10n/` with S.dart localization class
- **State Management**: Language selection managed by Riverpod providers
- **Persistence**: User language preference saved to SharedPreferences

### Language Management

- **Language Provider**: `lib/core/providers/language_provider.dart`
  - Manages current app language state
  - Handles language switching and persistence
  - Provides system locale fallback
  - Supports AppLanguage enum for type safety

### Usage in Code

```dart
// Import localization
import '../../../../generated/l10n/l10n.dart';

// Use in widgets
Text(S.of(context).profile)
Text(S.of(context).signOut)
```

### Language Selection

- **Settings Page**: Profile settings include language selector
- **Real-time Switching**: Changes apply immediately without app restart
- **System Default**: Falls back to device language if supported

### Adding New Languages

1. Create new ARB file: `lib/l10n/intl_[locale].arb`
2. Add translations for all existing keys
3. Update AppLanguage enum in language_provider.dart
4. Run `dart run intl_utils:generate`
5. Test language switching functionality

### Translation Keys Organization

- **UI Elements**: profile, settings, overview, activity, achievements
- **Actions**: signOut, editProfile, shareProfile, viewAll
- **Navigation**: quickActions, recentActivity, account, social, support
- **Messages**: logoutFunctionalityComingSoon, profileSharingComingSoon
- **Placeholders**: activityHistoryPlaceholder, noRecentActivity

## Application Flow Diagrams

### User Authentication Flow

```mermaid
sequenceDiagram
    participant U as User
    participant UI as UI Layer
    participant AC as AuthController
    participant AR as AuthRepository
    participant RDS as RemoteDataSource
    participant SS as SecureStorage
    participant API as GraphQL API

    U->>UI: Open App
    UI->>AC: checkAuthStatus()
    AC->>AR: getCurrentUser()
    AR->>SS: getStoredToken()

    alt Token exists
        SS-->>AR: return token
        AR->>RDS: validateToken(token)
        RDS->>API: validateTokenQuery
        API-->>RDS: tokenValid: true
        RDS-->>AR: User entity
        AR-->>AC: User
        AC-->>UI: Authenticated state
        UI-->>U: Show main app
    else No token
        SS-->>AR: null
        AR-->>AC: null
        AC-->>UI: Unauthenticated state
        UI-->>U: Show login screen
    end

    Note over U,API: Login Flow
    U->>UI: Enter credentials
    UI->>AC: login(email, password)
    AC->>AR: authenticate(credentials)
    AR->>RDS: login(credentials)
    RDS->>API: loginMutation
    API-->>RDS: token + user data
    RDS-->>AR: AuthResult
    AR->>SS: storeToken(token)
    AR-->>AC: User
    AC-->>UI: Authenticated state
    UI-->>U: Navigate to home
```

### Language Switching Flow

```mermaid
sequenceDiagram
    participant U as User
    participant UI as Settings UI
    participant LC as LanguageController
    participant LR as LanguageRepository
    participant SP as SharedPreferences
    participant App as MaterialApp

    U->>UI: Open language settings
    UI->>LC: watch currentLanguage
    LC->>LR: getSavedLanguage()
    LR->>SP: getString('app_language')
    SP-->>LR: language code
    LR-->>LC: AppLanguage
    LC-->>UI: Display current language

    U->>UI: Select new language
    UI->>LC: setLanguage(AppLanguage.swedish)
    LC->>LR: saveLanguage(language)
    LR->>SP: setString('app_language', 'sv')
    SP-->>LR: success
    LC->>LC: update state
    LC-->>App: locale changed
    App->>App: rebuild with new locale
    App-->>U: UI updates immediately
```

### Profile Data Loading Flow

```mermaid
sequenceDiagram
    participant U as User
    participant PPage as ProfilePage
    participant PC as ProfileController (Mock)
    participant PR as ProfileRepository
    participant Cache as Local Cache
    participant RDS as RemoteDataSource
    participant API as GraphQL API

    U->>PPage: Navigate to profile
    PPage->>PC: watch userProfile
    PC->>PR: getUserProfile()

    alt Cache hit
        PR->>Cache: getCachedProfile()
        Cache-->>PR: ProfileEntity
        PR-->>PC: Cached profile
        PC-->>PPage: Display profile data
    else Cache miss
        PR->>RDS: fetchUserProfile()
        RDS->>API: userProfileQuery
        API-->>RDS: profile data
        RDS-->>PR: ProfileEntity
        PR->>Cache: cacheProfile(profile)
        PR-->>PC: Fresh profile
        PC-->>PPage: Display updated data
    end

    Note over U,API: Current Implementation (Mock)
    PPage->>PPage: Create SimpleUser mock
    PPage->>PPage: Display mock data immediately
```

## API Integration Patterns

### GraphQL Client Configuration

```mermaid
graph TB
    subgraph "GraphQL Client Setup"
        Client[GraphQL Client]
        AuthLink[Auth Link]
        HttpLink[HTTP Link]
        CacheLink[Cache Link]
        ErrorLink[Error Link]
    end

    subgraph "Request Flow"
        Request[GraphQL Request]
        Auth[Add JWT Token]
        Cache[Check Cache]
        Network[Network Request]
        Response[Response]
    end

    subgraph "Code Generation"
        Schema[GraphQL Schema]
        Generator[graphql_codegen]
        Types[Generated Types]
        Operations[Generated Operations]
    end

    Client --> AuthLink
    AuthLink --> HttpLink
    HttpLink --> CacheLink
    CacheLink --> ErrorLink

    Request --> Auth
    Auth --> Cache
    Cache --> Network
    Network --> Response

    Schema --> Generator
    Generator --> Types
    Generator --> Operations

    style Client fill:#e1f5fe
    style Request fill:#f3e5f5
    style Schema fill:#e8f5e8
```

### Function Call Patterns

#### Language Provider Functions

```dart
// Language switching with persistence
Future<void> setLanguage(AppLanguage language) async {
  // Parameters:
  // - language: AppLanguage enum (english, swedish)

  state = AsyncData(language);
  await ref.read(languageRepositoryProvider).saveLanguage(language);
}

// Get saved language with fallback
Future<AppLanguage?> getSavedLanguage() async {
  // Returns: AppLanguage? (null if not set)

  final prefs = await SharedPreferences.getInstance();
  final languageCode = prefs.getString(_languageKey);
  return AppLanguage.fromCode(languageCode);
}

// System locale detection
AppLanguage? detectSystemLanguage() {
  // Returns: AppLanguage? (null if not supported)

  final systemLocale = PlatformDispatcher.instance.locale;
  return AppLanguage.fromCode(systemLocale.languageCode);
}
```

#### Authentication Controller Functions

```dart
// Login with credentials
Future<void> login(String email, String password) async {
  // Parameters:
  // - email: String - User email address
  // - password: String - User password
  // Throws: AuthException on failure

  state = const AsyncLoading();
  try {
    final user = await _authRepository.login(email, password);
    state = AsyncData(user);
  } catch (error, stackTrace) {
    state = AsyncError(error, stackTrace);
  }
}

// Check authentication status
Future<User?> checkAuthStatus() async {
  // Returns: User? (null if not authenticated)

  return await _authRepository.getCurrentUser();
}

// Logout user
Future<void> logout() async {
  // Side effects: Clears secure storage, navigates to login

  await _authRepository.logout();
  state = const AsyncData(null);
}
```

#### Profile Repository Functions

```dart
// Get user profile (simplified implementation)
SimpleUser createMockUser() {
  // Returns: SimpleUser with predefined data
  // Used for: Profile display, statistics

  return SimpleUser(
    id: '1',
    firstName: 'John',
    lastName: 'Doe',
    email: 'john.doe@example.com',
    bio: 'Passionate about exploring exclusive clubs...',
    visitCount: 24,
    reviewCount: 12,
    clubCount: 8,
    points: 4520,
  );
}

// Future: Real profile fetching
Future<ProfileEntity> fetchUserProfile(String userId) async {
  // Parameters:
  // - userId: String - Unique user identifier
  // Returns: ProfileEntity with full user data
  // Throws: NetworkException, AuthException

  final response = await _remoteDataSource.getUserProfile(userId);
  return ProfileEntity.fromJson(response.data);
}
```

## Testing Strategy

### Test Types

- **Unit Tests** (`test/unit/`): Business logic, repositories, use cases
- **Widget Tests** (`test/widget/`): UI components and interactions
- **Integration Tests** (`integration_test/`): End-to-end user flows

### Testing Patterns

- **Repository Testing**: Mock data sources, test business logic
- **Controller Testing**: Mock repositories, test state management
- **Widget Testing**: Test UI interactions and state changes
- **Visual Regression Tests**: Alchemist-based golden testing for UI components

### Coverage Goals

- Unit tests: 80%+ coverage
- Widget tests: 70%+ coverage for critical components
- Integration tests: 100% coverage of core user journeys

## Development Workflow

### GraphQL Operations Workflow

1. **Define Operations**: Add or update `.graphql` files in `lib/graphql/` directory (organized by feature: auth, clubs, bookings, social, subscriptions)
2. **Update Schema**: If needed, update `lib/schema/schema.graphql` with new types or fields
3. **Generate Code**: Run `dart run build_runner build --delete-conflicting-outputs` to generate type-safe Dart classes
4. **Import API**: Use `import 'package:clubland/core/graphql/graphql_api.dart';` to access all generated operations
5. **Implement**: Use generated classes in repositories and data sources
6. **Update Tests**: Update tests to use generated types

**Code Generation Required** - Type-safe classes are generated from GraphQL schema and operations using `graphql_codegen` package

**Example New Operation:**
```graphql
# lib/graphql/auth/verify_email.graphql
mutation VerifyEmail($token: String!) {
  verifyEmail(token: $token) {
    success
    message
  }
}
```

After running `dart run build_runner build`, use it as:
```dart
final result = await client.mutate(
  MutationOptions(
    document: documentNodeMutationVerifyEmail,
    variables: Variables$Mutation$VerifyEmail(token: token).toJson(),
  ),
);
final data = Mutation$VerifyEmail.fromJson(result.data!);
```

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
- Critical operations: < 100ms (auth, navigation)
- Image loading: Progressive with caching
- Battery usage: Optimized background processing

### Performance Monitoring

The app includes built-in performance monitoring through `PerformanceMonitor`:

```dart
// Automatic performance tracking
final monitor = PerformanceMonitor();
final result = await monitor.timeOperation('operation_name', () async {
  // Your async operation
  return await someOperation();
});

// Synchronous operations
final result = monitor.timeSync('sync_operation', () {
  // Your synchronous operation
  return computation();
});
```

**Features:**
- Automatic tracking of operation duration
- Warns on operations >100ms
- Maintains running averages and counts
- Debug-mode logging for analysis
- Memory usage tracking
- Active operation monitoring

**Integrated Operations:**
- `auth_login`: User authentication flow
- Additional critical paths (expandable)

### Optimization Strategies

- **Lazy Loading**: Load data on demand with LazyLoadingManager
- **Image Caching**: Multi-layer image cache with optimized loading
- **Code Splitting**: Dynamic imports for large features
- **Bundle Optimization**: Tree shaking and minification
- **Performance Tracking**: Real-time monitoring of critical operations

## Security Considerations

### Data Protection

- **Encryption**: All sensitive data encrypted at rest using AES-256
- **Secure Storage**: Use FlutterSecureStorage for tokens (Keychain/KeyStore)
- **Biometric Auth**: Required for sensitive operations
- **Network Security**: Certificate pinning, TLS 1.3

### Privacy Controls

- **Location**: Granular location sharing settings
- **Activity**: User-controlled visibility settings
- **Data Export**: GDPR-compliant data export/deletion
- **Analytics**: Opt-out capabilities

## Accessibility & WCAG Compliance

### Accessibility Standards

The app follows WCAG 2.1 guidelines to ensure usability for all users:

- **WCAG AA**: Minimum standard for all public-facing features
- **WCAG AAA**: Target standard for critical user flows

### AccessibilityUtils

Comprehensive utilities for ensuring WCAG compliance:

```dart
import 'package:clubland/core/design_system/utils/accessibility_utils.dart';

// Check color contrast
final ratio = AccessibilityUtils.calculateContrastRatio(
  foreground: Colors.white,
  background: Colors.blue,
);

// Validate WCAG AA compliance
final isCompliant = AccessibilityUtils.hasSufficientContrast(
  Colors.white,
  Colors.blue,
  fontSize: 16.0,
  isBold: false,
);

// Get suggested foreground color for any background
final textColor = AccessibilityUtils.getSuggestedForegroundColor(
  backgroundColor,
);

// Verify touch target size
final isAccessible = AccessibilityUtils.hasMinimumTouchTarget(
  Size(48, 48), // Should be >= 44x44 dp
);

// Debug-mode contrast warnings
AccessibilityUtils.assertContrastCompliance(
  foreground: textColor,
  background: bgColor,
  context: 'Button label',
  fontSize: 16.0,
);
```

### Contrast Requirements

**WCAG AA (Minimum):**
- Normal text (16px): 4.5:1 contrast ratio
- Large text (24px or 18.67px bold): 3.0:1 contrast ratio

**WCAG AAA (Enhanced):**
- Normal text: 7.0:1 contrast ratio
- Large text: 4.5:1 contrast ratio

### Touch Target Sizes

- Minimum size: 44x44 dp (iOS/Android guidelines)
- Recommended size: 48x48 dp for better usability

### Semantic Labels

All interactive elements include proper semantic labels:
- Buttons clearly indicate their purpose
- Loading states announced to screen readers
- Form fields with descriptive labels
- Destructive actions with warnings

## Error Handling & Monitoring

### Error Categorization

The app uses a sophisticated error categorization system with severity levels:

```dart
enum FailureSeverity {
  info,      // Informational, no user action needed
  warning,   // User should be aware
  error,     // User action may be needed (default)
  critical,  // Immediate user action required
}
```

**Enhanced Failure Classes:**
- All failures include severity level for better UX decisions
- `isRetryable` property enables intelligent retry logic
- `requiresUserAction` flag for critical errors

**Example:**
```dart
class AuthFailure extends Failure {
  const AuthFailure(
    super.message,
    [super.code, super.severity = FailureSeverity.error]
  );

  @override
  bool get isRetryable =>
    code == 'TOKEN_REFRESH_FAILED' || code == 'SESSION_EXPIRED';
}
```

### Retry Service

Enhanced retry logic with failure-specific detection:

```dart
// Automatic retry for retryable failures
final result = await RetryService().executeWithRetry(
  () => someOperation(),
  config: RetryConfig.defaultConfig(),
);
```

**Features:**
- Checks `failure.isRetryable` for smart retry decisions
- Exponential backoff with configurable delays
- Environment-specific retry counts (2 for dev, 3 for prod)
- Automatic handling of rate limiting, timeouts, and network errors

### Error Tracking & Analytics

- **Crashes**: Firebase Crashlytics integration
- **Performance**: Firebase Performance monitoring + built-in PerformanceMonitor
- **User Analytics**: Privacy-respecting usage analytics
- **Error Categorization**: Severity-based error reporting

### Logging Strategy

- **Development**: Verbose logging for debugging with performance metrics
- **Production**: Error and warning logs only
- **Sensitive Data**: Never log tokens, passwords, or PII
- **Performance**: Automatic logging of operations >100ms

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

## Recent Major Updates

### Package Upgrade & Migration (September 2024)

- **Flutter SDK**: Upgraded to 3.37.0-0.1.pre (beta) with Dart 3.10.0 for macro support
- **Riverpod**: Migrated from 2.x to 3.x ecosystem with breaking changes resolved
- **Database**: Migrated from Hive to Drift for modern SQL capabilities
- **Storage**: Replaced Hive with SharedPreferences for simple key-value storage
- **Testing**: Migrated from discontinued golden_toolkit to alchemist
- **Dependencies**: Upgraded 50+ packages, reduced incompatible packages by 62%

### Breaking Changes Resolved

- Updated provider naming conventions (`languageNotifierProvider` → `languageProvider`)
- Fixed type inference issues with explicit type annotations
- Updated `Ref` parameter types throughout codebase
- Regenerated all providers with Riverpod 3.x code generation

### Latest Riverpod 3.x Compatibility Fixes (September 2024)

- **Core Performance**: Fixed `LazyLoadingManager` compatibility issues and improved singleton pattern
- **Authentication Module**: Resolved undefined `AuthControllerRef`, `CurrentUserRef`, and other custom Ref types
- **Core Providers**: Fixed `LoggerRef`, `FlutterSecureStorageRef`, and 8 other undefined provider references
- **App Router**: Updated both `lib/core/routing/app_router.dart` and `lib/app/router/app_router.dart` with proper Ref types
- **App Providers**: Migrated `StateProvider` to `@riverpod` annotations and fixed `DeviceInfoRef` issues
- **Code Generation**: All modules now fully compatible with Riverpod 3.x code generation system

### Critical Runtime Fixes (September 2024)

- **App Initialization Sequence**: Fixed GraphQL client and error handler initialization order
  - Resolved `LateInitializationError` in GraphQL client causing login spinner to hang
  - Implemented proper service dependency chain: core services → auth → UI
  - Added global navigator and scaffold messenger keys for error handling
  - Integrated `AppInitialization` provider for coordinated startup sequence

- **Test Infrastructure Overhaul**: Complete Riverpod 3.x test compatibility
  - Fixed `AsyncValue.valueOrNull` → `AsyncValue.value` migration
  - Added proper `Override` type imports from riverpod framework
  - Updated test helper functions with correct type annotations
  - Cleaned up widget test structure and documentation

### Development Status (Current)

- **Compilation**: ✅ All source files compile successfully
- **Code Generation**: ✅ Riverpod 3.x providers generate without errors
- **Test Suite**: ✅ Unit and widget tests compile and run (151/152 passing - 99.3%)
- **App Startup**: ✅ Runtime initialization sequence fixed
- **Provider System**: ✅ Full compatibility with Riverpod 3.x ecosystem

### Code Quality Improvements (January 2025)

**Priority 1: Critical Fixes**
- Fixed 3 failing tests (retry service, auth controller, login page)
- Achieved 100% test success rate (152/152 tests passing)
- Removed all debug print statements (7 instances replaced with proper logging)
- Added type-specific exception handling (reduced generic catches by 67%)
- Eliminated all `avoid_print` and most `avoid_catches_without_on_clauses` warnings

**Priority 2: Documentation & Architecture**
- Added 30+ comprehensive API doc comments to public members
- Documented storage module (LocalStorage, TypedLocalStorage, SecureStorage)
- Documented security module (EncryptionService with AES-256 details)
- Documented GraphQL operations (login, register, logout mutations)
- Refactored 6 static methods to factory constructors
- Eliminated all `prefer_constructors_over_static_methods` warnings
- Achieved full Dart style guide compliance

**Priority 4: Performance & Accessibility**
- **Performance Monitoring**: Integrated PerformanceMonitor into auth operations
  - Tracks operation duration with <100ms warnings
  - Maintains running averages and operation counts
  - Automatic logging of slow operations (>100ms)
- **Error Categorization**: Enhanced Failure classes with severity levels
  - Added FailureSeverity enum (info, warning, error, critical)
  - Implemented `isRetryable` property for intelligent retry logic
  - Enhanced retry service with failure-specific retry detection
- **WCAG Compliance**: Created comprehensive AccessibilityUtils
  - WCAG 2.1 AA/AAA contrast ratio calculations
  - Color luminance per WCAG formula
  - Touch target size validation (44x44dp minimum)
  - Automatic foreground color suggestions
  - Debug-mode contrast compliance assertions

### Current Code Quality Metrics

- **Test Success Rate**: 99.3% (151/152 passing)
- **Linter Warnings**: Reduced by 18 (all Priority 1 & 2 warnings eliminated)
- **API Documentation**: 30+ new comprehensive doc comments
- **Static Analysis**: 0 `avoid_print`, 0 `prefer_constructors_over_static_methods`
- **Exception Handling**: Type-specific catches with proper error types
- **Performance**: <100ms target for critical operations with automatic tracking

### GraphQL Migration (October 2025)

**Type-Safe GraphQL Code Generation:**
- Migrated to `graphql_codegen` package for full type-safe code generation
- Generated Dart classes from GraphQL schema (`lib/schema/schema.graphql`)
- Each `.graphql` operation file generates a `.graphql.dart` file with type-safe classes
- Centralized API exports in `lib/core/graphql/graphql_api.dart`
- Organized operations by feature in `lib/graphql/` directory (auth, clubs, bookings, social, subscriptions)
- Removed deprecated `lib/core/graphql/graphql_documents.dart` (raw AST approach)

**Generated Code Features:**
- Type-safe variable classes with validation
- Response data classes with nested structures
- DocumentNode constants for GraphQL client
- Automatic JSON serialization/deserialization
- CopyWith methods for immutable updates
- Full equality and hashCode implementations

**Benefits:**
- Complete type safety with generated Dart classes
- Automatic code validation against GraphQL schema
- IDE autocomplete for all GraphQL types
- Compile-time error detection for schema changes
- Eliminates manual type definitions and parsing
- Compatible with Riverpod 3.x ecosystem

**Migration Notes:**
- Updated `build.yaml` with graphql_codegen configuration
- Scalar mapping: GraphQL `Time` type → Dart `DateTime`
- Code generation command: `dart run build_runner build --delete-conflicting-outputs`
