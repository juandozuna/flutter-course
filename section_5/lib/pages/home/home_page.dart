import 'package:flutter/material.dart';
import 'package:section_5/injector.dart';
import 'package:section_5/main.dart';
import 'package:section_5/pages/home/home_second_page.dart';

class HomeNavigatorRoutes {
  static const String home = '/home_intial';
  static const String homeSecond = '/home_second';
}

class HomeNavigator extends StatefulWidget {
  const HomeNavigator({Key? key}) : super(key: key);

  @override
  State<HomeNavigator> createState() => _HomeNavigatorState();
}

class _HomeNavigatorState extends State<HomeNavigator> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: get<AppNavigatorKey>().mainKey,
      initialRoute: HomeNavigatorRoutes.home,
      onGenerateRoute: (RouteSettings settings) {
        final name = settings.name;
        switch (name) {
          case HomeNavigatorRoutes.home:
            return MaterialPageRoute(
              builder: (context) => HomePage(),
            );
          case HomeNavigatorRoutes.homeSecond:
            return MaterialPageRoute(
              builder: (context) => HomeSecondPage(),
            );
          default:
            return MaterialPageRoute(
              builder: (context) => HomePage(),
            );
        }
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: ElevatedButton(
              child: Text('Go To Second Page'),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  HomeNavigatorRoutes.homeSecond,
                );
              })),
    );
  }
}
