import 'package:flutter/material.dart';
import 'package:section_5/pages/navigation_page.dart';

class InitializeProvider {
  final GlobalKey<NavigatorState> mainKey;

  InitializeProvider(
    this.mainKey,
  );

  void initialize() async {
    final navigator = mainKey.currentState!;

    navigator.pushNamed(NavigationPage.routeName);
  }
}
