# Flutter App Architecture Guide for Reciprocal Clubs Platform

## Overview

This guide provides comprehensive architectural patterns, project structure, and implementation strategies for developing both Administrator and End User Flutter applications for the Reciprocal Clubs platform.

## Project Structure

### Recommended Flutter Project Architecture

```text
lib/
├── main.dart
├── app/
│   ├── app.dart                    # Main app configuration
│   ├── router/
│   │   ├── app_router.dart         # Go Router configuration
│   │   └── route_paths.dart        # Route constants
│   └── themes/
│       ├── app_theme.dart          # Theme configuration
│       ├── colors.dart             # Color scheme
│       └── text_styles.dart        # Typography
├── core/
│   ├── constants/
│   │   ├── api_constants.dart      # API endpoints
│   │   ├── app_constants.dart      # App-wide constants
│   │   └── storage_keys.dart       # Local storage keys
│   ├── errors/
│   │   ├── exceptions.dart         # Custom exceptions
│   │   └── error_handler.dart      # Global error handling
│   ├── network/
│   │   ├── graphql_client.dart     # GraphQL client configuration
│   │   ├── graphql_links.dart      # Auth, HTTP, WebSocket links
│   │   └── network_info.dart       # Connectivity checking
│   ├── storage/
│   │   ├── local_storage.dart      # Hive/Drift configuration
│   │   ├── secure_storage.dart     # Flutter Secure Storage
│   │   └── cache_manager.dart      # Caching strategies
│   └── utils/
│       ├── extensions.dart         # Dart extensions
│       ├── validators.dart         # Form validators
│       └── formatters.dart         # Data formatters
├── features/
│   ├── auth/
│   │   ├── data/
│   │   │   ├── models/
│   │   │   │   ├── auth_request.dart
│   │   │   │   ├── auth_response.dart
│   │   │   │   └── user_model.dart
│   │   │   ├── repositories/
│   │   │   │   └── auth_repository_impl.dart
│   │   │   └── sources/
│   │   │       ├── auth_local_source.dart
│   │   │       └── auth_remote_source.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── user_entity.dart
│   │   │   ├── repositories/
│   │   │   │   └── auth_repository.dart
│   │   │   └── usecases/
│   │   │       ├── login_usecase.dart
│   │   │       ├── logout_usecase.dart
│   │   │       └── refresh_token_usecase.dart
│   │   └── presentation/
│   │       ├── controllers/
│   │       │   └── auth_controller.dart
│   │       ├── pages/
│   │       │   ├── login_page.dart
│   │       │   ├── mfa_page.dart
│   │       │   └── profile_setup_page.dart
│   │       └── widgets/
│   │           ├── biometric_auth_widget.dart
│   │           └── mfa_input_widget.dart
│   ├── clubs/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   ├── reservations/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   ├── visits/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   └── social/
│       ├── data/
│       ├── domain/
│       └── presentation/
├── shared/
│   ├── widgets/
│   │   ├── buttons/
│   │   ├── cards/
│   │   ├── forms/
│   │   └── loading/
│   ├── models/
│   └── services/
└── l10n/
    ├── app_en.arb              # English translations
    ├── app_es.arb              # Spanish translations
    └── app_fr.arb              # French translations
```

## State Management Architecture

### Riverpod Implementation

#### 1. Provider Structure

```dart
// core/providers/providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

// HTTP Client Provider
final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(BaseOptions(
    baseUrl: ApiConstants.baseUrl,
    connectTimeout: Duration(seconds: 30),
    receiveTimeout: Duration(seconds: 30),
  ));

  dio.interceptors.addAll([
    AuthInterceptor(ref),
    LoggingInterceptor(),
    ErrorInterceptor(),
  ]);

  return dio;
});

// Storage Providers
final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
    iOptions: IOSOptions(
      accessibility: KeychainItemAccessibility.first_unlock_this_device,
    ),
  );
});

// Repository Providers
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    remoteSource: ref.watch(authRemoteSourceProvider),
    localSource: ref.watch(authLocalSourceProvider),
  );
});
```

