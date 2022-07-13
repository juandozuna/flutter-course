import 'package:flutter/material.dart';
import 'package:section_8/domain/repositories/auth_repository.dart';
import 'package:section_8/domain/repositories/device_repository.dart';
import 'package:section_8/presentation/constants/routes.dart';

class InitProvider {
  final AuthRepository _authRepository;
  final DeviceRepository _deviceRepository;
  final GlobalKey<NavigatorState> _navKey;

  InitProvider(
    this._authRepository,
    this._deviceRepository,
    this._navKey,
  );

  Future<void> init() async {
    await _handleLocationPermissions();
    await _handleUserSession();
  }

  Future<void> _handleLocationPermissions() async {
    final result = await _deviceRepository.getLocationPermissions();
    if (!result) {
      await _navKey.currentState!.pushNamed(AppRoute.errorNoLocationPermission);
    }
  }

  Future<void> _handleUserSession() async {
    final isLoggedIn = await _authRepository.isSignedIn();

    if (isLoggedIn) {
      //Navigate to home
      _navKey.currentState!.pushReplacementNamed(AppRoute.home);
    } else {
      //Navigate to login
      _navKey.currentState!.pushReplacementNamed(AppRoute.login);
    }
  }
}
