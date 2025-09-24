import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import 'test_helpers.dart';

class GoldenTestHelpers {
  static Future<void> loadAppFonts() async {
    await loadAppFonts();
  }

  static Future<void> testGolden(
    WidgetTester tester,
    Widget widget,
    String goldenFileName, {
    Size? surfaceSize,
    double? textScaleFactor,
    Brightness? brightness,
    bool? accessibilityFont,
  }) async {
    await tester.pumpWidgetBuilder(
      createTestWidget(child: widget),
      surfaceSize: surfaceSize ?? const Size(400, 600),
      wrapper: (child) => MaterialApp(
        theme: ThemeData(brightness: brightness ?? Brightness.light),
        home: Scaffold(body: child),
        debugShowCheckedModeBanner: false,
      ),
    );

    await screenMatchesGolden(tester, goldenFileName);
  }

  static Future<void> testMultiScreenGolden(
    WidgetTester tester,
    Widget widget,
    String goldenFileName, {
    List<Device>? devices,
  }) async {
    await tester.pumpDeviceBuilder(
      DeviceBuilder()
        ..overrideDevicesForAllScenarios(
          devices:
              devices ?? [Device.phone, Device.iphone11, Device.tabletPortrait],
        )
        ..addScenario(
          widget: createTestWidget(child: widget),
          name: 'default',
        ),
      wrapper: (child) => MaterialApp(
        home: Scaffold(body: child),
        debugShowCheckedModeBanner: false,
      ),
    );

    await screenMatchesGolden(tester, goldenFileName);
  }

  static Future<void> testThemeVariations(
    WidgetTester tester,
    Widget widget,
    String goldenFileName,
  ) async {
    await tester.pumpWidgetBuilder(
      createTestWidget(child: widget),
      wrapper: (child) => MaterialApp(
        home: Scaffold(body: child),
        debugShowCheckedModeBanner: false,
      ),
    );

    await multiScreenGolden(
      tester,
      goldenFileName,
      devices: [
        const Device(name: 'light_theme', size: Size(400, 600)),
        const Device(name: 'dark_theme', size: Size(400, 600)),
      ],
    );
  }

  static Future<void> testAccessibilityVariations(
    WidgetTester tester,
    Widget widget,
    String goldenFileName,
  ) async {
    await tester.pumpWidgetBuilder(
      createTestWidget(child: widget),
      wrapper: (child) => MaterialApp(
        home: Scaffold(body: child),
        debugShowCheckedModeBanner: false,
      ),
    );

    await multiScreenGolden(
      tester,
      goldenFileName,
      devices: [
        const Device(name: 'normal_text', size: Size(400, 600)),
        const Device(name: 'large_text', size: Size(400, 600), textScale: 1.5),
        const Device(
          name: 'extra_large_text',
          size: Size(400, 600),
          textScale: 2.0,
        ),
      ],
    );
  }
}

extension GoldenTestExtensions on WidgetTester {
  Future<void> testGolden(
    Widget widget,
    String goldenFileName, {
    Size? surfaceSize,
    double? textScaleFactor,
    Brightness? brightness,
  }) async {
    await GoldenTestHelpers.testGolden(
      this,
      widget,
      goldenFileName,
      surfaceSize: surfaceSize,
      textScaleFactor: textScaleFactor,
      brightness: brightness,
    );
  }

  Future<void> testMultiScreenGolden(
    Widget widget,
    String goldenFileName, {
    List<Device>? devices,
  }) async {
    await GoldenTestHelpers.testMultiScreenGolden(
      this,
      widget,
      goldenFileName,
      devices: devices,
    );
  }
}