#### 2. Feature-Specific Controllers

```dart
// features/auth/presentation/controllers/auth_controller.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  AsyncValue<UserEntity?> build() {
    _loadStoredUser();
    return const AsyncValue.data(null);
  }

  Future<void> login(LoginRequest request) async {
    state = const AsyncValue.loading();

    final result = await ref.read(authRepositoryProvider).login(request);

    result.fold(
      (failure) => state = AsyncValue.error(failure, StackTrace.current),
      (user) => state = AsyncValue.data(user),
    );
  }

  Future<void> logout() async {
    await ref.read(authRepositoryProvider).logout();
    state = const AsyncValue.data(null);
  }

  Future<void> _loadStoredUser() async {
    final user = await ref.read(authRepositoryProvider).getCurrentUser();
    if (user != null) {
      state = AsyncValue.data(user);
    }
  }
}

// Usage in UI
class LoginPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);

    return Scaffold(
      body: authState.when(
        data: (user) => user != null ? DashboardPage() : LoginForm(),
        loading: () => const LoadingIndicator(),
        error: (error, stack) => ErrorWidget(error.toString()),
      ),
    );
  }
}
```

### 3. Global State Management

```dart
// core/providers/global_providers.dart

// App State Provider
@riverpod
class AppState extends _$AppState {
  @override
  AppStateModel build() {
    return AppStateModel(
      isOnline: true,
      currentTheme: ThemeMode.system,
      locale: const Locale('en'),
    );
  }

  void setOnlineStatus(bool isOnline) {
    state = state.copyWith(isOnline: isOnline);
  }

  void setTheme(ThemeMode theme) {
    state = state.copyWith(currentTheme: theme);
  }
}

// Connectivity Provider
@riverpod
Stream<ConnectivityResult> connectivity(ConnectivityRef ref) {
  return Connectivity().onConnectivityChanged;
}

// Connectivity Listener
@riverpod
class ConnectivityNotifier extends _$ConnectivityNotifier {
  @override
  bool build() {
    ref.listen(connectivityProvider, (previous, next) {
      next.when(
        data: (result) {
          final isConnected = result != ConnectivityResult.none;
          ref.read(appStateProvider.notifier).setOnlineStatus(isConnected);
        },
        loading: () {},
        error: (_, __) {},
      );
    });
    return true;
  }
}
```

## Data Layer Architecture

### 1. Repository Pattern Implementation

```dart
// Domain Layer - Repository Interface
abstract class ClubRepository {
  Future<Either<Failure, List<ClubEntity>>> searchClubs(SearchParams params);
  Future<Either<Failure, ClubEntity>> getClubDetails(String clubId);
  Future<Either<Failure, List<ClubEntity>>> getNearbyClubs(LatLng location);
}

// Data Layer - Repository Implementation
class ClubRepositoryImpl implements ClubRepository {
  final ClubRemoteSource remoteSource;
  final ClubLocalSource localSource;
  final NetworkInfo networkInfo;

  ClubRepositoryImpl({
    required this.remoteSource,
    required this.localSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<ClubEntity>>> searchClubs(SearchParams params) async {
    if (await networkInfo.isConnected) {
      try {
        final clubs = await remoteSource.searchClubs(params);
        await localSource.cacheClubs(clubs);
        return Right(clubs.map((e) => e.toEntity()).toList());
      } on Exception catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      try {
        final cachedClubs = await localSource.getCachedClubs();
        return Right(cachedClubs.map((e) => e.toEntity()).toList());
      } on Exception catch (e) {
        return Left(CacheFailure(e.toString()));
      }
    }
  }
}
```

### 2. Data Models with JSON Serialization

