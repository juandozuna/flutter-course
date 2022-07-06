import 'package:flutter/material.dart';
import 'package:section_8/presentation/app_init/app_init_route_generator.dart';
import 'package:section_8/presentation/constants/routes.dart';
import 'package:section_8/presentation/constants/theme.dart';

class AppInit extends StatelessWidget {
  const AppInit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Section 8',
      theme: AppTheme.theme,
      navigatorKey: AppRoute.navKey,
      initialRoute: AppRoute.splashScreen,
      routes: routeList,
    );
  }
}
