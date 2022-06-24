import 'package:flutter/material.dart';

class AppColors {
  static MaterialColor swatch = Colors.purple;
  static Color cardBackground = Colors.grey.shade200;
  static Color shadow = Colors.black38;
  static const Color verticalBarBackground = Color.fromARGB(255, 189, 189, 189);
}

class AppValues {
  /// Height
  static const double appBarHeight = kToolbarHeight;
  static const double verticalBarHeight = 80.0;

  /// Width
  static const double verticalBarWidth = 14.0;

  /// Radius
  static const double cardBorderRadius = 8.0;
  static const double fullRadius = 100.0;
  static const double shadowRadius = 10;

  /// Padding
  static const double defaultPadding = 8.0;
  static const double cardVertical = 10.0;

  /// Margin
  static const double defaultMargin = 8.0;

  /// Offset
  static const double xShadowOffset = 0.3;
  static const double yShadowOffset = 5;
}

class AppShadows {
  static BoxShadow defaultBoxShadow = BoxShadow(
    color: AppColors.shadow,
    blurRadius: AppValues.shadowRadius,
    offset: const Offset(
      AppValues.xShadowOffset,
      AppValues.yShadowOffset,
    ),
  );
}

class AppTheme {
  static ThemeData getTheme() {
    return ThemeData(
      primarySwatch: AppColors.swatch,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      cardColor: AppColors.cardBackground,
    );
  }
}
