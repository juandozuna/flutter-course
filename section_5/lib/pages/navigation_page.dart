import 'package:flutter/material.dart';
import 'package:section_5/pages/account/account_page.dart';
import 'package:section_5/pages/home/home_page.dart';
import 'package:section_5/pages/resources/resources_page.dart';
import 'package:section_5/widgets/custom_app_bar.dart';
import 'package:section_5/widgets/app_drawer.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      HomeNavigator(),
      ResourcesPage(),
      AccountPage(),
    ];
    return WillPopScope(
      onWillPop: () async {
        if (selectedIndex == 0) {
          final canPop = HomeNavigatorRoutes.navigator.currentState!.canPop();
          if (canPop) {
            HomeNavigatorRoutes.navigator.currentState!.pop();
            return false;
          }
          return true;
        }

        return true;
      },
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Main Nav',
        ),
        drawer: const AppDrawer(),
        body: pages[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Resources',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Account',
            ),
          ],
          currentIndex: selectedIndex,
          onTap: (int index) {
            setState(() => selectedIndex = index);
          },
        ),
      ),
    );
  }
}
