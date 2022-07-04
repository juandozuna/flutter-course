import 'package:section_5/models/users/create_user_model.dart';
import 'package:section_5/models/users/login_user_mode.dart';
import 'package:section_5/models/users/user_model.dart';
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

  void deleteUser(int index) async {
    startLoading();
    try {
      final user = users[index];
      await _usersRepository.deleteUser(user.id);
      users.removeAt(index);
    } catch (e) {
      setError(e);
    }
    stopLoading();
  }

  Future<void> createUser(CreateUserRequest request) async {
    startLoading();

    try {
      final user = await _usersRepository.createUser(request);
      users.add(UserModel(
          id: int.parse(user.id),
          email: 'email',
          firstName: user.name,
          lastName: user.job,
          avatar: null));
    } catch (e) {
      setError(e);
    }

    stopLoading();
  }

  Future<bool> login(LoginUserModel request) async {
    startLoading();
    bool isSuccess = false;
    try {
      await _usersRepository.performLogin(request, true);
      isSuccess = true;
    } catch (e) {
      setError(e);
    }
    stopLoading();
    return isSuccess;
  }
}
