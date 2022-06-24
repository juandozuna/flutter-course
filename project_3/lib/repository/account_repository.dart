import 'package:project_3/models/account_model.dart';

abstract class AccountRepository {
  Future<List<AccountModel>> getAccounts();
}
