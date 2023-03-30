import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_application/provider/app_provider.dart';
import 'package:task_application/services/app_navigation.dart';

import 'app_routes.dart';
import 'configs/core_theme.dart' as theme;
import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setUpLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
      ],
      child: MaterialApp(
        title: 'Quiz App',
        theme: theme.themeLight,
        debugShowCheckedModeBanner: false,
        navigatorKey: locator<AppNavigation>().navigatorKey,
        initialRoute: AppRoutes.home,
        onGenerateRoute: AppNavigation.onGenerateRoute,
      ),
    );
  }
}
