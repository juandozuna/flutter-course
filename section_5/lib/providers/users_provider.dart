import 'package:section_5/models/user_model.dart';
import 'package:section_5/providers/base_notifier_provider.dart';
import 'package:section_5/repositories/user_repository.dart';

class UserProvider extends BaseNotifierProvider {
  final UserRepository _usersRepository;

  List<UserModel> users = [];
  bool isInitialLoad = true;

  bool get noUsers => users.isEmpty;

  UserProvider(this._usersRepository);

  void getUsers() async {
    startLoading();

    if (isInitialLoad) {
      isInitialLoad = false;
      await _getUsersRequest();
    }

    stopLoading();
  }

  Future<void> _getUsersRequest() async {
    try {
      final users = await _usersRepository.getUsers();
      this.users = users;
    } catch (e) {
      setError(e);
    }
  }
}
