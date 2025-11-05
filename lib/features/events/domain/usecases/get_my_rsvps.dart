import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../entities/events_connection_entity.dart';
import '../repositories/events_repository.dart';
import 'base_usecase.dart';

/// Use case for getting member's RSVPs
class GetMyRSVPs implements UseCase<RSVPsConnectionEntity, GetMyRSVPsParams> {
  final EventsRepository repository;

  const GetMyRSVPs(this.repository);

  @override
  Future<Either<Failure, RSVPsConnectionEntity>> call(
    GetMyRSVPsParams params,
  ) async {
    return await repository.getMyRSVPs(
      clubId: params.clubId,
      statusFilter: params.statusFilter,
      page: params.page,
      pageSize: params.pageSize,
    );
  }
}

/// Parameters for GetMyRSVPs use case
class GetMyRSVPsParams extends Equatable {
  final String clubId;
  final List<String>? statusFilter;
  final int page;
  final int pageSize;

  const GetMyRSVPsParams({
    required this.clubId,
    this.statusFilter,
    this.page = 1,
    this.pageSize = 20,
  });

  @override
  List<Object?> get props => [clubId, statusFilter, page, pageSize];
}
