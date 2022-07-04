import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:section_5/data/local_data/user_local_data_source.dart';
import 'package:section_5/data/repositories/resources_data_repository.dart';
import 'package:section_5/data/repositories/user_data_repository.dart';
import 'package:section_5/data/services/resource_service.dart';
import 'package:section_5/data/services/user_service.dart';
import 'package:section_5/main.dart';
import 'package:section_5/networking.dart';
import 'package:section_5/providers/initialize_provider.dart';
import 'package:section_5/providers/resources_provider.dart';
import 'package:section_5/providers/users_provider.dart';
import 'package:section_5/repositories/resources_repository.dart';
import 'package:section_5/repositories/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _injector = GetIt.instance;

bool _alreadyRegistered = false;

Future<MultiProvider> initProvider(
    Widget Function(BuildContext) builder) async {
  if (!_alreadyRegistered) {
    await _init();
    _alreadyRegistered = true;
  }

  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => get<ResourcesProvider>()),
      ChangeNotifierProvider(create: (_) => get<UserProvider>()),
      Provider(create: (_) => get<InitializeProvider>()),
    ],
    builder: (c, child) => builder(c),
  );
}

Future<void> _init() {
  return _registerInstances();
}

Future<void> _registerInstances() async {
  _registerNavKeys();
  await _registerPackages();
  _registerDataSources();
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
      get<UserLocalDataSource>(),
    ),
  );
}

void _registerNavKeys() {
  _injector.registerLazySingleton(() => AppNavigatorKey());
}

void _registerProviders() {
  _injector.registerSingleton(
    ResourcesProvider(get<ResourcesRepository>()),
  );

  _injector.registerSingleton(
    UserProvider(get<UserRepository>()),
  );

  _injector.registerSingleton(
    InitializeProvider(
      get<AppNavigatorKey>().mainKey,
      get<UserRepository>(),
    ),
  );
}

void _registerDataSources() {
  _injector.registerLazySingleton(
    () => UserLocalDataSource(get<SharedPreferences>()),
  );
}

Future<void> _registerPackages() async {
  final preferences = await SharedPreferences.getInstance();
  _injector.registerSingleton<SharedPreferences>(preferences);
}

void _registerNetworkClient() =>
    _injector.registerSingleton<Dio>(createClient());

T get<T extends Object>() => _injector<T>();
