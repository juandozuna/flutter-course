import 'package:flutter/material.dart';
import 'package:project_2_quiz_app/model/question_model.dart';
import 'package:project_2_quiz_app/pages/quiz/widgets/question_answers.dart';
import 'package:project_2_quiz_app/widget/quiz/question_title.dart';

class SingleQuestionView extends StatefulWidget {
  final QuestionModel question;
  final int questionIndex;
  final void Function(int) onAnswerSelected;

  const SingleQuestionView({
    Key? key,
    required this.question,
    required this.questionIndex,
    required this.onAnswerSelected,
  }) : super(key: key);

  @override
  _SingleQuestionViewState createState() => _SingleQuestionViewState();
}

class _SingleQuestionViewState extends State<SingleQuestionView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          QuestionTitle(
            number: widget.questionIndex + 1,
            text: widget.question.questionText,
          ),
          const SizedBox(height: 10),
          QuestionAnswers(
            answers: widget.question.answers,
            onAnswerSelected: widget.onAnswerSelected,
          )
        ],
      ),
    );
  }
}
