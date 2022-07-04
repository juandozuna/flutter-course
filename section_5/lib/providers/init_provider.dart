import 'package:flutter/material.dart';
import 'package:section_5/pages/login_page.dart';
import 'package:section_5/pages/navigation_page.dart';
import 'package:section_5/repositories/user_repository.dart';

class InitProvider {
  final UserRepository _userRepository;
  final GlobalKey<NavigatorState> _navigatorKey;

  InitProvider(
    this._userRepository,
    this._navigatorKey,
  );

  void initialize() async {
    final isUserLoggedIn = await _userRepository.isUserLoggedIn();

    if (isUserLoggedIn) {
      _navigatorKey.currentState!.pushReplacementNamed(
        NavigationPage.routeName,
      );
    } else {
      _navigatorKey.currentState!.pushReplacementNamed(
        LoginPage.routeName,
      );
    }
  }
}
