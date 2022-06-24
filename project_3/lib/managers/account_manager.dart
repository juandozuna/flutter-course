import 'package:project_3/managers/base_manager.dart';
import 'package:project_3/models/account_model.dart';
import 'package:project_3/repository/account_repository.dart';

class AccountManager extends BaseManager {
  final AccountRepository _accountRepository;

  AccountManager(this._accountRepository);

  Future<List<AccountModel>> getAccounts() async {
    return await _accountRepository.getAccounts();
  }
}
