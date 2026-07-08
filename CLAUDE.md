# CLAUDE.md

AI instructions for Claude Code working with this repository.

## Project Overview

**Clubland** - Premium Flutter application for Reciprocal Clubs platform.

**Tech Stack:**

- Flutter 3.37.0+ (beta), Dart 3.10.0+
- Clean Architecture with feature-based organization
- Riverpod 3.x for state management
- GraphQL with type-safe code generation (`graphql_codegen`)
- Drift (structured data) + SharedPreferences (simple data)
- ARB-based i18n (English, Swedish)

## 🤖 AI Workflow (lean-ctx)

Use **lean-ctx** MCP tools to save tokens. **Always** use these instead of standard commands when possible:

| Tool | Replaces | Use Case |
| :--- | :--- | :--- |
| `ctx_read` | `Read` | Reading files for editing (`full`) or API surface only (`map`). |
| `ctx_shell` | `Bash` | Running `flutter`, `dart`, or `git` commands. |
| `ctx_tree` | `ls`/`find` | Exploring directory structure. |
| `ctx_search` | `Grep` | Finding specific code patterns across the codebase. |

### Session Protocol (run automatically, no prompting needed)

**At the start of every conversation:**

1. `ctx_session load` — restore prior session context (findings, decisions, task)
2. `ctx_overview <task>` — get a task-relevant project map before reading files

**During work:**

- `ctx_session finding "file:line — summary"` — record key discoveries as you make them
- `ctx_session decision "summary"` — record any architectural choices made
- `ctx_compress` — call proactively when context grows large, before it becomes a problem

**At natural stopping points:**

- `ctx_session save` — persist session state so the next conversation can restore it

### Read Modes

| Mode | When to use |
| :--- | :--- |
| `full` | Files you are about to edit — gets cached, re-reads are ~13 tokens |
| `map` | Files you need for context only — exports + dependencies, not bodies |
| `signatures` | When you only need function signatures |
| `lines:N-M` | When you know the exact range needed |

## Quick Setup

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```

## Essential Commands

### Running & Development

```bash
flutter run                                    # Run app
r                                              # Hot reload (in terminal)
R                                              # Hot restart (in terminal)
```

### Code Generation (Required after changes to GraphQL/Riverpod/i18n)

```bash
dart run build_runner build --delete-conflicting-outputs    # Generate all
dart run build_runner watch --delete-conflicting-outputs    # Watch mode
dart run intl_utils:generate                                # i18n only
```

### Testing & Quality

```bash
flutter test                                   # All tests
flutter test test/unit/                        # Unit tests
flutter test test/widget/                      # Widget tests
flutter test --coverage                        # With coverage
flutter analyze --fatal-infos --fatal-warnings # Analyze
dart format .                                  # Format
```

### Building

```bash
flutter build apk --release --dart-define=ENVIRONMENT=production
flutter build appbundle --release --dart-define=ENVIRONMENT=production
flutter build ios --release --dart-define=ENVIRONMENT=production
flutter build web --release --dart-define=ENVIRONMENT=production
```

## Project Structure

```text
lib/
├── main.dart                    # Entry point
├── app/                         # App configuration, router, themes
├── core/                        # Shared infrastructure
│   ├── constants/               # API endpoints, storage keys
│   ├── errors/                  # Exceptions, failures, error handling
│   ├── network/                 # GraphQL client setup
│   ├── storage/                 # Local/secure storage
│   └── utils/                   # Extensions, validators, formatters
├── features/                    # Feature modules
│   ├── auth/                    # Authentication
│   ├── clubs/                   # Club discovery
│   ├── bookings/                # Reservations
│   ├── events/                  # Events & RSVPs
│   ├── social/                  # Social features (data layer only — WIP)
│   ├── profile/                 # User profile
│   └── home/                    # Home screen
│   └── (each feature has):
│       ├── data/                # Models, repository impls, data sources
│       ├── domain/              # Entities, repository interfaces, use cases
│       └── presentation/        # Controllers, pages, widgets
├── shared/                      # Reusable widgets, models, services
├── generated/                   # Generated code (DO NOT EDIT)
├── l10n/                        # i18n ARB files
└── schema/                      # GraphQL schema files
```

## Critical Patterns (Must Follow)

### 1. Clean Architecture Layers

**Flow:** UI → Controller → Use Case → Repository → Data Source → API

- **Presentation**: UI widgets, Riverpod controllers
- **Domain**: Entities, repository interfaces, use cases
- **Data**: Repository implementations, remote/local data sources, models

### 2. Riverpod 3.x State Management

**Always use code generation:**

```dart
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_controller.g.dart';

