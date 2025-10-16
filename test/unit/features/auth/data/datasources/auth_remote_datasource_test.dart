import 'package:clubland/core/errors/failures.dart';
import 'package:clubland/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:local_auth/local_auth.dart';
import 'package:logger/logger.dart';
import 'package:mocktail/mocktail.dart';

class MockGraphQLClient extends Mock implements GraphQLClient {}

class MockLogger extends Mock implements Logger {}

class MockLocalAuthentication extends Mock implements LocalAuthentication {}

void main() {
  late MockGraphQLClient mockGraphQLClient;
  late MockLogger mockLogger;
  late MockLocalAuthentication mockLocalAuth;
  late AuthRemoteDataSourceImpl dataSource;

  setUpAll(() {
    // Register fallback values for mocktail
    registerFallbackValue(const AuthenticationOptions());
  });

  setUp(() {
    mockGraphQLClient = MockGraphQLClient();
    mockLogger = MockLogger();
    mockLocalAuth = MockLocalAuthentication();
    dataSource = AuthRemoteDataSourceImpl(
      graphqlClient: mockGraphQLClient,
      logger: mockLogger,
      localAuth: mockLocalAuth,
    );
  });

  group('Biometric Authentication', () {
    group('isBiometricAvailable', () {
      test('should return true when biometrics are available and enrolled', () async {
        // Arrange
        when(() => mockLocalAuth.canCheckBiometrics).thenAnswer((_) async => true);
        when(() => mockLocalAuth.isDeviceSupported()).thenAnswer((_) async => true);
        when(() => mockLocalAuth.getAvailableBiometrics()).thenAnswer(
          (_) async => [BiometricType.face, BiometricType.fingerprint],
        );

        // Act
        final result = await dataSource.isBiometricAvailable();

        // Assert
        expect(result, true);
        verify(() => mockLocalAuth.canCheckBiometrics).called(1);
        verify(() => mockLocalAuth.isDeviceSupported()).called(1);
        verify(() => mockLocalAuth.getAvailableBiometrics()).called(1);
      });

      test('should return false when device cannot check biometrics', () async {
        // Arrange
        when(() => mockLocalAuth.canCheckBiometrics).thenAnswer((_) async => false);
        when(() => mockLocalAuth.isDeviceSupported()).thenAnswer((_) async => true);

        // Act
        final result = await dataSource.isBiometricAvailable();

        // Assert
        expect(result, false);
        verify(() => mockLocalAuth.canCheckBiometrics).called(1);
        verify(() => mockLocalAuth.isDeviceSupported()).called(1);
        verifyNever(() => mockLocalAuth.getAvailableBiometrics());
      });

      test('should return false when device is not supported', () async {
        // Arrange
        when(() => mockLocalAuth.canCheckBiometrics).thenAnswer((_) async => true);
        when(() => mockLocalAuth.isDeviceSupported()).thenAnswer((_) async => false);

        // Act
        final result = await dataSource.isBiometricAvailable();

        // Assert
        expect(result, false);
        verify(() => mockLocalAuth.canCheckBiometrics).called(1);
        verify(() => mockLocalAuth.isDeviceSupported()).called(1);
        verifyNever(() => mockLocalAuth.getAvailableBiometrics());
      });

      test('should return false when no biometrics are enrolled', () async {
        // Arrange
        when(() => mockLocalAuth.canCheckBiometrics).thenAnswer((_) async => true);
        when(() => mockLocalAuth.isDeviceSupported()).thenAnswer((_) async => true);
        when(() => mockLocalAuth.getAvailableBiometrics()).thenAnswer(
          (_) async => [],
        );

        // Act
        final result = await dataSource.isBiometricAvailable();

        // Assert
        expect(result, false);
        verify(() => mockLocalAuth.getAvailableBiometrics()).called(1);
      });

      test('should return false and log error on exception', () async {
        // Arrange
        when(() => mockLocalAuth.canCheckBiometrics).thenThrow(Exception('Test error'));

        // Act
        final result = await dataSource.isBiometricAvailable();

        // Assert
        expect(result, false);
        verify(() => mockLogger.e(any())).called(1);
      });
    });

    group('authenticateWithBiometrics', () {
      test('should return Right(true) when authentication succeeds', () async {
        // Arrange
        when(() => mockLocalAuth.canCheckBiometrics).thenAnswer((_) async => true);
        when(() => mockLocalAuth.isDeviceSupported()).thenAnswer((_) async => true);
        when(() => mockLocalAuth.getAvailableBiometrics()).thenAnswer(
          (_) async => [BiometricType.face],
        );
        when(
          () => mockLocalAuth.authenticate(
            localizedReason: any(named: 'localizedReason'),
            options: any(named: 'options'),
          ),
        ).thenAnswer((_) async => true);

        // Act
        final result = await dataSource.authenticateWithBiometrics();

        // Assert
        expect(result.isRight(), true);
        result.fold(
          (failure) => fail('Should not return failure'),
          (success) => expect(success, true),
        );
        verify(() => mockLogger.d('Biometric authentication successful')).called(1);
      });

      test('should return Left(AuthFailure) when biometric is not available', () async {
        // Arrange
        when(() => mockLocalAuth.canCheckBiometrics).thenAnswer((_) async => false);
        when(() => mockLocalAuth.isDeviceSupported()).thenAnswer((_) async => true);

        // Act
        final result = await dataSource.authenticateWithBiometrics();

        // Assert
        expect(result.isLeft(), true);
        result.fold(
          (failure) {
            expect(failure, isA<AuthFailure>());
            expect(failure.code, 'BIOMETRIC_UNAVAILABLE');
          },
          (success) => fail('Should not return success'),
        );
      });

      test('should return Left(AuthFailure) when authentication fails', () async {
        // Arrange
        when(() => mockLocalAuth.canCheckBiometrics).thenAnswer((_) async => true);
        when(() => mockLocalAuth.isDeviceSupported()).thenAnswer((_) async => true);
        when(() => mockLocalAuth.getAvailableBiometrics()).thenAnswer(
          (_) async => [BiometricType.fingerprint],
        );
        when(
          () => mockLocalAuth.authenticate(
            localizedReason: any(named: 'localizedReason'),
            options: any(named: 'options'),
          ),
        ).thenAnswer((_) async => false);

        // Act
        final result = await dataSource.authenticateWithBiometrics();

        // Assert
        expect(result.isLeft(), true);
        result.fold(
          (failure) {
            expect(failure, isA<AuthFailure>());
            expect(failure.message, contains('Biometric authentication failed'));
          },
          (success) => fail('Should not return success'),
        );
        verify(() => mockLogger.w('Biometric authentication failed or cancelled')).called(1);
      });

      test('should return Left(AuthFailure) on exception', () async {
        // Arrange
        when(() => mockLocalAuth.canCheckBiometrics).thenThrow(Exception('Test error'));

        // Act
        final result = await dataSource.authenticateWithBiometrics();

        // Assert
        expect(result.isLeft(), true);
        result.fold(
          (failure) {
            expect(failure, isA<AuthFailure>());
            expect(failure.message, contains('Biometric error'));
          },
          (success) => fail('Should not return success'),
        );
        verify(() => mockLogger.e(any())).called(1);
      });
    });

    group('setBiometricAuth', () {
      test('should return Right(true) when enabling biometric auth successfully', () async {
        // Arrange
        when(() => mockLocalAuth.canCheckBiometrics).thenAnswer((_) async => true);
        when(() => mockLocalAuth.isDeviceSupported()).thenAnswer((_) async => true);
        when(() => mockLocalAuth.getAvailableBiometrics()).thenAnswer(
          (_) async => [BiometricType.face],
        );

        // Act
        final result = await dataSource.setBiometricAuth(enabled: true);

        // Assert
        expect(result.isRight(), true);
        result.fold(
          (failure) => fail('Should not return failure'),
          (success) => expect(success, true),
        );
        verify(() => mockLogger.d('Biometric auth enabled')).called(1);
      });

      test('should return Right(true) when disabling biometric auth', () async {
        // Act
        final result = await dataSource.setBiometricAuth(enabled: false);

        // Assert
        expect(result.isRight(), true);
        result.fold(
          (failure) => fail('Should not return failure'),
          (success) => expect(success, true),
        );
        verify(() => mockLogger.d('Biometric auth disabled')).called(1);
        verifyNever(() => mockLocalAuth.canCheckBiometrics);
      });

      test('should return Left(AuthFailure) when enabling but biometric is not available', () async {
        // Arrange
        when(() => mockLocalAuth.canCheckBiometrics).thenAnswer((_) async => false);
        when(() => mockLocalAuth.isDeviceSupported()).thenAnswer((_) async => true);

        // Act
        final result = await dataSource.setBiometricAuth(enabled: true);

        // Assert
        expect(result.isLeft(), true);
        result.fold(
          (failure) {
            expect(failure, isA<AuthFailure>());
            expect(failure.code, 'BIOMETRIC_UNAVAILABLE');
          },
          (success) => fail('Should not return success'),
        );
      });

      test('should return Left(AuthFailure) on exception', () async {
        // Arrange
        when(() => mockLocalAuth.canCheckBiometrics).thenThrow(Exception('Test error'));

        // Act
        final result = await dataSource.setBiometricAuth(enabled: true);

        // Assert
        expect(result.isLeft(), true);
        result.fold(
          (failure) {
            expect(failure, isA<AuthFailure>());
            expect(failure.message, contains('Error setting biometric auth'));
          },
          (success) => fail('Should not return success'),
        );
        verify(() => mockLogger.e(any())).called(1);
      });
    });
  });
}
