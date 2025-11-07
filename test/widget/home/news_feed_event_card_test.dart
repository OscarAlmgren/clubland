import 'package:clubland/features/events/domain/entities/event_entity.dart';
import 'package:clubland/features/home/presentation/widgets/news_feed_event_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NewsFeedEventCard', () {
    late EventEntity testEvent;

    setUp(() {
      testEvent = EventEntity(
        id: 'event_1',
        clubId: 'club_1',
        title: 'Wine Tasting Evening',
        description: 'An exclusive wine tasting event',
        eventType: EventType.dining,
        startTime: DateTime(2024, 2, 15, 18, 0),
        endTime: DateTime(2024, 2, 15, 21, 0),
        location: 'Main Dining Room',
        capacity: 30,
        currentAttendees: 20,
        availableSpots: 10,
        guestPolicy: GuestPolicy.membersOnly,
        requiresApproval: false,
        requiresPayment: true,
        price: 75.0,
        allowsSubgroupPriority: false,
        fullHouseExclusive: false,
        createdAt: DateTime(2024, 1, 1),
        updatedAt: DateTime(2024, 1, 1),
      );
    });

    testWidgets('renders event information correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NewsFeedEventCard(event: testEvent),
          ),
        ),
      );

      // Verify title is displayed
      expect(find.text('Wine Tasting Evening'), findsOneWidget);

      // Verify location is displayed
      expect(find.text('Main Dining Room'), findsOneWidget);

      // Verify EVENT badge is displayed
      expect(find.text('EVENT'), findsOneWidget);

      // Verify attendance info
      expect(find.text('20/30 attending'), findsOneWidget);
      expect(find.text('• 10 spots left'), findsOneWidget);
    });

    testWidgets('shows ATTENDING marker when user is attending',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NewsFeedEventCard(
              event: testEvent,
              userRSVPStatus: 'confirmed',
            ),
          ),
        ),
      );

      // Verify ATTENDING badge is shown
      expect(find.text('ATTENDING'), findsOneWidget);

      // Verify RSVP button is NOT shown
      expect(find.text('RSVP'), findsNothing);
    });

    testWidgets('shows FULLBOKAD marker when event is full',
        (WidgetTester tester) async {
      final fullEvent = EventEntity(
        id: 'event_1',
        clubId: 'club_1',
        title: 'Full Event',
        description: 'This event is full',
        eventType: EventType.social,
        startTime: DateTime(2024, 2, 15, 18, 0),
        endTime: DateTime(2024, 2, 15, 21, 0),
        location: 'Main Hall',
        capacity: 30,
        currentAttendees: 30,
        availableSpots: 0, // Full
        guestPolicy: GuestPolicy.membersOnly,
        requiresApproval: false,
        requiresPayment: false,
        allowsSubgroupPriority: false,
        fullHouseExclusive: false,
        createdAt: DateTime(2024, 1, 1),
        updatedAt: DateTime(2024, 1, 1),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NewsFeedEventCard(event: fullEvent),
          ),
        ),
      );

      // Verify FULLBOKAD badge is shown
      expect(find.text('FULLBOKAD'), findsOneWidget);

      // Verify RSVP button is NOT shown when full
      expect(find.text('RSVP'), findsNothing);
    });

    testWidgets('shows FULL HOUSE EXCLUSIVE marker when appropriate',
        (WidgetTester tester) async {
      final exclusiveEvent = EventEntity(
        id: 'event_1',
        clubId: 'club_1',
        title: 'Exclusive Event',
        description: 'Full house exclusive event',
        eventType: EventType.special,
        startTime: DateTime(2024, 2, 15, 18, 0),
        endTime: DateTime(2024, 2, 15, 21, 0),
        location: 'Grand Ballroom',
        capacity: 100,
        currentAttendees: 50,
        availableSpots: 50,
        guestPolicy: GuestPolicy.membersOnly,
        requiresApproval: false,
        requiresPayment: false,
        allowsSubgroupPriority: false,
        fullHouseExclusive: true, // Exclusive
        createdAt: DateTime(2024, 1, 1),
        updatedAt: DateTime(2024, 1, 1),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NewsFeedEventCard(event: exclusiveEvent),
          ),
        ),
      );

      // Verify FULL HOUSE EXCLUSIVE badge is shown
      expect(find.text('FULL HOUSE EXCLUSIVE'), findsOneWidget);
    });

    testWidgets('shows OTHERS WELCOME marker when guests are allowed',
        (WidgetTester tester) async {
      final guestEvent = EventEntity(
        id: 'event_1',
        clubId: 'club_1',
        title: 'Family Event',
        description: 'Guests welcome',
        eventType: EventType.family,
        startTime: DateTime(2024, 2, 15, 18, 0),
        endTime: DateTime(2024, 2, 15, 21, 0),
        location: 'Terrace',
        capacity: 60,
        currentAttendees: 30,
        availableSpots: 30,
        guestPolicy: GuestPolicy.friendsAndFamily, // Others welcome
        requiresApproval: false,
        requiresPayment: false,
        allowsSubgroupPriority: false,
        fullHouseExclusive: false,
        createdAt: DateTime(2024, 1, 1),
        updatedAt: DateTime(2024, 1, 1),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NewsFeedEventCard(event: guestEvent),
          ),
        ),
      );

      // Verify OTHERS WELCOME badge is shown
      expect(find.text('OTHERS WELCOME'), findsOneWidget);
    });

    testWidgets('shows RSVP button when not attending and not full',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NewsFeedEventCard(event: testEvent),
          ),
        ),
      );

      // Verify RSVP button is shown
      expect(find.text('RSVP'), findsOneWidget);
    });

    testWidgets('calls onTap when card is tapped',
        (WidgetTester tester) async {
      bool wasTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NewsFeedEventCard(
              event: testEvent,
              onTap: () {
                wasTapped = true;
              },
            ),
          ),
        ),
      );

      // Tap the card
      await tester.tap(find.byType(Card));
      await tester.pumpAndSettle();

      expect(wasTapped, isTrue);
    });

    testWidgets('calls onRSVPTap when RSVP button is tapped',
        (WidgetTester tester) async {
      bool rsvpTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NewsFeedEventCard(
              event: testEvent,
              onRSVPTap: () {
                rsvpTapped = true;
              },
            ),
          ),
        ),
      );

      // Tap the RSVP button
      await tester.tap(find.text('RSVP'));
      await tester.pumpAndSettle();

      expect(rsvpTapped, isTrue);
    });
  });
}
