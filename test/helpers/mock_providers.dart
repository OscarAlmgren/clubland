import 'package:clubland/core/storage/local_storage.dart';
import 'package:clubland/core/storage/secure_storage.dart';
import 'package:clubland/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:clubland/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:clubland/features/auth/data/datasources/hanko_datasource.dart';
import 'package:clubland/features/auth/domain/repositories/auth_repository.dart';
import 'package:clubland/features/auth/domain/usecases/login_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockLocalStorage extends Mock implements LocalStorage {}

class MockSecureStorage extends Mock implements SecureStorage {}

class MockSecureStorageService extends Mock implements SecureStorageService {}

class MockAuthRepository extends Mock implements AuthRepository {}

class MockAuthLocalDataSource extends Mock implements AuthLocalDataSource {}

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

class MockHankoDataSource extends Mock implements HankoDataSource {}

class MockLoginUsecase extends Mock implements LoginUsecase {}


class MockProviders {
  static final localStorage = MockLocalStorage();
  static final secureStorage = MockSecureStorage();
  static final authRepository = MockAuthRepository();
  static final authLocalDataSource = MockAuthLocalDataSource();
  static final authRemoteDataSource = MockAuthRemoteDataSource();
  static final hankoDataSource = MockHankoDataSource();
  static final loginUsecase = MockLoginUsecase();

  static void resetAll() {
    reset(localStorage);
    reset(secureStorage);
    reset(authRepository);
    reset(authLocalDataSource);
    reset(authRemoteDataSource);
    reset(hankoDataSource);
    reset(loginUsecase);
  }
}
