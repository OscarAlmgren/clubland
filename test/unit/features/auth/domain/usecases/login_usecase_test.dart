import 'package:clubland/core/errors/failures.dart';
import 'package:clubland/features/auth/domain/entities/auth_session_entity.dart';
import 'package:clubland/features/auth/domain/entities/user_entity.dart';
import 'package:clubland/features/auth/domain/usecases/login_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../helpers/mock_providers.dart';
import '../../../../../helpers/test_helpers.dart';

// Shared test data
final _testUser = UserEntity(
  id: 'user123',
  email: 'test@example.com',
  firstName: 'John',
  lastName: 'Doe',
  createdAt: DateTime(2025),
);

final _testSession = AuthSessionEntity(
  id: 'session123',
  user: _testUser,
  accessToken: 'test_access_token',
  refreshToken: 'test_refresh_token',
  expiresAt: DateTime.now().add(const Duration(hours: 1)),
  createdAt: DateTime.now(),
);

void main() {
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    TestHelpers.setupFallbackValues();
    mockAuthRepository = MockAuthRepository();
  });

  tearDown(() {
    reset(mockAuthRepository);
  });

  // ──────────────────────────────────────────────────────────────────────────
  // LoginUsecase
  // ──────────────────────────────────────────────────────────────────────────
  group('LoginUsecase', () {
    late LoginUsecase useCase;

    setUp(() {
      useCase = LoginUsecase(mockAuthRepository);
    });

    test('should return session when login is successful', () async {
      when(
        () => mockAuthRepository.login(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer(
        (_) async => Right<Failure, AuthSessionEntity>(_testSession),
      );

      final result = await useCase.call(
        email: 'test@example.com',
        password: 'password123',
      );

      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Expected success but got failure: $failure'),
        (session) {
          expect(session.user.email, 'test@example.com');
          expect(session.accessToken, 'test_access_token');
        },
      );

      verify(
        () => mockAuthRepository.login(
          email: 'test@example.com',
          password: 'password123',
        ),
      ).called(1);
    });

    test('should return failure when repository login fails', () async {
      when(
        () => mockAuthRepository.login(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer(
        (_) async =>
            Left<Failure, AuthSessionEntity>(AuthFailure.invalidCredentials()),
      );

      final result = await useCase.call(
        email: 'invalid@example.com',
        password: 'wrongpassword',
      );

      expect(result.isLeft(), true);
      result.fold(
        (failure) => expect(failure, isA<AuthFailure>()),
        (session) => fail('Expected failure but got success: $session'),
      );

      verify(
        () => mockAuthRepository.login(
          email: 'invalid@example.com',
          password: 'wrongpassword',
        ),
      ).called(1);
    });

    test('should return validation failure for empty email', () async {
      final result = await useCase.call(email: '', password: 'password123');

      expect(result.isLeft(), true);
      result.fold(
        (failure) => expect(failure, isA<ValidationFailure>()),
        (session) => fail('Expected validation failure but got success'),
      );

      verifyNever(
        () => mockAuthRepository.login(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      );
    });

    test('should return validation failure for invalid email format', () async {
      final result = await useCase.call(
        email: 'invalid-email',
        password: 'password123',
      );

      expect(result.isLeft(), true);
      result.fold(
        (failure) => expect(failure, isA<ValidationFailure>()),
        (session) => fail('Expected validation failure but got success'),
      );

      verifyNever(
        () => mockAuthRepository.login(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      );
    });

    test('should return validation failure for empty password', () async {
      final result = await useCase.call(
        email: 'test@example.com',
        password: '',
      );

      expect(result.isLeft(), true);
      result.fold(
        (failure) => expect(failure, isA<ValidationFailure>()),
        (session) => fail('Expected validation failure but got success'),
      );

      verifyNever(
        () => mockAuthRepository.login(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      );
    });

    test('should return validation failure for weak password', () async {
      final result = await useCase.call(
        email: 'test@example.com',
        password: '123', // Too short
      );

      expect(result.isLeft(), true);
      result.fold(
        (failure) => expect(failure, isA<ValidationFailure>()),
        (session) => fail('Expected validation failure but got success'),
      );

      verifyNever(
        () => mockAuthRepository.login(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      );
    });

    test('should trim and lowercase email before calling repository', () async {
      when(
        () => mockAuthRepository.login(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer(
        (_) async => Right<Failure, AuthSessionEntity>(_testSession),
      );

      final result = await useCase.call(
        email: ' Test@Example.COM ',
        password: 'Password123!',
      );

      expect(result.isRight(), true);

      verify(
        () => mockAuthRepository.login(
          email: 'test@example.com',
          password: 'Password123!',
        ),
      ).called(1);
    });

    test('should return AuthFailure when credentials are invalid', () async {
      when(
        () => mockAuthRepository.login(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer((_) async => Left(AuthFailure.invalidCredentials()));

      final result = await useCase.call(
        email: 'test@example.com',
        password: 'WrongPassword123!',
      );

      expect(result.isLeft(), true);
      result.fold((failure) {
        expect(failure, isA<AuthFailure>());
        expect(failure.code, 'INVALID_CREDENTIALS');
      }, (_) => fail('Should return Left'));
    });

    test('should handle repository exceptions gracefully', () async {
      when(
        () => mockAuthRepository.login(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenThrow(Exception('Network error'));

      expect(
        () =>
            useCase.call(email: 'test@example.com', password: 'password12345'),
        throwsA(isA<Exception>()),
      );
    });
  });

  // ──────────────────────────────────────────────────────────────────────────
  // HankoLoginUsecase
  // ──────────────────────────────────────────────────────────────────────────
  group('HankoLoginUsecase', () {
    late HankoLoginUsecase useCase;

    setUp(() {
      useCase = HankoLoginUsecase(mockAuthRepository);
    });

    test('should trim and lowercase email before calling repository', () async {
      when(
        () => mockAuthRepository.loginWithHanko(
          email: any(named: 'email'),
          clubSlug: any(named: 'clubSlug'),
        ),
      ).thenAnswer((_) async => Right(_testSession));

      await useCase(email: ' Test@Example.COM ', clubSlug: 'test-club');

      verify(
        () => mockAuthRepository.loginWithHanko(
          email: 'test@example.com',
          clubSlug: 'test-club',
        ),
      ).called(1);
    });

    test('should return AuthSessionEntity when Hanko login succeeds', () async {
      when(
        () => mockAuthRepository.loginWithHanko(
          email: any(named: 'email'),
          clubSlug: any(named: 'clubSlug'),
        ),
      ).thenAnswer((_) async => Right(_testSession));

      final result = await useCase(
        email: 'test@example.com',
        clubSlug: 'test-club',
      );

      expect(result.isRight(), true);
      result.fold((failure) => fail('Should return Right'), (session) {
        expect(session.user.email, 'test@example.com');
      });
    });

    test('should return ValidationFailure when email is empty', () async {
      final result = await useCase(email: '', clubSlug: 'test-club');

      expect(result.isLeft(), true);
      result.fold((failure) {
        expect(failure, isA<ValidationFailure>());
        expect(failure.code, 'INVALID_EMAIL');
      }, (_) => fail('Should return Left'));
      verifyNever(
        () => mockAuthRepository.loginWithHanko(
          email: any(named: 'email'),
          clubSlug: any(named: 'clubSlug'),
        ),
      );
    });

    test(
      'should return ValidationFailure when email format is invalid',
      () async {
        final result = await useCase(
          email: 'invalid-email',
          clubSlug: 'test-club',
        );

        expect(result.isLeft(), true);
        result.fold((failure) {
          expect(failure, isA<ValidationFailure>());
          expect(failure.code, 'INVALID_EMAIL');
        }, (_) => fail('Should return Left'));
      },
    );

    test('should return ValidationFailure when clubSlug is empty', () async {
      final result = await useCase(email: 'test@example.com', clubSlug: '');

      expect(result.isLeft(), true);
      result.fold((failure) {
        expect(failure, isA<ValidationFailure>());
        expect(failure.code, 'FIELD_REQUIRED');
      }, (_) => fail('Should return Left'));
    });
  });

  // ──────────────────────────────────────────────────────────────────────────
  // RegisterUsecase
  // ──────────────────────────────────────────────────────────────────────────
  group('RegisterUsecase', () {
    late RegisterUsecase useCase;

    setUp(() {
      useCase = RegisterUsecase(mockAuthRepository);
    });

    test('should trim and lowercase email before calling repository', () async {
      when(
        () => mockAuthRepository.checkEmailAvailability(
          email: any(named: 'email'),
        ),
      ).thenAnswer((_) async => const Right(true));
      when(
        () => mockAuthRepository.register(
          email: any(named: 'email'),
          password: any(named: 'password'),
          firstName: any(named: 'firstName'),
          lastName: any(named: 'lastName'),
          clubId: any(named: 'clubId'),
        ),
      ).thenAnswer((_) async => Right(_testSession));

      await useCase(
        email: ' Test@Example.COM ',
        password: 'Password123!',
        confirmPassword: 'Password123!',
        firstName: 'John',
        lastName: 'Doe',
      );

      verify(
        () => mockAuthRepository.register(
          email: 'test@example.com',
          password: 'Password123!',
          firstName: 'John',
          lastName: 'Doe',
        ),
      ).called(1);
    });

    test(
      'should return AuthSessionEntity when registration succeeds',
      () async {
        when(
          () => mockAuthRepository.checkEmailAvailability(
            email: any(named: 'email'),
          ),
        ).thenAnswer((_) async => const Right(true));
        when(
          () => mockAuthRepository.register(
            email: any(named: 'email'),
            password: any(named: 'password'),
            firstName: any(named: 'firstName'),
            lastName: any(named: 'lastName'),
            clubId: any(named: 'clubId'),
          ),
        ).thenAnswer((_) async => Right(_testSession));

        final result = await useCase(
          email: 'test@example.com',
          password: 'Password123!',
          confirmPassword: 'Password123!',
          firstName: 'John',
          lastName: 'Doe',
        );

        expect(result.isRight(), true);
        result.fold((failure) => fail('Should return Right'), (session) {
          expect(session.user.email, 'test@example.com');
        });
      },
    );

    test('should return ValidationFailure when email is empty', () async {
      final result = await useCase(
        email: '',
        password: 'Password123!',
        confirmPassword: 'Password123!',
        firstName: 'John',
        lastName: 'Doe',
      );

      expect(result.isLeft(), true);
      result.fold((failure) {
        expect(failure, isA<ValidationFailure>());
        expect(failure.code, 'FIELD_REQUIRED');
      }, (_) => fail('Should return Left'));
    });

    test(
      'should return ValidationFailure when email format is invalid',
      () async {
        final result = await useCase(
          email: 'invalid-email',
          password: 'Password123!',
          confirmPassword: 'Password123!',
          firstName: 'John',
          lastName: 'Doe',
        );

        expect(result.isLeft(), true);
        result.fold((failure) {
          expect(failure, isA<ValidationFailure>());
          expect(failure.code, 'INVALID_EMAIL');
        }, (_) => fail('Should return Left'));
      },
    );

    test(
      'should return ValidationFailure when password is too short',
      () async {
        final result = await useCase(
          email: 'test@example.com',
          password: 'Pass1!',
          confirmPassword: 'Pass1!',
          firstName: 'John',
          lastName: 'Doe',
        );

        expect(result.isLeft(), true);
        result.fold((failure) {
          expect(failure, isA<ValidationFailure>());
          expect(failure.code, 'WEAK_PASSWORD');
        }, (_) => fail('Should return Left'));
      },
    );

    test(
      'should return ValidationFailure when password missing uppercase',
      () async {
        final result = await useCase(
          email: 'test@example.com',
          password: 'password123!',
          confirmPassword: 'password123!',
          firstName: 'John',
          lastName: 'Doe',
        );

        expect(result.isLeft(), true);
        result.fold((failure) {
          expect(failure, isA<ValidationFailure>());
          expect(failure.code, 'WEAK_PASSWORD');
        }, (_) => fail('Should return Left'));
      },
    );

    test(
      'should return ValidationFailure when password missing lowercase',
      () async {
        final result = await useCase(
          email: 'test@example.com',
          password: 'PASSWORD123!',
          confirmPassword: 'PASSWORD123!',
          firstName: 'John',
          lastName: 'Doe',
        );

        expect(result.isLeft(), true);
        result.fold((failure) {
          expect(failure, isA<ValidationFailure>());
          expect(failure.code, 'WEAK_PASSWORD');
        }, (_) => fail('Should return Left'));
      },
    );

    test(
      'should return ValidationFailure when password missing number',
      () async {
        final result = await useCase(
          email: 'test@example.com',
          password: 'Password!',
          confirmPassword: 'Password!',
          firstName: 'John',
          lastName: 'Doe',
        );

        expect(result.isLeft(), true);
        result.fold((failure) {
          expect(failure, isA<ValidationFailure>());
          expect(failure.code, 'WEAK_PASSWORD');
        }, (_) => fail('Should return Left'));
      },
    );

    test(
      'should return ValidationFailure when password missing special character',
      () async {
        final result = await useCase(
          email: 'test@example.com',
          password: 'Password123',
          confirmPassword: 'Password123',
          firstName: 'John',
          lastName: 'Doe',
        );

        expect(result.isLeft(), true);
        result.fold((failure) {
          expect(failure, isA<ValidationFailure>());
          expect(failure.code, 'WEAK_PASSWORD');
        }, (_) => fail('Should return Left'));
      },
    );

    test(
      'should return ValidationFailure when passwords do not match',
      () async {
        final result = await useCase(
          email: 'test@example.com',
          password: 'Password123!',
          confirmPassword: 'DifferentPassword123!',
          firstName: 'John',
          lastName: 'Doe',
        );

        expect(result.isLeft(), true);
        result.fold((failure) {
          expect(failure, isA<ValidationFailure>());
          expect(failure.code, 'INVALID_INPUT');
          expect(failure.message, contains('Passwords do not match'));
        }, (_) => fail('Should return Left'));
      },
    );

    test('should return ValidationFailure when firstName is empty', () async {
      final result = await useCase(
        email: 'test@example.com',
        password: 'Password123!',
        confirmPassword: 'Password123!',
        firstName: '',
        lastName: 'Doe',
      );

      expect(result.isLeft(), true);
      result.fold((failure) {
        expect(failure, isA<ValidationFailure>());
        expect(failure.code, 'FIELD_REQUIRED');
      }, (_) => fail('Should return Left'));
    });

    test(
      'should return ValidationFailure when firstName is too short',
      () async {
        final result = await useCase(
          email: 'test@example.com',
          password: 'Password123!',
          confirmPassword: 'Password123!',
          firstName: 'J',
          lastName: 'Doe',
        );

        expect(result.isLeft(), true);
        result.fold((failure) {
          expect(failure, isA<ValidationFailure>());
          expect(failure.code, 'INVALID_INPUT');
          expect(failure.message, contains('at least 2 characters'));
        }, (_) => fail('Should return Left'));
      },
    );

    test(
      'should return ValidationFailure when email is not available',
      () async {
        when(
          () => mockAuthRepository.checkEmailAvailability(
            email: any(named: 'email'),
          ),
        ).thenAnswer((_) async => const Right(false));

        final result = await useCase(
          email: 'taken@example.com',
          password: 'Password123!',
          confirmPassword: 'Password123!',
          firstName: 'John',
          lastName: 'Doe',
        );

        expect(result.isLeft(), true);
        result.fold((failure) {
          expect(failure, isA<ValidationFailure>());
          expect(failure.message, contains('already taken'));
        }, (_) => fail('Should return Left'));
        verifyNever(
          () => mockAuthRepository.register(
            email: any(named: 'email'),
            password: any(named: 'password'),
            firstName: any(named: 'firstName'),
            lastName: any(named: 'lastName'),
            clubId: any(named: 'clubId'),
          ),
        );
      },
    );
  });

  // ──────────────────────────────────────────────────────────────────────────
  // LogoutUsecase
  // ──────────────────────────────────────────────────────────────────────────
  group('LogoutUsecase', () {
    late LogoutUsecase useCase;

    setUp(() {
      useCase = LogoutUsecase(mockAuthRepository);
    });

    test('should call repository logout method', () async {
      when(
        () => mockAuthRepository.logout(),
      ).thenAnswer((_) async => const Right(true));

      final result = await useCase();

      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Should return Right'),
        (success) => expect(success, true),
      );
      verify(() => mockAuthRepository.logout()).called(1);
    });

    test('should return failure from repository', () async {
      when(
        () => mockAuthRepository.logout(),
      ).thenAnswer((_) async => Left(AuthFailure.unexpected('Logout failed')));

      final result = await useCase();

      expect(result.isLeft(), true);
      result.fold((failure) {
        expect(failure, isA<AuthFailure>());
        expect(failure.message, contains('Logout failed'));
      }, (_) => fail('Should return Left'));
    });
  });

  // ──────────────────────────────────────────────────────────────────────────
  // RefreshTokenUsecase
  // ──────────────────────────────────────────────────────────────────────────
  group('RefreshTokenUsecase', () {
    late RefreshTokenUsecase useCase;

    setUp(() {
      useCase = RefreshTokenUsecase(mockAuthRepository);
    });

    test('should return new session when token refresh succeeds', () async {
      when(
        () =>
            mockAuthRepository.refreshToken(refreshToken: 'test_refresh_token'),
      ).thenAnswer((_) async => Right(_testSession));

      final result = await useCase(refreshToken: 'test_refresh_token');

      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Should return Right'),
        (session) => expect(session.accessToken, 'test_access_token'),
      );
    });

    test(
      'should return ValidationFailure when refreshToken is empty',
      () async {
        final result = await useCase(refreshToken: '');

        expect(result.isLeft(), true);
        result.fold((failure) {
          expect(failure, isA<ValidationFailure>());
          expect(failure.code, 'FIELD_REQUIRED');
        }, (_) => fail('Should return Left'));
        verifyNever(
          () => mockAuthRepository.refreshToken(
            refreshToken: any(named: 'refreshToken'),
          ),
        );
      },
    );
  });

  // ──────────────────────────────────────────────────────────────────────────
  // GetCurrentUserUsecase
  // ──────────────────────────────────────────────────────────────────────────
  group('GetCurrentUserUsecase', () {
    late GetCurrentUserUsecase useCase;

    setUp(() {
      useCase = GetCurrentUserUsecase(mockAuthRepository);
    });

    test('should return current user when available', () async {
      when(
        () => mockAuthRepository.getCurrentUser(),
      ).thenAnswer((_) async => Right(_testUser));

      final result = await useCase();

      expect(result.isRight(), true);
      result.fold((failure) => fail('Should return Right'), (user) {
        expect(user?.id, 'user123');
        expect(user?.email, 'test@example.com');
      });
    });
  });

  // ──────────────────────────────────────────────────────────────────────────
  // CheckAuthStatusUsecase
  // ──────────────────────────────────────────────────────────────────────────
  group('CheckAuthStatusUsecase', () {
    late CheckAuthStatusUsecase useCase;

    setUp(() {
      useCase = CheckAuthStatusUsecase(mockAuthRepository);
    });

    test('should return true when user is authenticated', () async {
      when(
        () => mockAuthRepository.isAuthenticated(),
      ).thenAnswer((_) async => true);

      final result = await useCase();

      expect(result, true);
    });

    test('should return false when user is not authenticated', () async {
      when(
        () => mockAuthRepository.isAuthenticated(),
      ).thenAnswer((_) async => false);

      final result = await useCase();

      expect(result, false);
    });
  });

  // ──────────────────────────────────────────────────────────────────────────
  // BiometricAuthUsecase
  // ──────────────────────────────────────────────────────────────────────────
  group('BiometricAuthUsecase', () {
    late BiometricAuthUsecase useCase;

    setUp(() {
      useCase = BiometricAuthUsecase(mockAuthRepository);
    });

    test(
      'isAvailable should return true when biometrics are available',
      () async {
        when(
          () => mockAuthRepository.isBiometricAvailable(),
        ).thenAnswer((_) async => true);

        final result = await useCase.isAvailable();

        expect(result, true);
      },
    );

    test(
      'authenticate should return true when authentication succeeds',
      () async {
        when(
          () => mockAuthRepository.isBiometricAvailable(),
        ).thenAnswer((_) async => true);
        when(
          () => mockAuthRepository.authenticateWithBiometrics(),
        ).thenAnswer((_) async => const Right(true));

        final result = await useCase.authenticate();

        expect(result.isRight(), true);
        result.fold(
          (failure) => fail('Should return Right'),
          (success) => expect(success, true),
        );
      },
    );

    test(
      'authenticate should return failure when biometrics not available',
      () async {
        when(
          () => mockAuthRepository.isBiometricAvailable(),
        ).thenAnswer((_) async => false);

        final result = await useCase.authenticate();

        expect(result.isLeft(), true);
        result.fold((failure) {
          expect(failure, isA<AuthFailure>());
          expect(failure.code, 'BIOMETRIC_UNAVAILABLE');
        }, (_) => fail('Should return Left'));
        verifyNever(() => mockAuthRepository.authenticateWithBiometrics());
      },
    );

    test('setBiometricAuth should enable biometrics when available', () async {
      when(
        () => mockAuthRepository.isBiometricAvailable(),
      ).thenAnswer((_) async => true);
      when(
        () => mockAuthRepository.setBiometricAuth(enabled: true),
      ).thenAnswer((_) async => const Right(true));

      final result = await useCase.setBiometricAuth(enabled: true);

      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Should return Right'),
        (success) => expect(success, true),
      );
    });

    test(
      'setBiometricAuth should return failure when enabling but not available',
      () async {
        when(
          () => mockAuthRepository.isBiometricAvailable(),
        ).thenAnswer((_) async => false);

        final result = await useCase.setBiometricAuth(enabled: true);

        expect(result.isLeft(), true);
        result.fold((failure) {
          expect(failure, isA<AuthFailure>());
          expect(failure.code, 'BIOMETRIC_UNAVAILABLE');
        }, (_) => fail('Should return Left'));
        verifyNever(
          () => mockAuthRepository.setBiometricAuth(
            enabled: any(named: 'enabled'),
          ),
        );
      },
    );

    test(
      'setBiometricAuth should disable biometrics without checking availability',
      () async {
        when(
          () => mockAuthRepository.setBiometricAuth(enabled: false),
        ).thenAnswer((_) async => const Right(true));

        final result = await useCase.setBiometricAuth(enabled: false);

        expect(result.isRight(), true);
        result.fold(
          (failure) => fail('Should return Right'),
          (success) => expect(success, true),
        );
        verifyNever(() => mockAuthRepository.isBiometricAvailable());
      },
    );
  });
}
