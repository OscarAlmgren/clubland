import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:clubland/core/errors/failures.dart';
import 'package:clubland/features/auth/domain/repositories/auth_repository.dart';
import 'package:clubland/features/auth/domain/usecases/login_usecase.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  group('BiometricAuthUsecase', () {
    late BiometricAuthUsecase usecase;
    late MockAuthRepository mockRepository;

    setUp(() {
      mockRepository = MockAuthRepository();
      usecase = BiometricAuthUsecase(mockRepository);
    });

    group('isAvailable', () {
      test('should return true when biometric is available', () async {
        // Arrange
        when(() => mockRepository.isBiometricAvailable())
            .thenAnswer((_) async => true);

        // Act
        final result = await usecase.isAvailable();

        // Assert
        expect(result, true);
        verify(() => mockRepository.isBiometricAvailable()).called(1);
      });

      test('should return false when biometric is not available', () async {
        // Arrange
        when(() => mockRepository.isBiometricAvailable())
            .thenAnswer((_) async => false);

        // Act
        final result = await usecase.isAvailable();

        // Assert
        expect(result, false);
        verify(() => mockRepository.isBiometricAvailable()).called(1);
      });

      test('should handle repository errors gracefully', () async {
        // Arrange
        when(() => mockRepository.isBiometricAvailable())
            .thenThrow(Exception('Device check failed'));

        // Act & Assert
        expect(
          () => usecase.isAvailable(),
          throwsException,
        );
      });
    });

    group('authenticate', () {
      test('should successfully authenticate when biometric is available',
          () async {
        // Arrange
        when(() => mockRepository.isBiometricAvailable())
            .thenAnswer((_) async => true);
        when(() => mockRepository.authenticateWithBiometrics())
            .thenAnswer((_) async => const Right(true));

        // Act
        final result = await usecase.authenticate();

        // Assert
        expect(result.isRight(), true);
        result.fold(
          (failure) => fail('Should return success'),
          (success) => expect(success, true),
        );

        verify(() => mockRepository.isBiometricAvailable()).called(1);
        verify(() => mockRepository.authenticateWithBiometrics()).called(1);
      });

      test('should return failure when biometric is not available', () async {
        // Arrange
        when(() => mockRepository.isBiometricAvailable())
            .thenAnswer((_) async => false);

        // Act
        final result = await usecase.authenticate();

        // Assert
        expect(result.isLeft(), true);
        result.fold(
          (failure) {
            expect(failure, isA<AuthFailure>());
            expect(failure.message, contains('not available'));
          },
          (success) => fail('Should return failure'),
        );

        verify(() => mockRepository.isBiometricAvailable()).called(1);
        verifyNever(() => mockRepository.authenticateWithBiometrics());
      });

      test('should return failure when authentication fails', () async {
        // Arrange
        when(() => mockRepository.isBiometricAvailable())
            .thenAnswer((_) async => true);
        when(() => mockRepository.authenticateWithBiometrics())
            .thenAnswer((_) async => Left(AuthFailure.biometricFailed()));

        // Act
        final result = await usecase.authenticate();

        // Assert
        expect(result.isLeft(), true);
        result.fold(
          (failure) => expect(failure, isA<AuthFailure>()),
          (success) => fail('Should return failure'),
        );

        verify(() => mockRepository.isBiometricAvailable()).called(1);
        verify(() => mockRepository.authenticateWithBiometrics()).called(1);
      });

      test('should return false when user cancels authentication', () async {
        // Arrange
        when(() => mockRepository.isBiometricAvailable())
            .thenAnswer((_) async => true);
        when(() => mockRepository.authenticateWithBiometrics())
            .thenAnswer((_) async => const Right(false));

        // Act
        final result = await usecase.authenticate();

        // Assert
        expect(result.isRight(), true);
        result.fold(
          (failure) => fail('Should return success'),
          (success) => expect(success, false),
        );
      });

      test('should handle multiple authentication attempts', () async {
        // Arrange
        when(() => mockRepository.isBiometricAvailable())
            .thenAnswer((_) async => true);
        when(() => mockRepository.authenticateWithBiometrics())
            .thenAnswer((_) async => const Right(true));

        // Act
        final result1 = await usecase.authenticate();
        final result2 = await usecase.authenticate();
        final result3 = await usecase.authenticate();

        // Assert
        expect(result1.isRight(), true);
        expect(result2.isRight(), true);
        expect(result3.isRight(), true);

        verify(() => mockRepository.isBiometricAvailable()).called(3);
        verify(() => mockRepository.authenticateWithBiometrics()).called(3);
      });

      test('should handle authentication timeout', () async {
        // Arrange
        when(() => mockRepository.isBiometricAvailable())
            .thenAnswer((_) async => true);
        when(() => mockRepository.authenticateWithBiometrics())
            .thenAnswer((_) async => Left(AuthFailure.timeout()));

        // Act
        final result = await usecase.authenticate();

        // Assert
        expect(result.isLeft(), true);
        result.fold(
          (failure) => expect(failure, isA<AuthFailure>()),
          (success) => fail('Should return failure'),
        );
      });

      test('should handle device lockout scenario', () async {
        // Arrange
        when(() => mockRepository.isBiometricAvailable())
            .thenAnswer((_) async => true);
        when(() => mockRepository.authenticateWithBiometrics())
            .thenAnswer((_) async => Left(AuthFailure.biometricLockout()));

        // Act
        final result = await usecase.authenticate();

        // Assert
        expect(result.isLeft(), true);
        result.fold(
          (failure) {
            expect(failure, isA<AuthFailure>());
            expect(failure.message, contains('locked'));
          },
          (success) => fail('Should return failure'),
        );
      });
    });

    group('setBiometricAuth', () {
      test('should successfully enable biometric auth when available',
          () async {
        // Arrange
        when(() => mockRepository.isBiometricAvailable())
            .thenAnswer((_) async => true);
        when(() => mockRepository.setBiometricAuth(enabled: true))
            .thenAnswer((_) async => const Right(true));

        // Act
        final result = await usecase.setBiometricAuth(enabled: true);

        // Assert
        expect(result.isRight(), true);
        result.fold(
          (failure) => fail('Should return success'),
          (success) => expect(success, true),
        );

        verify(() => mockRepository.isBiometricAvailable()).called(1);
        verify(() => mockRepository.setBiometricAuth(enabled: true)).called(1);
      });

      test('should return failure when enabling but biometric not available',
          () async {
        // Arrange
        when(() => mockRepository.isBiometricAvailable())
            .thenAnswer((_) async => false);

        // Act
        final result = await usecase.setBiometricAuth(enabled: true);

        // Assert
        expect(result.isLeft(), true);
        result.fold(
          (failure) {
            expect(failure, isA<AuthFailure>());
            expect(failure.message, contains('not available'));
          },
          (success) => fail('Should return failure'),
        );

        verify(() => mockRepository.isBiometricAvailable()).called(1);
        verifyNever(() => mockRepository.setBiometricAuth(enabled: any(named: 'enabled')));
      });

      test('should successfully disable biometric auth without checking availability',
          () async {
        // Arrange
        when(() => mockRepository.setBiometricAuth(enabled: false))
            .thenAnswer((_) async => const Right(true));

        // Act
        final result = await usecase.setBiometricAuth(enabled: false);

        // Assert
        expect(result.isRight(), true);
        result.fold(
          (failure) => fail('Should return success'),
          (success) => expect(success, true),
        );

        // Should not check availability when disabling
        verifyNever(() => mockRepository.isBiometricAvailable());
        verify(() => mockRepository.setBiometricAuth(enabled: false)).called(1);
      });

      test('should handle repository failure when enabling', () async {
        // Arrange
        when(() => mockRepository.isBiometricAvailable())
            .thenAnswer((_) async => true);
        when(() => mockRepository.setBiometricAuth(enabled: true))
            .thenAnswer((_) async => Left(AuthFailure.unknown()));

        // Act
        final result = await usecase.setBiometricAuth(enabled: true);

        // Assert
        expect(result.isLeft(), true);
        verify(() => mockRepository.setBiometricAuth(enabled: true)).called(1);
      });

      test('should handle repository failure when disabling', () async {
        // Arrange
        when(() => mockRepository.setBiometricAuth(enabled: false))
            .thenAnswer((_) async => Left(AuthFailure.unknown()));

        // Act
        final result = await usecase.setBiometricAuth(enabled: false);

        // Assert
        expect(result.isLeft(), true);
        verify(() => mockRepository.setBiometricAuth(enabled: false)).called(1);
      });

      test('should handle multiple enable/disable operations', () async {
        // Arrange
        when(() => mockRepository.isBiometricAvailable())
            .thenAnswer((_) async => true);
        when(() => mockRepository.setBiometricAuth(enabled: true))
            .thenAnswer((_) async => const Right(true));
        when(() => mockRepository.setBiometricAuth(enabled: false))
            .thenAnswer((_) async => const Right(true));

        // Act
        final enable1 = await usecase.setBiometricAuth(enabled: true);
        final disable1 = await usecase.setBiometricAuth(enabled: false);
        final enable2 = await usecase.setBiometricAuth(enabled: true);

        // Assert
        expect(enable1.isRight(), true);
        expect(disable1.isRight(), true);
        expect(enable2.isRight(), true);

        verify(() => mockRepository.isBiometricAvailable()).called(2);
        verify(() => mockRepository.setBiometricAuth(enabled: true)).called(2);
        verify(() => mockRepository.setBiometricAuth(enabled: false)).called(1);
      });

      test('should handle permission denied scenario', () async {
        // Arrange
        when(() => mockRepository.isBiometricAvailable())
            .thenAnswer((_) async => true);
        when(() => mockRepository.setBiometricAuth(enabled: true))
            .thenAnswer((_) async => Left(AuthFailure.permissionDenied()));

        // Act
        final result = await usecase.setBiometricAuth(enabled: true);

        // Assert
        expect(result.isLeft(), true);
        result.fold(
          (failure) => expect(failure, isA<AuthFailure>()),
          (success) => fail('Should return failure'),
        );
      });
    });

    group('Integration Scenarios', () {
      test('should complete full biometric setup flow', () async {
        // Arrange
        when(() => mockRepository.isBiometricAvailable())
            .thenAnswer((_) async => true);
        when(() => mockRepository.setBiometricAuth(enabled: true))
            .thenAnswer((_) async => const Right(true));
        when(() => mockRepository.authenticateWithBiometrics())
            .thenAnswer((_) async => const Right(true));

        // Act - Check availability
        final isAvailable = await usecase.isAvailable();
        expect(isAvailable, true);

        // Act - Enable biometric auth
        final enableResult = await usecase.setBiometricAuth(enabled: true);
        expect(enableResult.isRight(), true);

        // Act - Authenticate
        final authResult = await usecase.authenticate();
        expect(authResult.isRight(), true);

        // Assert
        verify(() => mockRepository.isBiometricAvailable()).called(3);
        verify(() => mockRepository.setBiometricAuth(enabled: true)).called(1);
        verify(() => mockRepository.authenticateWithBiometrics()).called(1);
      });

      test('should handle device without biometric support', () async {
        // Arrange
        when(() => mockRepository.isBiometricAvailable())
            .thenAnswer((_) async => false);

        // Act - Check availability
        final isAvailable = await usecase.isAvailable();
        expect(isAvailable, false);

        // Act - Try to enable (should fail)
        final enableResult = await usecase.setBiometricAuth(enabled: true);
        expect(enableResult.isLeft(), true);

        // Act - Try to authenticate (should fail)
        final authResult = await usecase.authenticate();
        expect(authResult.isLeft(), true);

        // Assert
        verify(() => mockRepository.isBiometricAvailable()).called(3);
        verifyNever(() => mockRepository.setBiometricAuth(enabled: any(named: 'enabled')));
        verifyNever(() => mockRepository.authenticateWithBiometrics());
      });

      test('should handle user disabling previously enabled biometric auth',
          () async {
        // Arrange
        when(() => mockRepository.isBiometricAvailable())
            .thenAnswer((_) async => true);
        when(() => mockRepository.setBiometricAuth(enabled: true))
            .thenAnswer((_) async => const Right(true));
        when(() => mockRepository.setBiometricAuth(enabled: false))
            .thenAnswer((_) async => const Right(true));

        // Act - Enable
        final enableResult = await usecase.setBiometricAuth(enabled: true);
        expect(enableResult.isRight(), true);

        // Act - Disable
        final disableResult = await usecase.setBiometricAuth(enabled: false);
        expect(disableResult.isRight(), true);

        // Assert
        verify(() => mockRepository.setBiometricAuth(enabled: true)).called(1);
        verify(() => mockRepository.setBiometricAuth(enabled: false)).called(1);
      });

      test('should handle failed authentication followed by successful retry',
          () async {
        // Arrange
        when(() => mockRepository.isBiometricAvailable())
            .thenAnswer((_) async => true);

        var callCount = 0;
        when(() => mockRepository.authenticateWithBiometrics())
            .thenAnswer((_) async {
              callCount++;
              return callCount == 1 ? const Right(false) : const Right(true);
            });

        // Act - First attempt fails
        final result1 = await usecase.authenticate();
        expect(result1.isRight(), true);
        result1.fold(
          (failure) => fail('Should return success'),
          (success) => expect(success, false),
        );

        // Act - Second attempt succeeds
        final result2 = await usecase.authenticate();
        expect(result2.isRight(), true);
        result2.fold(
          (failure) => fail('Should return success'),
          (success) => expect(success, true),
        );

        // Assert
        verify(() => mockRepository.authenticateWithBiometrics()).called(2);
      });
    });

    group('Edge Cases', () {
      test('should handle rapid successive availability checks', () async {
        // Arrange
        when(() => mockRepository.isBiometricAvailable())
            .thenAnswer((_) async => true);

        // Act
        final futures = List.generate(
          10,
          (_) => usecase.isAvailable(),
        );
        final results = await Future.wait(futures);

        // Assert
        expect(results.every((r) => r == true), true);
        verify(() => mockRepository.isBiometricAvailable()).called(10);
      });

      test('should handle concurrent authentication attempts', () async {
        // Arrange
        when(() => mockRepository.isBiometricAvailable())
            .thenAnswer((_) async => true);
        when(() => mockRepository.authenticateWithBiometrics())
            .thenAnswer((_) async => const Right(true));

        // Act
        final futures = List.generate(
          3,
          (_) => usecase.authenticate(),
        );
        final results = await Future.wait(futures);

        // Assert
        expect(results.every((r) => r.isRight()), true);
        verify(() => mockRepository.authenticateWithBiometrics()).called(3);
      });

      test('should handle repository throwing unexpected errors', () async {
        // Arrange
        when(() => mockRepository.isBiometricAvailable())
            .thenAnswer((_) async => true);
        when(() => mockRepository.authenticateWithBiometrics())
            .thenThrow(Exception('Unexpected error'));

        // Act & Assert
        expect(
          () => usecase.authenticate(),
          throwsException,
        );
      });

      test('should handle delayed repository responses', () async {
        // Arrange
        when(() => mockRepository.isBiometricAvailable())
            .thenAnswer((_) async {
          await Future<void>.delayed(const Duration(milliseconds: 100));
          return true;
        });
        when(() => mockRepository.authenticateWithBiometrics())
            .thenAnswer((_) async {
          await Future<void>.delayed(const Duration(milliseconds: 200));
          return const Right(true);
        });

        // Act
        final startTime = DateTime.now();
        final result = await usecase.authenticate();
        final duration = DateTime.now().difference(startTime);

        // Assert
        expect(result.isRight(), true);
        expect(duration.inMilliseconds, greaterThanOrEqualTo(300));
      });
    });
  });
}
