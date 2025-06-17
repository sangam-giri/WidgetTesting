### **Flutter Widget Interaction Cheat Sheet**

| **Interaction**                     | **Code Example**                                                                 | **Use Case**                                                                 |
|-------------------------------------|----------------------------------------------------------------------------------|------------------------------------------------------------------------------|
| **Tap**                             | `await tester.tap(find.byKey(Key('button')));`                                   | Tap buttons, icons, or any tappable widget.                                 |
| **Enter Text**                      | `await tester.enterText(find.byType(TextField), 'Hello');`                      | Fill text fields, forms.                                                    |
| **Long Press**                      | `await tester.longPress(find.text('Delete'));`                                   | Trigger long-press actions (e.g., context menus).                            |
| **Scroll**                          | `await tester.scrollUntilVisible(find.text('Item 50'), 50.0);`                   | Scroll lists (ListView, SingleChildScrollView).                              |
| **Drag**                            | `await tester.drag(find.byType(Draggable), Offset(100, 0));`                    | Drag sliders, draggable widgets.                                             |
| **Swipe**                           | `await tester.fling(find.byType(ListView), Offset(0, -200), 3000);`              | Swipe to dismiss (e.g., Dismissible widgets).                                |
| **Pump (Trigger Frame)**            | `await tester.pump();`                                                          | Rebuild the UI after state changes (like `setState`).                        |
| **Pump and Settle**                 | `await tester.pumpAndSettle();`                                                 | Wait for all animations to complete.                                         |
| **Find by Text**                    | `find.text('Submit')`                                                           | Locate widgets by displayed text.                                           |
| **Find by Key**                     | `find.byKey(Key('submit_btn'))`                                                 | Locate widgets with a specific `Key`.                                       |
| **Find by Type**                    | `find.byType(TextField)`                                                        | Locate all widgets of a specific type.                                      |
| **Find by Icon**                    | `find.byIcon(Icons.add)`                                                        | Locate Icon widgets.                                                        |
| **Find Ancestor/Descendant**        | `find.descendant(of: find.byType(Card), matching: find.text('Title'))`           | Locate widgets within a parent hierarchy.                                   |
| **Check Visibility**                | `expect(find.text('Success'), findsOneWidget);`                                  | Verify a widget is displayed (`findsNothing` for absence).                   |
| **Check Widget Property**           | `expect(tester.widget<Text>(find.text('Hi')).style.color, Colors.red);`          | Assert widget properties (color, padding, etc.).                            |
| **Enter Text + Close Keyboard**     | ```dart                                                                         | Fill text fields and hide keyboard (prevents `pumpAndSettle` hangs).         |
|                                     | await tester.enterText(find.byType(TextField), 'Hi');                           |                                                                              |
|                                     | await tester.testTextInput.receiveAction(TextInputAction.done);                 |                                                                              |
|                                     | ```                                                                             |                                                                              |
| **Tap with Warning**                | `await tester.tap(find.byType(FlatButton), warnIfMissed: true);`                | Logs a warning if the tap target is too small or obscured.                  |
| **Ensure Visible**                  | `await tester.ensureVisible(find.text('Hidden Item'));`                         | Scrolls to make a widget visible (useful for `ListView` items).             |
| **Run Async Task**                  | ```dart                                                                         | Test widgets with async operations (e.g., API calls).                       |
|                                     | await tester.runAsync(() async {                                                |                                                                              |
|                                     |   await Future.delayed(Duration(seconds: 1));                                   |                                                                              |
|                                     | });                                                                             |                                                                              |
|                                     | ```                                                                             |                                                                              |

---

### **Key Notes**:
1. **Always `await` interactions**:  
   Flutter tests are asynchronous. Use `await` for all `tester` methods.

2. **Use `pump()` or `pumpAndSettle()`**:  
   - `pump()`: Triggers a single frame update.  
   - `pumpAndSettle()`: Waits for all animations to complete (uses `pump()` in a loop).

3. **Common Finders**:  
   - `find.text('Hi')`: Finds widgets with exact text.  
   - `find.byType(Button)`: Finds all widgets of type `Button`.  
   - `find.byKey(Key('my_key'))`: Finds widgets with a specific key.

4. **Golden Rule**:  
   > **"Arrange-Act-Assert"**  
   - **Arrange**: Set up the widget (e.g., `pumpWidget`).  
   - **Act**: Perform interactions (`tap`, `enterText`).  
   - **Assert**: Verify outcomes (`expect`).

---

### **Example Test Snippet**
```dart
testWidgets('Test login flow', (tester) async {
  // Arrange
  await tester.pumpWidget(MyApp());

  // Act
  await tester.enterText(find.byKey(Key('email_field')), 'test@test.com');
  await tester.enterText(find.byKey(Key('password_field')), '123456');
  await tester.tap(find.byKey(Key('login_button')));
  await tester.pumpAndSettle(); // Wait for navigation

  // Assert
  expect(find.text('Welcome'), findsOneWidget);
});
```
