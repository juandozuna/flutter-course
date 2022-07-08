import 'package:section_8/domain/repositories/auth_repository.dart';
import 'package:section_8/domain/repositories/device_repository.dart';
import 'package:section_8/presentation/constants/routes.dart';

class InitProvider {
  final AuthRepository _authRepository;
  final DeviceRepository _deviceRepository;

  InitProvider(
    this._authRepository,
    this._deviceRepository,
  );

  void init() async {
    await _handleLocationPermissions();
    await _handleUserSession();
  }

  Future<void> _handleLocationPermissions() async {
    final result = await _deviceRepository.getLocationPermissions();
    if (!result) {
      await AppRoute.nav.pushNamed(AppRoute.errorNoLocationPermission);
    }
  }

  Future<void> _handleUserSession() async {
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
