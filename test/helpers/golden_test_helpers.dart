import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_helpers.dart';

class GoldenTestHelpers {
  static Future<void> testGolden(
    WidgetTester tester,
    Widget widget,
    String goldenFileName, {
    Size? surfaceSize,
    double? textScaleFactor,
    Brightness? brightness,
    bool? accessibilityFont,
  }) async {
    await goldenTest(
      goldenFileName,
      fileName: goldenFileName,
      builder: () => GoldenTestGroup(
        children: [
          GoldenTestScenario(
            name: 'default',
            child: MaterialApp(
              theme: ThemeData(brightness: brightness ?? Brightness.light),
              home: Scaffold(
                body: createTestWidget(child: widget),
              ),
              debugShowCheckedModeBanner: false,
            ),
          ),
        ],
      ),
    );
  }

  static Future<void> testMultiScreenGolden(
    WidgetTester tester,
    Widget widget,
    String goldenFileName, {
    List<Size>? sizes,
  }) async {
    final testSizes = sizes ?? [
      const Size(375, 812), // iPhone
      const Size(414, 896), // iPhone 11
      const Size(768, 1024), // iPad Portrait
    ];

    await goldenTest(
      goldenFileName,
      fileName: goldenFileName,
      builder: () => GoldenTestGroup(
        children: testSizes
            .map(
              (size) => GoldenTestScenario(
                name: '${size.width.toInt()}x${size.height.toInt()}',
                child: SizedBox(
                  width: size.width,
                  height: size.height,
                  child: MaterialApp(
                    home: Scaffold(
                      body: createTestWidget(child: widget),
                    ),
                    debugShowCheckedModeBanner: false,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  static Future<void> testThemeVariations(
    WidgetTester tester,
    Widget widget,
    String goldenFileName,
  ) async {
    await goldenTest(
      goldenFileName,
      fileName: goldenFileName,
      builder: () => GoldenTestGroup(
        children: [
          GoldenTestScenario(
            name: 'light_theme',
            child: MaterialApp(
              theme: ThemeData(brightness: Brightness.light),
              home: Scaffold(
                body: createTestWidget(child: widget),
              ),
              debugShowCheckedModeBanner: false,
            ),
          ),
          GoldenTestScenario(
            name: 'dark_theme',
            child: MaterialApp(
              theme: ThemeData(brightness: Brightness.dark),
              home: Scaffold(
                body: createTestWidget(child: widget),
              ),
              debugShowCheckedModeBanner: false,
            ),
          ),
        ],
      ),
    );
  }

  static Future<void> testAccessibilityVariations(
    WidgetTester tester,
    Widget widget,
    String goldenFileName,
  ) async {
    await goldenTest(
      goldenFileName,
      fileName: goldenFileName,
      builder: () => GoldenTestGroup(
        children: [
          GoldenTestScenario(
            name: 'normal_text',
            child: MediaQuery(
              data: const MediaQueryData(textScaler: TextScaler.noScaling),
              child: MaterialApp(
                home: Scaffold(
                  body: createTestWidget(child: widget),
                ),
                debugShowCheckedModeBanner: false,
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'large_text',
            child: MediaQuery(
              data: const MediaQueryData(textScaler: TextScaler.linear(1.5)),
              child: MaterialApp(
                home: Scaffold(
                  body: createTestWidget(child: widget),
                ),
                debugShowCheckedModeBanner: false,
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'extra_large_text',
            child: MediaQuery(
              data: const MediaQueryData(textScaler: TextScaler.linear(2.0)),
              child: MaterialApp(
                home: Scaffold(
                  body: createTestWidget(child: widget),
                ),
                debugShowCheckedModeBanner: false,
              ),
            ),
          ),
        ],
      ),
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
    List<Size>? sizes,
  }) async {
    await GoldenTestHelpers.testMultiScreenGolden(
      this,
      widget,
      goldenFileName,
      sizes: sizes,
    );
  }
}
