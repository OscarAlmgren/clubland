// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Profile repository provider

@ProviderFor(profileRepository)
const profileRepositoryProvider = ProfileRepositoryProvider._();

/// Profile repository provider

final class ProfileRepositoryProvider
    extends
        $FunctionalProvider<
          ProfileRepository,
          ProfileRepository,
          ProfileRepository
        >
    with $Provider<ProfileRepository> {
  /// Profile repository provider
  const ProfileRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileRepositoryHash();

  @$internal
  @override
  $ProviderElement<ProfileRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ProfileRepository create(Ref ref) {
    return profileRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProfileRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProfileRepository>(value),
    );
  }
}

String _$profileRepositoryHash() => r'42d4c7eb93d93a5dd569c29725e2a2d514294000';

/// Profile controller — wraps auth state and exposes updateProfile.
///
/// Reads from [authControllerProvider] first (cached). Falls back to a fresh
/// `me` query if the auth state has no user.

@ProviderFor(ProfileController)
const profileControllerProvider = ProfileControllerProvider._();

/// Profile controller — wraps auth state and exposes updateProfile.
///
/// Reads from [authControllerProvider] first (cached). Falls back to a fresh
/// `me` query if the auth state has no user.
final class ProfileControllerProvider
    extends $AsyncNotifierProvider<ProfileController, UserEntity?> {
  /// Profile controller — wraps auth state and exposes updateProfile.
  ///
  /// Reads from [authControllerProvider] first (cached). Falls back to a fresh
  /// `me` query if the auth state has no user.
  const ProfileControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileControllerHash();

  @$internal
  @override
  ProfileController create() => ProfileController();
}

String _$profileControllerHash() => r'f928b2ece267e731b6d8164a1e2f79611d66f164';

/// Profile controller — wraps auth state and exposes updateProfile.
///
/// Reads from [authControllerProvider] first (cached). Falls back to a fresh
/// `me` query if the auth state has no user.

abstract class _$ProfileController extends $AsyncNotifier<UserEntity?> {
  FutureOr<UserEntity?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<UserEntity?>, UserEntity?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<UserEntity?>, UserEntity?>,
              AsyncValue<UserEntity?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
