import 'package:flutter/material.dart';
import 'package:project_3/models/expense_model.dart';
import 'package:project_3/viewModels/expenses_summary_view_model.dart';

class ExpensesProvider with ChangeNotifier {
  final List<ExpenseModel> expenses = [
    ExpenseModel(amount: 23, description: 'Course', created: DateTime.now()),
    ExpenseModel(
      amount: 23,
      description: 'Course',
      created: DateTime.now().subtract(
        const Duration(days: 1),
      ),
    ),
    ExpenseModel(
      amount: 23,
      description: 'Course',
      created: DateTime.now().subtract(
        const Duration(days: 2),
      ),
    ),
    ExpenseModel(
      amount: 23,
      description: 'Course',
      created: DateTime.now().subtract(
        const Duration(days: 3),
      ),
    ),
    ExpenseModel(
      amount: 23,
      description: 'Course',
      created: DateTime.now().subtract(
        const Duration(days: 4),
      ),
    ),
    ExpenseModel(
      amount: 23,
      description: 'Course',
      created: DateTime.now().subtract(
        const Duration(days: 5),
      ),
    ),
    ExpenseModel(
      amount: 23,
      description: 'Course',
      created: DateTime.now().subtract(
        const Duration(days: 6),
      ),
    ),
    ExpenseModel(
      amount: 23,
      description: 'Course',
      created: DateTime.now().subtract(
        const Duration(days: 7),
      ),
    ),
    ExpenseModel(
      amount: 23,
      description: 'Course',
      created: DateTime.now().subtract(
        const Duration(days: 8),
      ),
    ),
    ExpenseModel(
      amount: 23,
      description: 'Course',
      created: DateTime.now().subtract(
        const Duration(days: 9),
      ),
    ),
  ];

  ExpensesSummaryViewModel getViewModel() {
    return ExpensesSummaryViewModel.initViewModel(expenses);
  }
}
