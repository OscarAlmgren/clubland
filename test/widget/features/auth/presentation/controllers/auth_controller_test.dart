// Placeholder imports (adjust as needed for your project structure)
import 'package:clubland/core/errors/error_handler.dart';
import 'package:clubland/core/errors/failures.dart';
import 'package:clubland/core/providers/core_providers.dart';
import 'package:clubland/core/storage/secure_storage.dart';
import 'package:clubland/features/auth/domain/entities/auth_session_entity.dart';
import 'package:clubland/features/auth/domain/entities/user_entity.dart';
import 'package:clubland/features/auth/domain/repositories/auth_repository.dart';
import 'package:clubland/features/auth/domain/usecases/login_usecase.dart';
import 'package:clubland/features/auth/presentation/controllers/auth_controller.dart';
import 'package:clubland/features/auth/presentation/providers/auth_providers.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../helpers/test_helpers.dart';

// Mock classes
class MockAuthRepository extends Mock implements AuthRepository {}

class MockLoginUsecase extends Mock implements LoginUsecase {}

class MockRegisterUsecase extends Mock implements RegisterUsecase {}

class MockLogoutUsecase extends Mock implements LogoutUsecase {}

class MockRefreshTokenUsecase extends Mock implements RefreshTokenUsecase {}

class MockGetCurrentUserUsecase extends Mock implements GetCurrentUserUsecase {}

class MockCheckAuthStatusUsecase extends Mock
    implements CheckAuthStatusUsecase {}

class MockHankoLoginUsecase extends Mock implements HankoLoginUsecase {}

class MockBiometricAuthUsecase extends Mock implements BiometricAuthUsecase {}

class MockSecureStorageService extends Mock implements SecureStorageService {}

