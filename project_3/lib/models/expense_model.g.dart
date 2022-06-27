// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpenseModel _$ExpenseModelFromJson(Map<String, dynamic> json) => ExpenseModel(
      amount: (json['amount'] as num).toDouble(),
      description: json['description'] as String,
      created: DateTime.parse(json['created'] as String),
    );

Map<String, dynamic> _$ExpenseModelToJson(ExpenseModel instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'description': instance.description,
      'created': instance.created.toIso8601String(),
    };
