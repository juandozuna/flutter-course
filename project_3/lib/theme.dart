import 'package:flutter/material.dart';

class AppColors {
  static MaterialColor swatch = Colors.purple;
}

class AppSizes {
  static const double appBarHeight = kToolbarHeight;
}

class AppTheme {
  static ThemeData getTheme() {
    return ThemeData(
      primarySwatch: AppColors.swatch,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
