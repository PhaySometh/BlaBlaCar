import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:week_3_blabla_project/ui/screens/ride_pref/widgets/bla_button.dart';
import 'package:week_3_blabla_project/ui/theme/theme.dart';

void main() {
  group('BlaButton Tests', () {
    
    // Test 1: Primary button without icon
    testWidgets('Primary button without icon', (WidgetTester tester) async {
      bool pressed = false;
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BlaButton(
              customText: "Search",
              isPrimary: true,
              onPressed: () => pressed = true,
            ),
          ),
        ),
      );
      
      // Verify button exists with correct text
      expect(find.text("Search"), findsOneWidget);
      
      // Verify button can be tapped
      await tester.tap(find.byType(BlaButton));
      expect(pressed, true);
      
      // Verify primary colors
      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(button.style?.backgroundColor?.resolve({}), BlaColors.primary);
    });
    
    // Test 2: Primary button with icon
    testWidgets('Primary button with icon', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BlaButton(
              customText: "Search",
              isPrimary: true,
              customIcon: Icons.search,
              onPressed: () {},
            ),
          ),
        ),
      );
      
      // Verify text and icon exist
      expect(find.text("Search"), findsOneWidget);
      expect(find.byIcon(Icons.search), findsOneWidget);
    });
    
    // Test 3: Secondary button without icon
    testWidgets('Secondary button without icon', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BlaButton(
              customText: "Contact",
              isPrimary: false,
              onPressed: () {},
            ),
          ),
        ),
      );
      
      // Verify button exists with correct text
      expect(find.text("Contact"), findsOneWidget);
      
      // Verify secondary colors
      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(button.style?.backgroundColor?.resolve({}), BlaColors.white);
    });
    
    // Test 4: Secondary button with icon
    testWidgets('Secondary button with icon', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BlaButton(
              customText: "Contact",
              isPrimary: false,
              customIcon: Icons.chat_bubble,
              onPressed: () {},
            ),
          ),
        ),
      );
      
      // Verify text and icon exist
      expect(find.text("Contact"), findsOneWidget);
      expect(find.byIcon(Icons.chat_bubble), findsOneWidget);
    });
    
    // Test 5: Button with null callback (disabled state)
    testWidgets('Button with null callback is disabled', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BlaButton(
              customText: "Disabled",
              isPrimary: true,
            ),
          ),
        ),
      );
      
      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(button.onPressed, isNull);
    });
  });
}
