import 'package:car_dekho_app/src/app/route/app_route.dart';
import 'package:flutter/material.dart';
import '../ui/admin_screens_view/bottom_navigation_view.dart';
import '../utils/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: AppRoute.screens,
      initialRoute: BottomNavigationView.routeName,
      theme: AppTheme.appTheme,
      themeMode: ThemeMode.light,
    );
  }
}
