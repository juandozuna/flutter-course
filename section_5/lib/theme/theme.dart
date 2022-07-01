import 'package:flutter/material.dart';

class AppColor {
  static const Color primary = Colors.pink;
  static const Color secondary = Colors.orange;
  static const Color info = Colors.blue;
  static const Color danger = Colors.red;
  static const Color white = Colors.white;
  static Color black = Colors.grey.shade900;
  static Color evenListItem = Colors.grey.shade300;
  static Color oddListItem = Colors.grey.shade100;
}

class AppTheme {
  static ThemeData getTheme() {
    return ThemeData(
      primaryColor: AppColor.primary,
      errorColor: AppColor.danger,
      colorScheme: ColorScheme(
        background: AppColor.white,
        brightness: Brightness.light,
        error: AppColor.danger,
        primary: AppColor.primary,
        secondary: AppColor.secondary,
        onBackground: AppColor.black,
        onError: AppColor.white,
        onPrimary: AppColor.white,
        onSecondary: AppColor.white,
        onSurface: AppColor.black,
        surface: AppColor.white,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColor.primary,
        selectedItemColor: AppColor.white,
      ),
      appBarTheme: const AppBarTheme(
        color: AppColor.secondary,
        centerTitle: true,
      ),
    );
  }
}
