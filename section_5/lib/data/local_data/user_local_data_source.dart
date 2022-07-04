import 'package:section_5/models/users/login_user_mode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLocalDataSource {
  final SharedPreferences _preferences;
  String? _token;

  UserLocalDataSource(this._preferences);

  Future<void> storeToken(String token) async {
    await _preferences.setString('token', token);
    _token = token;
  }

  String? getToken() {
    return _preferences.getString('token');
  }

  Future<void> storeUser(LoginUserModel user) {
    return _preferences.setString('email', user.email);
  }

  void deleteToken() {
    _preferences.remove('token');
    _preferences.remove('email');
    _token = null;
  }

  LoginUserModel? getUser() {
    final email = _preferences.getString('email');

    if (email == null) {
      return null;
    }

    return LoginUserModel(email: email);
  }
}
