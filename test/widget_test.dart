// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart'; // Import the Flutter material package
import 'package:flutter_test/flutter_test.dart'; // Import the Flutter test package

import 'package:earthwise_app/main.dart'; // Import the main file of the EarthWise app

void main() { // Define the main function
  testWidgets('Counter increments smoke test', (WidgetTester tester) async { // Define a widget test
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp()); // Pump the MyApp widget into the widget tree

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget); // Verify that the text '0' is found once in the widget tree
    expect(find.text('1'), findsNothing); // Verify that the text '1' is not found in the widget tree

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add)); // Simulate a tap on the '+' icon
    await tester.pump(); // Trigger a frame to rebuild the widget tree

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing); // Verify that the text '0' is not found in the widget tree
    expect(find.text('1'), findsOneWidget); // Verify that the text '1' is found once in the widget tree
  });
}
