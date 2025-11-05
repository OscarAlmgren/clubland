import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/finding_friends_subgroup_entity.dart';
import '../repositories/events_repository.dart';
import 'base_usecase.dart';

/// Use case for getting Finding Friends subgroups for a club
class GetFindingFriendsSubgroups
    implements
        UseCase<List<FindingFriendsSubgroupEntity>, String> {
  final EventsRepository repository;

  const GetFindingFriendsSubgroups(this.repository);

  @override
  Future<Either<Failure, List<FindingFriendsSubgroupEntity>>> call(
    String clubId,
  ) async {
    return await repository.getFindingFriendsSubgroups(clubId: clubId);
  }
}
