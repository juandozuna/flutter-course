import 'package:flutter/material.dart';
import 'package:tinycolor2/tinycolor2.dart';

class QuizColors {
  static MaterialColor swatch = Colors.orange;
  static Color card = Colors.orange.shade300;
  static Color answerColor = Colors.black;
  static Color lightText = Colors.white;
  static Color background = Colors.deepOrangeAccent;
}

class QuizShadows {}

class QuizDurations {
  static const int horizontalSlideDuration = 500;
}

class QuizTheme {
  static ThemeData getTheme() {
    return ThemeData(
      primarySwatch: QuizColors.swatch,
      cardColor: QuizColors.card,
      scaffoldBackgroundColor: QuizColors.background,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          padding: setValue(
            EdgeInsets.symmetric(horizontal: 30, vertical: 8),
          ),
          shape: setValue(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
      ),
      primaryTextTheme: TextTheme(
        titleSmall: TextStyle(color: QuizColors.lightText),
      ),
    );
  }
}

/// Metodo Utilitario para agregar elementos
MaterialStateProperty<T> setValue<T>(
  T value, {
  T? disabled,
  T? error,
  T? hovered,
  T? focused,
}) =>
    MaterialStateProperty.resolveWith((states) {
      if (error != null && states.contains(MaterialState.error)) {
        return error;
      }
      if (disabled != null && states.contains(MaterialState.disabled)) {
        return disabled;
      }
      if (hovered != null && states.contains(MaterialState.hovered)) {
        return hovered;
      }
      if (focused != null && states.contains(MaterialState.focused)) {
        return focused;
      }
      return value;
    });
