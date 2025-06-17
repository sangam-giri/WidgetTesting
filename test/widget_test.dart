import 'package:example_2/counter_screen.dart';
import 'package:example_2/home_screen.dart';
import 'package:example_2/widgets/example_widget.dart';
import 'package:example_2/widgets/listview_widget.dart';
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

    testWidgets(
      'Example Widget should have red color container with home icon',
      (tester) async {
        // Arrange & Act
        await tester.pumpWidget(TesterComponent(child: ExampleWidget()));

        final container = tester.widget<Container>(
          find.byType(Container).first,
        );

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
      },
    );

    testWidgets('finds a deep item in a long list on ListViewWidget', (
      widgetTester,
    ) async {
      await widgetTester.pumpWidget(TesterComponent(child: ListviewWidget()));

      final listFinder = find.byType(Scrollable); // Widget
      final itemFinder = find.byKey(
        const ValueKey('item_50_text'),
      ); // Item to be found

      // Scroll until the item to be found appears.
      await widgetTester.scrollUntilVisible(
        itemFinder,
        500.0,
        scrollable: listFinder,
      );

      // Verify that the item contains the correct text.
      expect(itemFinder, findsOneWidget);

      passedTests.add('Item with key:item_50_text found');
    });

    /// Test case for CounterScreen
    testWidgets(
      'Count must increase on tapping increaseCounter on CounterScreen',
      (widgetTester) async {
        // Build the widget
        await widgetTester.pumpWidget(TesterComponent(child: CounterScreen()));

        // Verify initial counter text
        expect(find.text('Counter: 0'), findsOneWidget);

        passedTests.add('Counter text with initial value:0 found');

        // Find the button and tap it
        await widgetTester.tap(find.byKey(Key('increment-button')));

        passedTests.add('Finds the Increase button');

        // Trigger a rebuild after state change - Rebuilds the system to show new counter value.
        // Similar to how setState((){}) works.
        await widgetTester.pump();
        passedTests.add('Updates the state with increase count');

        // Verify the counter incremented
        expect(find.text('Counter: 1'), findsOneWidget);

        passedTests.add('Count increases by 1');
      },
    );
  });
}

class TesterComponent extends StatelessWidget {
  const TesterComponent({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: child is Scaffold ? child : Scaffold(body: child)),
    );
  }
}
