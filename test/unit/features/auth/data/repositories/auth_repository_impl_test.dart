import 'dart:async';

import 'package:clubland/core/errors/failures.dart';
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
    mockSecureStorageService = MockSecureStorageService();
    mockLogger = Logger(level: Level.off);

    repository = AuthRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
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
        when(
          () => mockRemoteDataSource.login(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenAnswer(
          (_) async => Right<Failure, AuthSessionEntity>(testSession),
        );
        when(
          () => mockLocalDataSource.storeSession(any()),
        ).thenAnswer((_) async {});
        when(
          () => mockLocalDataSource.storeUser(any()),
        ).thenAnswer((_) async {});
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

      test('should return AuthFailure when login throws exception', () async {
        when(
          () => mockRemoteDataSource.login(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenThrow(Exception('Network error'));

        final result = await repository.login(
          email: 'test@example.com',
          password: 'Password123!',
        );

        expect(result.isLeft(), true);
        result.fold((failure) {
          expect(failure, isA<AuthFailure>());
          expect(failure.message, contains('Exception: Network error'));
        }, (_) => fail('Should return Left'));
      });

      test('should emit auth state change on successful login', () async {
        when(
          () => mockRemoteDataSource.login(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenAnswer(
          (_) async => Right<Failure, AuthSessionEntity>(testSession),
        );
        when(
          () => mockLocalDataSource.storeSession(any()),
        ).thenAnswer((_) async {});
        when(
          () => mockLocalDataSource.storeUser(any()),
        ).thenAnswer((_) async {});
        when(
          () => mockSecureStorageService.storeAccessToken(any()),
        ).thenAnswer((_) async {});
        when(
          () => mockSecureStorageService.storeRefreshToken(any()),
        ).thenAnswer((_) async {});

        unawaited(expectLater(repository.authStateChanges, emits(testSession)));

        await repository.login(
          email: 'test@example.com',
          password: 'Password123!',
        );
      });
    });

    group('loginWithHanko', () {
      test('should return session when passkey login is successful', () async {
        when(
          () => mockRemoteDataSource.loginWithHanko(
            email: any(named: 'email'),
            clubSlug: any(named: 'clubSlug'),
          ),
        ).thenAnswer(
          (_) async => Right<Failure, AuthSessionEntity>(testSession),
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

        final result = await repository.loginWithHanko(
          email: 'test@example.com',
          clubSlug: 'test-club',
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
          () => mockRemoteDataSource.loginWithHanko(
            email: 'test@example.com',
            clubSlug: 'test-club',
          ),
        ).called(1);
      });

      test('should return AuthFailure when passkey login fails', () async {
        when(
          () => mockRemoteDataSource.loginWithHanko(
            email: any(named: 'email'),
            clubSlug: any(named: 'clubSlug'),
          ),
        ).thenAnswer((_) async => Left(AuthFailure.invalidCredentials()));

        final result = await repository.loginWithHanko(
          email: 'test@example.com',
          clubSlug: 'test-club',
        );

        expect(result.isLeft(), true);
        result.fold((failure) {
          expect(failure, isA<AuthFailure>());
          expect(failure.code, 'INVALID_CREDENTIALS');
        }, (_) => fail('Should return Left'));
      });
    });

    group('register', () {
      test(
        'should return AuthSessionEntity when registration succeeds',
        () async {
          when(
            () => mockRemoteDataSource.register(
              email: any(named: 'email'),
              password: any(named: 'password'),
              firstName: any(named: 'firstName'),
              lastName: any(named: 'lastName'),
              clubId: any(named: 'clubId'),
            ),
          ).thenAnswer(
            (_) async => Right<Failure, AuthSessionEntity>(testSession),
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

          final result = await repository.register(
            email: 'test@example.com',
            password: 'Password123!',
            firstName: 'John',
            lastName: 'Doe',
          );

          expect(result.isRight(), true);
          result.fold((failure) => fail('Should return Right'), (session) {
            expect(session.user.email, 'test@example.com');
          });
          verify(
            () => mockRemoteDataSource.register(
              email: 'test@example.com',
              password: 'Password123!',
              firstName: 'John',
              lastName: 'Doe',
            ),
          ).called(1);
        },
      );

      test(
        'should emit auth state change on successful registration',
        () async {
          when(
            () => mockRemoteDataSource.register(
              email: any(named: 'email'),
              password: any(named: 'password'),
              firstName: any(named: 'firstName'),
              lastName: any(named: 'lastName'),
              clubId: any(named: 'clubId'),
            ),
          ).thenAnswer(
            (_) async => Right<Failure, AuthSessionEntity>(testSession),
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

          unawaited(
            expectLater(repository.authStateChanges, emits(testSession)),
          );

          await repository.register(
            email: 'test@example.com',
            password: 'Password123!',
            firstName: 'John',
            lastName: 'Doe',
          );
        },
      );
    });

    group('logout', () {
      test('should return success when logout is successful', () async {
        when(
          () => mockRemoteDataSource.logout(),
        ).thenAnswer((_) async => const Right<Failure, bool>(true));
        when(() => mockLocalDataSource.clearSession()).thenAnswer((_) async {});
        when(() => mockLocalDataSource.clearUser()).thenAnswer((_) async {});
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

      test('should emit null auth state on successful logout', () async {
        when(
          () => mockRemoteDataSource.logout(),
        ).thenAnswer((_) async => const Right<Failure, bool>(true));
        when(
          () => mockLocalDataSource.clearSession(),
        ).thenAnswer((_) async {});
        when(
          () => mockLocalDataSource.clearUser(),
        ).thenAnswer((_) async {});
        when(
          () => mockSecureStorageService.deleteAccessToken(),
        ).thenAnswer((_) async {});
        when(
          () => mockSecureStorageService.deleteRefreshToken(),
        ).thenAnswer((_) async {});

        unawaited(expectLater(repository.authStateChanges, emits(null)));

        await repository.logout();
      });
    });

    group('getCurrentUser', () {
      test('should return user when available in local storage', () async {
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

    group('isAuthenticated', () {
      test('should return true when valid session exists', () async {
        when(() => mockLocalDataSource.getCurrentSession()).thenAnswer(
          (_) async => Right<Failure, AuthSessionEntity?>(testSession),
        );

        final result = await repository.isAuthenticated();

        expect(result, true);
      });

      test('should return false when session is expired', () async {
        final expiredSession = testSession.copyWith(
          expiresAt: DateTime.now().subtract(const Duration(hours: 1)),
        );
        when(
          () => mockLocalDataSource.getCurrentSession(),
        ).thenAnswer(
          (_) async => Right<Failure, AuthSessionEntity?>(expiredSession),
        );

        final result = await repository.isAuthenticated();

        expect(result, false);
      });

      test('should return false when no session exists', () async {
        when(() => mockLocalDataSource.getCurrentSession()).thenAnswer(
          (_) async => const Right<Failure, AuthSessionEntity?>(null),
        );

        final result = await repository.isAuthenticated();

        expect(result, false);
      });

      test('should return false when getCurrentSession fails', () async {
        when(
          () => mockLocalDataSource.getCurrentSession(),
        ).thenAnswer((_) async => Left(StorageFailure.readError()));

        final result = await repository.isAuthenticated();

        expect(result, false);
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

    group('checkEmailAvailability', () {
      test('should return true when email is available', () async {
        when(
          () => mockRemoteDataSource.checkEmailAvailability(
            email: 'test@example.com',
          ),
        ).thenAnswer((_) async => const Right<Failure, bool>(true));

        final result = await repository.checkEmailAvailability(
          email: 'test@example.com',
        );

        expect(result.isRight(), true);
        result.fold(
          (failure) => fail('Should return Right'),
          (isAvailable) => expect(isAvailable, true),
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
        ).thenAnswer(
          (_) async => Right<Failure, AuthSessionEntity?>(testSession),
        );
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

    group('requestPasswordReset', () {
      test(
        'should return true when password reset request succeeds',
        () async {
          when(
            () => mockRemoteDataSource.requestPasswordReset(
              email: 'test@example.com',
            ),
          ).thenAnswer((_) async => const Right<Failure, bool>(true));

          final result = await repository.requestPasswordReset(
            email: 'test@example.com',
          );

          expect(result.isRight(), true);
          result.fold(
            (failure) => fail('Should return Right'),
            (success) => expect(success, true),
          );
        },
      );
    });

    group('resetPassword', () {
      test('should return true when password reset succeeds', () async {
        when(
          () => mockRemoteDataSource.resetPassword(
            token: 'reset_token',
            newPassword: 'NewPassword123!',
          ),
        ).thenAnswer((_) async => const Right<Failure, bool>(true));

        final result = await repository.resetPassword(
          token: 'reset_token',
          newPassword: 'NewPassword123!',
        );

        expect(result.isRight(), true);
        result.fold(
          (failure) => fail('Should return Right'),
          (success) => expect(success, true),
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

      test(
        'should emit null auth state on successful account deletion',
        () async {
          when(
            () => mockRemoteDataSource.deleteAccount(
              password: any(named: 'password'),
            ),
          ).thenAnswer((_) async => const Right<Failure, bool>(true));
          when(
            () => mockLocalDataSource.clearSession(),
          ).thenAnswer((_) async {});
          when(
            () => mockLocalDataSource.clearUser(),
          ).thenAnswer((_) async {});
          when(
            () => mockSecureStorageService.deleteAccessToken(),
          ).thenAnswer((_) async {});
          when(
            () => mockSecureStorageService.deleteRefreshToken(),
          ).thenAnswer((_) async {});

          unawaited(expectLater(repository.authStateChanges, emits(null)));

          await repository.deleteAccount(password: 'Password123!');
        },
      );
    });

    group('verifyEmail', () {
      test(
        'should update user status when email verification succeeds',
        () async {
          when(
            () => mockRemoteDataSource.verifyEmail(token: 'verify_token'),
          ).thenAnswer((_) async => const Right<Failure, bool>(true));
          when(
            () => mockLocalDataSource.getCurrentUser(),
          ).thenAnswer((_) async => Right<Failure, UserEntity?>(testUser));
          when(
            () => mockLocalDataSource.storeUser(any()),
          ).thenAnswer((_) async {});
          when(() => mockLocalDataSource.getCurrentSession()).thenAnswer(
            (_) async => Right<Failure, AuthSessionEntity?>(testSession),
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

          final result = await repository.verifyEmail(token: 'verify_token');

          expect(result.isRight(), true);
          result.fold(
            (failure) => fail('Should return Right'),
            (success) => expect(success, true),
          );
        },
      );
    });

    group('getUserPermissions', () {
      test('should return list of permissions', () async {
        final permissions = ['read', 'write', 'admin'];
        when(
          () => mockRemoteDataSource.getUserPermissions(),
        ).thenAnswer(
          (_) async => Right<Failure, List<String>>(permissions),
        );

        final result = await repository.getUserPermissions();

        expect(result.isRight(), true);
        result.fold((failure) => fail('Should return Right'), (perms) {
          expect(perms.length, 3);
          expect(perms, contains('admin'));
        });
      });
    });

    group('biometric authentication', () {
      test('isBiometricAvailable should return true when available', () async {
        when(
          () => mockRemoteDataSource.isBiometricAvailable(),
        ).thenAnswer((_) async => true);

        final result = await repository.isBiometricAvailable();

        expect(result, true);
      });

      test(
        'authenticateWithBiometrics should return true when successful',
        () async {
          when(
            () => mockRemoteDataSource.authenticateWithBiometrics(),
          ).thenAnswer((_) async => const Right<Failure, bool>(true));

          final result = await repository.authenticateWithBiometrics();

          expect(result.isRight(), true);
          result.fold(
            (failure) => fail('Should return Right'),
            (success) => expect(success, true),
          );
        },
      );

      test('setBiometricAuth should enable biometric auth', () async {
        when(
          () => mockRemoteDataSource.setBiometricAuth(enabled: true),
        ).thenAnswer((_) async => const Right<Failure, bool>(true));

        final result = await repository.setBiometricAuth(enabled: true);

        expect(result.isRight(), true);
        result.fold(
          (failure) => fail('Should return Right'),
          (success) => expect(success, true),
        );
      });
    });
  });
}
