import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/providers/core_providers.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/services/hanko_service.dart';

part 'auth_providers.g.dart';

/// Auth Repository provider
@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepositoryImpl(
    secureStorage: ref.watch(secureStorageServiceProvider),
    logger: ref.watch(loggerProvider),
  );
}

/// Login usecase provider
@riverpod
LoginUsecase loginUsecase(LoginUsecaseRef ref) {
  return LoginUsecase(ref.watch(authRepositoryProvider));
}

/// Hanko login usecase provider
@riverpod
HankoLoginUsecase hankoLoginUsecase(HankoLoginUsecaseRef ref) {
  return HankoLoginUsecase(ref.watch(authRepositoryProvider));
}

/// Register usecase provider
@riverpod
RegisterUsecase registerUsecase(RegisterUsecaseRef ref) {
  return RegisterUsecase(ref.watch(authRepositoryProvider));
}

/// Logout usecase provider
@riverpod
LogoutUsecase logoutUsecase(LogoutUsecaseRef ref) {
  return LogoutUsecase(ref.watch(authRepositoryProvider));
}

/// Refresh token usecase provider
@riverpod
RefreshTokenUsecase refreshTokenUsecase(RefreshTokenUsecaseRef ref) {
  return RefreshTokenUsecase(ref.watch(authRepositoryProvider));
}

/// Get current user usecase provider
@riverpod
GetCurrentUserUsecase getCurrentUserUsecase(GetCurrentUserUsecaseRef ref) {
  return GetCurrentUserUsecase(ref.watch(authRepositoryProvider));
}

/// Check auth status usecase provider
@riverpod
CheckAuthStatusUsecase checkAuthStatusUsecase(CheckAuthStatusUsecaseRef ref) {
  return CheckAuthStatusUsecase(ref.watch(authRepositoryProvider));
}

/// Biometric auth usecase provider
@riverpod
BiometricAuthUsecase biometricAuthUsecase(BiometricAuthUsecaseRef ref) {
  return BiometricAuthUsecase(ref.watch(authRepositoryProvider));
}

/// Hanko service provider
@riverpod
HankoService hankoService(HankoServiceRef ref) {
  return HankoServiceImpl();
}
