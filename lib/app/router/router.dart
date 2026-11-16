import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes_app/app/features/features.dart';
import 'package:recipes_app/di/di.dart';
import 'package:talker_flutter/talker_flutter.dart';

final _rootNavigationKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final router = GoRouter(
  observers: [TalkerRouteObserver(talker)],
  debugLogDiagnostics: true,
  initialLocation: '/home',
  navigatorKey: _rootNavigationKey,
  routes: [
    GoRoute(
      path: '/home',
      pageBuilder: (_, state) => MaterialPage(
        key: state.pageKey,
        child: const HomeScreen(),
      ),
    ),
    GoRoute(
      path: '/recipe/:id',
      pageBuilder: (_, state) => MaterialPage(
        key: state.pageKey,
        child: RecipeScreen(
          recipeId: int.parse(state.pathParameters['id']!),
        ),
      ),
    ),
    GoRoute(
      path: '/logs',
      pageBuilder: (_, state) => MaterialPage(
        key: state.pageKey,
        child: TalkerScreen(talker: talker),
      ),
    ),
  ],
);
