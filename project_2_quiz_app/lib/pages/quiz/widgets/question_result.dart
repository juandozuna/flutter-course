import 'package:flutter/material.dart';
import 'package:project_2_quiz_app/model/question_model.dart';
import 'package:project_2_quiz_app/themes/assets.dart';
import 'package:project_2_quiz_app/themes/theme.dart';
import 'package:project_2_quiz_app/widget/primary_button.dart';

class QuestionResult extends StatelessWidget {
  final QuestionModel question;
  final int chosenAnswerIndex;
  final VoidCallback onNextPressed;

  bool get isCorrect => question.correctAnswerIndex == chosenAnswerIndex + 1;

  const QuestionResult({
    Key? key,
    required this.question,
    required this.chosenAnswerIndex,
    required this.onNextPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Question Result'),
    );
  }
}
