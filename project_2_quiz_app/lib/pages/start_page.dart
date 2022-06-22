import 'package:flutter/material.dart';
import 'package:project_2_quiz_app/pages/quiz/quiz_page.dart';
import 'package:project_2_quiz_app/widget/primary_button.dart';

class StartPage extends StatelessWidget {
  static const String routeName = '/';

  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PrimaryButton(
          text: 'Start Quiz',
          onPressed: () => startQuiz(context),
        ),
      ),
    );
  }

  void startQuiz(BuildContext context) {
    Navigator.pushNamed(context, QuizPage.routeName);
  }
}
