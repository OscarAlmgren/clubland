import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/graphql_client.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../../../auth/presentation/controllers/auth_controller.dart';
import '../../data/datasources/profile_remote_datasource.dart';
import '../../data/repositories/profile_repository_impl.dart';
import '../../domain/repositories/profile_repository.dart';

part 'profile_providers.g.dart';

/// Profile repository provider
@riverpod
ProfileRepository profileRepository(Ref ref) => ProfileRepositoryImpl(
      remoteDataSource: ProfileRemoteDataSourceImpl(
        client: GraphQLClientConfig.client,
      ),
    );

/// Profile controller — wraps auth state and exposes updateProfile.
///
/// Reads from [authControllerProvider] first (cached). Falls back to a fresh
/// `me` query if the auth state has no user.
@riverpod
class ProfileController extends _$ProfileController {
  @override
  Future<UserEntity?> build() async {
    // Primary source: cached auth state
    final authUser = ref.watch(authControllerProvider).value;
    if (authUser != null) return authUser;

    // Fallback: fetch from backend
    final repo = ref.read(profileRepositoryProvider);
    final result = await repo.getCurrentProfile();
    return result.fold((_) => null, (UserEntity user) => user);
  }

  /// Update first and/or last name.
  ///
  /// On success, updates both local state and the auth cache.
  Future<bool> updateProfile({
    required String userId,
    String? firstName,
    String? lastName,
  }) async {
    final repo = ref.read(profileRepositoryProvider);
    final result = await repo.updateProfile(
      userId: userId,
      firstName: firstName,
      lastName: lastName,
    );

    return result.fold(
      (_) => false,
      (UserEntity updatedUser) {
        state = AsyncData(updatedUser);
        // Refresh auth state so ProfilePage stays in sync
        ref.invalidate(authControllerProvider);
        return true;
      },
    );
  }
}
