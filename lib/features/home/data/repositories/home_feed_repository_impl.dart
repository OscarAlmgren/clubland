import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../events/domain/repositories/events_repository.dart';
import '../../domain/entities/news_feed_item_entity.dart';
import '../../domain/repositories/home_feed_repository.dart';

/// Home feed repository implementation.
class HomeFeedRepositoryImpl implements HomeFeedRepository {
  HomeFeedRepositoryImpl({required EventsRepository eventsRepository})
    : _eventsRepository = eventsRepository;

  final EventsRepository _eventsRepository;

  @override
  Future<Either<Failure, List<NewsFeedItemEntity>>> getFeed({
    required String clubId,
  }) async {
    final result = await _eventsRepository.getEvents(clubId: clubId);

    return result.fold(Left<Failure, List<NewsFeedItemEntity>>.new, (
      connection,
    ) {
      final feedItems =
          connection.events
              .map((event) => NewsFeedItemEntity.event(event: event))
              .toList()
            ..sort((a, b) => a.timestamp.compareTo(b.timestamp));
      return Right<Failure, List<NewsFeedItemEntity>>(feedItems);
    });
  }

  @override
  Future<Either<Failure, NewsFeedItemEntity>> getEventDetails({
    required String eventId,
  }) async {
    // Ändrat från getEvent till getEventById för att matcha events_repo.dart
    final result = await _eventsRepository.getEventById(eventId);

    return result.fold(
      Left<Failure, NewsFeedItemEntity>.new,
      (event) => Right<Failure, NewsFeedItemEntity>(
        NewsFeedItemEntity.event(event: event),
      ),
    );
  }

  @override
  Future<Either<Failure, List<NewsFeedItemEntity>>> refreshFeed({
    required String clubId,
  }) async {
    // Kallar på getFeed direkt för att hämta färsk data
    return getFeed(clubId: clubId);
  }
}
