# Example_2: Flutter Widget Testing Demo

This project demonstrates basic widget testing in Flutter, showcasing how to test widgets both individually and collectively using test groups.

## 🧪 Testing Features
- Group testing of multiple widgets
- Individual widget testing
- Clear test reporting with passed test tracking

## 🚀 How to Run Tests

**Documentation:** [Flutter Widget Interaction CheatSheet](FlutterTesting.md)

### Option 1: Run All Tests
```bash
flutter test
```

### Option 2: Run Specific Test Groups
```bash
# Test all widgets in the 'App' group
flutter test --plain-name "App Widget Tests"

# Test only HomeScreen related tests
flutter test --plain-name "HomeScreen should display correct title and message"

# Test only ExampleWidget related tests
flutter test --plain-name "'Example Widget should have red color container with home icon'"
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
├── core/                       # Base test utilities
│   ├── base_test.dart          # BaseTest class (with runSafeTest, etc.)
│   ├── test_services.dart      # TestServices (common assertions)
│   └── test_helpers.dart       # TestHelpers (pumpWidget, scroll, etc.)
│
├── unit/                       # Pure logic tests (no widgets)
│   ├── services/               # Service layer tests
│   ├── blocs/                  # BLoC/Cubit tests
│   └── utils/                  # Utility/helper tests
│
├── widgets/                    # Component/widget tests
│   ├── screens/                # Full-screen widget tests
│   │   ├── home_screen_test.dart
│   │   ├── counter_screen_test.dart
│   │   └── ...
│   │
│   └── components/             # Reusable widgets
│       ├── example_widget_test.dart
│       ├── listview_widget_test.dart
│       └── ...
│
├── integration/                # Full-flow tests (optional)
│   ├── app_flows/              # Critical user journeys
│   └── drivers/                # Flutter driver (if needed)
│
└── mocks/                      # Shared mock classes
    ├── mock_repository.dart
    └── ...
```

## 🛠️ Dependencies
- Flutter SDK
- Test package (included in Flutter)

## 📝 Notes
- Tests are organized using `group()` for logical grouping
- Each test case includes clear Arrange-Act-Assert sections
- Passed tests are tracked and reported at the end
