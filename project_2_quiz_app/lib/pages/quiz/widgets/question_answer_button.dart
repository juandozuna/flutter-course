import 'package:flutter/material.dart';
import 'package:project_2_quiz_app/constants.dart';
import 'package:project_2_quiz_app/themes/theme.dart';

class QuestionAnswerButton extends StatelessWidget {
  final String answer;
  final int index;
  final VoidCallback? onPressed;

  const QuestionAnswerButton({
    Key? key,
    required this.answer,
    required this.index,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: _createButtonContent(context),
    );
  }

  Widget _createButtonContent(BuildContext context) {
    final letter = ALPHABET[index].toUpperCase();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      decoration: BoxDecoration(
        color: QuizColors.answerButton,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        '$letter. $answer',
        style: Theme.of(context).primaryTextTheme.titleMedium,
      ),
    );
  }
}
