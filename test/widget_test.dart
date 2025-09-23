import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:clubland/main.dart';
import 'helpers/test_helpers.dart';

void main() {
  setUpAll(() async {
    TestHelpers.setupFallbackValues();
    await Hive.initFlutter();
  });

  testWidgets('App should start and show splash screen', (WidgetTester tester) async {
    await tester.pumpWidget(const ClublandApp());
    await tester.pump();

    expect(find.text('Clubland'), findsOneWidget);
  });
}
