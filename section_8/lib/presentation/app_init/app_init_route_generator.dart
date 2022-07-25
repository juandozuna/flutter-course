import 'package:flutter/material.dart';
import 'package:section_8/presentation/constants/routes.dart';
import 'package:section_8/presentation/error_pages/no_location_permission_page.dart';
import 'package:section_8/presentation/home/home_page.dart';
import 'package:section_8/presentation/login/login_page.dart';
import 'package:section_8/presentation/map/map_page.dart';
import 'package:section_8/presentation/notification_example/notification_example_page.dart';
import 'package:section_8/presentation/splash_screen/splash_screen_page.dart';

final routeList = <String, Widget Function(BuildContext)>{
  AppRoute.splashScreen: (context) => const SplashScreenPage(),
  AppRoute.login: (context) => const LoginPage(),
  AppRoute.home: (context) => const HomePage(),
  AppRoute.map: (context) => const MapPage(),
  AppRoute.notifExample: (context) => const NotificationExamplePage(),
  AppRoute.errorNoLocationPermission: (context) =>
      const NoLocationPermissionPage(),
};
