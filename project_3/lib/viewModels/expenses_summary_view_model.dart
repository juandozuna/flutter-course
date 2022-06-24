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
    final totalAmount = expenses.map((e) => e.amount).reduce((a, b) => a + b);

    final groupedByWeek =
        groupBy<ExpenseModel, int>(expenses, (e) => e.weekDay);

    final summaryItems = groupedByWeek.entries.map((e) {
      final weekDay = e.key;
      final amount = e.value.map((e) => e.amount).reduce((a, b) => a + b);
      final percentage = (amount / totalAmount) * 100;
      return ExpenseSummaryItem(
        weekDay: weekDay,
        amount: amount,
        barPercentageFill: percentage,
      );
    }).toList()
      ..sort((a, b) => a.weekDay.compareTo(b.weekDay));

    return ExpensesSummaryViewModel._(
        summaryItems: summaryItems, totalAmount: totalAmount);
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
