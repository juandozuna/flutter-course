import 'package:project_3/models/account_model.dart';
import 'package:project_3/repository/account_repository.dart';

class AccountDataRepository implements AccountRepository {
  @override
  Future<List<AccountModel>> getAccounts() async {
    return [
      AccountModel(
        id: 1,
        accountNumber: '123456789',
        balance: 100.0,
      ),
      AccountModel(
        id: 2,
        accountNumber: '987654321',
        balance: 200.0,
      ),
    ];
  }
}