```dart
// Data Model
@freezed
class ClubModel with _$ClubModel {
  const factory ClubModel({
    required String id,
    required String name,
    required String description,
    required LocationModel location,
    required List<String> amenities,
    required RatingModel rating,
    @JsonKey(name: 'reciprocal_info') required ReciprocalInfoModel reciprocalInfo,
  }) = _ClubModel;

  factory ClubModel.fromJson(Map<String, dynamic> json) =>
      _$ClubModelFromJson(json);
}

// Extension for Entity Conversion
extension ClubModelX on ClubModel {
  ClubEntity toEntity() {
    return ClubEntity(
      id: id,
      name: name,
      description: description,
      location: location.toEntity(),
      amenities: amenities,
      rating: rating.toEntity(),
      reciprocalInfo: reciprocalInfo.toEntity(),
    );
  }
}
```

### 3. Local Storage with Hive

```dart
// Hive Model for Offline Storage
@HiveType(typeId: 0)
class CachedClub extends HiveObject {
  @HiveField(0)
  late String id;

  @HiveField(1)
  late String name;

  @HiveField(2)
  late String description;

  @HiveField(3)
  late double latitude;

  @HiveField(4)
  late double longitude;

  @HiveField(5)
  late List<String> amenities;

  @HiveField(6)
  late DateTime lastUpdated;

  ClubEntity toEntity() {
    return ClubEntity(
      id: id,
      name: name,
      description: description,
      location: LocationEntity(latitude: latitude, longitude: longitude),
      amenities: amenities,
      rating: const RatingEntity(average: 0, count: 0),
      reciprocalInfo: const ReciprocalInfoEntity(
        accessType: 'unknown',
        guestPolicy: 'unknown',
        advanceBooking: false,
        fees: FeesEntity(facilityFee: 0, guestFee: 0),
      ),
    );
  }
}

// Local Source Implementation
class ClubLocalSource {
  final Box<CachedClub> _clubBox;

  ClubLocalSource(this._clubBox);

  Future<void> cacheClubs(List<ClubModel> clubs) async {
    await _clubBox.clear();
    for (final club in clubs) {
      final cachedClub = CachedClub()
        ..id = club.id
        ..name = club.name
        ..description = club.description
        ..latitude = club.location.coordinates.lat
        ..longitude = club.location.coordinates.lng
        ..amenities = club.amenities
        ..lastUpdated = DateTime.now();
      await _clubBox.put(club.id, cachedClub);
    }
  }

  Future<List<CachedClub>> getCachedClubs() async {
    return _clubBox.values.toList();
  }
}
```

## UI Architecture and Design System

### 1. Atomic Design Components

```dart
// Atoms - Basic building blocks
class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final ButtonSize size;

  const PrimaryButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.size = ButtonSize.medium,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
        minimumSize: _getButtonSize(size),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: isLoading
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : Text(text),
    );
  }

  Size _getButtonSize(ButtonSize size) {
    switch (size) {
      case ButtonSize.small:
        return const Size(120, 36);
      case ButtonSize.medium:
        return const Size(200, 48);
      case ButtonSize.large:
        return const Size(280, 56);
    }
  }
}

// Molecules - Component combinations
class SearchBar extends StatefulWidget {
  final String hint;
  final Function(String) onSearch;
  final Function()? onFilter;

  const SearchBar({
    Key? key,
    required this.hint,
    required this.onSearch,
    this.onFilter,
  }) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final _controller = TextEditingController();
  Timer? _debounce;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.grey),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: widget.hint,
                border: InputBorder.none,
              ),
              onChanged: _onSearchChanged,
            ),
          ),
          if (widget.onFilter != null) ...[
            const SizedBox(width: 8),
            IconButton(
              onPressed: widget.onFilter,
              icon: const Icon(Icons.filter_list),
            ),
          ],
        ],
      ),
    );
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      widget.onSearch(query);
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }
}

// Organisms - Complex components
class ClubCard extends StatelessWidget {
  final ClubEntity club;
  final VoidCallback onTap;
  final bool showDistance;

  const ClubCard({
    Key? key,
    required this.club,
    required this.onTap,
    this.showDistance = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClubImage(
                    imageUrl: club.images.first,
                    size: 60,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          club.name,
                          style: Theme.of(context).textTheme.titleMedium,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          club.location.address,
                          style: Theme.of(context).textTheme.bodySmall,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (showDistance) ...[
                          const SizedBox(height: 4),
                          Text(
                            '${club.location.distanceMiles.toStringAsFixed(1)} miles away',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      RatingDisplay(rating: club.rating),
                      const SizedBox(height: 8),
                      ReciprocalBadge(info: club.reciprocalInfo),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              AmenityChips(amenities: club.amenities.take(3).toList()),
            ],
          ),
        ),
      ),
    );
  }
}
```

