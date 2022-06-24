import 'package:get_it/get_it.dart';
import 'package:project_3/data/repository/account_data_repository.dart';
import 'package:project_3/managers/account_manager.dart';
import 'package:project_3/repository/account_repository.dart';

final injector = GetIt.instance;

void init() {
  registerRepositories();
  registerManagers();
}

void registerManagers() {
  registerAccountManager();
}

void registerAccountManager() {
  injector.registerLazySingleton<AccountManager>(
    () => AccountManager(injector.get<AccountRepository>()),
  );
}

void registerRepositories() {
  injector.registerLazySingleton<AccountRepository>(
    () => AccountDataRepository(),
  );
}
