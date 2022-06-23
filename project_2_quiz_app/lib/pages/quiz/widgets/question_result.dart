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
    return Column(
      children: [
        isCorrect
            ? _buildSuccessfulResult(context)
            : _buildFailedResult(context),
        const SizedBox(height: 10),
        PrimaryButton(
          text: 'Continuar!',
          onPressed: onNextPressed,
        ),
      ],
    );
  }

  Widget _buildSuccessfulResult(BuildContext context) {
    return _buildResult(QuizAssets.successIcon, '¡Correcto!', context);
  }

  Widget _buildFailedResult(BuildContext context) {
    return _buildResult(QuizAssets.failureIcon, 'Incorrecto!', context);
  }

  Widget _buildResult(String image, String text, BuildContext context) {
    return Column(
      children: [
        _buildImage(image),
        const SizedBox(height: 10),
        _buildText(text, context),
      ],
    );
  }

  Widget _buildImage(String image) {
    return Image.asset(
      image,
      width: 100,
      height: 100,
    );
  }

  Widget _buildText(String text, BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline6,
    );
  }
}
