import 'package:section_8/domain/repositories/auth_repository.dart';
import 'package:section_8/presentation/constants/routes.dart';
import 'package:section_8/presentation/providers/base_notifier_provider.dart';
import 'package:section_8/util.dart';

class AuthProvider extends BaseNotifierProvider {
  final AuthRepository _authRepository;

  AuthProvider(this._authRepository);

  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    startLoading();
    try {
      await _authRepository.signInWithEmailAndPassword(email, password);
      stopLoading();
      return true;
    } catch (e) {
      setError(e);
      return false;
    }
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
    notifyListeners();
    popAllRoutes();
    AppRoute.nav.pushNamed(AppRoute.login);
  }

  Future<bool> isUserLoggedIn() {
    return _authRepository.isSignedIn();
  }
}
