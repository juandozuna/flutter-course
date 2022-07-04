import 'package:section_5/data/services/user_service.dart';
import 'package:section_5/models/users/create_user_model.dart';
import 'package:section_5/models/users/login_model.dart';
import 'package:section_5/models/users/user_model.dart';
import 'package:section_5/packges/user_preferences_package.dart';
import 'package:section_5/repositories/user_repository.dart';

class UserDataRepository implements UserRepository {
  final UserService _userService;
  final UserPreferencesPackage _userPreferencesPackage;

  UserDataRepository(
    this._userService,
    this._userPreferencesPackage,
  );

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

  Future<bool> logInUser(LoginUserRequest userRequest) async {
    final response = await _userService.logInUser(userRequest);
    await _userPreferencesPackage.storeToken(response.token);
    return true;
  }

  @override
  Future<bool> isUserLoggedIn() {
    return _userPreferencesPackage.hasToken();
  }

  @override
  Future<void> logOutUser() {
    return _userPreferencesPackage.removeToken();
  }
}
