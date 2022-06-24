import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:project_3/models/expense_model.dart';
import 'package:project_3/utils.dart';

@immutable
class ExpensesSummaryViewModel {
  final List<ExpenseSummaryItem> summaryItems;
  final double totalAmount;

  const ExpensesSummaryViewModel._({
    required this.summaryItems,
    required this.totalAmount,
  });

  static ExpensesSummaryViewModel initViewModel(List<ExpenseModel> expenses) {
    return ExpensesSummaryViewModel._(summaryItems: [], totalAmount: 123);
  }
}

@immutable
class ExpenseSummaryItem extends Equatable {
  final int weekDay;
  final double amount;
  final double barPercentageFill;

  const ExpenseSummaryItem({
    required this.weekDay,
    required this.amount,
    required this.barPercentageFill,
  });

  @override
  List<Object> get props => [
        weekDay,
        amount,
        barPercentageFill,
      ];
}
