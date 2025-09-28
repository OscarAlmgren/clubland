import 'package:clubland/core/errors/failures.dart';
import 'package:clubland/features/auth/data/datasources/hanko_datasource.dart';
import 'package:clubland/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:clubland/features/auth/domain/entities/auth_session_entity.dart';
import 'package:clubland/features/auth/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../helpers/mock_providers.dart';
import '../../../../../helpers/test_helpers.dart';

void main() {
  late AuthRepositoryImpl repository;
  late MockAuthRemoteDataSource mockRemoteDataSource;
  late MockAuthLocalDataSource mockLocalDataSource;
  late MockHankoDataSource mockHankoDataSource;
  late MockSecureStorageService mockSecureStorageService;
  late Logger mockLogger;

  setUpAll(() {
    TestHelpers.setupFallbackValues();
    // Add additional fallback values for this test
    registerFallbackValue(
      AuthSessionEntity(
        accessToken: 'fallback-token',
        refreshToken: 'fallback-refresh',
        expiresAt: DateTime.now().add(const Duration(hours: 1)),
        user: UserEntity(
          id: 'fallback-id',
          email: 'fallback@example.com',
          createdAt: DateTime.now(),
        ),
      ),
    );
    registerFallbackValue(
      UserEntity(
        id: 'fallback-id',
        email: 'fallback@example.com',
        createdAt: DateTime.now(),
      ),
    );
    registerFallbackValue(
      const UserProfile(
        fullName: 'Fallback User',
      ),
    );
  });

  setUp(() {
    mockRemoteDataSource = MockAuthRemoteDataSource();
    mockLocalDataSource = MockAuthLocalDataSource();
    mockHankoDataSource = MockHankoDataSource();
    mockSecureStorageService = MockSecureStorageService();
    mockLogger = Logger(level: Level.off);

    repository = AuthRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      hankoDataSource: mockHankoDataSource,
      secureStorage: mockSecureStorageService,
      logger: mockLogger,
    );
  });

  tearDown(MockProviders.resetAll);

  group('AuthRepositoryImpl', () {
    final testUser = UserEntity(
      id: '123',
      email: 'test@example.com',
      firstName: 'Test',
      lastName: 'User',
      createdAt: DateTime.now(),
    );

    final testSession = AuthSessionEntity(
      accessToken: 'test-access-token',
      refreshToken: 'test-refresh-token',
      expiresAt: DateTime.now().add(const Duration(hours: 1)),
      user: testUser,
    );

    group('login', () {
      test('should return session when login is successful', () async {
        // Mock remote login success
        when(
          () => mockRemoteDataSource.login(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenAnswer(
          (_) async => Right<Failure, AuthSessionEntity>(testSession),
        );

        // Mock local storage operations
        when(
          () => mockLocalDataSource.storeSession(any()),
        ).thenAnswer((_) async {});
        when(
          () => mockLocalDataSource.storeUser(any()),
        ).thenAnswer((_) async {});

        // Mock secure storage operations
        when(
          () => mockSecureStorageService.storeAccessToken(any()),
        ).thenAnswer((_) async {});
        when(
          () => mockSecureStorageService.storeRefreshToken(any()),
        ).thenAnswer((_) async {});

        final result = await repository.login(
          email: 'test@example.com',
          password: 'password123',
        );

        expect(result.isRight(), true);
        result.fold(
          (failure) => fail('Expected success but got failure: $failure'),
          (session) {
            expect(session.user.email, 'test@example.com');
            expect(session.accessToken, 'test-access-token');
          },
        );

        verify(
          () => mockRemoteDataSource.login(
            email: 'test@example.com',
            password: 'password123',
          ),
        ).called(1);
        verify(() => mockLocalDataSource.storeSession(any())).called(1);
      });

      test('should return failure when login fails', () async {
        // Mock remote login failure
        when(
          () => mockRemoteDataSource.login(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenAnswer(
          (_) async => Left<Failure, AuthSessionEntity>(
            AuthFailure.invalidCredentials(),
          ),
        );

        final result = await repository.login(
          email: 'invalid@example.com',
          password: 'wrongpassword',
        );

        expect(result.isLeft(), true);
        result.fold(
          (failure) => expect(failure, isA<AuthFailure>()),
          (session) => fail('Expected failure but got success: $session'),
        );

        verify(
          () => mockRemoteDataSource.login(
            email: 'invalid@example.com',
            password: 'wrongpassword',
          ),
        ).called(1);
        verifyNever(() => mockLocalDataSource.storeSession(any()));
      });
    });

    group('loginWithHanko', () {
      test('should return session when Hanko login is successful', () async {
        // Mock Hanko email check
        when(
          () => mockHankoDataSource.isEmailRegistered(any()),
        ).thenAnswer((_) async => const Right<Failure, bool>(true));

        // Mock Hanko login initiation
        when(() => mockHankoDataSource.initiateLogin(any())).thenAnswer(
          (_) async => const Right(
            HankoAuthResponse(sessionId: 'test-session-id', status: 'pending'),
          ),
        );

        // Mock Hanko login success
        when(
          () => mockRemoteDataSource.loginWithHanko(email: any(named: 'email')),
        ).thenAnswer(
          (_) async => Right<Failure, AuthSessionEntity>(testSession),
        );

        // Mock local storage operations
        when(
          () => mockLocalDataSource.storeSession(any()),
        ).thenAnswer((_) async {});
        when(
          () => mockLocalDataSource.storeUser(any()),
        ).thenAnswer((_) async {});

        // Mock secure storage operations
        when(
          () => mockSecureStorageService.storeAccessToken(any()),
        ).thenAnswer((_) async {});
        when(
          () => mockSecureStorageService.storeRefreshToken(any()),
        ).thenAnswer((_) async {});
        when(
          () => mockSecureStorageService.saveHankoSessionId(any()),
        ).thenAnswer((_) async {});

        final result = await repository.loginWithHanko(
          email: 'test@example.com',
        );

        expect(result.isRight(), true);
        result.fold(
          (failure) => fail('Expected success but got failure: $failure'),
          (session) {
            expect(session.user.email, 'test@example.com');
            expect(session.accessToken, 'pending-hanko-auth');
            expect(session.refreshToken, 'pending-hanko-refresh');
            expect(session.user.status, UserStatus.pending);
          },
        );

        verify(
          () => mockHankoDataSource.isEmailRegistered('test@example.com'),
        ).called(1);
        verify(
          () => mockHankoDataSource.initiateLogin('test@example.com'),
        ).called(1);
        verify(
          () => mockSecureStorageService.saveHankoSessionId('test-session-id'),
        ).called(1);
      });
    });

    group('logout', () {
      test('should return success when logout is successful', () async {
        // Mock remote logout success
        when(
          () => mockRemoteDataSource.logout(),
        ).thenAnswer((_) async => const Right<Failure, bool>(true));

        // Mock local storage operations
        when(() => mockLocalDataSource.clearSession()).thenAnswer((_) async {});
        when(() => mockLocalDataSource.clearUser()).thenAnswer((_) async {});

        // Mock secure storage operations
        when(
          () => mockSecureStorageService.deleteAccessToken(),
        ).thenAnswer((_) async {});
        when(
          () => mockSecureStorageService.deleteRefreshToken(),
        ).thenAnswer((_) async {});

        final result = await repository.logout();

        expect(result.isRight(), true);
        result.fold(
          (failure) => fail('Expected success but got failure: $failure'),
          (success) => expect(success, true),
        );

        verify(() => mockRemoteDataSource.logout()).called(1);
        verify(() => mockLocalDataSource.clearSession()).called(1);
      });
    });

    group('getCurrentUser', () {
      test('should return user when available in local storage', () async {
        // Mock local user retrieval success
        when(
          () => mockLocalDataSource.getCurrentUser(),
        ).thenAnswer((_) async => Right<Failure, UserEntity?>(testUser));

        final result = await repository.getCurrentUser();

        expect(result.isRight(), true);
        result.fold(
          (failure) => fail('Expected success but got failure: $failure'),
          (user) {
            expect(user?.email, 'test@example.com');
            expect(user?.id, '123');
          },
        );

        verify(() => mockLocalDataSource.getCurrentUser()).called(1);
      });

      test('should return null when no user in local storage', () async {
        // Mock local user retrieval returning null
        when(
          () => mockLocalDataSource.getCurrentUser(),
        ).thenAnswer((_) async => const Right<Failure, UserEntity?>(null));

        final result = await repository.getCurrentUser();

        expect(result.isRight(), true);
        result.fold(
          (failure) => fail('Expected success but got failure: $failure'),
          (user) => expect(user, isNull),
        );

        verify(() => mockLocalDataSource.getCurrentUser()).called(1);
      });
    });

    group('getCurrentSession', () {
      test('should return session when available in local storage', () async {
        // Mock local session retrieval success
        when(() => mockLocalDataSource.getCurrentSession()).thenAnswer(
          (_) async => Right<Failure, AuthSessionEntity?>(testSession),
        );

        final result = await repository.getCurrentSession();

        expect(result.isRight(), true);
        result.fold(
          (failure) => fail('Expected success but got failure: $failure'),
          (session) {
            expect(session?.user.email, 'test@example.com');
            expect(session?.accessToken, 'test-access-token');
          },
        );

        verify(() => mockLocalDataSource.getCurrentSession()).called(1);
      });
    });

    group('refreshToken', () {
      test('should return new session when refresh is successful', () async {
        final newSession = AuthSessionEntity(
          accessToken: 'new-access-token',
          refreshToken: 'new-refresh-token',
          expiresAt: DateTime.now().add(const Duration(hours: 1)),
          user: testUser,
        );

        when(
          () => mockSecureStorageService.getRefreshToken(),
        ).thenAnswer((_) async => 'current-refresh-token');
        when(
          () => mockRemoteDataSource.refreshToken(
            refreshToken: any(named: 'refreshToken'),
          ),
        ).thenAnswer(
          (_) async => Right<Failure, AuthSessionEntity>(newSession),
        );

        when(
          () => mockLocalDataSource.storeSession(any()),
        ).thenAnswer((_) async {});
        when(
          () => mockSecureStorageService.storeAccessToken(any()),
        ).thenAnswer((_) async {});
        when(
          () => mockSecureStorageService.storeRefreshToken(any()),
        ).thenAnswer((_) async {});

        final result = await repository.refreshToken(
          refreshToken: 'current-refresh-token',
        );

        expect(result.isRight(), true);
        result.fold(
          (failure) => fail('Expected success but got failure: $failure'),
          (session) {
            expect(session.accessToken, 'new-access-token');
            expect(session.refreshToken, 'new-refresh-token');
          },
        );

        verify(
          () => mockRemoteDataSource.refreshToken(
            refreshToken: 'current-refresh-token',
          ),
        ).called(1);
      });

      test('should return failure when refresh fails', () async {
        when(
          () => mockRemoteDataSource.refreshToken(
            refreshToken: any(named: 'refreshToken'),
          ),
        ).thenAnswer(
          (_) async => Left<Failure, AuthSessionEntity>(
            AuthFailure.tokenRefreshFailed(),
          ),
        );

        final result = await repository.refreshToken(
          refreshToken: 'invalid-token',
        );

        expect(result.isLeft(), true);
        result.fold(
          (failure) => expect(failure, isA<AuthFailure>()),
          (session) => fail('Expected failure but got success: $session'),
        );
      });
    });

    group('updateProfile', () {
      test('should update user profile successfully', () async {
        const profile = UserProfile(
          fullName: 'John Doe',
          phoneNumber: '+1234567890',
        );

        final updatedUser = testUser.copyWith(
          firstName: 'John',
          lastName: 'Doe',
          profile: profile,
        );

        when(
          () => mockRemoteDataSource.updateProfile(
            userId: any(named: 'userId'),
            profile: any(named: 'profile'),
          ),
        ).thenAnswer((_) async => Right<Failure, UserEntity>(updatedUser));

        when(
          () => mockLocalDataSource.storeUser(any()),
        ).thenAnswer((_) async {});

        // Mock getCurrentSession since updateProfile calls it internally
        when(
          () => mockLocalDataSource.getCurrentSession(),
        ).thenAnswer((_) async => Right<Failure, AuthSessionEntity?>(testSession));

        // Mock session storage methods called by _storeSession
        when(
          () => mockLocalDataSource.storeSession(any()),
        ).thenAnswer((_) async {});
        when(
          () => mockSecureStorageService.storeAccessToken(any()),
        ).thenAnswer((_) async {});
        when(
          () => mockSecureStorageService.storeRefreshToken(any()),
        ).thenAnswer((_) async {});

        final result = await repository.updateProfile(
          userId: '123',
          profile: profile,
        );

        expect(result.isRight(), true);
        result.fold(
          (failure) => fail('Expected success but got failure: $failure'),
          (user) {
            expect(user.firstName, 'John');
            expect(user.lastName, 'Doe');
            expect(user.profile?.fullName, 'John Doe');
            expect(user.profile?.phoneNumber, '+1234567890');
          },
        );

        verify(
          () => mockRemoteDataSource.updateProfile(
            userId: '123',
            profile: profile,
          ),
        ).called(1);
        verify(() => mockLocalDataSource.storeUser(updatedUser)).called(1);
      });
    });

    group('changePassword', () {
      test('should change password successfully', () async {
        when(
          () => mockRemoteDataSource.changePassword(
            currentPassword: any(named: 'currentPassword'),
            newPassword: any(named: 'newPassword'),
          ),
        ).thenAnswer((_) async => const Right<Failure, bool>(true));

        final result = await repository.changePassword(
          currentPassword: 'oldPassword',
          newPassword: 'newPassword123',
        );

        expect(result.isRight(), true);
        result.fold(
          (failure) => fail('Expected success but got failure: $failure'),
          (success) => expect(success, true),
        );

        verify(
          () => mockRemoteDataSource.changePassword(
            currentPassword: 'oldPassword',
            newPassword: 'newPassword123',
          ),
        ).called(1);
      });

      test('should return failure when password change fails', () async {
        when(
          () => mockRemoteDataSource.changePassword(
            currentPassword: any(named: 'currentPassword'),
            newPassword: any(named: 'newPassword'),
          ),
        ).thenAnswer(
          (_) async => Left<Failure, bool>(AuthFailure.invalidCredentials()),
        );

        final result = await repository.changePassword(
          currentPassword: 'wrongPassword',
          newPassword: 'newPassword123',
        );

        expect(result.isLeft(), true);
        result.fold(
          (failure) => expect(failure, isA<AuthFailure>()),
          (success) => fail('Expected failure but got success: $success'),
        );
      });
    });

    group('deleteAccount', () {
      test('should delete account successfully', () async {
        when(
          () => mockRemoteDataSource.deleteAccount(
            password: any(named: 'password'),
          ),
        ).thenAnswer((_) async => const Right<Failure, bool>(true));

        when(() => mockLocalDataSource.clearSession()).thenAnswer((_) async {});
        when(() => mockLocalDataSource.clearUser()).thenAnswer((_) async {});
        when(
          () => mockSecureStorageService.deleteAccessToken(),
        ).thenAnswer((_) async {});
        when(
          () => mockSecureStorageService.deleteRefreshToken(),
        ).thenAnswer((_) async {});

        final result = await repository.deleteAccount(password: 'password123');

        expect(result.isRight(), true);
        result.fold(
          (failure) => fail('Expected success but got failure: $failure'),
          (success) => expect(success, true),
        );

        verify(
          () => mockRemoteDataSource.deleteAccount(password: 'password123'),
        ).called(1);
        verify(() => mockLocalDataSource.clearSession()).called(1);
        verify(() => mockLocalDataSource.clearUser()).called(1);
      });
    });

    // Note: Only testing methods that actually exist in the implementation
    // Other methods like linkSocialAccount, enableTwoFactorAuth, etc. would need
    // to be implemented first before adding their tests
  });
}
