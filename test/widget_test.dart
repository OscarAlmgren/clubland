import 'package:clubland/features/auth/presentation/pages/splash_page.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers/test_helpers.dart';

/// Drift test database setup
/// Variable to hold the test database executor for in-memory testing
late NativeDatabase _testExecutor;

/// Function to create and return the in-memory executor
NativeDatabase _openTestDatabase() => NativeDatabase.memory();

/// Function to dispose of the test executor
Future<void> _closeTestDatabase() async {
  await _testExecutor.close();
}

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();

    // Mock path_provider for testing environment
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

    // Initialize in-memory database for testing
    _testExecutor = _openTestDatabase();
  });

  tearDownAll(() async {
    // Close the database connection
    await _closeTestDatabase();
  });

  testWidgets('SplashPage should display Clubland text', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(home: SplashPage()),
      ),
    );

    expect(find.text('Clubland'), findsOneWidget);
  });
}
