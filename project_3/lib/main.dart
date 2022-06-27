import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_3/injector.dart';
import 'package:project_3/pages/home/home_page.dart';
import 'package:project_3/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return registerInjector(
      GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: const ExpensesApp(),
      ),
    );
  }
}

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Expenses App',
      theme: AppTheme.getTheme(),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
