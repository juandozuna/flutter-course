import 'package:flutter/material.dart';
import 'package:section_8/presentation/constants/routes.dart';
import 'package:section_8/presentation/splash_screen/splash_screen_page.dart';

final routeList = <String, Widget Function(BuildContext)>{
  AppRoute.splashScreen: (context) => const SplashScreenPage(),
};
