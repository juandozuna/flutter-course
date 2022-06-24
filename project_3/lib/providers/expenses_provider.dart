import 'package:flutter/material.dart';
import 'package:project_3/models/expense_model.dart';
import 'package:project_3/repositories/expenses_repository.dart';
import 'package:project_3/viewModels/expenses_summary_view_model.dart';

class ExpensesProvider with ChangeNotifier {
  final ExpensesRepository _expensesRepository;

  ExpensesProvider(this._expensesRepository);

  final List<ExpenseModel> _expenses = [
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

  void addExpense(ExpenseModel expense) {
    _expenses.add(expense);
    notifyListeners();
  }

  void deleteExpense(int i) {
    _expenses.removeAt(i);
    notifyListeners();
  }

  ExpensesSummaryViewModel getViewModel() {
    return ExpensesSummaryViewModel.initViewModel(_expenses);
  }

  List<ExpenseModel> getExpenses() {
    final sortedExpenses = _expenses.toList();
    sortedExpenses.sort((a, b) => b.created.compareTo(a.created));
    return sortedExpenses;
  }
}
