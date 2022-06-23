import 'package:flutter/material.dart';
import 'package:project_2_quiz_app/pages/start_page.dart';
import 'package:project_2_quiz_app/widget/primary_button.dart';

class EndPage extends StatelessWidget {
  static const String routeName = '/end';

  const EndPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as EndPageArguments;

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Preguntas Correctas: ${args.count}'),
              Text(
                  'Preguntas Incorrectas: ${args.totalQuestions - args.count}'),
              Text('Preguntas Totales: ${args.totalQuestions}'),
              Center(
                child: PrimaryButton(
                  text: 'Comenzar de Nuevo!',
                  onPressed: () => startAgain(context),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void startAgain(BuildContext context) {
    Navigator.of(context)
        .popUntil((route) => route.settings.name == StartPage.routeName);
  }
}

class EndPageArguments {
  final int count;
  final int totalQuestions;

  const EndPageArguments(this.count, this.totalQuestions);
}
