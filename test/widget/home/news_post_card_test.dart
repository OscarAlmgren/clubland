import 'package:clubland/features/home/domain/entities/news_post_entity.dart';
import 'package:clubland/features/home/presentation/widgets/news_post_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NewsPostCard', () {
    late NewsPostEntity testNewsPost;

    setUp(() {
      testNewsPost = NewsPostEntity(
        id: '1',
        clubId: 'club_1',
        title: 'Test News Title',
        content: 'This is a test news post content.',
        postedAt: DateTime(2024, 1, 15, 10, 30),
        author: 'Test Author',
      );
    });

    testWidgets('renders news post information correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NewsPostCard(newsPost: testNewsPost),
          ),
        ),
      );

      // Verify title is displayed
      expect(find.text('Test News Title'), findsOneWidget);

      // Verify content is displayed
      expect(find.text('This is a test news post content.'), findsOneWidget);

      // Verify author is displayed
      expect(find.text('Test Author'), findsOneWidget);

      // Verify NEWS badge is displayed
      expect(find.text('NEWS'), findsOneWidget);
    });

    testWidgets('displays card without author when author is null',
        (WidgetTester tester) async {
      final newsPostWithoutAuthor = NewsPostEntity(
        id: '1',
        clubId: 'club_1',
        title: 'Test News',
        content: 'Test content',
        postedAt: DateTime(2024, 1, 15),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NewsPostCard(newsPost: newsPostWithoutAuthor),
          ),
        ),
      );

      // Verify title is displayed
      expect(find.text('Test News'), findsOneWidget);

      // Verify no author text
      expect(find.byIcon(Icons.person), findsNothing);
    });

    testWidgets('calls onTap when card is tapped',
        (WidgetTester tester) async {
      bool wasTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NewsPostCard(
              newsPost: testNewsPost,
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
  });
}
