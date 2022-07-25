import 'package:flutter/material.dart';
import 'package:section_5/app_config.dart';
import 'package:section_5/injector.dart';
import 'package:section_5/pages/account/user_form_page.dart';
import 'package:section_5/pages/home/second_page.dart';
import 'package:section_5/pages/login_page.dart';
import 'package:section_5/pages/navigation_page.dart';
import 'package:section_5/pages/resources/resources_form_page.dart';
import 'package:section_5/pages/splash_screen_page.dart';
import 'package:section_5/theme/theme.dart';

import 'main.dart';

void main() {
  final config = AppConfig(
    appName: 'Section 5 PROD',
    flavor: 'prod',
  );
  runApp(MyApp(
    config: config,
  ));
}

class MyApp extends StatelessWidget {
  final AppConfig config;

  const MyApp({
    Key? key,
    required this.config,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return initProvider(
      config,
      (p0) => GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: AppTheme.getTheme(),
          initialRoute: SplashScreenPage.routeName,
          routes: {
            NavigationPage.routeName: (context) => NavigationPage(),
            ResourcesFormPage.routeName: (context) => ResourcesFormPage(),
            UserFormPage.routeName: (context) => UserFormPage(),
            SplashScreenPage.routeName: (context) => SplashScreenPage(),
            LoginPage.routeName: (context) => LoginPage(),
            SecondPage.routeName: (context) => SecondPage(),
          },
          navigatorKey: get<AppNavigatorKey>().mainKey,
        ),
      ),
    );
  }
}
