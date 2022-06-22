import 'package:flutter/material.dart';
import 'package:tinycolor2/tinycolor2.dart';

class QuizColors {
  static MaterialColor primarySwatch = Colors.deepOrange;
  static Color primary = Colors.deepOrange;
  static Color primaryDisabled = primary.withAlpha(150);
  static Color primaryHover = Colors.deepOrange.shade300;
  static Color background = TinyColor.fromColor(Colors.deepOrange.shade900)
      .darken(10)
      .desaturate(50)
      .color;
  static Color card = Colors.deepOrange.shade200;
  static Color lightText = Colors.white;
  static Color shadowColor = Colors.black45;
  static Color answerButton = Colors.orange;
}

class QuizShadows {
  static BoxShadow primaryShadow = BoxShadow(
    color: QuizColors.shadowColor,
    blurRadius: 8,
    offset: const Offset(0, 4),
  );
}

class QuizTheme {
  static ThemeData getTheme() {
    return ThemeData(
        primaryColor: QuizColors.primary,
        primarySwatch: QuizColors.primarySwatch,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto',
        cardColor: QuizColors.card,
        scaffoldBackgroundColor: QuizColors.background,
        elevatedButtonTheme: getElevatedButtonTheme(),
        primaryTextTheme: TextTheme(
          headline4: TextStyle(
            color: QuizColors.lightText,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ));
  }

  static ElevatedButtonThemeData getElevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
          shape: setValue(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            disabled: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          backgroundColor: setValue(
            QuizColors.primary,
            disabled: QuizColors.primaryDisabled,
            hovered: QuizColors.primaryHover,
          ),
          padding: setValue(
            const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          )),
    );
  }
}

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
