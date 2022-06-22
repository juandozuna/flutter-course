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
    return Center(
      child: Text('Question Answer Button'),
    );
  }

  Widget _createButtonContent(BuildContext context) {
    final letter = ALPHABET[index].toUpperCase();

    return Container();
  }
}