@riverpod
class MyController extends _$MyController {
  @override
  FutureOr<MyState> build() async {
    // Initialize state
  }

  Future<void> doSomething() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      // Do work
    });
  }
}
```

**Key points:**

- Use `@riverpod` annotation (not manual providers)
- Run `dart run build_runner build` after changes
- Use `Ref` parameter, not custom ref types
- Controllers extend `_$ControllerName`

### 3. GraphQL Operations (Type-Safe)

**Workflow:**

1. Add/update `.graphql` files in `lib/graphql/[feature]/`
2. Run `dart run build_runner build --delete-conflicting-outputs`
3. Import: `import 'package:clubland/core/graphql/graphql_api.dart';`
4. Use generated classes

**Example:**

```graphql
# lib/graphql/auth/login.graphql
mutation Login($email: String!, $password: String!) {
  login(email: $email, password: $password) {
    token
    user { id email firstName lastName }
  }
}
```

**Usage after generation:**

```dart
import 'package:clubland/core/graphql/graphql_api.dart';

final result = await graphQLClient.mutate(
  MutationOptions(
    document: documentNodeMutationLogin,
    variables: Variables$Mutation$Login(
      email: email,
      password: password,
    ).toJson(),
  ),
);

final data = Mutation$Login.fromJson(result.data!);
final token = data.login.token;
```

**Schema sync — `lib/schema/schema.graphql` is NOT hand-maintained.**
It is a copy of the backend's canonical merged SDL. The backend is the source of
truth for the GraphQL contract. To re-sync after backend schema changes:

```bash
# In the backend repo: regenerate the canonical artifact
../reciprocal-clubs-backend/scripts/export-graphql-schema.sh
# In this repo: copy it in, then regenerate
./scripts/sync-schema.sh
dart run build_runner build --delete-conflicting-outputs
```

`scripts/sync-schema.sh` assumes the backend is a sibling checkout
(`../reciprocal-clubs-backend`); override with the `BACKEND_REPO` env var.
Never edit `lib/schema/schema.graphql` directly — changes belong in the backend.

### 4. Repository Pattern

**Always use `Either<Failure, T>` for error handling:**

```dart
// Domain layer - interface
abstract class MyRepository {
  Future<Either<Failure, MyEntity>> getData(String id);
}

