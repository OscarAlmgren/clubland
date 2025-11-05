import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../entities/event_rsvp_entity.dart';
import '../repositories/events_repository.dart';
import 'base_usecase.dart';

/// Use case for updating an existing RSVP
class UpdateRSVP implements UseCase<EventRSVPEntity, UpdateRSVPParams> {
  final EventsRepository repository;

  const UpdateRSVP(this.repository);

  @override
  Future<Either<Failure, EventRSVPEntity>> call(UpdateRSVPParams params) async {
    return await repository.updateRSVP(
      rsvpId: params.rsvpId,
      input: params.input,
    );
  }
}

/// Parameters for UpdateRSVP use case
class UpdateRSVPParams extends Equatable {
  final String rsvpId;
  final Map<String, dynamic> input;

  const UpdateRSVPParams({
    required this.rsvpId,
    required this.input,
  });

  @override
  List<Object?> get props => [rsvpId, input];
}
