import 'package:flutter/material.dart';
import 'package:section_5/pages/navigation_page.dart';

class InitialPage extends StatelessWidget {
  static const String routeName = '/';
  const InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Navigator.of(context).pushNamed(NavigationPage.routeName);

    return Container();
  }
}
