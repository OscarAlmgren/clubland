import 'package:clubland/core/errors/failures.dart';
import 'package:clubland/features/auth/domain/entities/auth_session_entity.dart';
import 'package:clubland/features/auth/domain/entities/user_entity.dart';
import 'package:clubland/features/auth/domain/usecases/login_usecase.dart';
import 'package:clubland/features/auth/presentation/controllers/auth_controller.dart';
import 'package:clubland/features/auth/presentation/providers/auth_providers.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginUsecase extends Mock implements LoginUsecase {}

class MockHankoLoginUsecase extends Mock implements HankoLoginUsecase {}

class MockRegisterUsecase extends Mock implements RegisterUsecase {}

class MockLogoutUsecase extends Mock implements LogoutUsecase {}

class MockRefreshTokenUsecase extends Mock implements RefreshTokenUsecase {}

class MockBiometricAuthUsecase extends Mock implements BiometricAuthUsecase {}

class MockGetCurrentUserUsecase extends Mock implements GetCurrentUserUsecase {}

void main() {
  late MockLoginUsecase mockLoginUsecase;
  late MockHankoLoginUsecase mockHankoLoginUsecase;
  late MockRegisterUsecase mockRegisterUsecase;
  late MockLogoutUsecase mockLogoutUsecase;
  late MockRefreshTokenUsecase mockRefreshTokenUsecase;
  late MockBiometricAuthUsecase mockBiometricAuthUsecase;
  late MockGetCurrentUserUsecase mockGetCurrentUserUsecase;

  setUp(() {
    mockLoginUsecase = MockLoginUsecase();
    mockHankoLoginUsecase = MockHankoLoginUsecase();
    mockRegisterUsecase = MockRegisterUsecase();
    mockLogoutUsecase = MockLogoutUsecase();
    mockRefreshTokenUsecase = MockRefreshTokenUsecase();
    mockBiometricAuthUsecase = MockBiometricAuthUsecase();
    mockGetCurrentUserUsecase = MockGetCurrentUserUsecase();

    // Setup fallback values for mocking
    registerFallbackValue(const UserProfile(fullName: 'Test User'));
  });

  // Test data
  final testUser = UserEntity(
    id: 'user123',
    email: 'test@example.com',
    firstName: 'John',
    lastName: 'Doe',
    status: UserStatus.active,
    createdAt: DateTime(2025, 1, 1),
  );

  final testSession = AuthSessionEntity(
    id: 'session123',
    user: testUser,
    accessToken: 'test_access_token',
    refreshToken: 'test_refresh_token',
    expiresAt: DateTime.now().add(const Duration(hours: 1)),
    createdAt: DateTime.now(),
  );

  ProviderContainer makeProviderContainer() {
    return ProviderContainer(
      overrides: [
        loginUsecaseProvider.overrideWithValue(mockLoginUsecase),
        hankoLoginUsecaseProvider.overrideWithValue(mockHankoLoginUsecase),
        registerUsecaseProvider.overrideWithValue(mockRegisterUsecase),
        logoutUsecaseProvider.overrideWithValue(mockLogoutUsecase),
        refreshTokenUsecaseProvider.overrideWithValue(mockRefreshTokenUsecase),
        biometricAuthUsecaseProvider
            .overrideWithValue(mockBiometricAuthUsecase),
        getCurrentUserUsecaseProvider
            .overrideWithValue(mockGetCurrentUserUsecase),
      ],
    );
  }

  group('AuthController -', () {
    group('build (initialization)', () {
      test('should start with loading state', () async {
        // arrange
        when(() => mockGetCurrentUserUsecase())
            .thenAnswer((_) async => const Right(null));

        final container = makeProviderContainer();

        // act
        final controller = container.read(authControllerProvider);

        // assert
        expect(controller.isLoading, true);

        // cleanup
        container.dispose();
      });

      test('should load stored user on initialization', () async {
        // arrange
        when(() => mockGetCurrentUserUsecase())
            .thenAnswer((_) async => Right(testUser));

        final container = makeProviderContainer();

        // act
        await container.read(authControllerProvider.future);

        // assert
        final state = container.read(authControllerProvider);
        expect(state.value, testUser);
        verify(() => mockGetCurrentUserUsecase()).called(1);

        // cleanup
        container.dispose();
      });

      test('should handle no stored user gracefully', () async {
        // arrange
        when(() => mockGetCurrentUserUsecase())
            .thenAnswer((_) async => const Right(null));

        final container = makeProviderContainer();

        // act
        await container.read(authControllerProvider.future);

        // assert
        final state = container.read(authControllerProvider);
        expect(state.value, isNull);

        // cleanup
        container.dispose();
      });

      test('should handle storage failure gracefully', () async {
        // arrange
        when(() => mockGetCurrentUserUsecase())
            .thenAnswer((_) async => Left(StorageFailure.readError()));

        final container = makeProviderContainer();

        // act
        await container.read(authControllerProvider.future);

        // assert
        final state = container.read(authControllerProvider);
        expect(state.value, isNull);
        expect(state.hasError, false); // Should not error, just return null

        // cleanup
        container.dispose();
      });
    });

    group('login', () {
      test('should update state to loading during login', () async {
        // arrange
        when(() => mockGetCurrentUserUsecase())
            .thenAnswer((_) async => const Right(null));
        when(() => mockLoginUsecase(
              email: any(named: 'email'),
              password: any(named: 'password'),
            )).thenAnswer((_) async => Right(testSession));

        final container = makeProviderContainer();
        await container.read(authControllerProvider.future);

        // act
        final controller = container.read(authControllerProvider.notifier);
        final loginFuture = controller.login(
          email: 'test@example.com',
          password: 'Password123!',
        );

        // assert - check loading state
        expect(container.read(authControllerProvider).isLoading, true);

        await loginFuture;

        // cleanup
        container.dispose();
      });

      test('should update state with user on successful login', () async {
        // arrange
        when(() => mockGetCurrentUserUsecase())
            .thenAnswer((_) async => const Right(null));
        when(() => mockLoginUsecase(
              email: any(named: 'email'),
              password: any(named: 'password'),
            )).thenAnswer((_) async => Right(testSession));

        final container = makeProviderContainer();
        await container.read(authControllerProvider.future);

        // act
        final controller = container.read(authControllerProvider.notifier);
        await controller.login(
          email: 'test@example.com',
          password: 'Password123!',
        );

        // assert
        final state = container.read(authControllerProvider);
        expect(state.value, testUser);
        expect(state.value?.email, 'test@example.com');
        verify(() => mockLoginUsecase(
              email: 'test@example.com',
              password: 'Password123!',
            )).called(1);

        // cleanup
        container.dispose();
      });

      test('should update state to error on login failure', () async {
        // arrange
        when(() => mockGetCurrentUserUsecase())
            .thenAnswer((_) async => const Right(null));
        when(() => mockLoginUsecase(
              email: any(named: 'email'),
              password: any(named: 'password'),
            )).thenAnswer((_) async => Left(AuthFailure.invalidCredentials()));

        final container = makeProviderContainer();
        await container.read(authControllerProvider.future);

        // act
        final controller = container.read(authControllerProvider.notifier);
        await controller.login(
          email: 'test@example.com',
          password: 'wrongpassword',
        );

        // assert
        final state = container.read(authControllerProvider);
        expect(state.hasError, true);
        expect(state.error, isA<AuthFailure>());

        // cleanup
        container.dispose();
      });

      test('should handle exceptions during login', () async {
        // arrange
        when(() => mockGetCurrentUserUsecase())
            .thenAnswer((_) async => const Right(null));
        when(() => mockLoginUsecase(
              email: any(named: 'email'),
              password: any(named: 'password'),
            )).thenThrow(Exception('Network error'));

        final container = makeProviderContainer();
        await container.read(authControllerProvider.future);

        // act
        final controller = container.read(authControllerProvider.notifier);
        await controller.login(
          email: 'test@example.com',
          password: 'Password123!',
        );

        // assert
        final state = container.read(authControllerProvider);
        expect(state.hasError, true);
        expect(state.error, isA<Exception>());

        // cleanup
        container.dispose();
      });
    });

    group('loginWithHanko', () {
      test('should update state with user on successful Hanko login', () async {
        // arrange
        when(() => mockGetCurrentUserUsecase())
            .thenAnswer((_) async => const Right(null));
        when(() => mockHankoLoginUsecase(email: any(named: 'email')))
            .thenAnswer((_) async => Right(testSession));

        final container = makeProviderContainer();
        await container.read(authControllerProvider.future);

        // act
        final controller = container.read(authControllerProvider.notifier);
        await controller.loginWithHanko(email: 'test@example.com');

        // assert
        final state = container.read(authControllerProvider);
        expect(state.value, testUser);
        verify(() => mockHankoLoginUsecase(email: 'test@example.com'))
            .called(1);

        // cleanup
        container.dispose();
      });

      test('should update state to error on Hanko login failure', () async {
        // arrange
        when(() => mockGetCurrentUserUsecase())
            .thenAnswer((_) async => const Right(null));
        when(() => mockHankoLoginUsecase(email: any(named: 'email')))
            .thenAnswer((_) async => Left(AuthFailure.invalidCredentials()));

        final container = makeProviderContainer();
        await container.read(authControllerProvider.future);

        // act
        final controller = container.read(authControllerProvider.notifier);
        await controller.loginWithHanko(email: 'test@example.com');

        // assert
        final state = container.read(authControllerProvider);
        expect(state.hasError, true);

        // cleanup
        container.dispose();
      });
    });

    group('completeHankoAuth', () {
      test('should update state with user on successful completion', () async {
        // arrange
        when(() => mockGetCurrentUserUsecase())
            .thenAnswer((_) async => const Right(null));
        when(() => mockHankoLoginUsecase.completeAuth(
              sessionId: any(named: 'sessionId'),
              credential: any(named: 'credential'),
            )).thenAnswer((_) async => Right(testSession));

        final container = makeProviderContainer();
        await container.read(authControllerProvider.future);

        // act
        final controller = container.read(authControllerProvider.notifier);
        await controller.completeHankoAuth(
          sessionId: 'session123',
          credential: 'credential',
        );

        // assert
        final state = container.read(authControllerProvider);
        expect(state.value, testUser);

        // cleanup
        container.dispose();
      });
    });

    group('register', () {
      test('should update state with user on successful registration',
          () async {
        // arrange
        when(() => mockGetCurrentUserUsecase())
            .thenAnswer((_) async => const Right(null));
        when(() => mockRegisterUsecase(
              email: any(named: 'email'),
              password: any(named: 'password'),
              confirmPassword: any(named: 'confirmPassword'),
              firstName: any(named: 'firstName'),
              lastName: any(named: 'lastName'),
              clubId: any(named: 'clubId'),
            )).thenAnswer((_) async => Right(testSession));

        final container = makeProviderContainer();
        await container.read(authControllerProvider.future);

        // act
        final controller = container.read(authControllerProvider.notifier);
        await controller.register(
          email: 'test@example.com',
          password: 'Password123!',
          confirmPassword: 'Password123!',
          firstName: 'John',
          lastName: 'Doe',
        );

        // assert
        final state = container.read(authControllerProvider);
        expect(state.value, testUser);
        verify(() => mockRegisterUsecase(
              email: 'test@example.com',
              password: 'Password123!',
              confirmPassword: 'Password123!',
              firstName: 'John',
              lastName: 'Doe',
              clubId: null,
            )).called(1);

        // cleanup
        container.dispose();
      });

      test('should update state to error on registration failure', () async {
        // arrange
        when(() => mockGetCurrentUserUsecase())
            .thenAnswer((_) async => const Right(null));
        when(() => mockRegisterUsecase(
              email: any(named: 'email'),
              password: any(named: 'password'),
              confirmPassword: any(named: 'confirmPassword'),
              firstName: any(named: 'firstName'),
              lastName: any(named: 'lastName'),
              clubId: any(named: 'clubId'),
            )).thenAnswer(
          (_) async => Left(ValidationFailure.invalidEmail()),
        );

        final container = makeProviderContainer();
        await container.read(authControllerProvider.future);

        // act
        final controller = container.read(authControllerProvider.notifier);
        await controller.register(
          email: 'invalid-email',
          password: 'Password123!',
          confirmPassword: 'Password123!',
          firstName: 'John',
          lastName: 'Doe',
        );

        // assert
        final state = container.read(authControllerProvider);
        expect(state.hasError, true);
        expect(state.error, isA<ValidationFailure>());

        // cleanup
        container.dispose();
      });
    });

    group('logout', () {
      test('should clear state on successful logout', () async {
        // arrange
        when(() => mockGetCurrentUserUsecase())
            .thenAnswer((_) async => Right(testUser));
        when(() => mockLogoutUsecase())
            .thenAnswer((_) async => const Right(true));

        final container = makeProviderContainer();
        await container.read(authControllerProvider.future);

        // Verify initial state has user
        expect(container.read(authControllerProvider).value, testUser);

        // act
        final controller = container.read(authControllerProvider.notifier);
        await controller.logout();

        // assert
        final state = container.read(authControllerProvider);
        expect(state.value, isNull);
        verify(() => mockLogoutUsecase()).called(1);

        // cleanup
        container.dispose();
      });

      test('should clear state even if logout fails', () async {
        // arrange
        when(() => mockGetCurrentUserUsecase())
            .thenAnswer((_) async => Right(testUser));
        when(() => mockLogoutUsecase())
            .thenAnswer((_) async => Left(NetworkFailure.noConnection()));

        final container = makeProviderContainer();
        await container.read(authControllerProvider.future);

        // act
        final controller = container.read(authControllerProvider.notifier);
        await controller.logout();

        // assert
        final state = container.read(authControllerProvider);
        expect(state.value, isNull);

        // cleanup
        container.dispose();
      });

      test('should clear state even if logout throws exception', () async {
        // arrange
        when(() => mockGetCurrentUserUsecase())
            .thenAnswer((_) async => Right(testUser));
        when(() => mockLogoutUsecase()).thenThrow(Exception('Logout error'));

        final container = makeProviderContainer();
        await container.read(authControllerProvider.future);

        // act
        final controller = container.read(authControllerProvider.notifier);
        await controller.logout();

        // assert
        final state = container.read(authControllerProvider);
        expect(state.value, isNull);

        // cleanup
        container.dispose();
      });
    });

    group('updateProfile', () {
      test('should update user profile when user is authenticated', () async {
        // arrange
        when(() => mockGetCurrentUserUsecase())
            .thenAnswer((_) async => Right(testUser));

        final container = makeProviderContainer();
        await container.read(authControllerProvider.future);

        final newProfile = UserProfile(
          fullName: 'John Doe Updated',
          phoneNumber: '+1234567890',
          avatar: 'https://example.com/avatar.jpg',
        );

        // act
        final controller = container.read(authControllerProvider.notifier);
        await controller.updateProfile(profile: newProfile);

        // assert
        final state = container.read(authControllerProvider);
        expect(state.value?.profile, newProfile);

        // cleanup
        container.dispose();
      });

      test('should do nothing when user is not authenticated', () async {
        // arrange
        when(() => mockGetCurrentUserUsecase())
            .thenAnswer((_) async => const Right(null));

        final container = makeProviderContainer();
        await container.read(authControllerProvider.future);

        final newProfile = UserProfile(
          fullName: 'John Doe',
          phoneNumber: '+1234567890',
        );

        // act
        final controller = container.read(authControllerProvider.notifier);
        await controller.updateProfile(profile: newProfile);

        // assert
        final state = container.read(authControllerProvider);
        expect(state.value, isNull);

        // cleanup
        container.dispose();
      });
    });

    group('authenticateWithBiometrics', () {
      test('should call biometric usecase on authentication', () async {
        // arrange
        when(() => mockGetCurrentUserUsecase())
            .thenAnswer((_) async => const Right(null));
        when(() => mockBiometricAuthUsecase.authenticate())
            .thenAnswer((_) async => const Right(true));

        final container = makeProviderContainer();
        await container.read(authControllerProvider.future);

        // act
        final controller = container.read(authControllerProvider.notifier);
        await controller.authenticateWithBiometrics();

        // assert
        verify(() => mockBiometricAuthUsecase.authenticate()).called(1);

        // cleanup
        container.dispose();
      });

      test('should handle biometric authentication failure', () async {
        // arrange
        when(() => mockGetCurrentUserUsecase())
            .thenAnswer((_) async => const Right(null));
        when(() => mockBiometricAuthUsecase.authenticate())
            .thenAnswer((_) async => Left(AuthFailure.biometricFailed()));

        final container = makeProviderContainer();
        await container.read(authControllerProvider.future);

        // act
        final controller = container.read(authControllerProvider.notifier);
        await controller.authenticateWithBiometrics();

        // assert - should not throw
        verify(() => mockBiometricAuthUsecase.authenticate()).called(1);

        // cleanup
        container.dispose();
      });
    });

    group('setBiometricAuth', () {
      test('should call usecase to enable biometric auth', () async {
        // arrange
        when(() => mockGetCurrentUserUsecase())
            .thenAnswer((_) async => const Right(null));
        when(() => mockBiometricAuthUsecase.setBiometricAuth(enabled: true))
            .thenAnswer((_) async => const Right(true));

        final container = makeProviderContainer();
        await container.read(authControllerProvider.future);

        // act
        final controller = container.read(authControllerProvider.notifier);
        await controller.setBiometricAuth(enabled: true);

        // assert
        verify(() => mockBiometricAuthUsecase.setBiometricAuth(enabled: true))
            .called(1);

        // cleanup
        container.dispose();
      });

      test('should call usecase to disable biometric auth', () async {
        // arrange
        when(() => mockGetCurrentUserUsecase())
            .thenAnswer((_) async => const Right(null));
        when(() => mockBiometricAuthUsecase.setBiometricAuth(enabled: false))
            .thenAnswer((_) async => const Right(true));

        final container = makeProviderContainer();
        await container.read(authControllerProvider.future);

        // act
        final controller = container.read(authControllerProvider.notifier);
        await controller.setBiometricAuth(enabled: false);

        // assert
        verify(() => mockBiometricAuthUsecase.setBiometricAuth(enabled: false))
            .called(1);

        // cleanup
        container.dispose();
      });
    });

    group('helper methods', () {
      test('isAuthenticated should return true when user exists', () async {
        // arrange
        when(() => mockGetCurrentUserUsecase())
            .thenAnswer((_) async => Right(testUser));

        final container = makeProviderContainer();
        await container.read(authControllerProvider.future);

        // act
        final controller = container.read(authControllerProvider.notifier);

        // assert
        expect(controller.isAuthenticated, true);

        // cleanup
        container.dispose();
      });

      test('isAuthenticated should return false when user is null', () async {
        // arrange
        when(() => mockGetCurrentUserUsecase())
            .thenAnswer((_) async => const Right(null));

        final container = makeProviderContainer();
        await container.read(authControllerProvider.future);

        // act
        final controller = container.read(authControllerProvider.notifier);

        // assert
        expect(controller.isAuthenticated, false);

        // cleanup
        container.dispose();
      });

      test('hasRole should return true when user has role', () async {
        // arrange
        final userWithRole = testUser.copyWith(roles: ['admin', 'member']);
        when(() => mockGetCurrentUserUsecase())
            .thenAnswer((_) async => Right(userWithRole));

        final container = makeProviderContainer();
        await container.read(authControllerProvider.future);

        // act
        final controller = container.read(authControllerProvider.notifier);

        // assert
        expect(controller.hasRole('admin'), true);
        expect(controller.hasRole('member'), true);
        expect(controller.hasRole('guest'), false);

        // cleanup
        container.dispose();
      });

      test('hasPermission should return true when user has permission',
          () async {
        // arrange
        final userWithPermission =
            testUser.copyWith(permissions: ['read', 'write']);
        when(() => mockGetCurrentUserUsecase())
            .thenAnswer((_) async => Right(userWithPermission));

        final container = makeProviderContainer();
        await container.read(authControllerProvider.future);

        // act
        final controller = container.read(authControllerProvider.notifier);

        // assert
        expect(controller.hasPermission('read'), true);
        expect(controller.hasPermission('write'), true);
        expect(controller.hasPermission('delete'), false);

        // cleanup
        container.dispose();
      });

      test('currentUser should return current user', () async {
        // arrange
        when(() => mockGetCurrentUserUsecase())
            .thenAnswer((_) async => Right(testUser));

        final container = makeProviderContainer();
        await container.read(authControllerProvider.future);

        // act
        final controller = container.read(authControllerProvider.notifier);

        // assert
        expect(controller.currentUser, testUser);

        // cleanup
        container.dispose();
      });
    });

    group('derived providers', () {
      test('currentUserProvider should return user from auth controller',
          () async {
        // arrange
        when(() => mockGetCurrentUserUsecase())
            .thenAnswer((_) async => Right(testUser));

        final container = makeProviderContainer();
        await container.read(authControllerProvider.future);

        // act
        final user = container.read(currentUserProvider);

        // assert
        expect(user, testUser);

        // cleanup
        container.dispose();
      });

      test('isAuthenticatedProvider should return true when user exists',
          () async {
        // arrange
        when(() => mockGetCurrentUserUsecase())
            .thenAnswer((_) async => Right(testUser));

        final container = makeProviderContainer();
        await container.read(authControllerProvider.future);

        // act
        final isAuth = container.read(isAuthenticatedProvider);

        // assert
        expect(isAuth, true);

        // cleanup
        container.dispose();
      });

      test('isAuthenticatedProvider should return false when user is null',
          () async {
        // arrange
        when(() => mockGetCurrentUserUsecase())
            .thenAnswer((_) async => const Right(null));

        final container = makeProviderContainer();
        await container.read(authControllerProvider.future);

        // act
        final isAuth = container.read(isAuthenticatedProvider);

        // assert
        expect(isAuth, false);

        // cleanup
        container.dispose();
      });
    });
  });
}
