import 'package:car_dekho_app/src/app/route/app_route.dart';
import 'package:car_dekho_app/src/ui/splash_screen_view/splash_screen_view.dart';
import 'package:flutter/material.dart';
import '../utils/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: AppRoute.screens,
      initialRoute: SplashScreenView.roueName,
      theme: AppTheme.appTheme,
      themeMode: ThemeMode.light,
    );
  }
}
