import 'package:flutter/material.dart';

class AppValues {
  static const double inputBorderRadius = 10;
  static const double inputBorderWidth = 2;
  static const double horizontalMargin = 16;
  static const double verticalMargin = 8;
  static const double logoSize = 90;
  static const double roundBorderRadius = 10;
}

class AppColors {
  static const Color primary = Colors.blue;
  static const Color error = Colors.red;
}

class AppTheme {
  static ThemeData get theme => ThemeData(
        primaryColor: AppColors.primary,
        errorColor: AppColors.error,
      );
}
