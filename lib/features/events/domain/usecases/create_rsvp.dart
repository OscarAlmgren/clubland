import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/event_rsvp_entity.dart';
import '../repositories/events_repository.dart';
import 'base_usecase.dart';

/// Use case for creating a new RSVP
class CreateRSVP implements UseCase<EventRSVPEntity, Map<String, dynamic>> {
  final EventsRepository repository;

  const CreateRSVP(this.repository);

  @override
  Future<Either<Failure, EventRSVPEntity>> call(
    Map<String, dynamic> input,
  ) async {
    return await repository.createRSVP(input);
  }
}
