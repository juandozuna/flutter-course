import 'package:flutter/material.dart';
import 'package:project_2_quiz_app/model/question_model.dart';
import 'package:project_2_quiz_app/pages/quiz/widgets/question_answers.dart';
import 'package:project_2_quiz_app/pages/quiz/widgets/question_result.dart';
import 'package:project_2_quiz_app/pages/quiz/widgets/question_title.dart';

class SingleQuestionView extends StatefulWidget {
  final QuestionModel question;
  final int questionIndex;
  final void Function() onNextPressed;
  final void Function() onAnsweredCorrectly;

  const SingleQuestionView({
    Key? key,
    required this.question,
    required this.questionIndex,
    required this.onNextPressed,
    required this.onAnsweredCorrectly,
  }) : super(key: key);

  @override
  _SingleQuestionViewState createState() => _SingleQuestionViewState();
}

class _SingleQuestionViewState extends State<SingleQuestionView> {
  bool answerIsShown = false;
  int selectedAnswer = -1;

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
          answerIsShown
              ? QuestionResult(
                  question: widget.question,
                  chosenAnswerIndex: selectedAnswer,
                  onNextPressed: widget.onNextPressed,
                )
              : QuestionAnswers(
                  answers: widget.question.answers,
                  onAnswerSelected: onAnswerSelected,
                ),
        ],
      ),
    );
  }

  void onAnswerSelected(int index) {
    setState(() {
      selectedAnswer = index;
      answerIsShown = true;
    });

    final isCorrect = widget.question.correctAnswerIndex == index + 1;
    if (isCorrect) {
      widget.onAnsweredCorrectly();
    }
  }
}
