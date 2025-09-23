import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import '../../lib/core/network/network_service.dart';
import '../../lib/core/storage/local_storage.dart';
import '../../lib/core/storage/secure_storage.dart';
import '../../lib/features/auth/data/datasources/auth_local_datasource.dart';
import '../../lib/features/auth/data/datasources/auth_remote_datasource.dart';
import '../../lib/features/auth/data/datasources/hanko_datasource.dart';
import '../../lib/features/auth/domain/repositories/auth_repository.dart';
import '../../lib/features/auth/domain/usecases/login_usecase.dart';
import '../../lib/features/auth/domain/usecases/logout_usecase.dart';
import '../../lib/features/auth/domain/usecases/register_usecase.dart';
import '../../lib/features/auth/domain/usecases/refresh_token_usecase.dart';

class MockNetworkService extends Mock implements NetworkService {}

class MockLocalStorageService extends Mock implements LocalStorageService {}

class MockSecureStorageService extends Mock implements SecureStorageService {}

class MockAuthRepository extends Mock implements AuthRepository {}

class MockAuthLocalDataSource extends Mock implements AuthLocalDataSource {}

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

class MockHankoDataSource extends Mock implements HankoDataSource {}

class MockLoginUseCase extends Mock implements LoginUseCase {}

class MockLogoutUseCase extends Mock implements LogoutUseCase {}

class MockRegisterUseCase extends Mock implements RegisterUseCase {}

class MockRefreshTokenUseCase extends Mock implements RefreshTokenUseCase {}

class MockProviders {
  static final networkService = MockNetworkService();
  static final localStorageService = MockLocalStorageService();
  static final secureStorageService = MockSecureStorageService();
  static final authRepository = MockAuthRepository();
  static final authLocalDataSource = MockAuthLocalDataSource();
  static final authRemoteDataSource = MockAuthRemoteDataSource();
  static final hankoDataSource = MockHankoDataSource();
  static final loginUseCase = MockLoginUseCase();
  static final logoutUseCase = MockLogoutUseCase();
  static final registerUseCase = MockRegisterUseCase();
  static final refreshTokenUseCase = MockRefreshTokenUseCase();

  static void reset() {
    reset(networkService);
    reset(localStorageService);
    reset(secureStorageService);
    reset(authRepository);
    reset(authLocalDataSource);
    reset(authRemoteDataSource);
    reset(hankoDataSource);
    reset(loginUseCase);
    reset(logoutUseCase);
    reset(registerUseCase);
    reset(refreshTokenUseCase);
  }
}