import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class BaseTest {
  final List<String> passedTests = [];
  final List<String> failedTests = [];

  Future<void> runSafeTest(
    WidgetTester tester,
    String description,
    Future<void> Function(WidgetTester tester) testBody,
  ) async {
    try {
      await testBody(tester);
      passedTests.add(description);
      return;
    } catch (e) {
      failedTests.add('$description ➜ $e');
      rethrow;
    }
  }

  void printTestResults() {
    debugPrint('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
    debugPrint('All Test Results 📋✅❌');
    debugPrint('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');

    for (final passedTest in passedTests) {
      debugPrint('✅ $passedTest');
    }

    for (final failedTest in failedTests) {
      debugPrint('❌ $failedTest');
    }
  }
}
