import 'package:clubland/core/errors/failures.dart';
import 'package:clubland/features/auth/domain/entities/auth_session_entity.dart';
import 'package:clubland/features/auth/domain/entities/user_entity.dart';
import 'package:clubland/features/auth/domain/repositories/auth_repository.dart';
import 'package:clubland/features/auth/domain/usecases/login_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepository mockRepository;

  setUp(() {
    mockRepository = MockAuthRepository();
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

  group('LoginUsecase -', () {
    late LoginUsecase usecase;

    setUp(() {
      usecase = LoginUsecase(mockRepository);
    });

    test('should trim and lowercase email before calling repository', () async {
      // arrange
      when(() => mockRepository.login(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenAnswer((_) async => Right(testSession));

      // act
      await usecase(
        email: ' Test@Example.COM ',
        password: 'Password123!',
      );

      // assert
      verify(() => mockRepository.login(
            email: 'test@example.com',
            password: 'Password123!',
          )).called(1);
    });

    test('should return AuthSessionEntity when login succeeds', () async {
      // arrange
      when(() => mockRepository.login(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenAnswer((_) async => Right(testSession));

      // act
      final result = await usecase(
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
    });

    test('should return ValidationFailure when email is empty', () async {
      // act
      final result = await usecase(
        email: '',
        password: 'Password123!',
      );

      // assert
      expect(result.isLeft(), true);
      result.fold(
        (failure) {
          expect(failure, isA<ValidationFailure>());
          expect(failure.code, 'INVALID_EMAIL');
        },
        (_) => fail('Should return Left'),
      );
      verifyNever(() => mockRepository.login(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ));
    });

    test('should return ValidationFailure when email format is invalid',
        () async {
      // act
      final result = await usecase(
        email: 'invalid-email',
        password: 'Password123!',
      );

      // assert
      expect(result.isLeft(), true);
      result.fold(
        (failure) {
          expect(failure, isA<ValidationFailure>());
          expect(failure.code, 'INVALID_EMAIL');
        },
        (_) => fail('Should return Left'),
      );
      verifyNever(() => mockRepository.login(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ));
    });

    test('should return ValidationFailure when password is empty', () async {
      // act
      final result = await usecase(
        email: 'test@example.com',
        password: '',
      );

      // assert
      expect(result.isLeft(), true);
      result.fold(
        (failure) {
          expect(failure, isA<ValidationFailure>());
          expect(failure.code, 'FIELD_REQUIRED');
        },
        (_) => fail('Should return Left'),
      );
      verifyNever(() => mockRepository.login(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ));
    });

    test('should return ValidationFailure when password is too short',
        () async {
      // act
      final result = await usecase(
        email: 'test@example.com',
        password: 'Pass1!',
      );

      // assert
      expect(result.isLeft(), true);
      result.fold(
        (failure) {
          expect(failure, isA<ValidationFailure>());
          expect(failure.code, 'WEAK_PASSWORD');
        },
        (_) => fail('Should return Left'),
      );
      verifyNever(() => mockRepository.login(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ));
    });

    test('should return AuthFailure from repository when credentials are invalid',
        () async {
      // arrange
      when(() => mockRepository.login(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenAnswer((_) async => Left(AuthFailure.invalidCredentials()));

      // act
      final result = await usecase(
        email: 'test@example.com',
        password: 'WrongPassword123!',
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
  });

  group('HankoLoginUsecase -', () {
    late HankoLoginUsecase usecase;

    setUp(() {
      usecase = HankoLoginUsecase(mockRepository);
    });

    test('should trim and lowercase email before calling repository', () async {
      // arrange
      when(() => mockRepository.loginWithHanko(
            email: any(named: 'email'),
          )).thenAnswer((_) async => Right(testSession));

      // act
      await usecase(email: ' Test@Example.COM ');

      // assert
      verify(() => mockRepository.loginWithHanko(
            email: 'test@example.com',
          )).called(1);
    });

    test('should return AuthSessionEntity when Hanko login succeeds', () async {
      // arrange
      when(() => mockRepository.loginWithHanko(
            email: any(named: 'email'),
          )).thenAnswer((_) async => Right(testSession));

      // act
      final result = await usecase(email: 'test@example.com');

      // assert
      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Should return Right'),
        (session) {
          expect(session.user.email, 'test@example.com');
        },
      );
    });

    test('should return ValidationFailure when email is empty', () async {
      // act
      final result = await usecase(email: '');

      // assert
      expect(result.isLeft(), true);
      result.fold(
        (failure) {
          expect(failure, isA<ValidationFailure>());
          expect(failure.code, 'INVALID_EMAIL');
        },
        (_) => fail('Should return Left'),
      );
      verifyNever(() => mockRepository.loginWithHanko(
            email: any(named: 'email'),
          ));
    });

    test('should return ValidationFailure when email format is invalid',
        () async {
      // act
      final result = await usecase(email: 'invalid-email');

      // assert
      expect(result.isLeft(), true);
      result.fold(
        (failure) {
          expect(failure, isA<ValidationFailure>());
          expect(failure.code, 'INVALID_EMAIL');
        },
        (_) => fail('Should return Left'),
      );
    });

    group('completeAuth', () {
      test('should return AuthSessionEntity when completion succeeds',
          () async {
        // arrange
        when(() => mockRepository.completeHankoAuth(
              sessionId: 'session123',
              credential: 'credential',
            )).thenAnswer((_) async => Right(testSession));

        // act
        final result = await usecase.completeAuth(
          sessionId: 'session123',
          credential: 'credential',
        );

        // assert
        expect(result.isRight(), true);
        result.fold(
          (failure) => fail('Should return Right'),
          (session) => expect(session.accessToken, 'test_access_token'),
        );
      });

      test('should return ValidationFailure when sessionId is empty',
          () async {
        // act
        final result = await usecase.completeAuth(
          sessionId: '',
          credential: 'credential',
        );

        // assert
        expect(result.isLeft(), true);
        result.fold(
          (failure) {
            expect(failure, isA<ValidationFailure>());
            expect(failure.code, 'FIELD_REQUIRED');
          },
          (_) => fail('Should return Left'),
        );
      });

      test('should return ValidationFailure when credential is empty',
          () async {
        // act
        final result = await usecase.completeAuth(
          sessionId: 'session123',
          credential: '',
        );

        // assert
        expect(result.isLeft(), true);
        result.fold(
          (failure) {
            expect(failure, isA<ValidationFailure>());
            expect(failure.code, 'FIELD_REQUIRED');
          },
          (_) => fail('Should return Left'),
        );
      });
    });
  });

  group('RegisterUsecase -', () {
    late RegisterUsecase usecase;

    setUp(() {
      usecase = RegisterUsecase(mockRepository);
    });

    test('should trim and lowercase email before calling repository', () async {
      // arrange
      when(() => mockRepository.checkEmailAvailability(
            email: any(named: 'email'),
          )).thenAnswer((_) async => const Right(true));
      when(() => mockRepository.register(
            email: any(named: 'email'),
            password: any(named: 'password'),
            firstName: any(named: 'firstName'),
            lastName: any(named: 'lastName'),
            clubId: any(named: 'clubId'),
          )).thenAnswer((_) async => Right(testSession));

      // act
      await usecase(
        email: ' Test@Example.COM ',
        password: 'Password123!',
        confirmPassword: 'Password123!',
        firstName: 'John',
        lastName: 'Doe',
      );

      // assert
      verify(() => mockRepository.register(
            email: 'test@example.com',
            password: 'Password123!',
            firstName: 'John',
            lastName: 'Doe',
            clubId: null,
          )).called(1);
    });

    test('should return AuthSessionEntity when registration succeeds',
        () async {
      // arrange
      when(() => mockRepository.checkEmailAvailability(
            email: any(named: 'email'),
          )).thenAnswer((_) async => const Right(true));
      when(() => mockRepository.register(
            email: any(named: 'email'),
            password: any(named: 'password'),
            firstName: any(named: 'firstName'),
            lastName: any(named: 'lastName'),
            clubId: any(named: 'clubId'),
          )).thenAnswer((_) async => Right(testSession));

      // act
      final result = await usecase(
        email: 'test@example.com',
        password: 'Password123!',
        confirmPassword: 'Password123!',
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
    });

    test('should return ValidationFailure when email is empty', () async {
      // act
      final result = await usecase(
        email: '',
        password: 'Password123!',
        confirmPassword: 'Password123!',
        firstName: 'John',
        lastName: 'Doe',
      );

      // assert
      expect(result.isLeft(), true);
      result.fold(
        (failure) {
          expect(failure, isA<ValidationFailure>());
          expect(failure.code, 'FIELD_REQUIRED');
        },
        (_) => fail('Should return Left'),
      );
    });

    test('should return ValidationFailure when email format is invalid',
        () async {
      // act
      final result = await usecase(
        email: 'invalid-email',
        password: 'Password123!',
        confirmPassword: 'Password123!',
        firstName: 'John',
        lastName: 'Doe',
      );

      // assert
      expect(result.isLeft(), true);
      result.fold(
        (failure) {
          expect(failure, isA<ValidationFailure>());
          expect(failure.code, 'INVALID_EMAIL');
        },
        (_) => fail('Should return Left'),
      );
    });

    test('should return ValidationFailure when password is too short',
        () async {
      // act
      final result = await usecase(
        email: 'test@example.com',
        password: 'Pass1!',
        confirmPassword: 'Pass1!',
        firstName: 'John',
        lastName: 'Doe',
      );

      // assert
      expect(result.isLeft(), true);
      result.fold(
        (failure) {
          expect(failure, isA<ValidationFailure>());
          expect(failure.code, 'WEAK_PASSWORD');
        },
        (_) => fail('Should return Left'),
      );
    });

    test('should return ValidationFailure when password missing uppercase',
        () async {
      // act
      final result = await usecase(
        email: 'test@example.com',
        password: 'password123!',
        confirmPassword: 'password123!',
        firstName: 'John',
        lastName: 'Doe',
      );

      // assert
      expect(result.isLeft(), true);
      result.fold(
        (failure) {
          expect(failure, isA<ValidationFailure>());
          expect(failure.code, 'WEAK_PASSWORD');
        },
        (_) => fail('Should return Left'),
      );
    });

    test('should return ValidationFailure when password missing lowercase',
        () async {
      // act
      final result = await usecase(
        email: 'test@example.com',
        password: 'PASSWORD123!',
        confirmPassword: 'PASSWORD123!',
        firstName: 'John',
        lastName: 'Doe',
      );

      // assert
      expect(result.isLeft(), true);
      result.fold(
        (failure) {
          expect(failure, isA<ValidationFailure>());
          expect(failure.code, 'WEAK_PASSWORD');
        },
        (_) => fail('Should return Left'),
      );
    });

    test('should return ValidationFailure when password missing number',
        () async {
      // act
      final result = await usecase(
        email: 'test@example.com',
        password: 'Password!',
        confirmPassword: 'Password!',
        firstName: 'John',
        lastName: 'Doe',
      );

      // assert
      expect(result.isLeft(), true);
      result.fold(
        (failure) {
          expect(failure, isA<ValidationFailure>());
          expect(failure.code, 'WEAK_PASSWORD');
        },
        (_) => fail('Should return Left'),
      );
    });

    test('should return ValidationFailure when password missing special character',
        () async {
      // act
      final result = await usecase(
        email: 'test@example.com',
        password: 'Password123',
        confirmPassword: 'Password123',
        firstName: 'John',
        lastName: 'Doe',
      );

      // assert
      expect(result.isLeft(), true);
      result.fold(
        (failure) {
          expect(failure, isA<ValidationFailure>());
          expect(failure.code, 'WEAK_PASSWORD');
        },
        (_) => fail('Should return Left'),
      );
    });

    test('should return ValidationFailure when passwords do not match',
        () async {
      // act
      final result = await usecase(
        email: 'test@example.com',
        password: 'Password123!',
        confirmPassword: 'DifferentPassword123!',
        firstName: 'John',
        lastName: 'Doe',
      );

      // assert
      expect(result.isLeft(), true);
      result.fold(
        (failure) {
          expect(failure, isA<ValidationFailure>());
          expect(failure.code, 'INVALID_INPUT');
          expect(failure.message, contains('Passwords do not match'));
        },
        (_) => fail('Should return Left'),
      );
    });

    test('should return ValidationFailure when firstName is empty', () async {
      // act
      final result = await usecase(
        email: 'test@example.com',
        password: 'Password123!',
        confirmPassword: 'Password123!',
        firstName: '',
        lastName: 'Doe',
      );

      // assert
      expect(result.isLeft(), true);
      result.fold(
        (failure) {
          expect(failure, isA<ValidationFailure>());
          expect(failure.code, 'FIELD_REQUIRED');
        },
        (_) => fail('Should return Left'),
      );
    });

    test('should return ValidationFailure when firstName is too short',
        () async {
      // act
      final result = await usecase(
        email: 'test@example.com',
        password: 'Password123!',
        confirmPassword: 'Password123!',
        firstName: 'J',
        lastName: 'Doe',
      );

      // assert
      expect(result.isLeft(), true);
      result.fold(
        (failure) {
          expect(failure, isA<ValidationFailure>());
          expect(failure.code, 'INVALID_INPUT');
          expect(failure.message, contains('at least 2 characters'));
        },
        (_) => fail('Should return Left'),
      );
    });

    test('should return ValidationFailure when email is not available',
        () async {
      // arrange
      when(() => mockRepository.checkEmailAvailability(
            email: any(named: 'email'),
          )).thenAnswer((_) async => const Right(false));

      // act
      final result = await usecase(
        email: 'taken@example.com',
        password: 'Password123!',
        confirmPassword: 'Password123!',
        firstName: 'John',
        lastName: 'Doe',
      );

      // assert
      expect(result.isLeft(), true);
      result.fold(
        (failure) {
          expect(failure, isA<ValidationFailure>());
          expect(failure.message, contains('already taken'));
        },
        (_) => fail('Should return Left'),
      );
      verifyNever(() => mockRepository.register(
            email: any(named: 'email'),
            password: any(named: 'password'),
            firstName: any(named: 'firstName'),
            lastName: any(named: 'lastName'),
            clubId: any(named: 'clubId'),
          ));
    });
  });

  group('LogoutUsecase -', () {
    late LogoutUsecase usecase;

    setUp(() {
      usecase = LogoutUsecase(mockRepository);
    });

    test('should call repository logout method', () async {
      // arrange
      when(() => mockRepository.logout())
          .thenAnswer((_) async => const Right(true));

      // act
      final result = await usecase();

      // assert
      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Should return Right'),
        (success) => expect(success, true),
      );
      verify(() => mockRepository.logout()).called(1);
    });

    test('should return failure from repository', () async {
      // arrange
      when(() => mockRepository.logout())
          .thenAnswer((_) async => Left(AuthFailure.unexpected('Logout failed')));

      // act
      final result = await usecase();

      // assert
      expect(result.isLeft(), true);
      result.fold(
        (failure) {
          expect(failure, isA<AuthFailure>());
          expect(failure.message, contains('Logout failed'));
        },
        (_) => fail('Should return Left'),
      );
    });
  });

  group('RefreshTokenUsecase -', () {
    late RefreshTokenUsecase usecase;

    setUp(() {
      usecase = RefreshTokenUsecase(mockRepository);
    });

    test('should return new session when token refresh succeeds', () async {
      // arrange
      when(() => mockRepository.refreshToken(
            refreshToken: 'test_refresh_token',
          )).thenAnswer((_) async => Right(testSession));

      // act
      final result = await usecase(refreshToken: 'test_refresh_token');

      // assert
      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Should return Right'),
        (session) => expect(session.accessToken, 'test_access_token'),
      );
    });

    test('should return ValidationFailure when refreshToken is empty',
        () async {
      // act
      final result = await usecase(refreshToken: '');

      // assert
      expect(result.isLeft(), true);
      result.fold(
        (failure) {
          expect(failure, isA<ValidationFailure>());
          expect(failure.code, 'FIELD_REQUIRED');
        },
        (_) => fail('Should return Left'),
      );
      verifyNever(() => mockRepository.refreshToken(
            refreshToken: any(named: 'refreshToken'),
          ));
    });
  });

  group('GetCurrentUserUsecase -', () {
    late GetCurrentUserUsecase usecase;

    setUp(() {
      usecase = GetCurrentUserUsecase(mockRepository);
    });

    test('should return current user when available', () async {
      // arrange
      when(() => mockRepository.getCurrentUser())
          .thenAnswer((_) async => Right(testUser));

      // act
      final result = await usecase();

      // assert
      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Should return Right'),
        (user) {
          expect(user?.id, 'user123');
          expect(user?.email, 'test@example.com');
        },
      );
    });
  });

  group('CheckAuthStatusUsecase -', () {
    late CheckAuthStatusUsecase usecase;

    setUp(() {
      usecase = CheckAuthStatusUsecase(mockRepository);
    });

    test('should return true when user is authenticated', () async {
      // arrange
      when(() => mockRepository.isAuthenticated()).thenAnswer((_) async => true);

      // act
      final result = await usecase();

      // assert
      expect(result, true);
    });

    test('should return false when user is not authenticated', () async {
      // arrange
      when(() => mockRepository.isAuthenticated())
          .thenAnswer((_) async => false);

      // act
      final result = await usecase();

      // assert
      expect(result, false);
    });
  });

  group('BiometricAuthUsecase -', () {
    late BiometricAuthUsecase usecase;

    setUp(() {
      usecase = BiometricAuthUsecase(mockRepository);
    });

    test('isAvailable should return true when biometrics are available',
        () async {
      // arrange
      when(() => mockRepository.isBiometricAvailable())
          .thenAnswer((_) async => true);

      // act
      final result = await usecase.isAvailable();

      // assert
      expect(result, true);
    });

    test('authenticate should return true when authentication succeeds',
        () async {
      // arrange
      when(() => mockRepository.isBiometricAvailable())
          .thenAnswer((_) async => true);
      when(() => mockRepository.authenticateWithBiometrics())
          .thenAnswer((_) async => const Right(true));

      // act
      final result = await usecase.authenticate();

      // assert
      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Should return Right'),
        (success) => expect(success, true),
      );
    });

    test('authenticate should return failure when biometrics not available',
        () async {
      // arrange
      when(() => mockRepository.isBiometricAvailable())
          .thenAnswer((_) async => false);

      // act
      final result = await usecase.authenticate();

      // assert
      expect(result.isLeft(), true);
      result.fold(
        (failure) {
          expect(failure, isA<AuthFailure>());
          expect(failure.code, 'BIOMETRIC_UNAVAILABLE');
        },
        (_) => fail('Should return Left'),
      );
      verifyNever(() => mockRepository.authenticateWithBiometrics());
    });

    test('setBiometricAuth should enable biometrics when available', () async {
      // arrange
      when(() => mockRepository.isBiometricAvailable())
          .thenAnswer((_) async => true);
      when(() => mockRepository.setBiometricAuth(enabled: true))
          .thenAnswer((_) async => const Right(true));

      // act
      final result = await usecase.setBiometricAuth(enabled: true);

      // assert
      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Should return Right'),
        (success) => expect(success, true),
      );
    });

    test('setBiometricAuth should return failure when enabling but not available',
        () async {
      // arrange
      when(() => mockRepository.isBiometricAvailable())
          .thenAnswer((_) async => false);

      // act
      final result = await usecase.setBiometricAuth(enabled: true);

      // assert
      expect(result.isLeft(), true);
      result.fold(
        (failure) {
          expect(failure, isA<AuthFailure>());
          expect(failure.code, 'BIOMETRIC_UNAVAILABLE');
        },
        (_) => fail('Should return Left'),
      );
      verifyNever(() => mockRepository.setBiometricAuth(enabled: any(named: 'enabled')));
    });

    test('setBiometricAuth should disable biometrics without checking availability',
        () async {
      // arrange
      when(() => mockRepository.setBiometricAuth(enabled: false))
          .thenAnswer((_) async => const Right(true));

      // act
      final result = await usecase.setBiometricAuth(enabled: false);

      // assert
      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Should return Right'),
        (success) => expect(success, true),
      );
      verifyNever(() => mockRepository.isBiometricAvailable());
    });
  });
}
