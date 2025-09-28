import 'package:clubland/features/auth/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'helpers/test_helpers.dart';

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();

    // Mock method channel for path_provider
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      const MethodChannel('plugins.flutter.io/path_provider'),
      (MethodCall methodCall) async {
        switch (methodCall.method) {
          case 'getApplicationDocumentsDirectory':
            return '/tmp/test_documents';
          case 'getTemporaryDirectory':
            return '/tmp/test_temp';
          case 'getApplicationSupportDirectory':
            return '/tmp/test_support';
          default:
            return null;
        }
      },
    );

    // Mock google_fonts method channel
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      const MethodChannel('plugins.flutter.io/google_fonts'),
      (MethodCall methodCall) async => null,
    );

    TestHelpers.setupFallbackValues();

    // Initialize Hive with a test directory instead of using initFlutter
    Hive.init('/tmp/test_hive');
  });

  tearDownAll(() async {
    await Hive.close();
  });

  testWidgets('SplashPage should display Clubland text', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: SplashPage(),
        ),
      ),
    );

    expect(find.text('Clubland'), findsOneWidget);
  });
}
