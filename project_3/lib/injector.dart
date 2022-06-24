import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:project_3/data/database_local_repository.dart';
import 'package:project_3/data/expenses_local_repository.dart';
import 'package:project_3/providers/expenses_provider.dart';
import 'package:project_3/repositories/database_repository.dart';
import 'package:project_3/repositories/expenses_repository.dart';
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
      ChangeNotifierProvider(create: (_) => injector.get<ExpensesProvider>()),
    ],
    child: child,
  );
}

void _init() {
  _reigsterRepositories();
  _registerProviders();
}

void _reigsterRepositories() {
  injector.registerLazySingleton<DatabaseRepository>(
    () => DatabaseLocalRepository(),
  );
  injector.registerLazySingleton<ExpensesRepository>(
    () => ExpensesLocalRepository(
      injector<DatabaseRepository>(),
    ),
  );
}

void _registerProviders() {
  injector.registerLazySingleton<ExpensesProvider>(
    () => ExpensesProvider(injector<ExpensesRepository>()),
  );
}
