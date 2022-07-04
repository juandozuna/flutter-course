import 'package:section_5/data/local_data/user_local_data_source.dart';
import 'package:section_5/data/services/user_service.dart';
import 'package:section_5/models/users/create_user_model.dart';
import 'package:section_5/models/users/login_user_mode.dart';
import 'package:section_5/models/users/user_model.dart';
import 'package:section_5/repositories/user_repository.dart';

class UserDataRepository implements UserRepository {
  final UserService _userService;
  final UserLocalDataSource _userLocalDataSource;

  UserDataRepository(this._userService, this._userLocalDataSource);

  @override
  Future<List<UserModel>> getUsers() async {
    final response = await _userService.getUsers();
    return response.data;
  }

  @override
  Future<void> deleteUser(int id) {
    return _userService.deleteUser(id);
  }

  Future<CreateUserResponse> createUser(CreateUserRequest request) async {
    return _userService.createUser(request);
  }

  Future<void> performLogin(LoginUserModel user, bool storeDat) async {
    final response = await _userService.loginUser(user);

    if (!storeDat) return;

    await _userLocalDataSource.storeToken(response.token);
    await _userLocalDataSource.storeUser(user);
  }

  Future<bool> isUserLoggedIn() async {
    final token = await _userLocalDataSource.getToken();
    return token != null;
  }

  Future<void> logout() async {
    _userLocalDataSource.deleteToken();
  }
}
