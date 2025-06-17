import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class TestServices {
  static Future<void> verifyWidgetExists({
    required WidgetTester tester,
    required Finder finder,
    required String description,
    List<String>? passedTests,
  }) async {
    expect(finder, findsOneWidget);
    passedTests?.add(description);
  }

  static Future<void> verifyWidgetText({
    required WidgetTester tester,
    required Finder finder,
    required String expectedText,
    required String description,
    List<String>? passedTests,
  }) async {
    final widget = tester.widget<Text>(finder);
    expect(widget.data, expectedText);
    passedTests?.add(description);
  }

  static Future<void> tapAndVerify({
    required WidgetTester tester,
    required Finder buttonFinder,
    required Finder verificationFinder,
    required String description,
    List<String>? passedTests,
  }) async {
    await tester.tap(buttonFinder);
    await tester.pump();
    expect(verificationFinder, findsOneWidget);
    passedTests?.add(description);
  }
}
