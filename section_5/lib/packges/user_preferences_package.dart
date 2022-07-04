import 'package:shared_preferences/shared_preferences.dart';

abstract class UserPreferencesPackage {
  Future<void> storeToken(String token);

  Future<String?> getToken();

  Future<bool> hasToken();

  Future<void> removeToken();
}

class UserPreferencesPackageImpl implements UserPreferencesPackage {
  final Future<SharedPreferences> _prefs;

  UserPreferencesPackageImpl(this._prefs);

  @override
  Future<String?> getToken() async {
    final prefs = await _prefs;
    return prefs.getString('token');
  }

  @override
  Future<bool> hasToken() async {
    final prefs = await _prefs;
    return prefs.containsKey('token');
  }

  @override
  Future<void> storeToken(String token) async {
    final prefs = await _prefs;
    await prefs.setString('token', token);
  }

  @override
  Future<void> removeToken() async {
    final prefs = await _prefs;
    await prefs.remove('token');
  }
}
