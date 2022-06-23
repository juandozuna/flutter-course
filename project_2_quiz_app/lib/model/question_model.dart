import 'package:equatable/equatable.dart';

class QuestionModel extends Equatable {
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

  bool isCorrectAnswer(int index) => correctAnswerIndex == index + 1;

  @override
  List<Object?> get props => [
        questionText,
        answers,
        correctAnswerIndex,
        explanation,
      ];

  @override
  bool get stringify => true;
}
