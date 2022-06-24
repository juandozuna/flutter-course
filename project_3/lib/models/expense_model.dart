import 'package:equatable/equatable.dart';

class ExpenseModel extends Equatable {
  final int? id;
  final double amount;
  final String description;
  final DateTime created;

  int get weekDay => created.weekday;

  const ExpenseModel({
    this.id,
    required this.amount,
    required this.description,
    required this.created,
  });

  @override
  List<Object?> get props => [
        id,
        amount,
        description,
        created,
      ];

  @override
  bool get stringify => true;

  static String tableScript = """
    CREATE TABLE $tableName (
      id INTEGER PRIMARY KEY,
      amount REAL,
      description TEXT,
      created DATETIME
    )
  """;
}
