import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:section_5/pages/account/account_page.dart';
import 'package:section_5/pages/home/home_page.dart';
import 'package:section_5/pages/resources/resources_page.dart';
import 'package:section_5/widgets/custom_app_bar.dart';
import 'package:section_5/widgets/app_drawer.dart';

class NavigationPage extends StatefulWidget {
  static const String routeName = '/nav';

  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  final _titles = [
    'Home',
    'Resources',
    'Account',
  ];
  int selectedIndex = 1;
  String title = 'Resources';

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      HomePage(),
      ResourcesPage(),
      AccountPage(),
    ];
    return WillPopScope(
      onWillPop: () async {
        await SystemNavigator.pop(animated: false);
        return false;
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: title,
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
            setState(() {
              selectedIndex = index;
              title = _titles[index];
            });
          },
        ),
      ),
    );
  }
}
