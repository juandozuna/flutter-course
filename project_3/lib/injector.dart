import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:project_3/providers/expenses_provider.dart';
import 'package:provider/provider.dart';

final injector = GetIt.instance;

bool _initCalled = false;

MultiProvider registerInjector(Widget child) {
  if (!_initCalled) {
    _init();
    _initCalled = true;
  }

  return MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: injector<ExpensesProvider>()),
    ],
    child: child,
  );
}

void _init() {
  _registerProviders();
}

void _registerProviders() {
  injector.registerSingleton<ExpensesProvider>(ExpensesProvider());
}
