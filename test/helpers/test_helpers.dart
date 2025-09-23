import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

import '../../lib/core/design_system/design_system.dart';

class MockGoRouter extends Mock implements GoRouter {}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

Widget createTestApp({
  required Widget child,
  List<Override>? overrides,
  GoRouter? router,
}) {
  return ProviderScope(
    overrides: overrides ?? [],
    child: MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: router != null
          ? Router.withConfig(config: router)
          : Scaffold(body: child),
    ),
  );
}

Widget createTestWidget({
  required Widget child,
  List<Override>? overrides,
}) {
  return ProviderScope(
    overrides: overrides ?? [],
    child: MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: Scaffold(body: child),
    ),
  );
}

extension WidgetTesterExtensions on WidgetTester {
  Future<void> pumpApp(
    Widget widget, {
    List<Override>? overrides,
  }) async {
    await pumpWidget(
      createTestApp(
        child: widget,
        overrides: overrides,
      ),
    );
  }

  Future<void> pumpAndSettleApp(
    Widget widget, {
    List<Override>? overrides,
  }) async {
    await pumpWidget(
      createTestApp(
        child: widget,
        overrides: overrides,
      ),
    );
    await pumpAndSettle();
  }
}

class TestConstants {
  static const testEmail = 'test@example.com';
  static const testPassword = 'Test123!@#';
  static const testFirstName = 'John';
  static const testLastName = 'Doe';
  static const testToken = 'test_token_123';
  static const testRefreshToken = 'test_refresh_token_123';
}

class TestHelpers {
  static void setupFallbackValues() {
    registerFallbackValue(Uri.parse('https://example.com'));
    registerFallbackValue(const Duration(seconds: 1));
  }

  static Future<void> delay([Duration? duration]) async {
    await Future.delayed(duration ?? const Duration(milliseconds: 100));
  }
}