import 'package:clubland/features/events/presentation/widgets/error_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/test_helpers.dart';

void main() {
  group('ErrorDisplay', () {
    testWidgets('should render error message and details', (tester) async {
      await tester.pumpApp(
        const ErrorDisplay(
          message: 'Test Error',
          details: 'This is a test error message with details.',
        ),
      );

      expect(find.text('Test Error'), findsOneWidget);
      expect(
        find.text('This is a test error message with details.'),
        findsOneWidget,
      );
      expect(find.byIcon(Icons.error_outline), findsOneWidget);
    });

    testWidgets('should show retry button when onRetry is provided',
        (tester) async {
      var wasRetried = false;

      await tester.pumpApp(
        ErrorDisplay(
          message: 'Connection Failed',
          onRetry: () => wasRetried = true,
        ),
      );

      expect(find.text('Retry'), findsOneWidget);
      expect(find.byIcon(Icons.refresh), findsOneWidget);

      await tester.tap(find.text('Retry'));
      expect(wasRetried, true);
    });

    testWidgets('should hide retry button when onRetry is null',
        (tester) async {
      await tester.pumpApp(
        const ErrorDisplay(
          message: 'Error',
          showRetry: true,
        ),
      );

      expect(find.text('Retry'), findsNothing);
      expect(find.byType(FilledButton), findsNothing);
    });

    testWidgets('should hide retry button when showRetry is false',
        (tester) async {
      await tester.pumpApp(
        ErrorDisplay(
          message: 'Error',
          onRetry: () {},
          showRetry: false,
        ),
      );

      expect(find.text('Retry'), findsNothing);
    });

    testWidgets('should show custom icon when provided', (tester) async {
      await tester.pumpApp(
        const ErrorDisplay(
          message: 'Custom Error',
          icon: Icons.cloud_off,
        ),
      );

      expect(find.byIcon(Icons.cloud_off), findsOneWidget);
      expect(find.byIcon(Icons.error_outline), findsNothing);
    });

    testWidgets('should use default icon when not provided', (tester) async {
      await tester.pumpApp(
        const ErrorDisplay(message: 'Error'),
      );

      expect(find.byIcon(Icons.error_outline), findsOneWidget);
    });

    testWidgets('should hide details when not provided', (tester) async {
      await tester.pumpApp(
        const ErrorDisplay(message: 'Simple Error'),
      );

      expect(find.text('Simple Error'), findsOneWidget);
      // Details section should not be shown
      final centerWidget = tester.widget<Center>(find.byType(Center));
      expect(centerWidget, isNotNull);
    });

    group('factory constructors', () {
      testWidgets('should create network error display', (tester) async {
        var wasRetried = false;

        await tester.pumpApp(
          ErrorDisplay.network(onRetry: () => wasRetried = true),
        );

        expect(find.text('Connection Error'), findsOneWidget);
        expect(
          find.text(
            'Unable to connect to the server. Please check your internet connection and try again.',
          ),
          findsOneWidget,
        );
        expect(find.byIcon(Icons.signal_wifi_off), findsOneWidget);
        expect(find.text('Retry'), findsOneWidget);

        await tester.tap(find.text('Retry'));
        expect(wasRetried, true);
      });

      testWidgets('should create server error display', (tester) async {
        await tester.pumpApp(
          ErrorDisplay.server(),
        );

        expect(find.text('Server Error'), findsOneWidget);
        expect(
          find.text('The server encountered an error. Please try again later.'),
          findsOneWidget,
        );
        expect(find.byIcon(Icons.cloud_off), findsOneWidget);
      });

      testWidgets('should create server error with custom details',
          (tester) async {
        await tester.pumpApp(
          ErrorDisplay.server(details: 'Custom server error details'),
        );

        expect(find.text('Server Error'), findsOneWidget);
        expect(find.text('Custom server error details'), findsOneWidget);
      });

      testWidgets('should create not found error display', (tester) async {
        await tester.pumpApp(
          ErrorDisplay.notFound(),
        );

        expect(find.text('Not Found'), findsOneWidget);
        expect(
          find.text('The requested resource could not be found.'),
          findsOneWidget,
        );
        expect(find.byIcon(Icons.search_off), findsOneWidget);
        expect(find.text('Retry'), findsNothing); // No retry for not found
      });

      testWidgets('should create not found error with custom message',
          (tester) async {
        await tester.pumpApp(
          ErrorDisplay.notFound(message: 'Event Not Found'),
        );

        expect(find.text('Event Not Found'), findsOneWidget);
      });

      testWidgets('should create unauthorized error display', (tester) async {
        await tester.pumpApp(
          ErrorDisplay.unauthorized(),
        );

        expect(find.text('Authentication Required'), findsOneWidget);
        expect(find.text('Please log in to access this content.'), findsOneWidget);
        expect(find.byIcon(Icons.lock_outline), findsOneWidget);
        expect(find.text('Retry'), findsNothing); // No retry for unauthorized
      });
    });
  });

  group('CompactErrorDisplay', () {
    testWidgets('should render compact error message', (tester) async {
      await tester.pumpApp(
        const CompactErrorDisplay(
          message: 'Failed to load data',
        ),
      );

      expect(find.text('Failed to load data'), findsOneWidget);
      expect(find.byIcon(Icons.error_outline), findsOneWidget);
    });

    testWidgets('should show retry button when onRetry is provided',
        (tester) async {
      var wasRetried = false;

      await tester.pumpApp(
        CompactErrorDisplay(
          message: 'Error',
          onRetry: () => wasRetried = true,
        ),
      );

      expect(find.byIcon(Icons.refresh), findsOneWidget);
      expect(find.byType(IconButton), findsOneWidget);

      await tester.tap(find.byType(IconButton));
      expect(wasRetried, true);
    });

    testWidgets('should hide retry button when onRetry is null',
        (tester) async {
      await tester.pumpApp(
        const CompactErrorDisplay(message: 'Error'),
      );

      expect(find.byType(IconButton), findsNothing);
    });

    testWidgets('should have tooltip on retry button', (tester) async {
      await tester.pumpApp(
        CompactErrorDisplay(
          message: 'Error',
          onRetry: () {},
        ),
      );

      final iconButton = tester.widget<IconButton>(find.byType(IconButton));
      expect(iconButton.tooltip, 'Retry');
    });

    testWidgets('should render with proper styling', (tester) async {
      await tester.pumpApp(
        const CompactErrorDisplay(message: 'Styled error'),
      );

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(CompactErrorDisplay),
          matching: find.byType(Container),
        ),
      );

      final decoration = container.decoration as BoxDecoration;
      expect(decoration.borderRadius, BorderRadius.circular(8));
      expect(decoration.border, isNotNull);
    });
  });

  group('EmptyStateDisplay', () {
    testWidgets('should render empty state with title', (tester) async {
      await tester.pumpApp(
        const EmptyStateDisplay(
          title: 'No Events Found',
        ),
      );

      expect(find.text('No Events Found'), findsOneWidget);
      expect(find.byIcon(Icons.inbox), findsOneWidget);
    });

    testWidgets('should render empty state with description', (tester) async {
      await tester.pumpApp(
        const EmptyStateDisplay(
          title: 'No Events',
          description: 'There are no events to display at this time.',
        ),
      );

      expect(find.text('No Events'), findsOneWidget);
      expect(
        find.text('There are no events to display at this time.'),
        findsOneWidget,
      );
    });

    testWidgets('should hide description when not provided', (tester) async {
      await tester.pumpApp(
        const EmptyStateDisplay(title: 'Empty'),
      );

      expect(find.text('Empty'), findsOneWidget);
      // Description should not be shown
      expect(find.byType(Text), findsOneWidget); // Only title text
    });

    testWidgets('should show action button when provided', (tester) async {
      var wasPressed = false;

      await tester.pumpApp(
        EmptyStateDisplay(
          title: 'No Events',
          action: FilledButton(
            onPressed: () => wasPressed = true,
            child: const Text('Create Event'),
          ),
        ),
      );

      expect(find.text('Create Event'), findsOneWidget);

      await tester.tap(find.text('Create Event'));
      expect(wasPressed, true);
    });

    testWidgets('should hide action when not provided', (tester) async {
      await tester.pumpApp(
        const EmptyStateDisplay(title: 'Empty'),
      );

      expect(find.byType(FilledButton), findsNothing);
    });

    testWidgets('should show custom icon when provided', (tester) async {
      await tester.pumpApp(
        const EmptyStateDisplay(
          title: 'No Data',
          icon: Icons.event_note,
        ),
      );

      expect(find.byIcon(Icons.event_note), findsOneWidget);
      expect(find.byIcon(Icons.inbox), findsNothing);
    });

    testWidgets('should use default icon when not provided', (tester) async {
      await tester.pumpApp(
        const EmptyStateDisplay(title: 'Empty'),
      );

      expect(find.byIcon(Icons.inbox), findsOneWidget);
    });
  });

  group('accessibility', () {
    testWidgets('ErrorDisplay should be accessible', (tester) async {
      await tester.pumpApp(
        ErrorDisplay(
          message: 'Test Error',
          onRetry: () {},
        ),
      );

      expect(find.byType(ErrorDisplay), findsOneWidget);
      expect(find.text('Test Error'), findsOneWidget);
      expect(find.text('Retry'), findsOneWidget);
    });

    testWidgets('CompactErrorDisplay should be accessible', (tester) async {
      await tester.pumpApp(
        CompactErrorDisplay(
          message: 'Compact Error',
          onRetry: () {},
        ),
      );

      expect(find.byType(CompactErrorDisplay), findsOneWidget);
      expect(find.text('Compact Error'), findsOneWidget);
    });

    testWidgets('EmptyStateDisplay should be accessible', (tester) async {
      await tester.pumpApp(
        const EmptyStateDisplay(
          title: 'Empty State',
          description: 'No data available',
        ),
      );

      expect(find.byType(EmptyStateDisplay), findsOneWidget);
      expect(find.text('Empty State'), findsOneWidget);
      expect(find.text('No data available'), findsOneWidget);
    });
  });
}
