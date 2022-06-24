import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'expense_model.g.dart';

@JsonSerializable()
class ExpenseModel extends Equatable {
  final double amount;
  final String description;
  final DateTime created;

  int get weekDay => created.weekday;

  const ExpenseModel({
    required this.amount,
    required this.description,
    required this.created,
  });

  factory ExpenseModel.fromJson(Map<String, dynamic> json) =>
      _$ExpenseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExpenseModelToJson(this);

  @override
  List<Object> get props => [
        amount,
        description,
        created,
      ];

  @override
  bool get stringify => true;
}