### 2. Theme Configuration

```dart
// app/themes/app_theme.dart
class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.light,
    ),
    textTheme: GoogleFonts.interTextTheme().copyWith(
      displayLarge: GoogleFonts.inter(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        height: 1.2,
      ),
      headlineLarge: GoogleFonts.inter(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        height: 1.3,
      ),
      titleLarge: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: 1.4,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.5,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.surface,
      foregroundColor: AppColors.onSurface,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.onSurface,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
        minimumSize: const Size(200, 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    cardTheme: CardTheme(
      color: AppColors.surface,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surfaceVariant,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.outline),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.primary, width: 2),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.dark,
    ),
    // Dark theme configuration...
  );
}
```

## Error Handling and Logging

### 1. Global Error Handler

```dart
// core/errors/error_handler.dart
class GlobalErrorHandler {
  static void initialize() {
    FlutterError.onError = (FlutterErrorDetails details) {
      _logError(details.exception, details.stack);
      if (kReleaseMode) {
        FirebaseCrashlytics.instance.recordFlutterFatalError(details);
      }
    };

    PlatformDispatcher.instance.onError = (error, stack) {
      _logError(error, stack);
      if (kReleaseMode) {
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      }
      return true;
    };
  }

  static void _logError(dynamic error, StackTrace? stack) {
    logger.e('Global Error: $error', error: error, stackTrace: stack);
  }

  static void handleApiError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectionTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        _showErrorSnackBar('Connection timeout. Please try again.');
        break;
      case DioErrorType.badResponse:
        final statusCode = error.response?.statusCode;
        switch (statusCode) {
          case 401:
            _handleUnauthorized();
            break;
          case 403:
            _showErrorSnackBar('Access denied.');
            break;
          case 404:
            _showErrorSnackBar('Resource not found.');
            break;
          case 500:
            _showErrorSnackBar('Server error. Please try again later.');
            break;
          default:
            _showErrorSnackBar('An error occurred. Please try again.');
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.unknown:
        _showErrorSnackBar('Network error. Please check your connection.');
        break;
    }
  }

  static void _handleUnauthorized() {
    // Clear auth tokens and redirect to login
    GetIt.instance<AuthRepository>().logout();
    navigatorKey.currentState?.pushNamedAndRemoveUntil('/login', (route) => false);
  }

  static void _showErrorSnackBar(String message) {
    final context = navigatorKey.currentContext;
    if (context != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }
  }
}
```

### 2. Custom Exceptions

```dart
// core/errors/exceptions.dart
abstract class AppException implements Exception {
  final String message;
  final String? code;

  const AppException(this.message, [this.code]);
}

class ServerException extends AppException {
  const ServerException(String message, [String? code]) : super(message, code);
}

class CacheException extends AppException {
  const CacheException(String message) : super(message);
}

class NetworkException extends AppException {
  const NetworkException(String message) : super(message);
}

class ValidationException extends AppException {
  final Map<String, String> errors;

  const ValidationException(String message, this.errors) : super(message);
}

// Failure classes for Either pattern
abstract class Failure {
  final String message;
  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}

class CacheFailure extends Failure {
  const CacheFailure(String message) : super(message);
}

class NetworkFailure extends Failure {
  const NetworkFailure(String message) : super(message);
}
```

## Testing Strategy

### 1. Unit Tests

