import 'package:clubland/core/errors/failures.dart';
import 'package:clubland/core/graphql/graphql_api.dart';
import 'package:clubland/features/auth/domain/entities/user_entity.dart';
import 'package:clubland/features/auth/presentation/controllers/auth_controller.dart';
import 'package:clubland/features/events/domain/entities/event_entity.dart';
import 'package:clubland/features/home/domain/entities/news_feed_item_entity.dart';
import 'package:clubland/features/home/domain/repositories/home_feed_repository.dart';
import 'package:clubland/features/home/presentation/controllers/news_feed_controller.dart';
import 'package:clubland/features/home/presentation/providers/home_providers.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class _FakeAuthController extends AuthController {
  _FakeAuthController(this._user);

  final UserEntity? _user;

  @override
  Future<UserEntity?> build() async => _user;
}

class _FakeHomeFeedRepository implements HomeFeedRepository {
  _FakeHomeFeedRepository(this._result);

  final Either<Failure, List<NewsFeedItemEntity>> _result;
  int getFeedCalls = 0;

  @override
  Future<Either<Failure, List<NewsFeedItemEntity>>> getFeed({
    required String clubId,
  }) async {
    getFeedCalls++;
    return _result;
  }

  @override
  Future<Either<Failure, NewsFeedItemEntity>> getEventDetails({
    required String eventId,
  }) async => Left(NetworkFailure.serverError(0, 'not stubbed'));

  @override
  Future<Either<Failure, List<NewsFeedItemEntity>>> refreshFeed({
    required String clubId,
  }) async => _result;
}

EventEntity _testEvent(String id) {
  final now = DateTime.now();
  return EventEntity(
    id: id,
    clubId: 'club_1',
    title: 'Event $id',
    description: 'Test event $id',
    eventType: Enum$ClubEventType.SOCIAL,
    startTime: now.add(const Duration(days: 1)),
    endTime: now.add(const Duration(days: 1, hours: 2)),
    location: 'Test Room',
    capacity: 10,
    currentAttendees: 5,
    availableSpots: 5,
    guestPolicy: Enum$GuestPolicy.MEMBERS_ONLY,
    requiresApproval: false,
    requiresPayment: false,
    allowsSubgroupPriority: false,
    fullHouseExclusive: false,
    createdAt: now,
    updatedAt: now,
  );
}

