import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../auth/presentation/controllers/auth_controller.dart';
import '../../../../core/graphql/graphql_api.dart';
import '../../domain/entities/news_feed_item_entity.dart';
import '../providers/home_providers.dart';

part 'news_feed_controller.g.dart';

/// News feed controller - manages news feed items
@riverpod
class NewsFeedController extends _$NewsFeedController {
  @override
  Future<List<NewsFeedItemEntity>> build() async {
    // Await the auth future so the feed stays in loading state until the
    // session is resolved, instead of flashing an empty feed.
    final user = await ref.watch(authControllerProvider.future);
    if (user == null || user.clubId == null) {
      // No club membership yet — genuinely empty feed.
      return [];
    }
    return _fetchFeed(user.clubId!);
  }

  Future<List<NewsFeedItemEntity>> _fetchFeed(String clubId) async {
    final repo = ref.read(homeFeedRepositoryProvider);
    final result = await repo.getFeed(clubId: clubId);
    // Surface failures as an error state instead of masking them with
    // placeholder content; an empty backend result is an empty feed.
    return result.fold((failure) => throw failure, (items) => items);
  }

  /// Refresh news feed
  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final user = await ref.read(authControllerProvider.future);
      if (user == null || user.clubId == null) {
        return <NewsFeedItemEntity>[];
      }
      return _fetchFeed(user.clubId!);
    });
  }

  /// Update RSVP response for an event
  Future<void> updateRSVP(String eventId, Enum$RSVPResponse response) async {
    // Use `await future` rather than `state.value` so that any in-flight
    // rebuild (e.g. triggered by an auth-state change) completes before we
    // mutate.  `state.value` is null while the provider is AsyncLoading,
    // which would silently discard the update via the null guard.
    final currentState = await future;

    // Update the RSVP status in the list
    final updatedItems = currentState.map((item) {
      final event = item.event;
      if (item.type == NewsFeedItemType.event &&
          event != null &&
          event.id == eventId) {
        return NewsFeedItemEntity.event(
          event: event,
          userRSVPResponse: response,
        );
      }
      return item;
    }).toList();

    state = AsyncValue.data(updatedItems);
  }
}
