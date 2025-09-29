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
  });
}
