import 'package:flutter/material.dart';
import 'package:section_5/pages/login/login_page.dart';
import 'package:section_5/pages/navigation_page.dart';
import 'package:section_5/repositories/user_repository.dart';

class InitializeProvider {
  final GlobalKey<NavigatorState> mainKey;
  final UserRepository _userRepository;

  InitializeProvider(
    this.mainKey,
    this._userRepository,
  );

  void initialize() async {
    final navigator = mainKey.currentState!;

    // await Future.delayed(Duration(seconds: 3));

    final isLoggedIn = await _userRepository.isUserLoggedIn();

    if (isLoggedIn) {
      navigator.pushReplacementNamed(NavigationPage.routeName);
    } else {
      navigator.pushReplacementNamed(LoginPage.routeName);
    }
  }
}
