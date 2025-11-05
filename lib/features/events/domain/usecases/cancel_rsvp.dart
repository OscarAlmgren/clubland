import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../entities/cancel_rsvp_response_entity.dart';
import '../repositories/events_repository.dart';
import 'base_usecase.dart';

/// Use case for cancelling an RSVP
class CancelRSVP
    implements UseCase<CancelRSVPResponseEntity, CancelRSVPParams> {
  final EventsRepository repository;

  const CancelRSVP(this.repository);

  @override
  Future<Either<Failure, CancelRSVPResponseEntity>> call(
    CancelRSVPParams params,
  ) async {
    return await repository.cancelRSVP(
      rsvpId: params.rsvpId,
      reason: params.reason,
    );
  }
}

/// Parameters for CancelRSVP use case
class CancelRSVPParams extends Equatable {
  final String rsvpId;
  final String? reason;

  const CancelRSVPParams({
    required this.rsvpId,
    this.reason,
  });

  @override
  List<Object?> get props => [rsvpId, reason];
}
