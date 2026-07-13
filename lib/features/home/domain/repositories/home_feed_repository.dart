import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/news_feed_item_entity.dart';

/// Home feed repository interface
abstract class HomeFeedRepository {
  /// Fetch the feed for the given club.
  ///
  /// Returns real events from the backend. News posts and lunch menus will
  /// join the feed once the backend adds those schemas.
  Future<Either<Failure, List<NewsFeedItemEntity>>> getFeed({
    required String clubId,
  });

  /// Fetch specific details for a single event.
  ///
  /// Useful when navigating from the feed to a detailed view.
  Future<Either<Failure, NewsFeedItemEntity>> getEventDetails({
    required String eventId,
  });

  /// Force a refresh of the feed.
  ///
  /// Usually bypasses local cache to fetch the latest data from the server.
  Future<Either<Failure, List<NewsFeedItemEntity>>> refreshFeed({
    required String clubId,
  });
}
