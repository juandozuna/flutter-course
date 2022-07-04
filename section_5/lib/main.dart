import 'package:flutter/material.dart';
import 'package:section_5/injector.dart';
import 'package:section_5/pages/account/user_form_page.dart';
import 'package:section_5/pages/navigation_page.dart';
import 'package:section_5/pages/resources/resources_form_page.dart';
import 'package:section_5/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return initProvider(
      (p0) => GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: AppTheme.getTheme(),
          initialRoute: NavigationPage.routeName,
          routes: {
            NavigationPage.routeName: (context) => NavigationPage(),
            ResourcesFormPage.routeName: (context) => ResourcesFormPage(),
            UserFormPage.routeName: (context) => UserFormPage(),
          },
          navigatorKey: get<AppNavigatorKey>().mainKey,
        ),
      ),
    );
  }
}

class AppNavigatorKey {
  final mainKey = GlobalKey<NavigatorState>();
  final homeKey = GlobalKey<NavigatorState>();
}
