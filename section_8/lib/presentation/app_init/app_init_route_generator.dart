import 'package:flutter/material.dart';
import 'package:section_8/presentation/constants/routes.dart';
import 'package:section_8/presentation/login/login_page.dart';
import 'package:section_8/presentation/splash_screen/splash_screen_page.dart';

final routeList = <String, Widget Function(BuildContext)>{
  AppRoute.splashScreen: (context) => const SplashScreenPage(),
  AppRoute.login: (context) => const LoginPage(),
};
