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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: answers
          .asMap()
          .entries
          .map(
            (entry) => QuestionAnswerButton(
              answer: entry.value,
              index: entry.key,
              onPressed: () => _onAnswerSelected(entry.key),
            ),
          )
          .toList(),
    );
  }

  void _onAnswerSelected(int index) {
    onAnswerSelected(index);
  }
}