void main() {
  late MockAuthRepository mockAuthRepository;
  late MockLoginUsecase mockLoginUsecase;
  late MockLogoutUsecase mockLogoutUsecase;
  late MockRegisterUsecase mockRegisterUsecase;
  late MockRefreshTokenUsecase mockRefreshTokenUsecase;
  late MockGetCurrentUserUsecase mockGetCurrentUserUsecase;
  late MockSecureStorageService mockSecureStorageService;
  late MockHankoLoginUsecase mockHankoLoginUsecase;
  late MockBiometricAuthUsecase mockBiometricAuthUsecase;

  setUp(() {
    TestHelpers.setupFallbackValues();

    // Initialize ErrorHandler for tests
    ErrorHandler.initialize(
      navigatorKey: GlobalKey<NavigatorState>(),
      scaffoldMessengerKey: GlobalKey<ScaffoldMessengerState>(),
      logger: Logger(level: Level.off), // Silent logger for tests
    );

    mockAuthRepository = MockAuthRepository();
    mockLoginUsecase = MockLoginUsecase();
    mockLogoutUsecase = MockLogoutUsecase();
    mockRegisterUsecase = MockRegisterUsecase();
    mockRefreshTokenUsecase = MockRefreshTokenUsecase();
    mockGetCurrentUserUsecase = MockGetCurrentUserUsecase();
    mockSecureStorageService = MockSecureStorageService();
    mockHankoLoginUsecase = MockHankoLoginUsecase();
    mockBiometricAuthUsecase = MockBiometricAuthUsecase();

    // Mock auth repository stream
    when(
      () => mockAuthRepository.authStateChanges,
    ).thenAnswer((_) => Stream.value(null));
  });

  List<Override> getOverrides() => [
    authRepositoryProvider.overrideWithValue(mockAuthRepository),
    loginUsecaseProvider.overrideWithValue(mockLoginUsecase),
    logoutUsecaseProvider.overrideWithValue(mockLogoutUsecase),
    registerUsecaseProvider.overrideWithValue(mockRegisterUsecase),
    refreshTokenUsecaseProvider.overrideWithValue(mockRefreshTokenUsecase),
    getCurrentUserUsecaseProvider.overrideWithValue(mockGetCurrentUserUsecase),
    secureStorageServiceProvider.overrideWithValue(mockSecureStorageService),
    // Add missing providers
    hankoLoginUsecaseProvider.overrideWithValue(mockHankoLoginUsecase),
    biometricAuthUsecaseProvider.overrideWithValue(mockBiometricAuthUsecase),
    loggerProvider.overrideWithValue(Logger(level: Level.off)),
    // Override currentUserProvider to avoid circular dependency
    currentUserProvider.overrideWith((ref) => null),
  ];

  // Direct ProviderContainer (no widget tree) — used by unit-style tests
  // from the old suite. Does NOT override currentUserProvider so derived
  // providers (currentUserProvider, isAuthenticatedProvider) work correctly.
  ProviderContainer makeDirectContainer() {
    return ProviderContainer(
      overrides: [
        authRepositoryProvider.overrideWithValue(mockAuthRepository),
        loginUsecaseProvider.overrideWithValue(mockLoginUsecase),
        hankoLoginUsecaseProvider.overrideWithValue(mockHankoLoginUsecase),
        registerUsecaseProvider.overrideWithValue(mockRegisterUsecase),
        logoutUsecaseProvider.overrideWithValue(mockLogoutUsecase),
        refreshTokenUsecaseProvider.overrideWithValue(mockRefreshTokenUsecase),
        biometricAuthUsecaseProvider.overrideWithValue(
          mockBiometricAuthUsecase,
        ),
        getCurrentUserUsecaseProvider.overrideWithValue(
          mockGetCurrentUserUsecase,
        ),
        secureStorageServiceProvider.overrideWithValue(mockSecureStorageService),
        loggerProvider.overrideWithValue(Logger(level: Level.off)),
      ],
    );
  }

  group('AuthController', () {
    final testUser = UserEntity(
      id: '123',
      email: TestConstants.testEmail,
      firstName: TestConstants.testFirstName,
      lastName: TestConstants.testLastName,
      createdAt: DateTime.now(),
    );

    final testSession = AuthSessionEntity(
      accessToken: TestConstants.testToken,
      refreshToken: TestConstants.testRefreshToken,
      expiresAt: DateTime.now().add(const Duration(hours: 1)),
      user: testUser,
    );

    // ---------------------------------------------------------------
    // Widget-style tests (testWidgets) — original surviving-file tests
    // ---------------------------------------------------------------

    testWidgets('initial state should be loading', (tester) async {
      // Mock getCurrentUser to return null
      when(
        () => mockGetCurrentUserUsecase(),
      ).thenAnswer((_) async => const Right(null));

      late ProviderContainer container;
      await tester.pumpWidget(
        MaterialApp(
          home: ProviderScope(
            overrides: getOverrides(),
            child: Consumer(
              builder: (context, ref, child) {
                container = ProviderScope.containerOf(context);
                return Container();
              },
            ),
          ),
        ),
      );

      await tester.pump();
      final state = await container.read(authControllerProvider.future);
      expect(state, null);
    });

    group('login', () {
      testWidgets('should update state to authenticated when login succeeds', (
        tester,
      ) async {
        when(
          () => mockGetCurrentUserUsecase(),
        ).thenAnswer((_) async => const Right(null));
        when(
          () => mockLoginUsecase(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenAnswer((_) async => Right(testSession));

        late ProviderContainer container;
        await tester.pumpWidget(
          MaterialApp(
            home: ProviderScope(
              overrides: getOverrides(),
              child: Consumer(
                builder: (context, ref, child) {
                  container = ProviderScope.containerOf(context);
                  return Container();
                },
              ),
            ),
          ),
        );

        await tester.pump();
        final controller = container.read(authControllerProvider.notifier);
        await controller.login(
          email: TestConstants.testEmail,
          password: TestConstants.testPassword,
        );

        final state = container.read(authControllerProvider);
        expect(state.value, testUser);
        expect(state.isLoading, false);
        expect(state.hasError, false);
      });

      testWidgets('should update state with error when login fails', (
        tester,
      ) async {
        const failure = AuthFailure('Invalid credentials');
        when(
          () => mockGetCurrentUserUsecase(),
        ).thenAnswer((_) async => const Right(null));
        when(
          () => mockLoginUsecase(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenAnswer((_) async => const Left(failure));

        late ProviderContainer container;
        await tester.pumpWidget(
          MaterialApp(
            home: ProviderScope(
              overrides: getOverrides(),
              child: Consumer(
                builder: (context, ref, child) {
                  container = ProviderScope.containerOf(context);
                  return Container();
                },
              ),
            ),
          ),
        );

        await tester.pump();
        final controller = container.read(authControllerProvider.notifier);
        await controller.login(
          email: TestConstants.testEmail,
          password: TestConstants.testPassword,
        );

        final state = container.read(authControllerProvider);
        expect(state.hasError, true);
        expect(state.error, failure);

        // When state has error, value should be null
        expect(state.value, null);
      });
    });

    group('register', () {
      testWidgets(
        'should update state to authenticated when registration succeeds',
        (tester) async {
          when(
            () => mockGetCurrentUserUsecase(),
          ).thenAnswer((_) async => const Right(null));
          when(
            () => mockRegisterUsecase(
              email: any(named: 'email'),
              password: any(named: 'password'),
              confirmPassword: any(named: 'confirmPassword'),
              firstName: any(named: 'firstName'),
              lastName: any(named: 'lastName'),
              clubId: any(named: 'clubId'),
            ),
          ).thenAnswer((_) async => Right(testSession));

          late ProviderContainer container;
          await tester.pumpWidget(
            MaterialApp(
              home: ProviderScope(
                overrides: getOverrides(),
                child: Consumer(
                  builder: (context, ref, child) {
                    container = ProviderScope.containerOf(context);
                    return Container();
                  },
                ),
              ),
            ),
          );

          await tester.pump();
          final controller = container.read(authControllerProvider.notifier);
          await controller.register(
            email: TestConstants.testEmail,
            password: TestConstants.testPassword,
            confirmPassword: TestConstants.testPassword,
            firstName: TestConstants.testFirstName,
            lastName: TestConstants.testLastName,
          );

          final state = container.read(authControllerProvider);
          expect(state.value, testUser);
          expect(state.isLoading, false);
          expect(state.hasError, false);
        },
      );
    });

    group('logout', () {
      testWidgets('should clear user state when logout succeeds', (
        tester,
      ) async {
        when(
          () => mockGetCurrentUserUsecase(),
        ).thenAnswer((_) async => Right(testUser));
        when(
          () => mockLogoutUsecase(),
        ).thenAnswer((_) async => const Right(true));

        late ProviderContainer container;
        await tester.pumpWidget(
          MaterialApp(
            home: ProviderScope(
              overrides: getOverrides(),
              child: Consumer(
                builder: (context, ref, child) {
                  container = ProviderScope.containerOf(context);
                  return Container();
                },
              ),
            ),
          ),
        );

        await tester.pump();
        // Initialize with logged in user
        await container.read(authControllerProvider.future);

        final controller = container.read(authControllerProvider.notifier);
        await controller.logout();

        final state = container.read(authControllerProvider);
        expect(state.value, null);
        expect(state.isLoading, false);
        expect(state.hasError, false);
      });

      testWidgets('should clear user state even when logout fails', (
        tester,
      ) async {
        const failure = AuthFailure('Server error');
        when(
          () => mockGetCurrentUserUsecase(),
        ).thenAnswer((_) async => Right(testUser));
        when(
          () => mockLogoutUsecase(),
        ).thenAnswer((_) async => const Left(failure));

        late ProviderContainer container;
        await tester.pumpWidget(
          MaterialApp(
            home: ProviderScope(
              overrides: getOverrides(),
              child: Consumer(
                builder: (context, ref, child) {
                  container = ProviderScope.containerOf(context);
                  return Container();
                },
              ),
            ),
          ),
        );

        await tester.pump();
        // Initialize with logged in user
        await container.read(authControllerProvider.future);

        final controller = container.read(authControllerProvider.notifier);
        await controller.logout();

        final state = container.read(authControllerProvider);
        expect(state.value, null);
        expect(state.isLoading, false);
        expect(state.hasError, false);
      });
    });

    group('refreshToken', () {
      testWidgets('should logout user when token refresh fails', (
        tester,
      ) async {
        const failure = AuthFailure('Token expired');
        when(
          () => mockGetCurrentUserUsecase(),
        ).thenAnswer((_) async => Right(testUser));
        when(
          () => mockSecureStorageService.getRefreshToken(),
        ).thenAnswer((_) async => TestConstants.testRefreshToken);
        when(
          () =>
              mockRefreshTokenUsecase(refreshToken: any(named: 'refreshToken')),
        ).thenAnswer((_) async => const Left(failure));
        when(
          () => mockLogoutUsecase(),
        ).thenAnswer((_) async => const Right(true));

        late ProviderContainer container;
        await tester.pumpWidget(
          MaterialApp(
            home: ProviderScope(
              overrides: getOverrides(),
              child: Consumer(
                builder: (context, ref, child) {
                  container = ProviderScope.containerOf(context);
                  return Container();
                },
              ),
            ),
          ),
        );

        await tester.pump();
        // Initialize with logged in user
        await container.read(authControllerProvider.future);

        final controller = container.read(authControllerProvider.notifier);
        await controller.refreshToken();

        final state = container.read(authControllerProvider);
        expect(state.value, null);
        verify(() => mockLogoutUsecase()).called(1);
      });
    });

    group('getters', () {
      testWidgets('isAuthenticated should return true when user exists', (
        tester,
      ) async {
        when(
          () => mockGetCurrentUserUsecase(),
        ).thenAnswer((_) async => Right(testUser));

        late ProviderContainer container;
        await tester.pumpWidget(
          MaterialApp(
            home: ProviderScope(
              overrides: getOverrides(),
              child: Consumer(
                builder: (context, ref, child) {
                  container = ProviderScope.containerOf(context);
                  return Container();
                },
              ),
            ),
          ),
        );

        await tester.pump();
        await container.read(authControllerProvider.future);
        final controller = container.read(authControllerProvider.notifier);

        expect(controller.isAuthenticated, true);
      });

      testWidgets('isAuthenticated should return false when user is null', (
        tester,
      ) async {
        when(
          () => mockGetCurrentUserUsecase(),
        ).thenAnswer((_) async => const Right(null));

        late ProviderContainer container;
        await tester.pumpWidget(
          MaterialApp(
            home: ProviderScope(
              overrides: getOverrides(),
              child: Consumer(
                builder: (context, ref, child) {
                  container = ProviderScope.containerOf(context);
                  return Container();
                },
              ),
            ),
          ),
        );

        await tester.pump();
        await container.read(authControllerProvider.future);
        final controller = container.read(authControllerProvider.notifier);

        expect(controller.isAuthenticated, false);
      });

      testWidgets('currentUser should return the current user', (tester) async {
        when(
          () => mockGetCurrentUserUsecase(),
        ).thenAnswer((_) async => Right(testUser));

        late ProviderContainer container;
        await tester.pumpWidget(
          MaterialApp(
            home: ProviderScope(
              overrides: getOverrides(),
              child: Consumer(
                builder: (context, ref, child) {
                  container = ProviderScope.containerOf(context);
                  return Container();
                },
              ),
            ),
          ),
        );

        await tester.pump();
        await container.read(authControllerProvider.future);
        final controller = container.read(authControllerProvider.notifier);

        expect(controller.currentUser, testUser);
      });
    });

    // ---------------------------------------------------------------
    // Unit-style tests (test + ProviderContainer) — ported from old
    // comprehensive suite. ErrorHandler is initialized in setUp above.
    // ---------------------------------------------------------------

    group('build (initialization)', () {
      test('should load stored user on initialization', () async {
        when(
          () => mockGetCurrentUserUsecase(),
        ).thenAnswer((_) async => Right(testUser));

        final container = makeDirectContainer();
        addTearDown(container.dispose);

        await container.read(authControllerProvider.future);

        final state = container.read(authControllerProvider);
        expect(state.value, testUser);
        verify(() => mockGetCurrentUserUsecase()).called(1);
      });

      test('should handle no stored user gracefully', () async {
        when(
          () => mockGetCurrentUserUsecase(),
        ).thenAnswer((_) async => const Right(null));

        final container = makeDirectContainer();
        addTearDown(container.dispose);

        await container.read(authControllerProvider.future);

        final state = container.read(authControllerProvider);
        expect(state.value, isNull);
      });

      test('should handle storage failure gracefully', () async {
        when(
          () => mockGetCurrentUserUsecase(),
        ).thenAnswer((_) async => Left(StorageFailure.readError()));

        final container = makeDirectContainer();
        addTearDown(container.dispose);

        await container.read(authControllerProvider.future);

        final state = container.read(authControllerProvider);
        expect(state.value, isNull);
        expect(state.hasError, false); // Should not error, just return null
      });
    });

    group('login (additional coverage)', () {
      test('should update state to loading during login', () async {
        when(
          () => mockGetCurrentUserUsecase(),
        ).thenAnswer((_) async => const Right(null));
        when(
          () => mockLoginUsecase(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenAnswer((_) async => Right(testSession));

        final container = makeDirectContainer();
        addTearDown(container.dispose);
        await container.read(authControllerProvider.future);

        final controller = container.read(authControllerProvider.notifier);
        final loginFuture = controller.login(
          email: 'test@example.com',
          password: 'Password123!',
        );

        // assert - check loading state
        expect(container.read(authControllerProvider).isLoading, true);

        await loginFuture;
      });

      test('should handle exceptions during login', () async {
        when(
          () => mockGetCurrentUserUsecase(),
        ).thenAnswer((_) async => const Right(null));
        when(
          () => mockLoginUsecase(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenThrow(Exception('Network error'));

        final container = makeDirectContainer();
        addTearDown(container.dispose);
        await container.read(authControllerProvider.future);

        final controller = container.read(authControllerProvider.notifier);
        await controller.login(
          email: 'test@example.com',
          password: 'Password123!',
        );

        final state = container.read(authControllerProvider);
        expect(state.hasError, true);
        expect(state.error, isA<Exception>());
      });
    });

    group('loginWithHanko', () {
      test('should update state with user on successful Hanko login', () async {
        when(
          () => mockGetCurrentUserUsecase(),
        ).thenAnswer((_) async => const Right(null));
        when(
          () => mockHankoLoginUsecase(
            email: any(named: 'email'),
            clubSlug: any(named: 'clubSlug'),
          ),
        ).thenAnswer((_) async => Right(testSession));

        final container = makeDirectContainer();
        addTearDown(container.dispose);
        await container.read(authControllerProvider.future);

        final controller = container.read(authControllerProvider.notifier);
        await controller.loginWithHanko(
          email: 'test@example.com',
          clubSlug: 'test-club',
        );

        final state = container.read(authControllerProvider);
        expect(state.value, testUser);
        verify(
          () => mockHankoLoginUsecase(
            email: 'test@example.com',
            clubSlug: 'test-club',
          ),
        ).called(1);
      });

      test('should update state to error on Hanko login failure', () async {
        when(
          () => mockGetCurrentUserUsecase(),
        ).thenAnswer((_) async => const Right(null));
        when(
          () => mockHankoLoginUsecase(
            email: any(named: 'email'),
            clubSlug: any(named: 'clubSlug'),
          ),
        ).thenAnswer((_) async => Left(AuthFailure.invalidCredentials()));

        final container = makeDirectContainer();
        addTearDown(container.dispose);
        await container.read(authControllerProvider.future);

        final controller = container.read(authControllerProvider.notifier);
        await controller.loginWithHanko(
          email: 'test@example.com',
          clubSlug: 'test-club',
        );

        final state = container.read(authControllerProvider);
        expect(state.hasError, true);
      });
    });

    group('register (additional coverage)', () {
      test('should update state to error on registration failure', () async {
        when(
          () => mockGetCurrentUserUsecase(),
        ).thenAnswer((_) async => const Right(null));
        when(
          () => mockRegisterUsecase(
            email: any(named: 'email'),
            password: any(named: 'password'),
            confirmPassword: any(named: 'confirmPassword'),
            firstName: any(named: 'firstName'),
            lastName: any(named: 'lastName'),
            clubId: any(named: 'clubId'),
          ),
        ).thenAnswer((_) async => Left(ValidationFailure.invalidEmail()));

        final container = makeDirectContainer();
        addTearDown(container.dispose);
        await container.read(authControllerProvider.future);

        final controller = container.read(authControllerProvider.notifier);
        await controller.register(
          email: 'invalid-email',
          password: 'Password123!',
          confirmPassword: 'Password123!',
          firstName: 'John',
          lastName: 'Doe',
        );

        final state = container.read(authControllerProvider);
        expect(state.hasError, true);
        expect(state.error, isA<ValidationFailure>());
      });
    });

    group('logout (additional coverage)', () {
      test('should clear state even if logout throws exception', () async {
        when(
          () => mockGetCurrentUserUsecase(),
        ).thenAnswer((_) async => Right(testUser));
        when(() => mockLogoutUsecase()).thenThrow(Exception('Logout error'));

        final container = makeDirectContainer();
        addTearDown(container.dispose);
        await container.read(authControllerProvider.future);

        final controller = container.read(authControllerProvider.notifier);
        await controller.logout();

        final state = container.read(authControllerProvider);
        expect(state.value, isNull);
      });
    });


    group('authenticateWithBiometrics', () {
      test('should call biometric usecase on authentication', () async {
        when(
          () => mockGetCurrentUserUsecase(),
        ).thenAnswer((_) async => const Right(null));
        when(
          () => mockBiometricAuthUsecase.authenticate(),
        ).thenAnswer((_) async => const Right(true));

        final container = makeDirectContainer();
        addTearDown(container.dispose);
        await container.read(authControllerProvider.future);

        final controller = container.read(authControllerProvider.notifier);
        await controller.authenticateWithBiometrics();

        verify(() => mockBiometricAuthUsecase.authenticate()).called(1);
      });

      test('should handle biometric authentication failure', () async {
        when(
          () => mockGetCurrentUserUsecase(),
        ).thenAnswer((_) async => const Right(null));
        when(
          () => mockBiometricAuthUsecase.authenticate(),
        ).thenAnswer((_) async => Left(AuthFailure.biometricFailed()));

        final container = makeDirectContainer();
        addTearDown(container.dispose);
        await container.read(authControllerProvider.future);

        final controller = container.read(authControllerProvider.notifier);
        await controller.authenticateWithBiometrics();

        // assert - should not throw
        verify(() => mockBiometricAuthUsecase.authenticate()).called(1);
      });
    });

    group('setBiometricAuth', () {
      test('should call usecase to enable biometric auth', () async {
        when(
          () => mockGetCurrentUserUsecase(),
        ).thenAnswer((_) async => const Right(null));
        when(
          () => mockBiometricAuthUsecase.setBiometricAuth(enabled: true),
        ).thenAnswer((_) async => const Right(true));

        final container = makeDirectContainer();
        addTearDown(container.dispose);
        await container.read(authControllerProvider.future);

        final controller = container.read(authControllerProvider.notifier);
        await controller.setBiometricAuth(enabled: true);

        verify(
          () => mockBiometricAuthUsecase.setBiometricAuth(enabled: true),
        ).called(1);
      });

      test('should call usecase to disable biometric auth', () async {
        when(
          () => mockGetCurrentUserUsecase(),
        ).thenAnswer((_) async => const Right(null));
        when(
          () => mockBiometricAuthUsecase.setBiometricAuth(enabled: false),
        ).thenAnswer((_) async => const Right(true));

        final container = makeDirectContainer();
        addTearDown(container.dispose);
        await container.read(authControllerProvider.future);

        final controller = container.read(authControllerProvider.notifier);
        await controller.setBiometricAuth(enabled: false);

        verify(
          () => mockBiometricAuthUsecase.setBiometricAuth(enabled: false),
        ).called(1);
      });
    });

    group('helper methods (additional coverage)', () {
      test('hasRole should return true when user has role', () async {
        final userWithRole = testUser.copyWith(roles: ['admin', 'member']);
        when(
          () => mockGetCurrentUserUsecase(),
        ).thenAnswer((_) async => Right(userWithRole));

        final container = makeDirectContainer();
        addTearDown(container.dispose);
        await container.read(authControllerProvider.future);

        final controller = container.read(authControllerProvider.notifier);

        expect(controller.hasRole('admin'), true);
        expect(controller.hasRole('member'), true);
        expect(controller.hasRole('guest'), false);
      });

      test(
        'hasPermission should return true when user has permission',
        () async {
          final userWithPermission = testUser.copyWith(
            permissions: ['read', 'write'],
          );
          when(
            () => mockGetCurrentUserUsecase(),
          ).thenAnswer((_) async => Right(userWithPermission));

          final container = makeDirectContainer();
          addTearDown(container.dispose);
          await container.read(authControllerProvider.future);

          final controller = container.read(authControllerProvider.notifier);

          expect(controller.hasPermission('read'), true);
          expect(controller.hasPermission('write'), true);
          expect(controller.hasPermission('delete'), false);
        },
      );
    });

    group('derived providers', () {
      test(
        'currentUserProvider should return user from auth controller',
        () async {
          when(
            () => mockGetCurrentUserUsecase(),
          ).thenAnswer((_) async => Right(testUser));

          final container = makeDirectContainer();
          addTearDown(container.dispose);
          await container.read(authControllerProvider.future);

          final user = container.read(currentUserProvider);

          expect(user, testUser);
        },
      );

      test(
        'isAuthenticatedProvider should return true when user exists',
        () async {
          when(
            () => mockGetCurrentUserUsecase(),
          ).thenAnswer((_) async => Right(testUser));

          final container = makeDirectContainer();
          addTearDown(container.dispose);
          await container.read(authControllerProvider.future);

          final isAuth = container.read(isAuthenticatedProvider);

          expect(isAuth, true);
        },
      );

      test(
        'isAuthenticatedProvider should return false when user is null',
        () async {
          when(
            () => mockGetCurrentUserUsecase(),
          ).thenAnswer((_) async => const Right(null));

          final container = makeDirectContainer();
          addTearDown(container.dispose);
          await container.read(authControllerProvider.future);

          final isAuth = container.read(isAuthenticatedProvider);

          expect(isAuth, false);
        },
      );
    });
  });
}
