import 'package:clubland/core/errors/failures.dart';
import 'package:clubland/features/auth/domain/entities/auth_session_entity.dart';
import 'package:clubland/features/auth/domain/entities/user_entity.dart';
import 'package:clubland/features/auth/domain/usecases/login_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../helpers/mock_providers.dart';
import '../../../../../helpers/test_helpers.dart';

void main() {
  late LoginUsecase useCase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    TestHelpers.setupFallbackValues();
    mockAuthRepository = MockAuthRepository();
    useCase = LoginUsecase(mockAuthRepository);
  });

  tearDown(() {
    reset(mockAuthRepository);
  });

  group('LoginUsecase', () {
    final testUser = UserEntity(
      id: '123',
      email: 'test@example.com',
      firstName: 'John',
      lastName: 'Doe',
      createdAt: DateTime.now(),
    );

    final testSession = AuthSessionEntity(
      accessToken: 'test-access-token',
      refreshToken: 'test-refresh-token',
      expiresAt: DateTime.now().add(const Duration(hours: 1)),
      user: testUser,
    );

    test('should return session when login is successful', () async {
      // Mock repository login success
      when(
        () => mockAuthRepository.login(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer((_) async => Right<Failure, AuthSessionEntity>(testSession));

      final result = await useCase.call(
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
        () => mockAuthRepository.login(
          email: 'test@example.com',
          password: 'password123',
        ),
      ).called(1);
    });

    test('should return failure when repository login fails', () async {
      // Mock repository login failure
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

      // Repository should not be called for invalid input
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

      // Repository should not be called for invalid input
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

      // Repository should not be called for invalid input
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

      // Repository should not be called for invalid input
      verifyNever(
        () => mockAuthRepository.login(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      );
    });

    test('should trim and lowercase email before calling repository', () async {
      // Mock repository login success
      when(
        () => mockAuthRepository.login(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer((_) async => Right<Failure, AuthSessionEntity>(testSession));

      final result = await useCase.call(
        email: 'Test@Example.Com',
        password: 'password12345',
      );

      // Verify the result is successful
      expect(result.isRight(), true);

      // Verify the email was trimmed and lowercased
      verify(
        () => mockAuthRepository.login(
          email: 'test@example.com',
          password: 'password12345',
        ),
      ).called(1);
    });

    test('should handle repository exceptions gracefully', () async {
      // Mock repository to throw an exception
      when(
        () => mockAuthRepository.login(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenThrow(Exception('Network error'));

      // This test should expect the exception to bubble up since the usecase doesn't handle exceptions
      expect(
        () =>
            useCase.call(email: 'test@example.com', password: 'password12345'),
        throwsA(isA<Exception>()),
      );
    });
  });
}
