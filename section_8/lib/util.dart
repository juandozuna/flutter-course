import 'package:flutter/material.dart';
import 'package:section_8/presentation/constants/routes.dart';

MaterialStateProperty<T> propertySetter<T>(T value) =>
    MaterialStateProperty.all(value);

void popAllRoutes() {
  while (AppRoute.nav.canPop()) {
    AppRoute.nav.pop();
  }
}
