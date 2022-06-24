import 'package:project_3/models/expense_model.dart';

abstract class ExpensesRepository {
  Future<List<ExpenseModel>> getExpenses();

  Future<void> addExpense(ExpenseModel expense);

  Future<void> deleteExpense(int id);
}
