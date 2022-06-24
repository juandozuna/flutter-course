abstract class DatabaseService {
  Future<int> insert(String table, Map<String, Object> data);

  Future<void> close();

  Future<List<Map<String, dynamic>>> getData(String table,
      {String filterColumn, String filterValue});

  Future<int> update(String table, Map<String, Object> data,
      {String filterColumn, String filterValue});

  Future<int> delete(String table, {String filterColumn, String filterValue});

  Future<bool> exist(String table, {String filterColumn, String filterValue});
}
