import 'package:flutter/material.dart';
import 'package:project_2_quiz_app/pages/end_page.dart';
import 'package:project_2_quiz_app/pages/quiz/quiz_page.dart';
import 'package:project_2_quiz_app/pages/start_page.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  StartPage.routeName: (context) => const StartPage(),
  QuizPage.routeName: (context) => const QuizPage(),
  EndPage.routeName: (context) => const EndPage(),
};
