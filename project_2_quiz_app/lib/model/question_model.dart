class QuestionModel {
  final String questionText;
  final List<String> answers;
  final int correctAnswerIndex;
  final String? explanation;

  String get correctAnswer => answers[correctAnswerIndex];

  const QuestionModel({
    required this.questionText,
    required this.answers,
    required this.correctAnswerIndex,
    this.explanation,
  });

  bool isCorrectAnswer(int index) => correctAnswerIndex == index;
}
