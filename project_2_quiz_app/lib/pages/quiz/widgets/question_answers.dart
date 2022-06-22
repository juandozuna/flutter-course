import 'package:flutter/material.dart';
import 'package:project_2_quiz_app/pages/quiz/widgets/question_answer_button.dart';

class QuestionAnswers extends StatelessWidget {
  final List<String> answers;
  final void Function(int) onAnswerSelected;

  const QuestionAnswers({
    Key? key,
    required this.answers,
    required this.onAnswerSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Question Answers'),
    );
  }

  void _onAnswerSelected(int index) {}
}
