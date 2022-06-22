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
    return Center(
      child: Text('Question Title'),
    );
  }
}
