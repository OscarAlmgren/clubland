import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../auth/domain/entities/user_entity.dart';

/// Profile repository interface
abstract class ProfileRepository {
  /// Fetch the current user's profile from the backend.
  Future<Either<Failure, UserEntity>> getCurrentProfile();

  /// Update the current user's profile fields.
  Future<Either<Failure, UserEntity>> updateProfile({
    required String userId,
    String? firstName,
    String? lastName,
  });
}
