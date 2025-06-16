# Example_2: Flutter Widget Testing Demo

This project demonstrates basic widget testing in Flutter, showcasing how to test widgets both individually and collectively using test groups.

## 🧪 Testing Features
- Group testing of multiple widgets
- Individual widget testing
- Clear test reporting with passed test tracking

## 🚀 How to Run Tests

### Option 1: Run All Tests
```bash
flutter test
```

### Option 2: Run Specific Test Groups
```bash
# Test all widgets in the 'App' group
flutter test --plain-name "App"

# Test only HomeScreen related tests
flutter test --plain-name "HomeScreen"

# Test only ExampleWidget related tests
flutter test --plain-name "Example Widget"
```

### Option 3: Run with Coverage Report
```bash
flutter test --coverage && genhtml coverage/lcov.info -o coverage/html
```

## 📁 Project Structure
```
lib/
├── home_screen.dart        # HomeScreen widget implementation
├── main.dart               # Entry point
├── widgets/
│   └── example_widget.dart # ExampleWidget implementation
test/
└── widget_test.dart        # All widget tests
```

## 🛠️ Dependencies
- Flutter SDK
- Test package (included in Flutter)

## 📝 Notes
- Tests are organized using `group()` for logical grouping
- Each test case includes clear Arrange-Act-Assert sections
- Passed tests are tracked and reported at the end