// Data layer - implementation
class MyRepositoryImpl implements MyRepository {
  @override
  Future<Either<Failure, MyEntity>> getData(String id) async {
    try {
      final result = await _remoteDataSource.fetchData(id);
      return Right(result.toEntity());
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}
```

### 5. Enum Types — Always Use Generated `Enum$*`

**Never declare hand-rolled enums that shadow generated types.** All domain enums
are generated from the GraphQL schema via `graphql_codegen` and live in:

```dart
import 'package:clubland/core/graphql/graphql_api.dart';
// Enum$ClubEventType, Enum$BookingStatus, Enum$VisitStatus, Enum$RSVPStatus,
// Enum$RSVPResponse, Enum$RSVPType, Enum$GuestPolicy, Enum$UserStatus, Enum$FacilityType
```

**Rules:**
- Use `fromJson$Enum$X(value)` at data boundaries (graceful `$unknown` fallback).
- Exclude `$unknown` from UI iteration: `.where((v) => v != Enum$X.$unknown)`.
- Every `switch` on an `Enum$*` must include a `$unknown` case (exhaustiveness).
- Domain-specific getters (`isActive`, `canCancel`, etc.) live as extensions on the generated type.

**Guard:** `flutter test test/ontology/enum_drift_test.dart` fails if a hand-rolled
`enum X` shadowing a generated `Enum$<X>` is re-introduced in `lib/features/**`.

### 7. Storage Architecture

- **Simple data**: SharedPreferences (via TypedLocalStorage)
- **Structured data**: Drift SQL database
- **Secure data**: FlutterSecureStorage (tokens, credentials)

### 8. Internationalization

**Add translations to ARB files:**

```json
// lib/l10n/intl_en.arb
{
  "myKey": "My translation",
  "@myKey": {
    "description": "Description for translators"
  }
}
```

**Use in code:**

```dart
import 'package:clubland/generated/l10n/l10n.dart';

Text(S.of(context).myKey)
```

**After adding translations:** Run `dart run intl_utils:generate`

## Feature Development Workflow

1. **Create feature branch** from main
2. **Implement Clean Architecture layers**:
   - Domain (entities, repository interface, use cases)
   - Data (models, repository impl, data sources)
   - Presentation (controllers with `@riverpod`, pages, widgets)
3. **Add GraphQL operations** if needed
4. **Run code generation**: `dart run build_runner build --delete-conflicting-outputs`
5. **Write tests** (unit, widget, integration)
6. **Format & analyze**: `dart format . && flutter analyze`
7. **Run tests**: `flutter test`
8. **Submit PR**

## Testing Strategy

### Test Structure

- `test/unit/` - Business logic, repositories, use cases
- `test/widget/` - UI components
- `integration_test/` - End-to-end flows

### Testing with Riverpod 3.x

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

test('test name', () async {
  final container = ProviderContainer(
    overrides: [
      myRepositoryProvider.overrideWithValue(mockRepository),
    ],
  );

  final controller = container.read(myControllerProvider.notifier);
  await controller.doSomething();

  final state = container.read(myControllerProvider);
  expect(state.value, expectedValue);
});
```

## Authentication & Security

- **Primary auth**: Hanko (OIDC / passkeys) — the app authenticates via Hanko; the backend validates JWTs
- **Storage**: FlutterSecureStorage for tokens (Keychain/KeyStore)
- **Encryption**: AES-256 for sensitive data
- **Never log**: Tokens, passwords, PII

## Troubleshooting

| Issue | Solution |
|-------|----------|
| Build failures | `flutter clean && dart run build_runner build` |
| GraphQL errors | Check schema, regenerate code |
| Riverpod errors | Ensure `@riverpod` annotation, regenerate |
| Provider not found | Run `dart run build_runner build` |
| Test failures | Check for `AsyncValue.value` (not `.valueOrNull`) |
| i18n not found | Run `dart run intl_utils:generate` |

## Key Dependencies

**Production:**

- flutter_riverpod, riverpod_annotation (state management)
- go_router (navigation)
- graphql_flutter, gql (GraphQL)
- drift (structured storage)
- shared_preferences (simple storage)
- flutter_secure_storage (secure storage)
- local_auth (biometric auth)
- intl (i18n)

**Development:**

- build_runner, riverpod_generator (code generation)
- graphql_codegen (GraphQL type generation)
- drift_dev (database code generation)
- intl_utils (i18n generation)
- mocktail (testing)
- flutter_lints, very_good_analysis (linting)

## Important Notes

1. **Always run code generation** after modifying:
   - GraphQL operations (`.graphql` files)
   - Riverpod providers (`@riverpod` annotations)
   - i18n translations (`.arb` files)
   - Drift database schemas

2. **Never edit generated files** (`.g.dart`, `.graphql.dart`, `l10n/`)

3. **Follow Clean Architecture**:
   - Domain layer has NO dependencies on data/presentation
   - Data layer depends only on domain
   - Presentation depends on domain (not data directly)

4. **Use `@riverpod` annotation** (not manual provider declarations)

5. **Return `Either<Failure, T>`** from repositories for proper error handling

6. **Test coverage goals**: 80%+ unit tests, 70%+ widget tests

7. **Performance target**: <100ms for critical operations (auth, navigation)

8. **Accessibility**: Follow WCAG 2.1 AAA standards (use AccessibilityUtils when needed)
