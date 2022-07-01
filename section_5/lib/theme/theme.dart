import 'package:flutter/material.dart';

class AppColor {
  static const Color primary = Colors.pink;
  static const Color secondary = Colors.orange;
  static const Color white = Colors.white;
}

class AppTheme {
  static ThemeData getTheme() {
    return ThemeData(
      primaryColor: AppColor.primary,
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
