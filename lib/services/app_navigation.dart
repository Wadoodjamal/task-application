import 'package:flutter/material.dart';
import 'package:task_application/app_routes.dart';
import 'package:task_application/extensions/string_ext.dart';

import '../screens/add_task/add_task.dart';
import '../screens/home/home.dart';

class AppNavigation {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final data = settings.name!.getRoutingData;

    switch (data.route) {
      case AppRoutes.home:
        return _FadeRoute(
          child: const HomeScreen(),
          settings: settings,
        );

      case AppRoutes.addTask:
        return _FadeRoute(
          child: const AddTaskScreen(),
          settings: settings,
        );

      default:
        return _FadeRoute(
          child: const HomeScreen(),
          settings: settings,
        );
    }
  }

  Future<dynamic> navigateTo(String route,
      {Map<String, dynamic>? queryParams}) {
    if (queryParams != null) {
      route = Uri(path: route, queryParameters: queryParams).toString();
    }

    return navigatorKey.currentState!.pushNamed(
      route,
      arguments: queryParams,
    );
  }

  Future<dynamic> navigateWithReplacement(String route) async {
    return await navigatorKey.currentState!.pushReplacementNamed(route);
  }

  void goBack() => navigatorKey.currentState!.pop();
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  @override
  final RouteSettings settings;

  _FadeRoute({required this.child, required this.settings})
      : super(
          settings: settings,
          pageBuilder: (context, ani1, ani2) => child,
          transitionsBuilder: (context, ani1, ani2, child) => FadeTransition(
            opacity: ani1,
            child: child,
          ),
        );
}
