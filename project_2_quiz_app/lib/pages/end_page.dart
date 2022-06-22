import 'dart:js';

import 'package:flutter/material.dart';
import 'package:project_2_quiz_app/pages/start_page.dart';
import 'package:project_2_quiz_app/widget/primary_button.dart';

class EndPageArguments {
  final int score;
  final int totalQuestions;

  EndPageArguments({
    required this.score,
    required this.totalQuestions,
  });
}

class EndPage extends StatelessWidget {
  static const String routeName = '/end';

  const EndPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as EndPageArguments;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Text('Preguntas: ${args.totalQuestions}'),
                const SizedBox(height: 10),
                Text('Preguntas Corretas: ${args.score}'),
                const SizedBox(height: 10),
                Text('Preguntas Incorrectas: ${args.score}'),
                const SizedBox(height: 10),
              ],
            ),
          ),
          PrimaryButton(
            text: 'Volver a Intentar',
            onPressed: () => Navigator.of(context).popUntil(
              (route) => route.settings.name == StartPage.routeName,
            ),
          ),
        ],
      ),
    );
  }
}
