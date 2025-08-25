import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:omdbapp/core/di/injection.dart';
import 'package:omdbapp/core/router/omdb_router.dart';
import 'package:omdbapp/features/account/account_screen.dart';
import 'package:omdbapp/features/home/presentation/pages/home_screen.dart';
import 'package:omdbapp/features/home/presentation/pages/main_screen.dart';
import 'package:omdbapp/features/new_and_hot/new_and_hot_screen.dart';
import 'package:omdbapp/gen/assets.gen.dart';

void main() {
  late GoRouter router;
  setUpAll(() async {
    router = OmdbRouter.router;
    await dotenv.load(fileName: ".env");
    configureDependencies();
  });
  group('MainScreen Widget Tests', () {
    testWidgets('renders BottomNavigationBar with correct items', (
      WidgetTester tester,

    ) async {
      await tester.pumpWidget(
        MaterialApp.router(routerConfig: OmdbRouter.router),
      );
      await tester.pumpAndSettle();
      expect(find.byType(BottomNavigationBar), findsOneWidget);
      final bottomNav = tester.widget<BottomNavigationBar>(
        find.byType(BottomNavigationBar),
      );
      expect(bottomNav.items.length, 3);
    });

    testWidgets('navigates to HOME when initial', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp.router(routerConfig: OmdbRouter.router),
      );
      await tester.pumpAndSettle();
      expect(find.byType(HomeScreen), findsOneWidget);
    });

    testWidgets(
      'navigates to NEW_AND_HOT route when New & Hot item is tapped',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp.router(routerConfig: OmdbRouter.router),
        );
        await tester.pumpAndSettle();
        await tester.tap(find.text('New & Hot'));
        await tester.pumpAndSettle();
        expect(find.byType(NewAndHotScreen), findsOneWidget);
      },
    );

    testWidgets(
      'navigates to ACCOUNT route when My netflix item is tapped',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp.router(routerConfig: OmdbRouter.router),
        );
        await tester.pumpAndSettle();
        await tester.tap(find.text('My netflix'));
        await tester.pumpAndSettle();
        expect(find.byType(AccountScreen), findsOneWidget);
      },
    );
  });
}
