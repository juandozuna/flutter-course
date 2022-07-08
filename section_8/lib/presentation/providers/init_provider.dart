import 'package:section_8/domain/repositories/auth_repository.dart';
import 'package:section_8/presentation/constants/routes.dart';

class InitProvider {
  final AuthRepository _authRepository;

  InitProvider(this._authRepository);

  void init() async {
    //Initialize some data

    final isLoggedIn = await _authRepository.isSignedIn();

    if (isLoggedIn) {
      //Navigate to home
      AppRoute.nav.pushReplacementNamed(AppRoute.home);
    } else {
      //Navigate to login
      AppRoute.nav.pushReplacementNamed(AppRoute.login);
    }
  }
}