```dart
// test/features/auth/domain/usecases/login_usecase_test.dart
void main() {
  late LoginUsecase usecase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = LoginUsecase(mockAuthRepository);
  });

  group('LoginUsecase', () {
    final tLoginRequest = LoginRequest(
      email: 'test@example.com',
      password: 'password123',
    );
    final tUser = UserEntity(
      id: '1',
      email: 'test@example.com',
      name: 'Test User',
    );

    test('should return UserEntity when login is successful', () async {
      // arrange
      when(mockAuthRepository.login(tLoginRequest))
          .thenAnswer((_) async => Right(tUser));

      // act
      final result = await usecase(tLoginRequest);

      // assert
      expect(result, Right(tUser));
      verify(mockAuthRepository.login(tLoginRequest));
      verifyNoMoreInteractions(mockAuthRepository);
    });

    test('should return ServerFailure when login fails', () async {
      // arrange
      when(mockAuthRepository.login(tLoginRequest))
          .thenAnswer((_) async => Left(ServerFailure('Login failed')));

      // act
      final result = await usecase(tLoginRequest);

      // assert
      expect(result, Left(ServerFailure('Login failed')));
      verify(mockAuthRepository.login(tLoginRequest));
      verifyNoMoreInteractions(mockAuthRepository);
    });
  });
}
```

### 2. Widget Tests

```dart
// test/features/auth/presentation/pages/login_page_test.dart
void main() {
  group('LoginPage', () {
    testWidgets('should display email and password fields', (tester) async {
      // arrange
      await tester.pumpWidget(
        MaterialApp(
          home: ProviderScope(
            child: LoginPage(),
          ),
        ),
      );

      // assert
      expect(find.byType(TextField), findsNWidgets(2));
      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
    });

    testWidgets('should show error when login fails', (tester) async {
      // arrange
      final container = ProviderContainer(
        overrides: [
          authRepositoryProvider.overrideWithValue(MockAuthRepository()),
        ],
      );

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp(home: LoginPage()),
        ),
      );

      // act
      await tester.enterText(find.byType(TextField).first, 'test@example.com');
      await tester.enterText(find.byType(TextField).last, 'wrong_password');
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      // assert
      expect(find.text('Login failed'), findsOneWidget);
    });
  });
}
```

### 3. Integration Tests

```dart
// integration_test/app_test.dart
void main() {
  group('App Integration Tests', () {
    testWidgets('complete login flow', (tester) async {
      await tester.pumpWidget(MyApp());

      // Navigate to login
      await tester.tap(find.text('Login'));
      await tester.pumpAndSettle();

      // Enter credentials
      await tester.enterText(
        find.byKey(const Key('email_field')),
        'test@example.com',
      );
      await tester.enterText(
        find.byKey(const Key('password_field')),
        'password123',
      );

      // Submit login
      await tester.tap(find.byKey(const Key('login_button')));
      await tester.pumpAndSettle();

      // Verify navigation to dashboard
      expect(find.text('Dashboard'), findsOneWidget);
    });
  });
}
```

## Performance Optimization

### 1. Image Loading and Caching

```dart
// shared/widgets/optimized_image.dart
class OptimizedImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Widget? placeholder;
  final Widget? errorWidget;

  const OptimizedImage({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.errorWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) =>
          placeholder ?? const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) =>
          errorWidget ?? const Icon(Icons.error),
      memCacheWidth: width?.toInt(),
      memCacheHeight: height?.toInt(),
      maxWidthDiskCache: 1000,
      maxHeightDiskCache: 1000,
    );
  }
}
```

### 2. List Performance with Infinite Scroll

