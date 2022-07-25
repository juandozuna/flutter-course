import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:section_5/data/repositories/resources_data_repository.dart';
import 'package:section_5/data/repositories/user_data_repository.dart';
import 'package:section_5/data/services/resource_service.dart';
import 'package:section_5/data/services/user_service.dart';
import 'package:section_5/main.dart';
import 'package:section_5/networking.dart';
import 'package:section_5/packges/user_preferences_package.dart';
import 'package:section_5/providers/init_provider.dart';
import 'package:section_5/providers/resources_provider.dart';
import 'package:section_5/providers/users_provider.dart';
import 'package:section_5/repositories/resources_repository.dart';
import 'package:section_5/repositories/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_config.dart';

final _injector = GetIt.instance;

bool _alreadyRegistered = false;

MultiProvider initProvider(
  AppConfig config,
  Widget Function(BuildContext) builder,
) {
  if (!_alreadyRegistered) {
    _init(config);
    _alreadyRegistered = true;
  }

  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => get<ResourcesProvider>()),
      ChangeNotifierProvider(create: (_) => get<UserProvider>()),
    ],
    builder: (c, child) => builder(c),
  );
}

void _init(AppConfig config) {
  _injector.registerSingleton<AppConfig>(config);
  _registerInstances();
}

void _registerInstances() {
  _registerNavKeys();
  _registerLibraries();
  _registerPackages();
  _registerNetworkClient();
  _registerServices();
  _registerRepositories();
  _registerProviders();
}

void _registerServices() {
  _injector.registerSingleton<ResourceService>(ResourceService(get<Dio>()));
  _injector.registerSingleton<UserService>(UserService(get<Dio>()));
}

void _registerRepositories() {
  _injector.registerSingleton<ResourcesRepository>(
    ResourcesDataRepository(get<ResourceService>()),
  );

  _injector.registerSingleton<UserRepository>(
    UserDataRepository(
      get<UserService>(),
      get<UserPreferencesPackage>(),
    ),
  );
}

void _registerNavKeys() {
  _injector.registerLazySingleton(() => AppNavigatorKey());
}

void _registerProviders() {
  _injector.registerSingleton<InitProvider>(
    InitProvider(
      get<UserRepository>(),
      get<AppNavigatorKey>().mainKey,
    ),
  );

  _injector.registerSingleton(
    ResourcesProvider(get<ResourcesRepository>()),
  );

  _injector.registerSingleton(
    UserProvider(
      get<UserRepository>(),
      get<AppNavigatorKey>().mainKey,
    ),
  );
}

void _registerLibraries() {
  _injector.registerSingleton<Future<SharedPreferences>>(
    SharedPreferences.getInstance(),
  );
}

void _registerPackages() {
  _injector.registerSingleton<UserPreferencesPackage>(
    UserPreferencesPackageImpl(get<Future<SharedPreferences>>()),
  );
}

void _registerNetworkClient() => _injector.registerSingleton<Dio>(
      createClient(get<UserPreferencesPackage>()),
    );

T get<T extends Object>() => _injector<T>();
