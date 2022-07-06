import 'package:flutter/material.dart';

class AppValues {
  static const double inputBorderRadius = 10;
  static const double inputBorderWidth = 2;

  static const double horizontalMargin = 16;
  static const double verticalMargin = 8;
}

class AppColors {
  static const Color primary = Colors.blue;
}

class AppTheme {
  static ThemeData get theme => ThemeData(
        primaryColor: AppColors.primary,
      );
}
