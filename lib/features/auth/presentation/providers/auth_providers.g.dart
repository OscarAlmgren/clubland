// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Auth Repository provider

@ProviderFor(authRepository)
const authRepositoryProvider = AuthRepositoryProvider._();

/// Auth Repository provider

final class AuthRepositoryProvider
    extends $FunctionalProvider<AuthRepository, AuthRepository, AuthRepository>
    with $Provider<AuthRepository> {
  /// Auth Repository provider
  const AuthRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRepositoryHash();

  @$internal
  @override
  $ProviderElement<AuthRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthRepository create(Ref ref) {
    return authRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthRepository>(value),
    );
  }
}

String _$authRepositoryHash() => r'982e74bc133f0a19c0941f929cc7d649751acdb6';

/// Login usecase provider

@ProviderFor(loginUsecase)
const loginUsecaseProvider = LoginUsecaseProvider._();

/// Login usecase provider

final class LoginUsecaseProvider
    extends $FunctionalProvider<LoginUsecase, LoginUsecase, LoginUsecase>
    with $Provider<LoginUsecase> {
  /// Login usecase provider
  const LoginUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loginUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loginUsecaseHash();

  @$internal
  @override
  $ProviderElement<LoginUsecase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LoginUsecase create(Ref ref) {
    return loginUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoginUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoginUsecase>(value),
    );
  }
}

String _$loginUsecaseHash() => r'c3641e73d4bce674ce71707936b27698d7759ded';

/// Hanko login usecase provider

@ProviderFor(hankoLoginUsecase)
const hankoLoginUsecaseProvider = HankoLoginUsecaseProvider._();

/// Hanko login usecase provider

final class HankoLoginUsecaseProvider
    extends
        $FunctionalProvider<
          HankoLoginUsecase,
          HankoLoginUsecase,
          HankoLoginUsecase
        >
    with $Provider<HankoLoginUsecase> {
  /// Hanko login usecase provider
  const HankoLoginUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hankoLoginUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hankoLoginUsecaseHash();

  @$internal
  @override
  $ProviderElement<HankoLoginUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  HankoLoginUsecase create(Ref ref) {
    return hankoLoginUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HankoLoginUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HankoLoginUsecase>(value),
    );
  }
}

String _$hankoLoginUsecaseHash() => r'5b5ce198f8c7f9d2fa8cc900929a7f36ef5c1c94';

/// Register usecase provider

@ProviderFor(registerUsecase)
const registerUsecaseProvider = RegisterUsecaseProvider._();

/// Register usecase provider

final class RegisterUsecaseProvider
    extends
        $FunctionalProvider<RegisterUsecase, RegisterUsecase, RegisterUsecase>
    with $Provider<RegisterUsecase> {
  /// Register usecase provider
  const RegisterUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'registerUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$registerUsecaseHash();

  @$internal
  @override
  $ProviderElement<RegisterUsecase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RegisterUsecase create(Ref ref) {
    return registerUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RegisterUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RegisterUsecase>(value),
    );
  }
}

String _$registerUsecaseHash() => r'5ac68d932d7a87bfcd2c11b45992defd5c69a8f2';

/// Logout usecase provider

@ProviderFor(logoutUsecase)
const logoutUsecaseProvider = LogoutUsecaseProvider._();

/// Logout usecase provider

final class LogoutUsecaseProvider
    extends $FunctionalProvider<LogoutUsecase, LogoutUsecase, LogoutUsecase>
    with $Provider<LogoutUsecase> {
  /// Logout usecase provider
  const LogoutUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'logoutUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$logoutUsecaseHash();

  @$internal
  @override
  $ProviderElement<LogoutUsecase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LogoutUsecase create(Ref ref) {
    return logoutUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LogoutUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LogoutUsecase>(value),
    );
  }
}

String _$logoutUsecaseHash() => r'958538269ffab77eb10cdeff614a7b7bb5e39714';

/// Refresh token usecase provider

@ProviderFor(refreshTokenUsecase)
const refreshTokenUsecaseProvider = RefreshTokenUsecaseProvider._();

/// Refresh token usecase provider

