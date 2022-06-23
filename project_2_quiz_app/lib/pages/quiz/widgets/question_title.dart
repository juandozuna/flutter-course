import 'package:flutter/material.dart';
import 'package:project_2_quiz_app/themes/theme.dart';

class QuestionTitle extends StatelessWidget {
  final int number;
  final String text;

  const QuestionTitle({
    Key? key,
    required this.number,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Column(
        children: [
          Text(
            'Pregunta #$number',
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 10),
          _buildQuestionText(context),
        ],
      ),
    );
  }

  Widget _buildQuestionText(BuildContext context) => Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).cardColor,
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.headline4,
        ),
      );
}
