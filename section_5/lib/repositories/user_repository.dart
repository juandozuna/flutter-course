import 'package:section_5/models/users/create_user_model.dart';
import 'package:section_5/models/users/login_model.dart';
import 'package:section_5/models/users/user_model.dart';

abstract class UserRepository {
  Future<List<UserModel>> getUsers();

  Future<void> deleteUser(int id);

  Future<CreateUserResponse> createUser(CreateUserRequest request);

  Future<bool> logInUser(LoginUserRequest userRequest);

  Future<bool> isUserLoggedIn();

  Future<void> logOutUser();
}
