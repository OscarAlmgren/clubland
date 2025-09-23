import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../../lib/core/errors/failures.dart';
import '../../../../../../lib/features/auth/data/repositories/auth_repository_impl.dart';
import '../../../../../../lib/features/auth/domain/entities/user.dart';
import '../../../../../helpers/mock_providers.dart';
import '../../../../../helpers/test_helpers.dart';

void main() {
  late AuthRepositoryImpl repository;
  late MockAuthRemoteDataSource mockRemoteDataSource;
  late MockAuthLocalDataSource mockLocalDataSource;
  late MockNetworkService mockNetworkService;

  setUp(() {
    mockRemoteDataSource = MockAuthRemoteDataSource();
    mockLocalDataSource = MockAuthLocalDataSource();
    mockNetworkService = MockNetworkService();
    repository = AuthRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkService: mockNetworkService,
    );
  });

  tearDown(() {
    MockProviders.reset();
  });

  group('AuthRepositoryImpl', () {
    const testUser = User(
      id: '123',
      email: TestConstants.testEmail,
      firstName: TestConstants.testFirstName,
      lastName: TestConstants.testLastName,
      isVerified: true,
    );

    group('login', () {
      test('should return user when login is successful and network is available', () async {
        when(() => mockNetworkService.isConnected()).thenAnswer((_) async => true);
        when(() => mockRemoteDataSource.login(
              email: any(named: 'email'),
              password: any(named: 'password'),
            )).thenAnswer((_) async => testUser);
        when(() => mockLocalDataSource.cacheUser(any())).thenAnswer((_) async {});

        final result = await repository.login(
          email: TestConstants.testEmail,
          password: TestConstants.testPassword,
        );

        expect(result, const Right(testUser));
        verify(() => mockRemoteDataSource.login(
              email: TestConstants.testEmail,
              password: TestConstants.testPassword,
            )).called(1);
        verify(() => mockLocalDataSource.cacheUser(testUser)).called(1);
      });

      test('should return network failure when no internet connection', () async {
        when(() => mockNetworkService.isConnected()).thenAnswer((_) async => false);

        final result = await repository.login(
          email: TestConstants.testEmail,
          password: TestConstants.testPassword,
        );

        expect(result.isLeft(), true);
        result.fold(
          (failure) => expect(failure, isA<NetworkFailure>()),
          (user) => fail('Should return failure'),
        );
        verifyNever(() => mockRemoteDataSource.login(
              email: any(named: 'email'),
              password: any(named: 'password'),
            ));
      });

      test('should return auth failure when login fails', () async {
        when(() => mockNetworkService.isConnected()).thenAnswer((_) async => true);
        when(() => mockRemoteDataSource.login(
              email: any(named: 'email'),
              password: any(named: 'password'),
            )).thenThrow(Exception('Invalid credentials'));

        final result = await repository.login(
          email: TestConstants.testEmail,
          password: TestConstants.testPassword,
        );

        expect(result.isLeft(), true);
        result.fold(
          (failure) => expect(failure, isA<AuthFailure>()),
          (user) => fail('Should return failure'),
        );
      });
    });

    group('register', () {
      test('should return user when registration is successful', () async {
        when(() => mockNetworkService.isConnected()).thenAnswer((_) async => true);
        when(() => mockRemoteDataSource.register(
              email: any(named: 'email'),
              password: any(named: 'password'),
              firstName: any(named: 'firstName'),
              lastName: any(named: 'lastName'),
            )).thenAnswer((_) async => testUser);
        when(() => mockLocalDataSource.cacheUser(any())).thenAnswer((_) async {});

        final result = await repository.register(
          email: TestConstants.testEmail,
          password: TestConstants.testPassword,
          firstName: TestConstants.testFirstName,
          lastName: TestConstants.testLastName,
        );

        expect(result, const Right(testUser));
        verify(() => mockRemoteDataSource.register(
              email: TestConstants.testEmail,
              password: TestConstants.testPassword,
              firstName: TestConstants.testFirstName,
              lastName: TestConstants.testLastName,
            )).called(1);
        verify(() => mockLocalDataSource.cacheUser(testUser)).called(1);
      });
    });

    group('logout', () {
      test('should return success when logout is successful', () async {
        when(() => mockNetworkService.isConnected()).thenAnswer((_) async => true);
        when(() => mockRemoteDataSource.logout()).thenAnswer((_) async {});
        when(() => mockLocalDataSource.clearCache()).thenAnswer((_) async {});

        final result = await repository.logout();

        expect(result, const Right(unit));
        verify(() => mockRemoteDataSource.logout()).called(1);
        verify(() => mockLocalDataSource.clearCache()).called(1);
      });

      test('should clear local cache even when remote logout fails', () async {
        when(() => mockNetworkService.isConnected()).thenAnswer((_) async => true);
        when(() => mockRemoteDataSource.logout()).thenThrow(Exception('Server error'));
        when(() => mockLocalDataSource.clearCache()).thenAnswer((_) async {});

        final result = await repository.logout();

        expect(result, const Right(unit));
        verify(() => mockLocalDataSource.clearCache()).called(1);
      });

      test('should clear local cache when no internet connection', () async {
        when(() => mockNetworkService.isConnected()).thenAnswer((_) async => false);
        when(() => mockLocalDataSource.clearCache()).thenAnswer((_) async {});

        final result = await repository.logout();

        expect(result, const Right(unit));
        verify(() => mockLocalDataSource.clearCache()).called(1);
        verifyNever(() => mockRemoteDataSource.logout());
      });
    });

    group('getCurrentUser', () {
      test('should return cached user when available', () async {
        when(() => mockLocalDataSource.getUser()).thenAnswer((_) async => testUser);

        final result = await repository.getCurrentUser();

        expect(result, const Right(testUser));
        verify(() => mockLocalDataSource.getUser()).called(1);
      });

      test('should return failure when no cached user', () async {
        when(() => mockLocalDataSource.getUser()).thenAnswer((_) async => null);

        final result = await repository.getCurrentUser();

        expect(result.isLeft(), true);
        result.fold(
          (failure) => expect(failure, isA<CacheFailure>()),
          (user) => fail('Should return failure'),
        );
      });
    });
  });
}