import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'expense_model.g.dart';

@JsonSerializable()
class ExpenseModel extends Equatable {
  static const String tableName = 'expenses';

  final int? id;
  final double amount;
  final String description;
  final DateTime created;

  static const String idColumn = 'id';

  int get weekDay => created.weekday;

  const ExpenseModel({
    this.id,
    required this.amount,
    required this.description,
    required this.created,
  });

  factory ExpenseModel.fromJson(Map<String, dynamic> json) {
    return _$ExpenseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ExpenseModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        amount,
        description,
        created,
      ];

  @override
  bool get stringify => true;

  static String createTable = """
    CREATE TABLE $tableName (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      amount REAL,
      description TEXT,
      created TEXT
    );
  """;
}
