import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/event_entity.dart';
import '../repositories/events_repository.dart';
import 'base_usecase.dart';

/// Use case for getting a single event by ID
class GetEventById implements UseCase<EventEntity, String> {
  final EventsRepository repository;

  const GetEventById(this.repository);

  @override
  Future<Either<Failure, EventEntity>> call(String eventId) async {
    return await repository.getEventById(eventId);
  }
}
