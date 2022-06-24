import 'package:project_3/models/expense_model.dart';
import 'package:project_3/repositories/database_repository.dart';
import 'package:project_3/repositories/expenses_repository.dart';

class ExpensesLocalRepository implements ExpensesRepository {
  final DatabaseRepository _databaseService;

  ExpensesLocalRepository(this._databaseService);

  @override
  Future<void> addExpense(ExpenseModel expense) {
    // TODO: implement addExpense
    throw UnimplementedError();
  }

  @override
  Future<void> deleteExpense(int id) {
    // TODO: implement deleteExpense
    throw UnimplementedError();
  }

  @override
  Future<List<ExpenseModel>> getExpenses() {
    // TODO: implement getExpenses
    throw UnimplementedError();
  }
}
