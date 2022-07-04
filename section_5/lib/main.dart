import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:section_5/injector.dart';
import 'package:section_5/pages/account/user_form_page.dart';
import 'package:section_5/pages/initial_page.dart';
import 'package:section_5/pages/login/login_page.dart';
import 'package:section_5/pages/navigation_page.dart';
import 'package:section_5/pages/resources/resources_form_page.dart';
import 'package:section_5/theme/theme.dart';
import 'package:section_5/widgets/center_circular_loading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return initProvider((_) => AppMain());
  }
}

class AppMain extends StatelessWidget {
  const AppMain({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.getTheme(),
        initialRoute: InitialPage.routeName,
        routes: {
          InitialPage.routeName: (context) => InitialPage(),
          LoginPage.routeName: (context) => LoginPage(),
          NavigationPage.routeName: (context) => NavigationPage(),
          ResourcesFormPage.routeName: (context) => ResourcesFormPage(),
          UserFormPage.routeName: (context) => UserFormPage(),
        },
        navigatorKey: AppNavigatorKey.instance.mainKey,
      ),
    );
  }
}

class AppNavigatorKey {
  static AppNavigatorKey instance = AppNavigatorKey._();

  late final GlobalKey<NavigatorState> mainKey;

  AppNavigatorKey._() {
    mainKey = GlobalKey<NavigatorState>();
  }
}