```dart
// shared/widgets/infinite_scroll_list.dart
class InfiniteScrollList<T> extends StatefulWidget {
  final Future<List<T>> Function(int page) onLoadMore;
  final Widget Function(BuildContext, T) itemBuilder;
  final Widget? separatorBuilder;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final int pageSize;

  const InfiniteScrollList({
    Key? key,
    required this.onLoadMore,
    required this.itemBuilder,
    this.separatorBuilder,
    this.loadingWidget,
    this.errorWidget,
    this.pageSize = 20,
  }) : super(key: key);

  @override
  State<InfiniteScrollList<T>> createState() => _InfiniteScrollListState<T>();
}

class _InfiniteScrollListState<T> extends State<InfiniteScrollList<T>> {
  final List<T> _items = [];
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;
  bool _hasMore = true;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _loadMore();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    if (_items.isEmpty && _isLoading) {
      return widget.loadingWidget ?? const Center(child: CircularProgressIndicator());
    }

    return ListView.separated(
      controller: _scrollController,
      itemCount: _items.length + (_hasMore ? 1 : 0),
      separatorBuilder: (context, index) =>
          widget.separatorBuilder ?? const SizedBox.shrink(),
      itemBuilder: (context, index) {
        if (index >= _items.length) {
          return const Center(child: CircularProgressIndicator());
        }
        return widget.itemBuilder(context, _items[index]);
      },
    );
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      _loadMore();
    }
  }

  Future<void> _loadMore() async {
    if (_isLoading || !_hasMore) return;

    setState(() => _isLoading = true);

    try {
      final newItems = await widget.onLoadMore(_currentPage);
      setState(() {
        _items.addAll(newItems);
        _currentPage++;
        _hasMore = newItems.length == widget.pageSize;
        _isLoading = false;
      });
    } on Exception catch (e) {
      setState(() => _isLoading = false);
      // Handle error
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
```

## Build Configuration and CI/CD

### 1. Build Flavors

```dart
// lib/app/config/app_config.dart
enum Environment { dev, staging, prod }

class AppConfig {
  static late Environment _environment;
  static late String _baseUrl;
  static late String _apiKey;
  static late bool _enableLogging;

  static Environment get environment => _environment;
  static String get baseUrl => _baseUrl;
  static String get apiKey => _apiKey;
  static bool get enableLogging => _enableLogging;

  static void initialize(Environment env) {
    _environment = env;

    switch (env) {
      case Environment.dev:
        _baseUrl = 'https://dev-api.reciprocal-clubs.com';
        _apiKey = 'dev_api_key';
        _enableLogging = true;
        break;
      case Environment.staging:
        _baseUrl = 'https://staging-api.reciprocal-clubs.com';
        _apiKey = 'staging_api_key';
        _enableLogging = true;
        break;
      case Environment.prod:
        _baseUrl = 'https://api.reciprocal-clubs.com';
        _apiKey = 'prod_api_key';
        _enableLogging = false;
        break;
    }
  }
}

// lib/main_dev.dart
void main() {
  AppConfig.initialize(Environment.dev);
  runApp(MyApp());
}

// lib/main_staging.dart
void main() {
  AppConfig.initialize(Environment.staging);
  runApp(MyApp());
}

// lib/main_prod.dart
void main() {
  AppConfig.initialize(Environment.prod);
  runApp(MyApp());
}
```

### 2. GitHub Actions Workflow

```yaml
# .github/workflows/flutter.yml
name: Flutter CI/CD

on:
  push:
    branches: [ main, develop ]
  pull_request:
    branches: [ main ]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v3
    - uses: subosito/flutter-action@v2
      with:
        flutter-version: '3.16.0'

    - name: Get dependencies
      run: flutter pub get

    - name: Run tests
      run: flutter test --coverage

    - name: Upload coverage to Codecov
      uses: codecov/codecov-action@v3

  build_android:
    needs: test
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v3
    - uses: subosito/flutter-action@v2
    - uses: actions/setup-java@v3
      with:
        distribution: 'zulu'
        java-version: '17'

    - name: Build APK
      run: flutter build apk --flavor prod --target lib/main_prod.dart

    - name: Upload APK
      uses: actions/upload-artifact@v3
      with:
        name: app-prod-release.apk
        path: build/app/outputs/flutter-apk/app-prod-release.apk

  build_ios:
    needs: test
    runs-on: macos-latest
    steps:
    - uses: actions/checkout@v3
    - uses: subosito/flutter-action@v2

    - name: Build iOS
      run: flutter build ios --flavor prod --target lib/main_prod.dart --no-codesign
```

This comprehensive Flutter architecture guide provides the foundation for building scalable, maintainable, and performant applications for the Reciprocal Clubs platform. The architecture follows industry best practices and provides clear patterns for development teams to follow.
