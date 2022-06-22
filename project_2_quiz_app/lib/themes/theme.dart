import 'package:flutter/material.dart';
import 'package:tinycolor2/tinycolor2.dart';

class QuizColors {}

class QuizShadows {}

class QuizTheme {
  static ThemeData getTheme() {
    return ThemeData();
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
