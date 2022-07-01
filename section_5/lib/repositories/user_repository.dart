import 'package:section_5/models/user_model.dart';

abstract class UserRepository {
  Future<List<UserModel>> getUsers();
}
