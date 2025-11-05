import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../entities/rsvp_eligibility_entity.dart';
import '../repositories/events_repository.dart';
import 'base_usecase.dart';

/// Use case for checking if a member can RSVP to an event
class CheckRSVPEligibility
    implements UseCase<RSVPEligibilityEntity, CheckRSVPEligibilityParams> {
  final EventsRepository repository;

  const CheckRSVPEligibility(this.repository);

  @override
  Future<Either<Failure, RSVPEligibilityEntity>> call(
    CheckRSVPEligibilityParams params,
  ) async {
    return await repository.checkRSVPEligibility(
      eventId: params.eventId,
      memberId: params.memberId,
    );
  }
}

/// Parameters for CheckRSVPEligibility use case
class CheckRSVPEligibilityParams extends Equatable {
  final String eventId;
  final String memberId;

  const CheckRSVPEligibilityParams({
    required this.eventId,
    required this.memberId,
  });

  @override
  List<Object?> get props => [eventId, memberId];
}
