import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Colors.blue;
}

class AppTheme {
  static ThemeData get theme => ThemeData(
        primaryColor: AppColors.primary,
      );
}
