import 'package:project_2_quiz_app/model/question_model.dart';

const questionData = <QuestionModel>[
  QuestionModel(
      questionText: '¿Cuántos litros de sangre tiene una persona?',
      answers: <String>[
        'Entre 2 y 4 litros',
        'Entre 4 y 6 litros',
        'Tiene 10 litros',
        'Tiene 7 litros',
        'Tiene 0.5 litros',
      ],
      correctAnswerIndex: 2,
      explanation:
          'La cantidad de sangre varía de persona a persona. El volumen de sangre representa del 7 al 8% del peso corporal. De esta forma, en una persona adulta que pesa entre 50 y 80 kilogramos, puede haber entre 4 y 6 litros de sangre.'),
  QuestionModel(
    questionText: '¿Quién es el autor de la frase "Pienso, luego existo"?',
    answers: <String>[
      'Platón',
      'Galileo Galilei',
      'Descartes',
      'Sócrates',
      'Francis Bacon',
    ],
    correctAnswerIndex: 3,
  ),
  QuestionModel(
    questionText: '¿Cuál es el país más grande y el más pequeño del mundo?',
    answers: <String>[
      'Rusia y Vaticano',
      'China y Nauru',
      'Canadá y Mónaco',
      'Estados Unidos y Malta',
      'India y San Marino',
    ],
    correctAnswerIndex: 1,
  ),
  QuestionModel(
    questionText: '¿Cuál es el grupo de palabras escritas correctamente?',
    answers: <String>[
      'Metamorfosis, extranjero, diversidac, equilivrio',
      'Metaformosis, estranjero, diversidad, ekilibrio',
      'Metamorfosis, extrangero, dibersidad, equilibrio',
      'Metamorfosis, extranjero, diversidad, equilibrio',
      'Metamórfosis, eztranjero, divérsidad, ecuilibrio',
    ],
    correctAnswerIndex: 4,
  ),
  QuestionModel(
    questionText:
        '¿Cuál es el libro más vendido en el mundo después de la Biblia?',
    answers: <String>[
      'El Señor de los Anillos',
      'Don Quijote de la Mancha',
      'El Principito',
      'Cien años de Soledad',
      'La Odisea',
    ],
    correctAnswerIndex: 2,
  ),
  QuestionModel(
    questionText: '¿Cuántos decimales tiene el número pi π?',
    answers: <String>[
      'Dos',
      'Cien',
      'Infinitos',
      'Mil',
      'Veinte',
    ],
    correctAnswerIndex: 3,
  ),
];
