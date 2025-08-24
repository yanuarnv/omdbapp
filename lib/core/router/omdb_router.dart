import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:omdbapp/features/account/account_screen.dart';
import 'package:omdbapp/features/home/domain/entities/movie_entity.dart';
import 'package:omdbapp/features/home/presentation/pages/home_screen.dart';
import 'package:omdbapp/features/home/presentation/pages/main_screen.dart';
import 'package:omdbapp/features/home/presentation/pages/movie_details_screen.dart';
import 'package:omdbapp/features/new_and_hot/new_and_hot_screen.dart';

import '../../gen/assets.gen.dart';

sealed class Routes {
  static const MAIN = '/';
  static const HOME = '/home';
  static const MOVIE_DETAILS = '/details';
  static const NEW_AND_HOT = '/new-and-hot';
  static const ACCOUNT = '/account';
}

class OmdbRouter {
  static final router = GoRouter(
    initialLocation: Routes.HOME,
    routes: [
      ShellRoute(
        builder: (context, state, child) => MainScreen(child: child),
        routes: <RouteBase>[
          GoRoute(
            path: Routes.HOME,
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: HomeScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                      final Animation<Offset> _offsetAnimation = Tween<Offset>(
                        begin: const Offset(-1.5, 0.0),
                        end: Offset.zero,
                      ).animate(animation);
                      return SlideTransition(
                        position: _offsetAnimation,
                        child: child,
                      );
                    },
              );
            },
          ),
          GoRoute(
            path: Routes.NEW_AND_HOT,
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: NewAndHotScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                      final Animation<Offset> _offsetAnimation = Tween<Offset>(
                        begin: const Offset(1.5, 0.0),
                        end: Offset.zero,
                      ).animate(animation);
                      return SlideTransition(
                        position: _offsetAnimation,
                        child: child,
                      );
                    },
              );
            },
          ),
          GoRoute(
            path: Routes.ACCOUNT,
            builder: (BuildContext context, GoRouterState state) {
              return AccountScreen();
            },
          ),
        ],
      ),
    ],
  );
}
