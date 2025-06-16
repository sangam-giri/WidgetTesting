import 'package:example_2/home_screen.dart';
import 'package:example_2/widgets/example_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App Widget Tests', () {
    List<String> passedTests = [];

    tearDownAll(() {
      if (kDebugMode) {
        print('Test passed! 🎉🔥🚀');
        print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      }

      for (String passedTest in passedTests) {
        if (kDebugMode) print('✅ $passedTest');
      }
    });

    testWidgets('HomeScreen should display correct title and message', (
      tester,
    ) async {
      //Arrange
      const testTitle = 'T';
      const testMessage = 'M';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HomeScreen(title: testTitle, message: testMessage),
          ),
        ),
      );

      await tester.pumpAndSettle();

      final titleFinder = find.text('T');
      final messageFinder = find.text('M');

      /// Assert
      expect(titleFinder, findsOneWidget, reason: 'Title should be displayed');
      expect(
        messageFinder,
        findsOneWidget,
        reason: 'Message should be displayed',
      );

      passedTests.add('HomeScreen displays correct content');
    });

    testWidgets('test case for ExampleWidget', (tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: ExampleWidget())),
      );

      final container = tester.widget<Container>(find.byType(Container).first);

      //Assert
      expect(
        container.color,
        Colors.red,
        reason: 'Container must have red color',
      );
      passedTests.add('Example Widget has a red colored container');

      expect(
        find.widgetWithIcon(Container, Icons.home),
        findsOneWidget,
        reason: 'Should contain home icon',
      );
      passedTests.add('Example Widget contains home icon');
    });
  });
}
