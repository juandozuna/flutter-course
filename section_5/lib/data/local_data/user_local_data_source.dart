import 'package:section_5/models/users/login_user_mode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLocalDataSource {
  final Future<SharedPreferences> _preferences;
  String? _token;

  UserLocalDataSource(this._preferences);

  Future<void> storeToken(String token) async {
    final prefs = await _preferences;
    await prefs.setString('token', token);
    _token = token;
  }

  Future<String?> getToken() async {
    final prefs = await _preferences;
    return prefs.getString('token');
  }

  Future<void> storeUser(LoginUserModel user) async {
    final prefs = await _preferences;
    prefs.setString('email', user.email);
  }

  void deleteToken() async {
    final prefs = await _preferences;
    prefs.remove('token');
    prefs.remove('email');
    _token = null;
  }

  Future<LoginUserModel?> getUser() async {
    final prefs = await _preferences;
    final email = prefs.getString('email');

    if (email == null) {
      return null;
    }

    return LoginUserModel(email: email);
  }
}
