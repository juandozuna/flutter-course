import 'package:flutter/material.dart';
import 'package:project_2_quiz_app/pages/start_page.dart';
import 'package:project_2_quiz_app/route.dart';
import 'package:project_2_quiz_app/themes/theme.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: QuizTheme.getTheme(),
      home: Scaffold(
          body: Center(
        child: Text('Hello World !'),
      )),
    );
  }
}
