import 'package:flutter/material.dart';
import 'package:project_3/models/expense_model.dart';
import 'package:project_3/repositories/expenses_repository.dart';
import 'package:project_3/viewModels/expenses_summary_view_model.dart';

class ExpensesProvider with ChangeNotifier {
  final ExpensesRepository _expensesRepository;

  ExpensesProvider(this._expensesRepository);

  bool isLoading = false;
  List<ExpenseModel> _expenses = [];

  bool get hasExpenses => _expenses.isNotEmpty;

  Future<void> getExpensesFromRepo() async {
    _startLoading();
    try {
      final expenses = await _expensesRepository.getExpenses();
      _expenses = [...expenses];
    } catch (e) {
      print(e);
    } finally {
      _stopLoading();
    }
  }

  void _startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void _stopLoading() {
    isLoading = false;
    notifyListeners();
  }

  List<ExpenseModel> getSortedExpenses() {
    return _expenses.toList()..sort((a, b) => b.created.compareTo(a.created));
  }

  ExpensesSummaryViewModel getSummaryViewModel() {
    return ExpensesSummaryViewModel.initViewModel(_expenses);
  }

  void addExpenseItem(ExpenseModel expense) async {
    _startLoading();
    try {
      await _expensesRepository.addExpense(expense);
      await getExpensesFromRepo();
    } catch (e) {
      print(e);
    } finally {
      _stopLoading();
    }
  }

  void addItem() {
    final daysToAdd = _expenses.length;
    final newItem = ExpenseModel(
      amount: 60,
      description: 'Curso',
      created: DateTime.now().add(Duration(days: daysToAdd)),
    );
    addExpenseItem(newItem);
  }

  void deleteExpense(int id) async {
    _startLoading();
    try {
      await _expensesRepository.deleteExpense(id);
      await getExpensesFromRepo();
    } catch (e) {
      print(e);
    } finally {
      _stopLoading();
    }
  }
}
