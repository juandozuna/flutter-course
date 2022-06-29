import 'package:flutter/material.dart';
import 'package:section_5/pages/navigation_page.dart';
import 'package:section_5/pages/tab_bar_page.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.teal,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.teal,
          selectedItemColor: Colors.white,
        ),
      ),
      home: const TabBarPage(),
    );
  }
}
