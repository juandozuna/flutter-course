import 'package:section_5/data/services/user_service.dart';
import 'package:section_5/models/users/create_user_model.dart';
import 'package:section_5/models/users/user_model.dart';
import 'package:section_5/repositories/user_repository.dart';

class UserDataRepository implements UserRepository {
  final UserService _userService;

  UserDataRepository(this._userService);

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
}
