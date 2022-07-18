import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:section_8/presentation/app_init/app_init_route_generator.dart';
import 'package:section_8/presentation/constants/routes.dart';
import 'package:section_8/presentation/constants/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppInit extends StatelessWidget {
  const AppInit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizedDelegate = LocalizedApp.of(context).delegate;

    return MaterialApp(
      title: 'Section 8',
      theme: AppTheme.theme,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        localizedDelegate,
      ],
      supportedLocales: localizedDelegate.supportedLocales,
      locale: localizedDelegate.currentLocale,
      navigatorKey: AppRoute.navKey,
      initialRoute: AppRoute.splashScreen,
      routes: routeList,
    );
  }
}