void main() {
  final testUser = UserEntity(
    id: 'user-1',
    email: 'member@example.com',
    firstName: 'Test',
    lastName: 'User',
    clubId: '550e8400-e29b-41d4-a716-446655440001',
    createdAt: DateTime.now(),
  );

  final feedItems = [
    NewsFeedItemEntity.event(event: _testEvent('1')),
    NewsFeedItemEntity.event(event: _testEvent('2')),
  ];

  ProviderContainer makeContainer({
    required Either<Failure, List<NewsFeedItemEntity>> feedResult,
    UserEntity? user,
  }) {
    final container = ProviderContainer(
      // Disable Riverpod 3's automatic retry-with-backoff so error-path
      // tests observe the failure instead of a perpetually pending future.
      retry: (retryCount, error) => null,
      overrides: [
        authControllerProvider.overrideWith(() => _FakeAuthController(user)),
        homeFeedRepositoryProvider.overrideWithValue(
          _FakeHomeFeedRepository(feedResult),
        ),
      ],
    );
    addTearDown(container.dispose);
    // Keep the autodispose provider alive across async gaps in the tests.
    // onError swallows AsyncError transitions so error-path tests can assert
    // on them explicitly instead of failing via the zone handler.
    final sub = container.listen(
      newsFeedControllerProvider,
      (_, _) {},
      onError: (_, _) {},
    );
    addTearDown(sub.close);
    return container;
  }

  group('NewsFeedController -', () {
    test('returns repository items for an authenticated club member',
        () async {
      final container = makeContainer(
        user: testUser,
        feedResult: Right(feedItems),
      );

      final newsFeed = await container.read(newsFeedControllerProvider.future);

      expect(newsFeed, hasLength(2));
      expect(newsFeed.every((i) => i.type == NewsFeedItemType.event), isTrue);
    });

    test('returns an empty feed when no user is signed in', () async {
      final container = makeContainer(feedResult: Right(feedItems));

      final newsFeed = await container.read(newsFeedControllerProvider.future);

      expect(newsFeed, isEmpty);
    });

    test('returns an empty feed when the user has no club', () async {
      final container = makeContainer(
        user: UserEntity(
          id: 'user-2',
          email: 'noclub@example.com',
          firstName: 'No',
          lastName: 'Club',
          createdAt: DateTime.now(),
        ),
        feedResult: Right(feedItems),
      );

      final newsFeed = await container.read(newsFeedControllerProvider.future);

      expect(newsFeed, isEmpty);
    });

    test('returns an empty feed when the backend has no items', () async {
      final container = makeContainer(
        user: testUser,
        feedResult: const Right([]),
      );

      final newsFeed = await container.read(newsFeedControllerProvider.future);

      expect(newsFeed, isEmpty);
    });

    test('surfaces repository failures as an error state', () async {
      final container = makeContainer(
        user: testUser,
        feedResult: Left(NetworkFailure.serverError(500, 'boom')),
      );

      // Riverpod 3 may surface the failure wrapped (ProviderException), so
      // match on the underlying NetworkFailure either way.
      await expectLater(
        container.read(newsFeedControllerProvider.future),
        throwsA(
          predicate(
            (e) => e is NetworkFailure || e.toString().contains('boom'),
          ),
        ),
      );
      expect(container.read(newsFeedControllerProvider).hasError, isTrue);
    });

    test('refresh re-fetches the feed', () async {
      final container = makeContainer(
        user: testUser,
        feedResult: Right(feedItems),
      );

      final initial = await container.read(newsFeedControllerProvider.future);
      expect(initial, hasLength(2));

      final controller = container.read(newsFeedControllerProvider.notifier);
      await controller.refresh();

      final refreshed = container.read(newsFeedControllerProvider).value;
      expect(refreshed, hasLength(2));
    });

    test('updates RSVP status for a matching event', () async {
      final container = makeContainer(
        user: testUser,
        feedResult: Right(feedItems),
      );

      await container.read(newsFeedControllerProvider.future);

      final controller = container.read(newsFeedControllerProvider.notifier);
      await controller.updateRSVP('1', Enum$RSVPResponse.YES);

      final updated = container.read(newsFeedControllerProvider).value!;
      final updatedEvent = updated.firstWhere((i) => i.event?.id == '1');
      final untouchedEvent = updated.firstWhere((i) => i.event?.id == '2');

      expect(updatedEvent.userRSVPResponse, Enum$RSVPResponse.YES);
      expect(untouchedEvent.userRSVPResponse, isNull);
    });

    test('leaves state intact when RSVP target does not exist', () async {
      final container = makeContainer(
        user: testUser,
        feedResult: Right(feedItems),
      );

      await container.read(newsFeedControllerProvider.future);

      final controller = container.read(newsFeedControllerProvider.notifier);
      await controller.updateRSVP('non_existent', Enum$RSVPResponse.YES);

      final state = container.read(newsFeedControllerProvider).value;
      expect(state, hasLength(2));
      expect(state!.every((i) => i.userRSVPResponse == null), isTrue);
    });

    test('handles multiple RSVP updates', () async {
      final container = makeContainer(
        user: testUser,
        feedResult: Right(feedItems),
      );

      await container.read(newsFeedControllerProvider.future);

      final controller = container.read(newsFeedControllerProvider.notifier);
      await controller.updateRSVP('1', Enum$RSVPResponse.YES);
      await controller.updateRSVP('2', Enum$RSVPResponse.MAYBE);

      final updated = container.read(newsFeedControllerProvider).value!;
      expect(
        updated.firstWhere((i) => i.event?.id == '1').userRSVPResponse,
        Enum$RSVPResponse.YES,
      );
      expect(
        updated.firstWhere((i) => i.event?.id == '2').userRSVPResponse,
        Enum$RSVPResponse.MAYBE,
      );
    });
  });
}
