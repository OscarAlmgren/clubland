import 'dart:async';

import 'package:clubland/core/errors/failures.dart';
import 'package:clubland/core/storage/secure_storage.dart';
import 'package:clubland/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:clubland/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:clubland/features/auth/data/datasources/hanko_datasource.dart';
import 'package:clubland/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:clubland/features/auth/domain/entities/auth_session_entity.dart';
import 'package:clubland/features/auth/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

class MockAuthLocalDataSource extends Mock implements AuthLocalDataSource {}

class MockHankoDataSource extends Mock implements HankoDataSource {}

class MockSecureStorageService extends Mock implements SecureStorageService {}

class MockLogger extends Mock implements Logger {}

void main() {
  late AuthRepositoryImpl repository;
  late MockAuthRemoteDataSource mockRemoteDataSource;
  late MockAuthLocalDataSource mockLocalDataSource;
  late MockHankoDataSource mockHankoDataSource;
  late MockSecureStorageService mockSecureStorage;
  late MockLogger mockLogger;

  setUp(() {
    mockRemoteDataSource = MockAuthRemoteDataSource();
    mockLocalDataSource = MockAuthLocalDataSource();
    mockHankoDataSource = MockHankoDataSource();
    mockSecureStorage = MockSecureStorageService();
    mockLogger = MockLogger();

    repository = AuthRepositoryImpl(
      secureStorage: mockSecureStorage,
      logger: mockLogger,
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      hankoDataSource: mockHankoDataSource,
    );

    // Setup common stubs
    when(() => mockLogger.d(any())).thenReturn(null);
    when(() => mockLogger.i(any())).thenReturn(null);
    when(() => mockLogger.e(any(), error: any(named: 'error'), stackTrace: any(named: 'stackTrace')))
        .thenReturn(null);
  });

  tearDown(() {
    repository.dispose();
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

  final testProfile = UserProfile(
    fullName: 'John Doe Updated',
    phoneNumber: '+1234567890',
    avatar: 'https://example.com/avatar.jpg',
  );

  group('AuthRepositoryImpl -', () {
    group('login', () {
      test('should return AuthSessionEntity when login succeeds', () async {
        // arrange
        when(() => mockRemoteDataSource.login(
              email: any(named: 'email'),
              password: any(named: 'password'),
            )).thenAnswer((_) async => Right(testSession));
        when(() => mockLocalDataSource.storeSession(any()))
            .thenAnswer((_) async => const Right(null));
        when(() => mockSecureStorage.storeAccessToken(any()))
            .thenAnswer((_) async {});
        when(() => mockSecureStorage.storeRefreshToken(any()))
            .thenAnswer((_) async {});

        // act
        final result = await repository.login(
          email: 'test@example.com',
          password: 'Password123!',
        );

        // assert
        expect(result.isRight(), true);
        result.fold(
          (failure) => fail('Should return Right'),
          (session) {
            expect(session.user.email, 'test@example.com');
            expect(session.accessToken, 'test_access_token');
          },
        );
        verify(() => mockRemoteDataSource.login(
              email: 'test@example.com',
              password: 'Password123!',
            )).called(1);
        verify(() => mockLocalDataSource.storeSession(testSession)).called(1);
        verify(() => mockSecureStorage.storeAccessToken('test_access_token'))
            .called(1);
        verify(() => mockSecureStorage.storeRefreshToken('test_refresh_token'))
            .called(1);
      });

      test('should return AuthFailure when login fails with invalid credentials',
          () async {
        // arrange
        when(() => mockRemoteDataSource.login(
              email: any(named: 'email'),
              password: any(named: 'password'),
            )).thenAnswer((_) async => Left(AuthFailure.invalidCredentials()));

        // act
        final result = await repository.login(
          email: 'test@example.com',
          password: 'wrongpassword',
        );

        // assert
        expect(result.isLeft(), true);
        result.fold(
          (failure) {
            expect(failure, isA<AuthFailure>());
            expect(failure.code, 'INVALID_CREDENTIALS');
          },
          (_) => fail('Should return Left'),
        );
      });

      test('should return AuthFailure when login throws exception', () async {
        // arrange
        when(() => mockRemoteDataSource.login(
              email: any(named: 'email'),
              password: any(named: 'password'),
            )).thenThrow(Exception('Network error'));

        // act
        final result = await repository.login(
          email: 'test@example.com',
          password: 'Password123!',
        );

        // assert
        expect(result.isLeft(), true);
        result.fold(
          (failure) {
            expect(failure, isA<AuthFailure>());
            expect(failure.message, contains('Exception: Network error'));
          },
          (_) => fail('Should return Left'),
        );
      });

      test('should emit auth state change on successful login', () async {
        // arrange
        when(() => mockRemoteDataSource.login(
              email: any(named: 'email'),
              password: any(named: 'password'),
            )).thenAnswer((_) async => Right(testSession));
        when(() => mockLocalDataSource.storeSession(any()))
            .thenAnswer((_) async => const Right(null));
        when(() => mockSecureStorage.storeAccessToken(any()))
            .thenAnswer((_) async {});
        when(() => mockSecureStorage.storeRefreshToken(any()))
            .thenAnswer((_) async {});

        // act & assert
        expectLater(
          repository.authStateChanges,
          emits(testSession),
        );

        await repository.login(
          email: 'test@example.com',
          password: 'Password123!',
        );
      });
    });

    group('loginWithHanko', () {
      const testEmail = 'test@example.com';
      const testSessionId = 'hanko_session_123';
      final testHankoResponse = HankoAuthResponse(
        sessionId: testSessionId,
        status: 'pending',
      );

      test(
          'should return pending AuthSessionEntity when Hanko login is initiated',
          () async {
        // arrange
        when(() => mockHankoDataSource.isEmailRegistered(testEmail))
            .thenAnswer((_) async => const Right(true));
        when(() => mockHankoDataSource.initiateLogin(testEmail))
            .thenAnswer((_) async => Right(testHankoResponse));
        when(() => mockSecureStorage.saveHankoSessionId(testSessionId))
            .thenAnswer((_) async {});

        // act
        final result = await repository.loginWithHanko(email: testEmail);

        // assert
        expect(result.isRight(), true);
        result.fold(
          (failure) => fail('Should return Right'),
          (session) {
            expect(session.user.email, testEmail);
            expect(session.user.status, UserStatus.pending);
            expect(session.hankoSessionId, testSessionId);
            expect(session.accessToken, 'pending-hanko-auth');
          },
        );
        verify(() => mockHankoDataSource.isEmailRegistered(testEmail))
            .called(1);
        verify(() => mockHankoDataSource.initiateLogin(testEmail)).called(1);
        verify(() => mockSecureStorage.saveHankoSessionId(testSessionId))
            .called(1);
      });

      test('should return AuthFailure when email is not registered', () async {
        // arrange
        when(() => mockHankoDataSource.isEmailRegistered(testEmail))
            .thenAnswer((_) async => const Right(false));

        // act
        final result = await repository.loginWithHanko(email: testEmail);

        // assert
        expect(result.isLeft(), true);
        result.fold(
          (failure) {
            expect(failure, isA<AuthFailure>());
            expect(failure.code, 'INVALID_CREDENTIALS');
          },
          (_) => fail('Should return Left'),
        );
      });
    });

    group('completeHankoAuth', () {
      const testSessionId = 'hanko_session_123';
      const testCredential = 'credential_token';

      test('should return AuthSessionEntity when Hanko auth completes',
          () async {
        // arrange
        when(() => mockHankoDataSource.completeLogin(
              sessionId: testSessionId,
              credential: testCredential,
            )).thenAnswer((_) async => Right(testSession));
        when(() => mockLocalDataSource.storeSession(any()))
            .thenAnswer((_) async => const Right(null));
        when(() => mockSecureStorage.storeAccessToken(any()))
            .thenAnswer((_) async {});
        when(() => mockSecureStorage.storeRefreshToken(any()))
            .thenAnswer((_) async {});
        when(() => mockSecureStorage.deleteHankoSessionId())
            .thenAnswer((_) async {});

        // act
        final result = await repository.completeHankoAuth(
          sessionId: testSessionId,
          credential: testCredential,
        );

        // assert
        expect(result.isRight(), true);
        result.fold(
          (failure) => fail('Should return Right'),
          (session) {
            expect(session.accessToken, 'test_access_token');
          },
        );
        verify(() => mockSecureStorage.deleteHankoSessionId()).called(1);
      });
    });

    group('register', () {
      test('should return AuthSessionEntity when registration succeeds',
          () async {
        // arrange
        when(() => mockRemoteDataSource.register(
              email: any(named: 'email'),
              password: any(named: 'password'),
              firstName: any(named: 'firstName'),
              lastName: any(named: 'lastName'),
              clubId: any(named: 'clubId'),
            )).thenAnswer((_) async => Right(testSession));
        when(() => mockLocalDataSource.storeSession(any()))
            .thenAnswer((_) async => const Right(null));
        when(() => mockSecureStorage.storeAccessToken(any()))
            .thenAnswer((_) async {});
        when(() => mockSecureStorage.storeRefreshToken(any()))
            .thenAnswer((_) async {});

        // act
        final result = await repository.register(
          email: 'test@example.com',
          password: 'Password123!',
          firstName: 'John',
          lastName: 'Doe',
        );

        // assert
        expect(result.isRight(), true);
        result.fold(
          (failure) => fail('Should return Right'),
          (session) {
            expect(session.user.email, 'test@example.com');
          },
        );
        verify(() => mockRemoteDataSource.register(
              email: 'test@example.com',
              password: 'Password123!',
              firstName: 'John',
              lastName: 'Doe',
              clubId: null,
            )).called(1);
      });

      test('should emit auth state change on successful registration',
          () async {
        // arrange
        when(() => mockRemoteDataSource.register(
              email: any(named: 'email'),
              password: any(named: 'password'),
              firstName: any(named: 'firstName'),
              lastName: any(named: 'lastName'),
              clubId: any(named: 'clubId'),
            )).thenAnswer((_) async => Right(testSession));
        when(() => mockLocalDataSource.storeSession(any()))
            .thenAnswer((_) async => const Right(null));
        when(() => mockSecureStorage.storeAccessToken(any()))
            .thenAnswer((_) async {});
        when(() => mockSecureStorage.storeRefreshToken(any()))
            .thenAnswer((_) async {});

        // act & assert
        expectLater(
          repository.authStateChanges,
          emits(testSession),
        );

        await repository.register(
          email: 'test@example.com',
          password: 'Password123!',
          firstName: 'John',
          lastName: 'Doe',
        );
      });
    });

    group('logout', () {
      test('should return true when logout succeeds', () async {
        // arrange
        when(() => mockRemoteDataSource.logout())
            .thenAnswer((_) async => const Right(true));
        when(() => mockLocalDataSource.clearSession())
            .thenAnswer((_) async => const Right(null));
        when(() => mockSecureStorage.deleteAccessToken())
            .thenAnswer((_) async {});
        when(() => mockSecureStorage.deleteRefreshToken())
            .thenAnswer((_) async {});

        // act
        final result = await repository.logout();

        // assert
        expect(result.isRight(), true);
        result.fold(
          (failure) => fail('Should return Right'),
          (success) => expect(success, true),
        );
        verify(() => mockRemoteDataSource.logout()).called(1);
        verify(() => mockLocalDataSource.clearSession()).called(1);
        verify(() => mockSecureStorage.deleteAccessToken()).called(1);
        verify(() => mockSecureStorage.deleteRefreshToken()).called(1);
      });

      test('should emit null auth state on successful logout', () async {
        // arrange
        when(() => mockRemoteDataSource.logout())
            .thenAnswer((_) async => const Right(true));
        when(() => mockLocalDataSource.clearSession())
            .thenAnswer((_) async => const Right(null));
        when(() => mockSecureStorage.deleteAccessToken())
            .thenAnswer((_) async {});
        when(() => mockSecureStorage.deleteRefreshToken())
            .thenAnswer((_) async {});

        // act & assert
        expectLater(
          repository.authStateChanges,
          emits(null),
        );

        await repository.logout();
      });
    });

    group('refreshToken', () {
      test('should return new AuthSessionEntity when token refresh succeeds',
          () async {
        // arrange
        final newSession = testSession.copyWith(
          accessToken: 'new_access_token',
        );
        when(() => mockRemoteDataSource.refreshToken(
              refreshToken: 'test_refresh_token',
            )).thenAnswer((_) async => Right(newSession));
        when(() => mockLocalDataSource.storeSession(any()))
            .thenAnswer((_) async => const Right(null));
        when(() => mockSecureStorage.storeAccessToken(any()))
            .thenAnswer((_) async {});
        when(() => mockSecureStorage.storeRefreshToken(any()))
            .thenAnswer((_) async {});

        // act
        final result = await repository.refreshToken(
          refreshToken: 'test_refresh_token',
        );

        // assert
        expect(result.isRight(), true);
        result.fold(
          (failure) => fail('Should return Right'),
          (session) {
            expect(session.accessToken, 'new_access_token');
          },
        );
      });
    });

    group('getCurrentUser', () {
      test('should return UserEntity from local storage', () async {
        // arrange
        when(() => mockLocalDataSource.getCurrentUser())
            .thenAnswer((_) async => Right(testUser));

        // act
        final result = await repository.getCurrentUser();

        // assert
        expect(result.isRight(), true);
        result.fold(
          (failure) => fail('Should return Right'),
          (user) {
            expect(user?.id, 'user123');
            expect(user?.email, 'test@example.com');
          },
        );
        verify(() => mockLocalDataSource.getCurrentUser()).called(1);
      });

      test('should return null when no user is stored', () async {
        // arrange
        when(() => mockLocalDataSource.getCurrentUser())
            .thenAnswer((_) async => const Right(null));

        // act
        final result = await repository.getCurrentUser();

        // assert
        expect(result.isRight(), true);
        result.fold(
          (failure) => fail('Should return Right'),
          (user) => expect(user, isNull),
        );
      });
    });

    group('getCurrentSession', () {
      test('should return AuthSessionEntity from local storage', () async {
        // arrange
        when(() => mockLocalDataSource.getCurrentSession())
            .thenAnswer((_) async => Right(testSession));

        // act
        final result = await repository.getCurrentSession();

        // assert
        expect(result.isRight(), true);
        result.fold(
          (failure) => fail('Should return Right'),
          (session) {
            expect(session?.id, 'session123');
            expect(session?.accessToken, 'test_access_token');
          },
        );
      });
    });

    group('isAuthenticated', () {
      test('should return true when valid session exists', () async {
        // arrange
        when(() => mockLocalDataSource.getCurrentSession())
            .thenAnswer((_) async => Right(testSession));

        // act
        final result = await repository.isAuthenticated();

        // assert
        expect(result, true);
      });

      test('should return false when session is expired', () async {
        // arrange
        final expiredSession = testSession.copyWith(
          expiresAt: DateTime.now().subtract(const Duration(hours: 1)),
        );
        when(() => mockLocalDataSource.getCurrentSession())
            .thenAnswer((_) async => Right(expiredSession));

        // act
        final result = await repository.isAuthenticated();

        // assert
        expect(result, false);
      });

      test('should return false when no session exists', () async {
        // arrange
        when(() => mockLocalDataSource.getCurrentSession())
            .thenAnswer((_) async => const Right(null));

        // act
        final result = await repository.isAuthenticated();

        // assert
        expect(result, false);
      });

      test('should return false when getCurrentSession fails', () async {
        // arrange
        when(() => mockLocalDataSource.getCurrentSession())
            .thenAnswer((_) async => Left(StorageFailure.readError()));

        // act
        final result = await repository.isAuthenticated();

        // assert
        expect(result, false);
      });
    });

    group('checkEmailAvailability', () {
      test('should return true when email is available', () async {
        // arrange
        when(() => mockRemoteDataSource.checkEmailAvailability(
              email: 'test@example.com',
            )).thenAnswer((_) async => const Right(true));

        // act
        final result = await repository.checkEmailAvailability(
          email: 'test@example.com',
        );

        // assert
        expect(result.isRight(), true);
        result.fold(
          (failure) => fail('Should return Right'),
          (isAvailable) => expect(isAvailable, true),
        );
      });
    });

    group('updateProfile', () {
      test('should return updated UserEntity when update succeeds', () async {
        // arrange
        final updatedUser = testUser.copyWith(
          profile: testProfile,
        );
        when(() => mockRemoteDataSource.updateProfile(
              userId: 'user123',
              profile: testProfile,
            )).thenAnswer((_) async => Right(updatedUser));
        when(() => mockLocalDataSource.storeUser(any()))
            .thenAnswer((_) async => const Right(null));
        when(() => mockLocalDataSource.getCurrentSession())
            .thenAnswer((_) async => Right(testSession));
        when(() => mockLocalDataSource.storeSession(any()))
            .thenAnswer((_) async => const Right(null));
        when(() => mockSecureStorage.storeAccessToken(any()))
            .thenAnswer((_) async {});
        when(() => mockSecureStorage.storeRefreshToken(any()))
            .thenAnswer((_) async {});

        // act
        final result = await repository.updateProfile(
          userId: 'user123',
          profile: testProfile,
        );

        // assert
        expect(result.isRight(), true);
        result.fold(
          (failure) => fail('Should return Right'),
          (user) {
            expect(user.profile, testProfile);
          },
        );
        verify(() => mockLocalDataSource.storeUser(updatedUser)).called(1);
      });
    });

    group('changePassword', () {
      test('should return true when password change succeeds', () async {
        // arrange
        when(() => mockRemoteDataSource.changePassword(
              currentPassword: 'OldPassword123!',
              newPassword: 'NewPassword123!',
            )).thenAnswer((_) async => const Right(true));

        // act
        final result = await repository.changePassword(
          currentPassword: 'OldPassword123!',
          newPassword: 'NewPassword123!',
        );

        // assert
        expect(result.isRight(), true);
        result.fold(
          (failure) => fail('Should return Right'),
          (success) => expect(success, true),
        );
      });
    });

    group('requestPasswordReset', () {
      test('should return true when password reset request succeeds',
          () async {
        // arrange
        when(() => mockRemoteDataSource.requestPasswordReset(
              email: 'test@example.com',
            )).thenAnswer((_) async => const Right(true));

        // act
        final result = await repository.requestPasswordReset(
          email: 'test@example.com',
        );

        // assert
        expect(result.isRight(), true);
        result.fold(
          (failure) => fail('Should return Right'),
          (success) => expect(success, true),
        );
      });
    });

    group('resetPassword', () {
      test('should return true when password reset succeeds', () async {
        // arrange
        when(() => mockRemoteDataSource.resetPassword(
              token: 'reset_token',
              newPassword: 'NewPassword123!',
            )).thenAnswer((_) async => const Right(true));

        // act
        final result = await repository.resetPassword(
          token: 'reset_token',
          newPassword: 'NewPassword123!',
        );

        // assert
        expect(result.isRight(), true);
        result.fold(
          (failure) => fail('Should return Right'),
          (success) => expect(success, true),
        );
      });
    });

    group('deleteAccount', () {
      test('should clear all data when account deletion succeeds', () async {
        // arrange
        when(() => mockRemoteDataSource.deleteAccount(
              password: 'Password123!',
            )).thenAnswer((_) async => const Right(true));
        when(() => mockLocalDataSource.clearSession())
            .thenAnswer((_) async => const Right(null));
        when(() => mockLocalDataSource.clearUser())
            .thenAnswer((_) async => const Right(null));
        when(() => mockSecureStorage.deleteAccessToken())
            .thenAnswer((_) async {});
        when(() => mockSecureStorage.deleteRefreshToken())
            .thenAnswer((_) async {});

        // act
        final result = await repository.deleteAccount(
          password: 'Password123!',
        );

        // assert
        expect(result.isRight(), true);
        result.fold(
          (failure) => fail('Should return Right'),
          (success) => expect(success, true),
        );
        verify(() => mockLocalDataSource.clearSession()).called(1);
        verify(() => mockLocalDataSource.clearUser()).called(1);
        verify(() => mockSecureStorage.deleteAccessToken()).called(1);
        verify(() => mockSecureStorage.deleteRefreshToken()).called(1);
      });

      test('should emit null auth state on successful account deletion',
          () async {
        // arrange
        when(() => mockRemoteDataSource.deleteAccount(
              password: 'Password123!',
            )).thenAnswer((_) async => const Right(true));
        when(() => mockLocalDataSource.clearSession())
            .thenAnswer((_) async => const Right(null));
        when(() => mockLocalDataSource.clearUser())
            .thenAnswer((_) async => const Right(null));
        when(() => mockSecureStorage.deleteAccessToken())
            .thenAnswer((_) async {});
        when(() => mockSecureStorage.deleteRefreshToken())
            .thenAnswer((_) async {});

        // act & assert
        expectLater(
          repository.authStateChanges,
          emits(null),
        );

        await repository.deleteAccount(password: 'Password123!');
      });
    });

    group('verifyEmail', () {
      test('should update user status when email verification succeeds',
          () async {
        // arrange
        when(() => mockRemoteDataSource.verifyEmail(
              token: 'verify_token',
            )).thenAnswer((_) async => const Right(true));
        when(() => mockLocalDataSource.getCurrentUser())
            .thenAnswer((_) async => Right(testUser));
        when(() => mockLocalDataSource.storeUser(any()))
            .thenAnswer((_) async => const Right(null));
        when(() => mockLocalDataSource.getCurrentSession())
            .thenAnswer((_) async => Right(testSession));
        when(() => mockLocalDataSource.storeSession(any()))
            .thenAnswer((_) async => const Right(null));
        when(() => mockSecureStorage.storeAccessToken(any()))
            .thenAnswer((_) async {});
        when(() => mockSecureStorage.storeRefreshToken(any()))
            .thenAnswer((_) async {});

        // act
        final result = await repository.verifyEmail(token: 'verify_token');

        // assert
        expect(result.isRight(), true);
        result.fold(
          (failure) => fail('Should return Right'),
          (success) => expect(success, true),
        );
      });
    });

    group('getUserPermissions', () {
      test('should return list of permissions', () async {
        // arrange
        final permissions = ['read', 'write', 'admin'];
        when(() => mockRemoteDataSource.getUserPermissions())
            .thenAnswer((_) async => Right(permissions));

        // act
        final result = await repository.getUserPermissions();

        // assert
        expect(result.isRight(), true);
        result.fold(
          (failure) => fail('Should return Right'),
          (perms) {
            expect(perms.length, 3);
            expect(perms, contains('admin'));
          },
        );
      });
    });

    group('biometric authentication', () {
      test('isBiometricAvailable should return true when available',
          () async {
        // arrange
        when(() => mockRemoteDataSource.isBiometricAvailable())
            .thenAnswer((_) async => true);

        // act
        final result = await repository.isBiometricAvailable();

        // assert
        expect(result, true);
      });

      test('authenticateWithBiometrics should return true when successful',
          () async {
        // arrange
        when(() => mockRemoteDataSource.authenticateWithBiometrics())
            .thenAnswer((_) async => const Right(true));

        // act
        final result = await repository.authenticateWithBiometrics();

        // assert
        expect(result.isRight(), true);
        result.fold(
          (failure) => fail('Should return Right'),
          (success) => expect(success, true),
        );
      });

      test('setBiometricAuth should enable biometric auth', () async {
        // arrange
        when(() => mockRemoteDataSource.setBiometricAuth(enabled: true))
            .thenAnswer((_) async => const Right(true));

        // act
        final result = await repository.setBiometricAuth(enabled: true);

        // assert
        expect(result.isRight(), true);
        result.fold(
          (failure) => fail('Should return Right'),
          (success) => expect(success, true),
        );
      });
    });
  });
}
