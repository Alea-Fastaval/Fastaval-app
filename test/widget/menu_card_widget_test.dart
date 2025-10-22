import 'package:fastaval_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MenuCard Widget Tests', () {
    testWidgets('MenuCard should display title', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: menuCard('Test Title', Icons.info),
          ),
        ),
      );

      expect(find.text('Test Title'), findsOneWidget);
    });

    testWidgets('MenuCard should display icon', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: menuCard('Test Title', Icons.info),
          ),
        ),
      );

      expect(find.byIcon(Icons.info), findsOneWidget);
    });

    testWidgets('MenuCard should show arrow when hasSubMenu is true',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: menuCard('Test Title', Icons.info, true),
          ),
        ),
      );

      expect(find.byIcon(Icons.keyboard_arrow_right_outlined), findsOneWidget);
    });

    testWidgets('MenuCard should not show arrow when hasSubMenu is false',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: menuCard('Test Title', Icons.info, false),
          ),
        ),
      );

      expect(find.byIcon(Icons.keyboard_arrow_right_outlined), findsNothing);
    });
  });
}
