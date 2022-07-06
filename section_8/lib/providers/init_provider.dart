import 'package:section_8/presentation/constants/routes.dart';

class InitProvider {
  InitProvider();

  void init() {
    //Initialize some data

    AppRoute.nav.pushNamed(AppRoute.login);
  }
}
