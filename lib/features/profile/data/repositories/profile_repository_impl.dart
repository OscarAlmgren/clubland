import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart' as app_exceptions;
import '../../../../core/errors/failures.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_remote_datasource.dart';

/// Profile repository implementation
class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl({required ProfileRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  final ProfileRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, UserEntity>> getCurrentProfile() async {
    try {
      final data = await _remoteDataSource.getCurrentUser();
      return Right(_parseUser(data));
    } on app_exceptions.NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> updateProfile({
    required String userId,
    String? firstName,
    String? lastName,
  }) async {
    try {
      final data = await _remoteDataSource.updateUser(
        id: userId,
        firstName: firstName,
        lastName: lastName,
      );
      return Right(_parseUser(data));
    } on app_exceptions.NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  UserEntity _parseUser(Map<String, dynamic> data) => UserEntity(
        id: data['id'] as String,
        email: data['email'] as String,
        firstName: data['firstName'] as String?,
        lastName: data['lastName'] as String?,
        username: data['username'] as String?,
        clubId: data['clubId'] as String?,
        createdAt: DateTime.parse(data['createdAt'] as String),
        updatedAt: data['updatedAt'] != null
            ? DateTime.parse(data['updatedAt'] as String)
            : null,
        roles: (data['roles'] as List<dynamic>?)
                ?.map((r) => r as String)
                .toList() ??
            [],
        permissions: (data['permissions'] as List<dynamic>?)
                ?.map((p) => p as String)
                .toList() ??
            [],
      );
}
