// ignore_for_file: constant_identifier_names

import 'package:bloc_gorouter_example/screens/main_scope/main_scope.dart';
import 'package:bloc_gorouter_example/screens/screen_one/screen_one.dart';
import 'package:bloc_gorouter_example/screens/screen_three/screen_three.dart';
import 'package:bloc_gorouter_example/screens/screen_two/screen_two.dart';
import 'package:bloc_gorouter_example/screens/splash/splash_screen.dart';
import 'package:bloc_gorouter_example/screens/tab_screen/tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter([String? initialLocation]) {
    _initialLocation = initialLocation ?? _defaultLocation;
  }

  static const _SPLASH_PATH = '/splash';
  static const _SCREEN_ONE_PATH = '/screen_one';
  static const _SCREEN_TWO_PATH = '/screen_two';
  static const _SCREEN_THREE_PATH = '/screen_three';

  static const String _defaultLocation = _SPLASH_PATH;

  static String buildSplashRoutePath() => _SPLASH_PATH;
  static String buildScreenOneRoutePath() => _SCREEN_ONE_PATH;
  static String buildScreenTwoRoutePath() => _SCREEN_TWO_PATH;
  static String buildScreenThreeRoutePath() => _SCREEN_THREE_PATH;

  final _routeObserver = RouteObserver<ModalRoute>();
  final _rootNavKey = GlobalKey<NavigatorState>();
  final _mainNavKey = GlobalKey<NavigatorState>();
  final _firstTabNavKey = GlobalKey<NavigatorState>();

  late String _initialLocation;

  late final GoRouter config = GoRouter(
    navigatorKey: _rootNavKey,
    observers: [_routeObserver],
    initialLocation: _initialLocation,
    routes: [
      ShellRoute(
        navigatorKey: _mainNavKey,
        pageBuilder: (context, state, child) => NoTransitionPage(child: MainScope(key: state.pageKey, child: child)),
        routes: [
          GoRoute(
            path: _SPLASH_PATH,
            builder: (context, state) => SplashScreen(key: state.pageKey),
          ),
          StatefulShellRoute.indexedStack(
            pageBuilder: (context, state, navigationShell) {
              print(state.uri.toString());
              return NoTransitionPage(
                  child: TabScreen(
                key: state.pageKey,
                navigationShell: navigationShell,
              ));
            },
            branches: [
              StatefulShellBranch(
                navigatorKey: _firstTabNavKey,
                routes: [
                  GoRoute(
                    path: _SCREEN_ONE_PATH,
                    pageBuilder: (context, state) => NoTransitionPage(
                      child: ScreenOne(key: state.pageKey),
                    ),
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: _SCREEN_TWO_PATH,
                    pageBuilder: (context, state) => NoTransitionPage(
                      child: ScreenTwo(key: state.pageKey),
                    ),
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: _SCREEN_THREE_PATH,
                    pageBuilder: (context, state) => NoTransitionPage(
                      child: ScreenThree(key: state.pageKey),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