final class RefreshTokenUsecaseProvider
    extends
        $FunctionalProvider<
          RefreshTokenUsecase,
          RefreshTokenUsecase,
          RefreshTokenUsecase
        >
    with $Provider<RefreshTokenUsecase> {
  /// Refresh token usecase provider
  const RefreshTokenUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'refreshTokenUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$refreshTokenUsecaseHash();

  @$internal
  @override
  $ProviderElement<RefreshTokenUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RefreshTokenUsecase create(Ref ref) {
    return refreshTokenUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RefreshTokenUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RefreshTokenUsecase>(value),
    );
  }
}

String _$refreshTokenUsecaseHash() =>
    r'dbc1c2e43662c9584f37e04c834e62f7c28653c7';

/// Get current user usecase provider

@ProviderFor(getCurrentUserUsecase)
const getCurrentUserUsecaseProvider = GetCurrentUserUsecaseProvider._();

/// Get current user usecase provider

final class GetCurrentUserUsecaseProvider
    extends
        $FunctionalProvider<
          GetCurrentUserUsecase,
          GetCurrentUserUsecase,
          GetCurrentUserUsecase
        >
    with $Provider<GetCurrentUserUsecase> {
  /// Get current user usecase provider
  const GetCurrentUserUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getCurrentUserUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getCurrentUserUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetCurrentUserUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetCurrentUserUsecase create(Ref ref) {
    return getCurrentUserUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetCurrentUserUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetCurrentUserUsecase>(value),
    );
  }
}

String _$getCurrentUserUsecaseHash() =>
    r'bf52b531cfb9c1b7c35ea44c199a6ab0165e86ba';

/// Check auth status usecase provider

@ProviderFor(checkAuthStatusUsecase)
const checkAuthStatusUsecaseProvider = CheckAuthStatusUsecaseProvider._();

/// Check auth status usecase provider

final class CheckAuthStatusUsecaseProvider
    extends
        $FunctionalProvider<
          CheckAuthStatusUsecase,
          CheckAuthStatusUsecase,
          CheckAuthStatusUsecase
        >
    with $Provider<CheckAuthStatusUsecase> {
  /// Check auth status usecase provider
  const CheckAuthStatusUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'checkAuthStatusUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$checkAuthStatusUsecaseHash();

  @$internal
  @override
  $ProviderElement<CheckAuthStatusUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CheckAuthStatusUsecase create(Ref ref) {
    return checkAuthStatusUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CheckAuthStatusUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CheckAuthStatusUsecase>(value),
    );
  }
}

String _$checkAuthStatusUsecaseHash() =>
    r'35356d7df1004e8778c63e510cdd35a1b270ddfd';

/// Biometric auth usecase provider

@ProviderFor(biometricAuthUsecase)
const biometricAuthUsecaseProvider = BiometricAuthUsecaseProvider._();

/// Biometric auth usecase provider

final class BiometricAuthUsecaseProvider
    extends
        $FunctionalProvider<
          BiometricAuthUsecase,
          BiometricAuthUsecase,
          BiometricAuthUsecase
        >
    with $Provider<BiometricAuthUsecase> {
  /// Biometric auth usecase provider
  const BiometricAuthUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'biometricAuthUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$biometricAuthUsecaseHash();

  @$internal
  @override
  $ProviderElement<BiometricAuthUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  BiometricAuthUsecase create(Ref ref) {
    return biometricAuthUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BiometricAuthUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BiometricAuthUsecase>(value),
    );
  }
}

String _$biometricAuthUsecaseHash() =>
    r'7323ce1a60b31d19e44a6dfd39668d05675010fa';

/// Hanko service provider

@ProviderFor(hankoService)
const hankoServiceProvider = HankoServiceProvider._();

/// Hanko service provider

final class HankoServiceProvider
    extends $FunctionalProvider<HankoService, HankoService, HankoService>
    with $Provider<HankoService> {
  /// Hanko service provider
  const HankoServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hankoServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hankoServiceHash();

  @$internal
  @override
  $ProviderElement<HankoService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  HankoService create(Ref ref) {
    return hankoService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HankoService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HankoService>(value),
    );
  }
}

String _$hankoServiceHash() => r'9587ca4190b1add6188d2f3d04d51c7536780d91';
