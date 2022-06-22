import 'package:flutter/material.dart';
import 'package:project_2_quiz_app/data/question_data.dart';
import 'package:project_2_quiz_app/pages/end_page.dart';
import 'package:project_2_quiz_app/pages/quiz/widgets/single_question_view.dart';

class QuizPage extends StatefulWidget {
  static const String routeName = '/quiz';

  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final questions = questionData;
  final PageController _controller = PageController();
  int countOfCorrectAnsweredQuestions = 0;

  int currentQuestionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
      ),
      body: Text('Quiz Page'),
    );
  }

  Widget _buildQuestion(int index) {
    final question = questions[index];
    return SingleQuestionView(
      question: question,
      questionIndex: index,
      onNextPressed: _goToNextQuestion,
      onAnsweredCorrectly: _onAnsweredCorrectly,
    );
  }

  void _onAnsweredCorrectly() {
    countOfCorrectAnsweredQuestions++;
  }

  void _goToNextQuestion() {
    if (currentQuestionIndex + 1 < questions.length) {
      // Go to next question

      return;
    }

    _endQuiz();
  }

  void _endQuiz() {}
}
