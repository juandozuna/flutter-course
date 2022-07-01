import 'package:flutter/material.dart';
import 'package:section_5/pages/navigation_page.dart';
import 'package:section_5/pages/tab_bar_page.dart';
import 'package:section_5/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.getTheme(),
      home: const NavigationPage(),
    );
  }
}
