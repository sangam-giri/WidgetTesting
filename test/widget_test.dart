import 'package:example_2/counter_screen.dart';
import 'package:example_2/home_screen.dart';
import 'package:example_2/widgets/example_widget.dart';
import 'package:example_2/widgets/listview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'core/base_tests.dart';
import 'core/test_helpers.dart';
import 'core/test_services.dart';

void main() {
  group('App Widget Tests', () {
    final baseTest = BaseTest();

    tearDownAll(() => baseTest.printTestResults());

    testWidgets('HomeScreen should display correct title and message', (
      tester,
    ) async {
      await baseTest.runSafeTest(tester, 'HomeScreen test', (tester) async {
        // Arrange
        const testTitle = 'T';
        const testMessage = 'M';

        // Act
        await TestHelpers.pumpMaterialWidget(
          tester,
          HomeScreen(title: testTitle, message: testMessage),
        );

        // Assert
        await TestServices.verifyWidgetExists(
          tester: tester,
          finder: find.text(testTitle),
          description: 'Title should be displayed',
          passedTests: baseTest.passedTests,
        );

        await TestServices.verifyWidgetExists(
          tester: tester,
          finder: find.text(testMessage),
          description: 'Message should be displayed',
          passedTests: baseTest.passedTests,
        );
      });
    });

    testWidgets(
      'Example Widget should have red color container with home icon',
      (tester) async {
        await baseTest.runSafeTest(tester, 'ExampleWidget test', (
          tester,
        ) async {
          // Arrange & Act
          await TestHelpers.pumpMaterialWidget(tester, ExampleWidget());

          // Assert
          final container = tester.widget<Container>(
            find.byType(Container).first,
          );
          expect(container.color, Colors.red);
          baseTest.passedTests.add('Container has red color');

          await TestServices.verifyWidgetExists(
            tester: tester,
            finder: find.widgetWithIcon(Container, Icons.home),
            description: 'Contains home icon',
            passedTests: baseTest.passedTests,
          );
        });
      },
    );

    testWidgets('finds a deep item in a long list on ListViewWidget', (
      tester,
    ) async {
      await baseTest.runSafeTest(tester, 'ListViewWidget test', (tester) async {
        // Arrange & Act
        await TestHelpers.pumpMaterialWidget(tester, ListviewWidget());

        // Act
        await TestHelpers.scrollToItem(
          tester,
          itemFinder: find.byKey(const ValueKey('item_50_text')),
        );

        // Assert
        await TestServices.verifyWidgetExists(
          tester: tester,
          finder: find.byKey(const ValueKey('item_50_text')),
          description: 'Found item_50_text',
          passedTests: baseTest.passedTests,
        );
      });
    });

    testWidgets(
      'Count must increase on tapping increaseCounter on CounterScreen',
      (tester) async {
        await baseTest.runSafeTest(tester, 'CounterScreen test', (
          tester,
        ) async {
          // Arrange
          await TestHelpers.pumpMaterialWidget(tester, CounterScreen());

          // Assert initial state
          await TestServices.verifyWidgetText(
            tester: tester,
            finder: find.text('Counter: 0'),
            expectedText: 'Counter: 0',
            description: 'Initial counter value is 0',
            passedTests: baseTest.passedTests,
          );

          // Act & Assert
          await TestServices.tapAndVerify(
            tester: tester,
            buttonFinder: find.byKey(const Key('increment-button')),
            verificationFinder: find.text('Counter: 2'),
            description: 'Counter increments on button tap',
            passedTests: baseTest.passedTests,
          );
        });
      },
    );
  });
}
