import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../entities/events_connection_entity.dart';
import '../repositories/events_repository.dart';
import 'base_usecase.dart';

/// Use case for getting events with filtering and pagination
class GetEvents implements UseCase<EventsConnectionEntity, GetEventsParams> {
  final EventsRepository repository;

  const GetEvents(this.repository);

  @override
  Future<Either<Failure, EventsConnectionEntity>> call(
    GetEventsParams params,
  ) async {
    return await repository.getEvents(
      clubId: params.clubId,
      filters: params.filters,
      page: params.page,
      pageSize: params.pageSize,
    );
  }
}

/// Parameters for GetEvents use case
class GetEventsParams extends Equatable {
  final String clubId;
  final Map<String, dynamic>? filters;
  final int page;
  final int pageSize;

  const GetEventsParams({
    required this.clubId,
    this.filters,
    this.page = 1,
    this.pageSize = 20,
  });

  @override
  List<Object?> get props => [clubId, filters, page, pageSize];
}
