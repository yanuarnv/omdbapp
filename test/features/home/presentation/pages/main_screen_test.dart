import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:omdbapp/core/di/injection.dart';
import 'package:omdbapp/features/home/presentation/pages/home_screen.dart';
import 'package:omdbapp/features/home/presentation/pages/main_screen.dart';

void main() {
  setUpAll(() async {
    await dotenv.load(fileName: ".env");
    configureDependencies();
  });
  testWidgets('Should switch tab when tapping BottomNavigationBar', (
      WidgetTester tester,
      ) async {
    await tester.pumpWidget(const MaterialApp(home: MainScreen()));

    expect(find.byType(HomeScreen), findsOneWidget);

    await tester.tap(find.text('New & Hot'));
    await tester.pumpAndSettle();

    expect(find.text('Index 1: Business'), findsOneWidget);

    await tester.tap(find.text('My netflix'));
    await tester.pumpAndSettle();

    expect(find.text('Index 2: School'), findsOneWidget);
  });
}
