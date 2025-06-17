import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class TestHelpers {
  static Future<void> pumpMaterialWidget(
    WidgetTester tester,
    Widget child,
  ) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: child)));
    await tester.pumpAndSettle();
  }

  static Future<void> scrollToItem(
    WidgetTester tester, {
    required Finder itemFinder,
    double delta = 500.0,
  }) async {
    final listFinder = find.byType(Scrollable);
    await tester.scrollUntilVisible(itemFinder, delta, scrollable: listFinder);
  }

  // Add more common test operations as needed
}
