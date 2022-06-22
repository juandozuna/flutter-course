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
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          _buildQuestionNumber(context),
          const SizedBox(height: 10),
          _buildQuestionTextContainer(context),
        ],
      ),
    );
  }

  Widget _buildQuestionNumber(BuildContext context) {
    return Text(
      'Pregunta #$number',
      style: Theme.of(context).primaryTextTheme.headline6,
    );
  }

  Widget _buildQuestionTextContainer(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          QuizShadows.primaryShadow,
        ],
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}
