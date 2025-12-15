import 'package:clubland/features/events/domain/entities/event_entity.dart';
import 'package:clubland/features/home/presentation/widgets/rsvp_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('RSVPModal', () {
    late EventEntity testEvent;

    setUp(() {
      testEvent = EventEntity(
        id: '1',
        clubId: 'club_1',
        title: 'Wine Tasting Evening',
        description: 'An exclusive wine tasting event',
        eventType: EventType.dining,
        startTime: DateTime(2024, 2, 15, 18),
        endTime: DateTime(2024, 2, 15, 21),
        location: 'Main Dining Room',
        capacity: 30,
        currentAttendees: 20,
        availableSpots: 10,
        guestPolicy: GuestPolicy.membersOnly,
        requiresApproval: false,
        requiresPayment: true,
        allowsSubgroupPriority: false,
        fullHouseExclusive: false,
        createdAt: DateTime(2024),
        updatedAt: DateTime(2024),
      );
    });

    testWidgets('displays modal with event information', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  RSVPModal.show(context: context, event: testEvent);
                },
                child: const Text('Show Modal'),
              ),
            ),
          ),
        ),
      );

      // Tap to show modal
      await tester.tap(find.text('Show Modal'));
      await tester.pumpAndSettle();

      // Verify modal title
      expect(find.text('RSVP to Event'), findsOneWidget);

      // Verify event title
      expect(find.text('Wine Tasting Evening'), findsOneWidget);

      // Verify question text
      expect(find.text('Will you be attending this event?'), findsOneWidget);
    });

    testWidgets('displays all RSVP options', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  RSVPModal.show(context: context, event: testEvent);
                },
                child: const Text('Show Modal'),
              ),
            ),
          ),
        ),
      );

      // Tap to show modal
      await tester.tap(find.text('Show Modal'));
      await tester.pumpAndSettle();

      // Verify all three options
      expect(find.text("Yes, I'll attend"), findsOneWidget);
      expect(find.text('Maybe'), findsOneWidget);
      expect(find.text("No, I can't attend"), findsOneWidget);

      // Verify descriptions
      expect(find.text('Confirm your attendance'), findsOneWidget);
      expect(find.text("You're not sure yet"), findsOneWidget);
      expect(find.text('Decline the invitation'), findsOneWidget);
    });

    testWidgets('returns RSVPResponse.yes when yes is tapped', (
      WidgetTester tester,
    ) async {
      RSVPResponse? selectedResponse;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () async {
                  selectedResponse = await RSVPModal.show(
                    context: context,
                    event: testEvent,
                  );
                },
                child: const Text('Show Modal'),
              ),
            ),
          ),
        ),
      );

      // Tap to show modal
      await tester.tap(find.text('Show Modal'));
      await tester.pumpAndSettle();

      // Tap "Yes" option
      await tester.tap(find.text("Yes, I'll attend"));
      await tester.pumpAndSettle();

      // Verify response
      expect(selectedResponse, RSVPResponse.yes);
    });

    testWidgets('returns RSVPResponse.maybe when maybe is tapped', (
      WidgetTester tester,
    ) async {
      RSVPResponse? selectedResponse;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () async {
                  selectedResponse = await RSVPModal.show(
                    context: context,
                    event: testEvent,
                  );
                },
                child: const Text('Show Modal'),
              ),
            ),
          ),
        ),
      );

      // Tap to show modal
      await tester.tap(find.text('Show Modal'));
      await tester.pumpAndSettle();

      // Tap "Maybe" option
      await tester.tap(find.text('Maybe'));
      await tester.pumpAndSettle();

      // Verify response
      expect(selectedResponse, RSVPResponse.maybe);
    });

    testWidgets('returns RSVPResponse.no when no is tapped', (
      WidgetTester tester,
    ) async {
      RSVPResponse? selectedResponse;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () async {
                  selectedResponse = await RSVPModal.show(
                    context: context,
                    event: testEvent,
                  );
                },
                child: const Text('Show Modal'),
              ),
            ),
          ),
        ),
      );

      // Tap to show modal
      await tester.tap(find.text('Show Modal'));
      await tester.pumpAndSettle();

      // Tap "No" option
      await tester.tap(find.text("No, I can't attend"));
      await tester.pumpAndSettle();

      // Verify response
      expect(selectedResponse, RSVPResponse.no);
    });

    testWidgets('can be closed with close button', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  RSVPModal.show(context: context, event: testEvent);
                },
                child: const Text('Show Modal'),
              ),
            ),
          ),
        ),
      );

      // Tap to show modal
      await tester.tap(find.text('Show Modal'));
      await tester.pumpAndSettle();

      // Verify modal is shown
      expect(find.text('RSVP to Event'), findsOneWidget);

      // Tap close button
      await tester.tap(find.byIcon(Icons.close));
      await tester.pumpAndSettle();

      // Verify modal is closed
      expect(find.text('RSVP to Event'), findsNothing);
    });
  });
}
