import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../../lib/core/errors/failures.dart';
import '../../../../../../lib/features/auth/domain/entities/user.dart';
import '../../../../../../lib/features/auth/domain/usecases/login_usecase.dart';
import '../../../../../helpers/mock_providers.dart';
import '../../../../../helpers/test_helpers.dart';

void main() {
  late LoginUseCase useCase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    useCase = LoginUseCase(mockAuthRepository);
  });

  tearDown(() {
    reset(mockAuthRepository);
  });

  group('LoginUseCase', () {
    const testUser = User(
      id: '123',
      email: TestConstants.testEmail,
      firstName: TestConstants.testFirstName,
      lastName: TestConstants.testLastName,
      isVerified: true,
    );

    test('should return user when login is successful', () async {
      when(() => mockAuthRepository.login(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenAnswer((_) async => const Right(testUser));

      final result = await useCase(LoginParams(
        email: TestConstants.testEmail,
        password: TestConstants.testPassword,
      ));

      expect(result, const Right(testUser));
      verify(() => mockAuthRepository.login(
            email: TestConstants.testEmail,
            password: TestConstants.testPassword,
          )).called(1);
    });

    test('should return failure when login fails', () async {
      const failure = AuthFailure.invalidCredentials();
      when(() => mockAuthRepository.login(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenAnswer((_) async => const Left(failure));

      final result = await useCase(LoginParams(
        email: TestConstants.testEmail,
        password: TestConstants.testPassword,
      ));

      expect(result, const Left(failure));
      verify(() => mockAuthRepository.login(
            email: TestConstants.testEmail,
            password: TestConstants.testPassword,
          )).called(1);
    });

    test('should return failure for empty email', () async {
      final result = await useCase(LoginParams(
        email: '',
        password: TestConstants.testPassword,
      ));

      expect(result.isLeft(), true);
      verifyNever(() => mockAuthRepository.login(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ));
    });

    test('should return failure for empty password', () async {
      final result = await useCase(LoginParams(
        email: TestConstants.testEmail,
        password: '',
      ));

      expect(result.isLeft(), true);
      verifyNever(() => mockAuthRepository.login(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ));
    });

    test('should trim email before login', () async {
      when(() => mockAuthRepository.login(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenAnswer((_) async => const Right(testUser));

      await useCase(LoginParams(
        email: '  ${TestConstants.testEmail}  ',
        password: TestConstants.testPassword,
      ));

      verify(() => mockAuthRepository.login(
            email: TestConstants.testEmail,
            password: TestConstants.testPassword,
          )).called(1);
    });
  });

  group('LoginParams', () {
    test('should support equality comparison', () {
      const params1 = LoginParams(
        email: TestConstants.testEmail,
        password: TestConstants.testPassword,
      );

      const params2 = LoginParams(
        email: TestConstants.testEmail,
        password: TestConstants.testPassword,
      );

      expect(params1, equals(params2));
    });

    test('should support inequality comparison', () {
      const params1 = LoginParams(
        email: TestConstants.testEmail,
        password: TestConstants.testPassword,
      );

      const params2 = LoginParams(
        email: 'different@example.com',
        password: TestConstants.testPassword,
      );

      expect(params1, isNot(equals(params2)));
    });
  });
}