import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../../lib/core/errors/failures.dart';
import '../../../../../../lib/features/auth/domain/entities/user.dart';
import '../../../../../../lib/features/auth/presentation/controllers/auth_controller.dart';
import '../../../../../../lib/features/auth/presentation/providers/auth_providers.dart';
import '../../../../../helpers/mock_providers.dart';
import '../../../../../helpers/test_helpers.dart';

void main() {
  late ProviderContainer container;
  late MockLoginUseCase mockLoginUseCase;
  late MockLogoutUseCase mockLogoutUseCase;
  late MockRegisterUseCase mockRegisterUseCase;
  late MockRefreshTokenUseCase mockRefreshTokenUseCase;

  setUp(() {
    TestHelpers.setupFallbackValues();
    mockLoginUseCase = MockLoginUseCase();
    mockLogoutUseCase = MockLogoutUseCase();
    mockRegisterUseCase = MockRegisterUseCase();
    mockRefreshTokenUseCase = MockRefreshTokenUseCase();

    container = ProviderContainer(
      overrides: [
        loginUseCaseProvider.overrideWithValue(mockLoginUseCase),
        logoutUseCaseProvider.overrideWithValue(mockLogoutUseCase),
        registerUseCaseProvider.overrideWithValue(mockRegisterUseCase),
        refreshTokenUseCaseProvider.overrideWithValue(mockRefreshTokenUseCase),
      ],
    );
  });

  tearDown(() {
    container.dispose();
    MockProviders.reset();
  });

  group('AuthController', () {
    const testUser = User(
      id: '123',
      email: TestConstants.testEmail,
      firstName: TestConstants.testFirstName,
      lastName: TestConstants.testLastName,
      isVerified: true,
    );

    test('initial state should be loading', () {
      final state = container.read(authControllerProvider);
      expect(state.isLoading, true);
      expect(state.user, null);
      expect(state.error, null);
    });

    group('login', () {
      test('should update state to authenticated when login succeeds', () async {
        when(() => mockLoginUseCase(any())).thenAnswer(
          (_) async => const Right(testUser),
        );

        final controller = container.read(authControllerProvider.notifier);
        await controller.login(
          email: TestConstants.testEmail,
          password: TestConstants.testPassword,
        );

        final state = container.read(authControllerProvider);
        expect(state.isLoading, false);
        expect(state.user, testUser);
        expect(state.error, null);
        expect(state.isAuthenticated, true);
      });

      test('should update state with error when login fails', () async {
        const failure = AuthFailure.invalidCredentials();
        when(() => mockLoginUseCase(any())).thenAnswer(
          (_) async => const Left(failure),
        );

        final controller = container.read(authControllerProvider.notifier);
        await controller.login(
          email: TestConstants.testEmail,
          password: TestConstants.testPassword,
        );

        final state = container.read(authControllerProvider);
        expect(state.isLoading, false);
        expect(state.user, null);
        expect(state.error, isNotNull);
        expect(state.isAuthenticated, false);
      });

      test('should set loading state during login', () async {
        when(() => mockLoginUseCase(any())).thenAnswer(
          (_) async {
            await Future.delayed(const Duration(milliseconds: 100));
            return const Right(testUser);
          },
        );

        final controller = container.read(authControllerProvider.notifier);
        final loginFuture = controller.login(
          email: TestConstants.testEmail,
          password: TestConstants.testPassword,
        );

        await TestHelpers.delay(const Duration(milliseconds: 50));
        final loadingState = container.read(authControllerProvider);
        expect(loadingState.isLoading, true);

        await loginFuture;
        final finalState = container.read(authControllerProvider);
        expect(finalState.isLoading, false);
      });
    });

    group('register', () {
      test('should update state to authenticated when registration succeeds', () async {
        when(() => mockRegisterUseCase(any())).thenAnswer(
          (_) async => const Right(testUser),
        );

        final controller = container.read(authControllerProvider.notifier);
        await controller.register(
          email: TestConstants.testEmail,
          password: TestConstants.testPassword,
          confirmPassword: TestConstants.testPassword,
          firstName: TestConstants.testFirstName,
          lastName: TestConstants.testLastName,
        );

        final state = container.read(authControllerProvider);
        expect(state.isLoading, false);
        expect(state.user, testUser);
        expect(state.error, null);
        expect(state.isAuthenticated, true);
      });

      test('should update state with error when passwords do not match', () async {
        final controller = container.read(authControllerProvider.notifier);
        await controller.register(
          email: TestConstants.testEmail,
          password: TestConstants.testPassword,
          confirmPassword: 'DifferentPassword123!',
          firstName: TestConstants.testFirstName,
          lastName: TestConstants.testLastName,
        );

        final state = container.read(authControllerProvider);
        expect(state.isLoading, false);
        expect(state.user, null);
        expect(state.error, isNotNull);
        expect(state.isAuthenticated, false);
        verifyNever(() => mockRegisterUseCase(any()));
      });
    });

    group('logout', () {
      test('should clear user state when logout succeeds', () async {
        when(() => mockLogoutUseCase()).thenAnswer(
          (_) async => const Right(unit),
        );

        container.read(authControllerProvider.notifier).state = AuthState(
          user: testUser,
          isLoading: false,
          error: null,
        );

        final controller = container.read(authControllerProvider.notifier);
        await controller.logout();

        final state = container.read(authControllerProvider);
        expect(state.isLoading, false);
        expect(state.user, null);
        expect(state.error, null);
        expect(state.isAuthenticated, false);
      });

      test('should clear user state even when logout fails', () async {
        const failure = AuthFailure.serverError();
        when(() => mockLogoutUseCase()).thenAnswer(
          (_) async => const Left(failure),
        );

        container.read(authControllerProvider.notifier).state = AuthState(
          user: testUser,
          isLoading: false,
          error: null,
        );

        final controller = container.read(authControllerProvider.notifier);
        await controller.logout();

        final state = container.read(authControllerProvider);
        expect(state.isLoading, false);
        expect(state.user, null);
        expect(state.error, null);
        expect(state.isAuthenticated, false);
      });
    });

    group('refreshToken', () {
      test('should update user when token refresh succeeds', () async {
        const updatedUser = User(
          id: '123',
          email: TestConstants.testEmail,
          firstName: TestConstants.testFirstName,
          lastName: TestConstants.testLastName,
          isVerified: true,
        );

        when(() => mockRefreshTokenUseCase()).thenAnswer(
          (_) async => const Right(updatedUser),
        );

        container.read(authControllerProvider.notifier).state = AuthState(
          user: testUser,
          isLoading: false,
          error: null,
        );

        final controller = container.read(authControllerProvider.notifier);
        await controller.refreshToken();

        final state = container.read(authControllerProvider);
        expect(state.isLoading, false);
        expect(state.user, updatedUser);
        expect(state.error, null);
        expect(state.isAuthenticated, true);
      });

      test('should logout user when token refresh fails', () async {
        const failure = AuthFailure.tokenExpired();
        when(() => mockRefreshTokenUseCase()).thenAnswer(
          (_) async => const Left(failure),
        );
        when(() => mockLogoutUseCase()).thenAnswer(
          (_) async => const Right(unit),
        );

        container.read(authControllerProvider.notifier).state = AuthState(
          user: testUser,
          isLoading: false,
          error: null,
        );

        final controller = container.read(authControllerProvider.notifier);
        await controller.refreshToken();

        final state = container.read(authControllerProvider);
        expect(state.isLoading, false);
        expect(state.user, null);
        expect(state.error, null);
        expect(state.isAuthenticated, false);
        verify(() => mockLogoutUseCase()).called(1);
      });
    });

    group('clearError', () {
      test('should clear error from state', () {
        container.read(authControllerProvider.notifier).state = AuthState(
          user: null,
          isLoading: false,
          error: 'Some error message',
        );

        final controller = container.read(authControllerProvider.notifier);
        controller.clearError();

        final state = container.read(authControllerProvider);
        expect(state.error, null);
      });
    });
  });
}