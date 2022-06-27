import 'package:project_3/models/expense_model.dart';
import 'package:project_3/repositories/database_repository.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class DatabaseLocalRepository implements DatabaseRepository {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDatabase();
    }

    return _database!;
  }

  Future<Database> _initDatabase() async {
    final String dbPath = await getDatabasesPath();
    return await openDatabase(
      path.join(dbPath, 'name3.db'),
      onCreate: (db, version) async {
        await db.execute(ExpenseModel.createTable);
      },
      version: 2,
    );
  }

  @override
  Future<void> close() async {
    final Database db = await database;
    db.close();
    _database = null;
  }

  @override
  Future<int> delete(String table,
      {String? filterColumn, String? filterValue}) async {
    final Database db = await database;
    final res =
        await db.delete(table, where: '"$filterColumn" == "$filterValue"');
    return res;
  }

  @override
  Future<bool> exist(String table,
      {String? filterColumn, String? filterValue}) async {
    final Database db = await database;
    final List<Map<String, dynamic>> result = await db.rawQuery(
        "SELECT EXISTS(SELECT 1 FROM $table WHERE $filterColumn = '$filterValue')");
    return result.first.values.first == 1 ? true : false;
  }

  @override
  Future<List<Map<String, dynamic>>> getData(String table,
      {String? filterColumn, String? filterValue}) async {
    final Database db = await database;
    final res =
        await db.query(table, where: '"$filterColumn" == "$filterValue"');
    return res;
  }

  @override
  Future<int> insert(String table, Map<String, dynamic> data) async {
    final Database db = await database;
    final res = await db.insert(
      table,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return res;
  }

  @override
  Future<int> update(String table, Map<String, Object> data,
      {String? filterColumn, String? filterValue}) async {
    final Database db = await database;
    final res = await db.update(table, data,
        where: '"$filterColumn" == "$filterValue"');
    return res;
  }
}
