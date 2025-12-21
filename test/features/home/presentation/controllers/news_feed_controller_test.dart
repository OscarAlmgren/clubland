import 'package:clubland/features/events/domain/entities/event_entity.dart';
import 'package:clubland/features/home/domain/entities/news_feed_item_entity.dart';
import 'package:clubland/features/home/presentation/controllers/news_feed_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NewsFeedController -', () {
    test('should load news feed items on build', () async {
      // arrange
      final container = ProviderContainer();
      addTearDown(container.dispose);

      // act
      final newsFeed = await container.read(newsFeedControllerProvider.future);

      // assert
      expect(newsFeed, isA<List<NewsFeedItemEntity>>());
      expect(newsFeed.isNotEmpty, true);
    });

    test('should return mixed content types in news feed', () async {
      // arrange
      final container = ProviderContainer();
      addTearDown(container.dispose);

      // act
      final newsFeed = await container.read(newsFeedControllerProvider.future);

      // assert
      final hasNewsPost = newsFeed.any(
        (item) => item.type == NewsFeedItemType.newsPost,
      );
      final hasEvent = newsFeed.any(
        (item) => item.type == NewsFeedItemType.event,
      );
      final hasLunchMenu = newsFeed.any(
        (item) => item.type == NewsFeedItemType.lunchMenu,
      );

      expect(hasNewsPost, true, reason: 'Should contain news posts');
      expect(hasEvent, true, reason: 'Should contain events');
      expect(hasLunchMenu, true, reason: 'Should contain lunch menus');
    });

    test('should include news posts with proper data', () async {
      // arrange
      final container = ProviderContainer();
      addTearDown(container.dispose);

      // act
      final newsFeed = await container.read(newsFeedControllerProvider.future);
      final newsPostItems = newsFeed
          .where((item) => item.type == NewsFeedItemType.newsPost)
          .toList();

      // assert
      expect(newsPostItems.isNotEmpty, true);

      for (final item in newsPostItems) {
        final newsPost = item.newsPost;
        expect(newsPost, isNotNull);
        expect(newsPost?.id, isNotEmpty);
        expect(newsPost?.title, isNotEmpty);
        expect(newsPost?.content, isNotEmpty);
        expect(newsPost?.postedAt, isNotNull);
      }
    });

    test('should include events with proper data', () async {
      // arrange
      final container = ProviderContainer();
      addTearDown(container.dispose);

      // act
      final newsFeed = await container.read(newsFeedControllerProvider.future);
      final eventItems = newsFeed
          .where((item) => item.type == NewsFeedItemType.event)
          .toList();

      // assert
      expect(eventItems.isNotEmpty, true);

      for (final item in eventItems) {
        final event = item.event;
        expect(event, isNotNull);
        expect(event?.id, isNotEmpty);
        expect(event?.title, isNotEmpty);
        expect(event?.description, isNotEmpty);
        expect(event?.startTime, isNotNull);
        expect(event?.endTime, isNotNull);
        expect(event?.capacity, greaterThan(0));
      }
    });

    test('should include lunch menu with items', () async {
      // arrange
      final container = ProviderContainer();
      addTearDown(container.dispose);

      // act
      final newsFeed = await container.read(newsFeedControllerProvider.future);
      final lunchMenuItems = newsFeed
          .where((item) => item.type == NewsFeedItemType.lunchMenu)
          .toList();

      // assert
      expect(lunchMenuItems.isNotEmpty, true);

      for (final item in lunchMenuItems) {
        final lunchMenu = item.lunchMenu;
        expect(lunchMenu, isNotNull);
        expect(lunchMenu?.id, isNotEmpty);
        expect(lunchMenu?.menuItems, isNotEmpty);
        expect(lunchMenu?.weekStartDate, isNotNull);
        expect(lunchMenu?.weekEndDate, isNotNull);
      }
    });

    test('should include events with various guest policies', () async {
      // arrange
      final container = ProviderContainer();
      addTearDown(container.dispose);

      // act
      final newsFeed = await container.read(newsFeedControllerProvider.future);
      final events = newsFeed
          .where((item) => item.type == NewsFeedItemType.event)
          .map((item) => item.event!)
          .toList();

      // assert
      final hasMembersOnly = events.any(
        (e) => e.guestPolicy == GuestPolicy.membersOnly,
      );
      final hasFriendsAndFamily = events.any(
        (e) => e.guestPolicy == GuestPolicy.friendsAndFamily,
      );

      expect(hasMembersOnly, true);
      expect(hasFriendsAndFamily, true);
    });

    test('should include events with different availability states', () async {
      // arrange
      final container = ProviderContainer();
      addTearDown(container.dispose);

      // act
      final newsFeed = await container.read(newsFeedControllerProvider.future);
      final events = newsFeed
          .where((item) => item.type == NewsFeedItemType.event)
          .map((item) => item.event!)
          .toList();

      // assert
      final hasAvailableSpots = events.any((e) => e.availableSpots > 0);
      final hasFullyBooked = events.any((e) => e.availableSpots == 0);

      expect(hasAvailableSpots, true);
      expect(hasFullyBooked, true);
    });

    test('should track user RSVP status for events', () async {
      // arrange
      final container = ProviderContainer();
      addTearDown(container.dispose);

      // act
      final newsFeed = await container.read(newsFeedControllerProvider.future);
      final eventItems = newsFeed
          .where((item) => item.type == NewsFeedItemType.event)
          .toList();

      // assert
      final hasConfirmedRSVP = eventItems.any(
        (item) => item.userRSVPStatus == 'confirmed',
      );
      final hasNoRSVP = eventItems.any((item) => item.userRSVPStatus == null);

      expect(
        hasConfirmedRSVP,
        true,
        reason: 'Should have events user is attending',
      );
      expect(
        hasNoRSVP,
        true,
        reason: "Should have events user has not RSVP'd to",
      );
    });

    test('should refresh news feed', () async {
      // arrange
      final container = ProviderContainer();
      addTearDown(container.dispose);

      // Get initial state
      final initial = await container.read(newsFeedControllerProvider.future);
      expect(initial.isNotEmpty, true);

      // act
      final controller = container.read(newsFeedControllerProvider.notifier);
      await controller.refresh();

      // assert
      final refreshed = await container.read(newsFeedControllerProvider.future);
      expect(refreshed.isNotEmpty, true);
      expect(refreshed.length, initial.length);
    });

    test('should update RSVP status for event', () async {
      // arrange
      final container = ProviderContainer();
      addTearDown(container.dispose);

      // Get initial state
      final initial = await container.read(newsFeedControllerProvider.future);
      final eventItem = initial.firstWhere(
        (item) => item.type == NewsFeedItemType.event && item.event != null,
      );
      final eventId = eventItem.event!.id;

      // act
      final controller = container.read(newsFeedControllerProvider.notifier);
      await controller.updateRSVP(eventId, 'confirmed');

      // assert
      final updated = container.read(newsFeedControllerProvider).value;
      final updatedEvent = updated!.firstWhere(
        (item) =>
            item.type == NewsFeedItemType.event && item.event?.id == eventId,
      );

      expect(updatedEvent.userRSVPStatus, 'confirmed');
    });

    test('should not update RSVP for non-matching event', () async {
      // arrange
      final container = ProviderContainer();
      addTearDown(container.dispose);

      // Get initial state
      await container.read(newsFeedControllerProvider.future);

      // act
      final controller = container.read(newsFeedControllerProvider.notifier);
      await controller.updateRSVP('non_existent_event', 'confirmed');

      // assert - should complete without error
      final state = container.read(newsFeedControllerProvider).value;
      expect(state, isNotNull);
    });

    test('should handle multiple RSVP status updates', () async {
      // arrange
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final initial = await container.read(newsFeedControllerProvider.future);
      final eventItems = initial
          .where(
            (item) => item.type == NewsFeedItemType.event && item.event != null,
          )
          .toList();

      expect(eventItems.length, greaterThan(1));

      final firstEventId = eventItems[0].event!.id;
      final secondEventId = eventItems[1].event!.id;

      // act
      final controller = container.read(newsFeedControllerProvider.notifier);
      await controller.updateRSVP(firstEventId, 'confirmed');
      await controller.updateRSVP(secondEventId, 'tentative');

      // assert
      final updated = container.read(newsFeedControllerProvider).value!;

      final firstUpdated = updated.firstWhere(
        (item) =>
            item.type == NewsFeedItemType.event &&
            item.event?.id == firstEventId,
      );
      final secondUpdated = updated.firstWhere(
        (item) =>
            item.type == NewsFeedItemType.event &&
            item.event?.id == secondEventId,
      );

      expect(firstUpdated.userRSVPStatus, 'confirmed');
      expect(secondUpdated.userRSVPStatus, 'tentative');
    });

    test('should include paid and free events', () async {
      // arrange
      final container = ProviderContainer();
      addTearDown(container.dispose);

      // act
      final newsFeed = await container.read(newsFeedControllerProvider.future);
      final events = newsFeed
          .where((item) => item.type == NewsFeedItemType.event)
          .map((item) => item.event!)
          .toList();

      // assert
      final hasPaidEvents = events.any(
        (e) => (e.requiresPayment ?? false) && e.price != null,
      );
      final hasFreeEvents = events.any((e) => !(e.requiresPayment ?? false));

      expect(hasPaidEvents, true);
      expect(hasFreeEvents, true);
    });

    test('should include full house exclusive events', () async {
      // arrange
      final container = ProviderContainer();
      addTearDown(container.dispose);

      // act
      final newsFeed = await container.read(newsFeedControllerProvider.future);
      final events = newsFeed
          .where((item) => item.type == NewsFeedItemType.event)
          .map((item) => item.event!)
          .toList();

      // assert
      final hasFullHouseExclusive = events.any((e) => e.fullHouseExclusive);

      expect(hasFullHouseExclusive, true);
    });

    test('should include events with different types', () async {
      // arrange
      final container = ProviderContainer();
      addTearDown(container.dispose);

      // act
      final newsFeed = await container.read(newsFeedControllerProvider.future);
      final events = newsFeed
          .where((item) => item.type == NewsFeedItemType.event)
          .map((item) => item.event!)
          .toList();

      // assert - check for various event types
      final eventTypes = events.map((e) => e.eventType).toSet();
      expect(
        eventTypes.length,
        greaterThan(1),
        reason: 'Should have multiple event types',
      );
    });
  });
}
