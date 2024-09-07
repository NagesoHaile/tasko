import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:tasko/features/completed_task/completed_task_page.dart';
import 'package:tasko/features/home/pages/add_task_page.dart';
import 'package:tasko/features/home/pages/home_page.dart';
import 'package:tasko/features/settings/pages/settings_page.dart';
import 'package:tasko/features/splash_screen/splash_screen.dart';

GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

GoRouter router = GoRouter(
  initialLocation: SplashScreen.routeName,
  debugLogDiagnostics: true,
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: SplashScreen.routeName,
      name: SplashScreen.routeName,
      builder: (context, state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
        path: HomePage.routeName,
        name: HomePage.routeName,
        builder: (context, state) {
          return const HomePage();
        },
        routes: [
          GoRoute(
            path: AddTaskPage.routeName,
            name: AddTaskPage.routeName,
            builder: (context, state) {
              return const AddTaskPage();
            },
          ),
        ]),
    GoRoute(
      path: CompletedTaskPage.routeName,
      name: CompletedTaskPage.routeName,
      builder: (context, state) {
        return const CompletedTaskPage();
      },
    ),
    GoRoute(
      path: SettingsPage.routeName,
      name: SettingsPage.routeName,
      builder: (context, state) {
        return const SettingsPage();
      },
    ),
  ],
);
