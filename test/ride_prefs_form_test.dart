import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:week_3_blabla_project/model/ride/locations.dart';
import 'package:week_3_blabla_project/model/ride_pref/ride_pref.dart';
import 'package:week_3_blabla_project/ui/screens/ride_pref/widgets/ride_prefs_form.dart';

void main() {
  group('RidePrefForm Tests', () {
    // Test 1: Form initializes with default values
    testWidgets('Form initializes with defaults', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RidePrefForm(),
          ),
        ),
      );

      // Verify hint texts are shown
      expect(find.text("Leaving from"), findsOneWidget);
      expect(find.text("Going to"), findsOneWidget);
      expect(find.text("1"), findsOneWidget); // Default seat
    });

    // Test 2: Form initializes with provided RidePref
    testWidgets('Form initializes with initRidePref',
        (WidgetTester tester) async {
      final testRidePref = RidePref(
        departure: Location(name: "Paris", country: Country.france),
        arrival: Location(name: "Lyon", country: Country.france),
        departureDate: DateTime(2026, 2, 15),
        requestedSeats: 2,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RidePrefForm(initRidePref: testRidePref),
          ),
        ),
      );

      // Verify initial values are displayed
      expect(find.text("Paris"), findsOneWidget);
      expect(find.text("Lyon"), findsOneWidget);
      expect(find.text("2"), findsOneWidget);
    });

    // Test 3: Search button is disabled when departure/arrival are null
    testWidgets('Search button disabled without locations',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RidePrefForm(),
          ),
        ),
      );

      // Find the search button
      final searchButton = tester.widget<ElevatedButton>(
        find.widgetWithText(ElevatedButton, "Search"),
      );

      // Verify button is disabled
      expect(searchButton.onPressed, isNull);
    });

    // Test 4: Search button is enabled when both locations are set
    testWidgets('Search button enabled with locations',
        (WidgetTester tester) async {
      final testRidePref = RidePref(
        departure: Location(name: "Paris", country: Country.france),
        arrival: Location(name: "Lyon", country: Country.france),
        departureDate: DateTime.now(),
        requestedSeats: 1,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RidePrefForm(initRidePref: testRidePref),
          ),
        ),
      );

      // Find the search button
      final searchButton = tester.widget<ElevatedButton>(
        find.widgetWithText(ElevatedButton, "Search"),
      );

      // Verify button is enabled
      expect(searchButton.onPressed, isNotNull);
    });

    // Test 5: Switch button exists
    testWidgets('Switch location button exists', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RidePrefForm(),
          ),
        ),
      );

      // Verify switch button icon exists
      expect(find.byIcon(Icons.swap_vert), findsOneWidget);
    });
  });
}
