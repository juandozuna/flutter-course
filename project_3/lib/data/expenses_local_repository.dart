import 'package:project_3/models/expense_model.dart';
import 'package:project_3/repositories/database_repository.dart';
import 'package:project_3/repositories/expenses_repository.dart';

class ExpensesLocalRepository implements ExpensesRepository {
  final DatabaseRepository _databaseRepository;

  ExpensesLocalRepository(this._databaseRepository);

  @override
  Future<void> addExpense(ExpenseModel expense) {
    return _databaseRepository.insert(
      ExpenseModel.tableName,
      expense.toJson(),
    );
  }

  @override
  Future<void> deleteExpense(int id) {
    return _databaseRepository.delete(
      ExpenseModel.tableName,
      filterColumn: ExpenseModel.idColumn,
      filterValue: id.toString(),
    );
  }

  @override
  Future<List<ExpenseModel>> getExpenses() async {
    final found = await _databaseRepository.getData(ExpenseModel.tableName);
    final expenses = found.map((e) => ExpenseModel.fromJson(e)).toList();
    return expenses;
  }
}
