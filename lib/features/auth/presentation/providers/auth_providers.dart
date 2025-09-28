import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/providers/core_providers.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/services/hanko_service.dart';
import '../../domain/usecases/login_usecase.dart';

part 'auth_providers.g.dart';

/// Auth Repository provider
@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) {
  // Ensure GraphQL client is initialized first
  ref.watch(graphqlClientProvider);

  return AuthRepositoryImpl(
    secureStorage: ref.watch(secureStorageServiceProvider),
    logger: ref.watch(loggerProvider),
  );
}

/// Login usecase provider
@riverpod
LoginUsecase loginUsecase(Ref ref) =>
    LoginUsecase(ref.watch(authRepositoryProvider));

/// Hanko login usecase provider
@riverpod
HankoLoginUsecase hankoLoginUsecase(Ref ref) =>
    HankoLoginUsecase(ref.watch(authRepositoryProvider));

/// Register usecase provider
@riverpod
RegisterUsecase registerUsecase(Ref ref) =>
    RegisterUsecase(ref.watch(authRepositoryProvider));

/// Logout usecase provider
@riverpod
LogoutUsecase logoutUsecase(Ref ref) =>
    LogoutUsecase(ref.watch(authRepositoryProvider));

/// Refresh token usecase provider
@riverpod
RefreshTokenUsecase refreshTokenUsecase(Ref ref) =>
    RefreshTokenUsecase(ref.watch(authRepositoryProvider));

/// Get current user usecase provider
@riverpod
GetCurrentUserUsecase getCurrentUserUsecase(Ref ref) =>
    GetCurrentUserUsecase(ref.watch(authRepositoryProvider));

/// Check auth status usecase provider
@riverpod
CheckAuthStatusUsecase checkAuthStatusUsecase(Ref ref) =>
    CheckAuthStatusUsecase(ref.watch(authRepositoryProvider));

/// Biometric auth usecase provider
@riverpod
BiometricAuthUsecase biometricAuthUsecase(Ref ref) =>
    BiometricAuthUsecase(ref.watch(authRepositoryProvider));

/// Hanko service provider
@riverpod
HankoService hankoService(Ref ref) => HankoServiceImpl();
