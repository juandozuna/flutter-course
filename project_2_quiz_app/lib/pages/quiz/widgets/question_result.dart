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
        isCorrect ? _buildSuccessResult(context) : _buildFailureResult(context),
        const SizedBox(height: 10),
        _buildContinueButton(),
      ],
    );
  }

  Widget _buildContinueButton() {
    return PrimaryButton(text: 'Continuar', onPressed: onNextPressed);
  }

  Widget _buildFailureResult(BuildContext context) {
    return Column(children: [
      _buildImage(QuizAssets.failureIcon),
      _buildText('Respuesta Incorrecta', context)
    ]);
  }

  Widget _buildSuccessResult(BuildContext context) {
    return Column(children: [
      _buildImage(QuizAssets.successIcon),
      _buildText('¡Correcto!', context)
    ]);
  }

  Widget _buildImage(String imagePath) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          QuizShadows.primaryShadow,
        ],
      ),
      child: Image.asset(
        imagePath,
        width: 100,
        height: 100,
      ),
    );
  }

  Widget _buildText(String text, BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: const EdgeInsets.all(8),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context).primaryTextTheme.headline2,
      ),
    );
  }
}
