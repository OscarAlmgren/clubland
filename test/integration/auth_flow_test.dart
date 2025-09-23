import 'package:clubland/core/errors/failures.dart';
import 'package:clubland/features/auth/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mocktail/mocktail.dart';

import '../helpers/mock_providers.dart';
import '../helpers/test_helpers.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late MockLoginUsecase mockLoginUsecase;

  setUp(() async {
    TestHelpers.setupFallbackValues();
    mockLoginUsecase = MockLoginUsecase();
  });

  tearDown(MockProviders.resetAll);

  group('Authentication Flow Integration Tests', () {
    final testUser = UserEntity(
      id: '123',
      email: 'test@example.com',
      firstName: 'Test',
      lastName: 'User',
      createdAt: DateTime.now(),
    );

    test('Login usecase returns success', () async {
      // Mock the login usecase to return success
      when(
        () => mockLoginUsecase.call(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer(
        (_) async => Right<Failure, AuthSessionEntity>(
          AuthSessionEntity(
            accessToken: 'test-token',
            refreshToken: 'test-refresh',
            expiresAt: DateTime.now().add(const Duration(hours: 1)),
            user: testUser,
          ),
        ),
      );

      // Execute the usecase
      final result = await mockLoginUsecase.call(
        email: 'test@example.com',
        password: 'password123',
      );

      // Verify the result
      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Expected success but got failure: $failure'),
        (session) {
          expect(session.user.email, 'test@example.com');
          expect(session.accessToken, 'test-token');
        },
      );

      // Verify the usecase was called
      verify(
        () => mockLoginUsecase.call(
          email: 'test@example.com',
          password: 'password123',
        ),
      ).called(1);
    });

    test('Login usecase returns failure for invalid credentials', () async {
      // Mock the login usecase to return failure
      when(
        () => mockLoginUsecase.call(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer(
        (_) async =>
            Left<Failure, AuthSessionEntity>(AuthFailure.invalidCredentials()),
      );

      // Execute the usecase
      final result = await mockLoginUsecase.call(
        email: 'invalid@example.com',
        password: 'wrongpassword',
      );

      // Verify the result
      expect(result.isLeft(), true);
      result.fold(
        (failure) => expect(failure, isA<AuthFailure>()),
        (session) => fail('Expected failure but got success: $session'),
      );

      // Verify the usecase was called
      verify(
        () => mockLoginUsecase.call(
          email: 'invalid@example.com',
          password: 'wrongpassword',
        ),
      ).called(1);
    });
  });
}
