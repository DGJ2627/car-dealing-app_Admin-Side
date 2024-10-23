import 'package:flutter/material.dart';

import '../packages/resources/colors.dart';

abstract class AppTheme {
  static const defaultFontFamily = "Roboto";
  static ThemeData appTheme = ThemeData(
    fontFamily: defaultFontFamily,
    primaryColor: AppColors.primaryColor,
    useMaterial3: true,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(color: AppColors.primaryColor),
    textTheme: _textTheme(),
  );

  static TextTheme _textTheme() {
    return const TextTheme(
      displayLarge: TextStyle(fontSize: 48, fontWeight: FontWeight.w700),
      displayMedium: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
      displaySmall: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
      headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
      headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
      headlineSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
      labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      labelMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      labelSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
    );
  }
}
