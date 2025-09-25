// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentUserHash() => r'f9ee8547baacb1299177402e18e6d493b82128bd';

/// Current user provider (derived from auth controller)
///
/// Copied from [currentUser].
@ProviderFor(currentUser)
final currentUserProvider = AutoDisposeProvider<UserEntity?>.internal(
  currentUser,
  name: r'currentUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currentUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentUserRef = AutoDisposeProviderRef<UserEntity?>;
String _$isAuthenticatedHash() => r'fe6f954f2d7938a820a402d3f97973c87930d8b5';

/// Authentication status provider
///
/// Copied from [isAuthenticated].
@ProviderFor(isAuthenticated)
final isAuthenticatedProvider = AutoDisposeProvider<bool>.internal(
  isAuthenticated,
  name: r'isAuthenticatedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isAuthenticatedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef IsAuthenticatedRef = AutoDisposeProviderRef<bool>;
String _$authSessionHash() => r'7202f02699abd446c27cc47e1b2de74a822658a0';

/// Current auth session provider
///
/// Copied from [authSession].
@ProviderFor(authSession)
final authSessionProvider =
    AutoDisposeFutureProvider<AuthSessionEntity?>.internal(
  authSession,
  name: r'authSessionProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authSessionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthSessionRef = AutoDisposeFutureProviderRef<AuthSessionEntity?>;
String _$userPermissionsHash() => r'ccf64a314ad14e0a387dc600fd3aeb8f933d861a';

/// User permissions provider
///
/// Copied from [userPermissions].
@ProviderFor(userPermissions)
final userPermissionsProvider =
    AutoDisposeFutureProvider<List<String>>.internal(
  userPermissions,
  name: r'userPermissionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userPermissionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserPermissionsRef = AutoDisposeFutureProviderRef<List<String>>;
String _$biometricAvailableHash() =>
    r'50699d187b190d5c6e78cc77442518fde9039698';

/// Biometric availability provider
///
/// Copied from [biometricAvailable].
@ProviderFor(biometricAvailable)
final biometricAvailableProvider = AutoDisposeFutureProvider<bool>.internal(
  biometricAvailable,
  name: r'biometricAvailableProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$biometricAvailableHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef BiometricAvailableRef = AutoDisposeFutureProviderRef<bool>;
String _$authControllerHash() => r'02e41c83e7cf8c1197f3a93ef03d70e7aa813c38';

/// Authentication controller managing user auth state
///
/// Copied from [AuthController].
@ProviderFor(AuthController)
final authControllerProvider =
    AutoDisposeAsyncNotifierProvider<AuthController, UserEntity?>.internal(
  AuthController.new,
  name: r'authControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AuthController = AutoDisposeAsyncNotifier<UserEntity?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
