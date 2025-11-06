import 'package:clubland/features/events/domain/entities/event_entity.dart';
import 'package:clubland/features/events/presentation/widgets/capacity_indicator.dart';
import 'package:clubland/features/events/presentation/widgets/event_card.dart';
import 'package:clubland/features/events/presentation/widgets/rsvp_status_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/test_helpers.dart';

void main() {
  group('EventCard', () {
    late EventEntity testEvent;

    setUp(() {
      testEvent = EventEntity(
        id: '1',
        clubId: 'club1',
        title: 'Summer Gala',
        description: 'Join us for an elegant evening of dining and dancing.',
        eventType: EventType.social,
        startTime: DateTime(2024, 7, 15, 19),
        endTime: DateTime(2024, 7, 15, 23),
        location: 'Grand Ballroom',
        capacity: 100,
        currentAttendees: 45,
        availableSpots: 55,
        guestPolicy: GuestPolicy.friendsAndFamily,
        maxGuestsPerMember: 2,
        requiresApproval: false,
        requiresPayment: false,
        allowsSubgroupPriority: false,
        fullHouseExclusive: false,
        createdAt: DateTime(2024, 6),
        updatedAt: DateTime(2024, 6),
      );
    });

    testWidgets('should render event card with all basic information', (
      tester,
    ) async {
      await tester.pumpApp(EventCard(event: testEvent));

      expect(find.text('Summer Gala'), findsOneWidget);
      expect(
        find.text('Join us for an elegant evening of dining and dancing.'),
        findsOneWidget,
      );
      expect(find.text('Grand Ballroom'), findsOneWidget);
      expect(find.text('Social'), findsOneWidget);
    });

    testWidgets('should display event date and time correctly', (tester) async {
      await tester.pumpApp(EventCard(event: testEvent));

      expect(find.text('Jul 15, 2024'), findsOneWidget);
      expect(find.text('7:00 PM'), findsOneWidget);
      expect(find.byIcon(Icons.calendar_today), findsOneWidget);
      expect(find.byIcon(Icons.access_time), findsOneWidget);
    });

    testWidgets('should display location icon and text', (tester) async {
      await tester.pumpApp(EventCard(event: testEvent));

      expect(find.byIcon(Icons.location_on), findsOneWidget);
      expect(find.text('Grand Ballroom'), findsOneWidget);
    });

    testWidgets('should show capacity indicator when showCapacity is true', (
      tester,
    ) async {
      await tester.pumpApp(EventCard(event: testEvent));

      expect(find.byType(CapacityIndicator), findsOneWidget);
      expect(find.text('55 spots available'), findsOneWidget);
    });

    testWidgets('should hide capacity indicator when showCapacity is false', (
      tester,
    ) async {
      await tester.pumpApp(EventCard(event: testEvent, showCapacity: false));

      expect(find.byType(CapacityIndicator), findsNothing);
    });

    testWidgets('should show RSVP status badge when user has RSVP', (
      tester,
    ) async {
      await tester.pumpApp(
        EventCard(event: testEvent, userRSVPStatus: 'confirmed'),
      );

      expect(find.byType(RSVPStatusBadge), findsOneWidget);
      expect(find.text('Confirmed'), findsOneWidget);
    });

    testWidgets('should hide RSVP status badge when user has no RSVP', (
      tester,
    ) async {
      await tester.pumpApp(EventCard(event: testEvent));

      expect(find.byType(RSVPStatusBadge), findsNothing);
    });

    testWidgets('should hide RSVP status badge when showRSVPStatus is false', (
      tester,
    ) async {
      await tester.pumpApp(
        EventCard(
          event: testEvent,
          userRSVPStatus: 'confirmed',
          showRSVPStatus: false,
        ),
      );

      expect(find.byType(RSVPStatusBadge), findsNothing);
    });

    testWidgets('should display payment indicator when payment is required', (
      tester,
    ) async {
      final paidEvent = EventEntity(
        id: '2',
        clubId: 'club1',
        title: 'Wine Tasting',
        description: 'Premium wine tasting event',
        eventType: EventType.dining,
        startTime: DateTime(2024, 8, 1, 18),
        endTime: DateTime(2024, 8, 1, 21),
        location: 'Wine Cellar',
        capacity: 30,
        currentAttendees: 15,
        availableSpots: 15,
        guestPolicy: GuestPolicy.membersOnly,
        requiresApproval: false,
        requiresPayment: true,
        price: 75.50,
        allowsSubgroupPriority: false,
        fullHouseExclusive: false,
        createdAt: DateTime(2024, 7),
        updatedAt: DateTime(2024, 7),
      );

      await tester.pumpApp(EventCard(event: paidEvent));

      expect(find.byIcon(Icons.payment), findsOneWidget);
      expect(find.text('Payment required: \$75.50'), findsOneWidget);
    });

    testWidgets('should display approval required indicator', (tester) async {
      final approvalEvent = EventEntity(
        id: '3',
        clubId: 'club1',
        title: 'Exclusive Dinner',
        description: 'Members only dinner',
        eventType: EventType.special,
        startTime: DateTime(2024, 9, 1, 19),
        endTime: DateTime(2024, 9, 1, 22),
        location: 'Private Dining Room',
        capacity: 20,
        currentAttendees: 8,
        availableSpots: 12,
        guestPolicy: GuestPolicy.membersOnly,
        requiresApproval: true,
        requiresPayment: false,
        allowsSubgroupPriority: false,
        fullHouseExclusive: false,
        createdAt: DateTime(2024, 8),
        updatedAt: DateTime(2024, 8),
      );

      await tester.pumpApp(EventCard(event: approvalEvent));

      expect(find.byIcon(Icons.verified_user), findsOneWidget);
      expect(find.text('Approval required'), findsOneWidget);
    });

    testWidgets('should handle tap callback', (tester) async {
      var wasTapped = false;

      await tester.pumpApp(
        EventCard(event: testEvent, onTap: () => wasTapped = true),
      );

      await tester.tap(find.byType(InkWell));
      expect(wasTapped, true);
    });

    testWidgets('should truncate long event titles', (tester) async {
      final longTitleEvent = EventEntity(
        id: '4',
        clubId: 'club1',
        title:
            'This is a very long event title that should be truncated properly',
        description: 'Test description',
        eventType: EventType.social,
        startTime: DateTime(2024, 7, 15, 19),
        endTime: DateTime(2024, 7, 15, 23),
        location: 'Test Location',
        capacity: 50,
        currentAttendees: 25,
        availableSpots: 25,
        guestPolicy: GuestPolicy.noGuests,
        requiresApproval: false,
        requiresPayment: false,
        allowsSubgroupPriority: false,
        fullHouseExclusive: false,
        createdAt: DateTime(2024, 6),
        updatedAt: DateTime(2024, 6),
      );

      await tester.pumpApp(EventCard(event: longTitleEvent));

      final titleText = tester.widget<Text>(find.text(longTitleEvent.title));
      expect(titleText.maxLines, 2);
      expect(titleText.overflow, TextOverflow.ellipsis);
    });

    testWidgets('should truncate long descriptions', (tester) async {
      final longDescriptionEvent = EventEntity(
        id: '5',
        clubId: 'club1',
        title: 'Event Title',
        description:
            'This is a very long description that should be truncated to fit nicely in the card layout without taking up too much space',
        eventType: EventType.social,
        startTime: DateTime(2024, 7, 15, 19),
        endTime: DateTime(2024, 7, 15, 23),
        location: 'Test Location',
        capacity: 50,
        currentAttendees: 25,
        availableSpots: 25,
        guestPolicy: GuestPolicy.noGuests,
        requiresApproval: false,
        requiresPayment: false,
        allowsSubgroupPriority: false,
        fullHouseExclusive: false,
        createdAt: DateTime(2024, 6),
        updatedAt: DateTime(2024, 6),
      );

      await tester.pumpApp(EventCard(event: longDescriptionEvent));

      final descriptionText = tester.widget<Text>(
        find.text(longDescriptionEvent.description),
      );
      expect(descriptionText.maxLines, 2);
      expect(descriptionText.overflow, TextOverflow.ellipsis);
    });

    testWidgets('should hide description when empty', (tester) async {
      final noDescriptionEvent = EventEntity(
        id: '6',
        clubId: 'club1',
        title: 'Simple Event',
        description: '',
        eventType: EventType.social,
        startTime: DateTime(2024, 7, 15, 19),
        endTime: DateTime(2024, 7, 15, 23),
        location: 'Test Location',
        capacity: 50,
        currentAttendees: 25,
        availableSpots: 25,
        guestPolicy: GuestPolicy.noGuests,
        requiresApproval: false,
        requiresPayment: false,
        allowsSubgroupPriority: false,
        fullHouseExclusive: false,
        createdAt: DateTime(2024, 6),
        updatedAt: DateTime(2024, 6),
      );

      await tester.pumpApp(EventCard(event: noDescriptionEvent));

      // Description text should not be present when empty
      final descriptionFinder = find.text('');
      expect(descriptionFinder, findsWidgets);
    });

    group('event type badges', () {
      testWidgets('should show social event type badge', (tester) async {
        await tester.pumpApp(EventCard(event: testEvent));

        expect(find.text('Social'), findsOneWidget);
      });

      testWidgets('should show dining event type badge', (tester) async {
        final diningEvent = EventEntity(
          id: '7',
          clubId: 'club1',
          title: 'Dinner',
          description: 'Test',
          eventType: EventType.dining,
          startTime: DateTime(2024, 7, 15, 19),
          endTime: DateTime(2024, 7, 15, 23),
          location: 'Restaurant',
          capacity: 50,
          currentAttendees: 25,
          availableSpots: 25,
          guestPolicy: GuestPolicy.noGuests,
          requiresApproval: false,
          requiresPayment: false,
          allowsSubgroupPriority: false,
          fullHouseExclusive: false,
          createdAt: DateTime(2024, 6),
          updatedAt: DateTime(2024, 6),
        );

        await tester.pumpApp(EventCard(event: diningEvent));

        expect(find.text('Dining'), findsOneWidget);
      });

      testWidgets('should show sports event type badge', (tester) async {
        final sportsEvent = EventEntity(
          id: '8',
          clubId: 'club1',
          title: 'Tennis Tournament',
          description: 'Test',
          eventType: EventType.sports,
          startTime: DateTime(2024, 7, 15, 9),
          endTime: DateTime(2024, 7, 15, 17),
          location: 'Tennis Courts',
          capacity: 32,
          currentAttendees: 16,
          availableSpots: 16,
          guestPolicy: GuestPolicy.noGuests,
          requiresApproval: false,
          requiresPayment: false,
          allowsSubgroupPriority: false,
          fullHouseExclusive: false,
          createdAt: DateTime(2024, 6),
          updatedAt: DateTime(2024, 6),
        );

        await tester.pumpApp(EventCard(event: sportsEvent));

        expect(find.text('Sports'), findsOneWidget);
      });

      testWidgets('should show Finding Friends event type badge', (
        tester,
      ) async {
        final findingFriendsEvent = EventEntity(
          id: '9',
          clubId: 'club1',
          title: 'Networking Meetup',
          description: 'Test',
          eventType: EventType.findingFriends,
          startTime: DateTime(2024, 7, 15, 18),
          endTime: DateTime(2024, 7, 15, 20),
          location: 'Lounge',
          capacity: 40,
          currentAttendees: 20,
          availableSpots: 20,
          guestPolicy: GuestPolicy.membersOnly,
          requiresApproval: false,
          requiresPayment: false,
          allowsSubgroupPriority: true,
          fullHouseExclusive: false,
          createdAt: DateTime(2024, 6),
          updatedAt: DateTime(2024, 6),
        );

        await tester.pumpApp(EventCard(event: findingFriendsEvent));

        expect(find.text('Finding Friends'), findsOneWidget);
      });
    });

    group('capacity variations', () {
      testWidgets('should handle event without capacity limit', (tester) async {
        final noCap Event = EventEntity(
          id: '10',
          clubId: 'club1',
          title: 'Open Event',
          description: 'No capacity limit',
          eventType: EventType.social,
          startTime: DateTime(2024, 7, 15, 19),
          endTime: DateTime(2024, 7, 15, 23),
          location: 'Large Hall',
          currentAttendees: 50,
          availableSpots: 999,
          guestPolicy: GuestPolicy.friendsAndFamily,
          requiresApproval: false,
          requiresPayment: false,
          allowsSubgroupPriority: false,
          fullHouseExclusive: false,
          createdAt: DateTime(2024, 6),
          updatedAt: DateTime(2024, 6),
        );

        await tester.pumpApp(EventCard(event: noCapEvent));

        // Should not show capacity indicator when capacity is null
        expect(find.byType(CapacityIndicator), findsNothing);
      });

      testWidgets('should show full event correctly', (tester) async {
        final fullEvent = EventEntity(
          id: '11',
          clubId: 'club1',
          title: 'Sold Out Event',
          description: 'This event is full',
          eventType: EventType.special,
          startTime: DateTime(2024, 7, 15, 19),
          endTime: DateTime(2024, 7, 15, 23),
          location: 'Small Venue',
          capacity: 50,
          currentAttendees: 50,
          availableSpots: 0,
          guestPolicy: GuestPolicy.membersOnly,
          requiresApproval: false,
          requiresPayment: true,
          price: 100.0,
          allowsSubgroupPriority: false,
          fullHouseExclusive: false,
          createdAt: DateTime(2024, 6),
          updatedAt: DateTime(2024, 6),
        );

        await tester.pumpApp(EventCard(event: fullEvent));

        expect(find.text('Event Full'), findsOneWidget);
      });
    });

    group('accessibility', () {
      testWidgets('should be tappable for screen readers', (tester) async {
        var wasTapped = false;

        await tester.pumpApp(
          EventCard(event: testEvent, onTap: () => wasTapped = true),
        );

        expect(find.byType(InkWell), findsOneWidget);
        await tester.tap(find.byType(InkWell));
        expect(wasTapped, true);
      });

      testWidgets('should render without exceptions', (tester) async {
        await tester.pumpApp(EventCard(event: testEvent));

        expect(tester.takeException(), isNull);
      });
    });
  });
}
