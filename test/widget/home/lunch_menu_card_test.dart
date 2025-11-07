import 'package:clubland/features/home/domain/entities/lunch_menu_entity.dart';
import 'package:clubland/features/home/presentation/widgets/lunch_menu_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LunchMenuCard', () {
    late LunchMenuEntity testLunchMenu;

    setUp(() {
      testLunchMenu = LunchMenuEntity(
        id: '1',
        clubId: 'club_1',
        weekStartDate: DateTime(2024, 1, 15),
        weekEndDate: DateTime(2024, 1, 21),
        menuItems: const [
          LunchMenuItem(
            name: 'Grilled Salmon',
            description: 'Fresh salmon with vegetables',
            price: 28.50,
          ),
          LunchMenuItem(
            name: 'Caesar Salad',
            description: 'Classic Caesar salad',
            price: 16.00,
          ),
        ],
        specialNotes: 'All meals include soup or salad',
      );
    });

    testWidgets('renders lunch menu information correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: LunchMenuCard(lunchMenu: testLunchMenu),
          ),
        ),
      );

      // Verify LUNCH MENU badge is displayed
      expect(find.text('LUNCH MENU'), findsOneWidget);

      // Verify title is displayed
      expect(find.text('This Week\'s Lunch Menu'), findsOneWidget);

      // Verify menu items are displayed
      expect(find.text('Grilled Salmon'), findsOneWidget);
      expect(find.text('Caesar Salad'), findsOneWidget);

      // Verify prices are displayed
      expect(find.text('\$28.50'), findsOneWidget);
      expect(find.text('\$16.00'), findsOneWidget);

      // Verify special notes
      expect(find.text('All meals include soup or salad'), findsOneWidget);
    });

    testWidgets('displays only first 3 items when more than 3 items exist',
        (WidgetTester tester) async {
      final menuWithManyItems = LunchMenuEntity(
        id: '1',
        clubId: 'club_1',
        weekStartDate: DateTime(2024, 1, 15),
        weekEndDate: DateTime(2024, 1, 21),
        menuItems: const [
          LunchMenuItem(name: 'Item 1', description: 'Desc 1', price: 10.0),
          LunchMenuItem(name: 'Item 2', description: 'Desc 2', price: 15.0),
          LunchMenuItem(name: 'Item 3', description: 'Desc 3', price: 20.0),
          LunchMenuItem(name: 'Item 4', description: 'Desc 4', price: 25.0),
          LunchMenuItem(name: 'Item 5', description: 'Desc 5', price: 30.0),
        ],
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: LunchMenuCard(lunchMenu: menuWithManyItems),
          ),
        ),
      );

      // Verify first 3 items are displayed
      expect(find.text('Item 1'), findsOneWidget);
      expect(find.text('Item 2'), findsOneWidget);
      expect(find.text('Item 3'), findsOneWidget);

      // Verify 4th and 5th items are not displayed
      expect(find.text('Item 4'), findsNothing);
      expect(find.text('Item 5'), findsNothing);

      // Verify "more items" indicator
      expect(find.text('+ 2 more items'), findsOneWidget);
    });

    testWidgets('calls onTap when card is tapped',
        (WidgetTester tester) async {
      bool wasTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: LunchMenuCard(
              lunchMenu: testLunchMenu,
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
