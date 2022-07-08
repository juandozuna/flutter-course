import 'package:flutter/material.dart';

class AppRoute {
  static GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
  static NavigatorState get nav => navKey.currentState!;

  static const splashScreen = '/';
  static const login = '/login';
  static const home = '/home';
}
