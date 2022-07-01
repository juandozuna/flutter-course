import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:section_5/data/repositories/resources_data_repository.dart';
import 'package:section_5/data/services/resource_service.dart';
import 'package:section_5/networking.dart';
import 'package:section_5/providers/resources_provider.dart';
import 'package:section_5/repositories/resources_repository.dart';

final _injector = GetIt.instance;

bool _alreadyRegistered = false;

MultiProvider initProvider(Widget Function(BuildContext) builder) {
  if (!_alreadyRegistered) {
    _init();
    _alreadyRegistered = true;
  }
  
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => get<ResourcesProvider>()),
    ],
    builder: (c, child) => builder(c),
  );
}

void _init() {
  _registerInstances();
}

void _registerInstances() {
  _registerNetworkClient();
  _registerServices();
  _registerRepositories();
  _registerProviders();
}

void _registerServices() {
  _injector.registerSingleton<ResourceService>(ResourceService(get<Dio>()));
}

void _registerRepositories() {
  _injector.registerSingleton<ResourcesRepository>(
    ResourcesDataRepository(get<ResourceService>()),
  );
}

void _registerProviders() {
  _injector.registerSingleton(
    ResourcesProvider(get<ResourcesRepository>()),
  );
}

void _registerNetworkClient() =>
    _injector.registerSingleton<Dio>(createClient());

T get<T extends Object>() => _injector<T>();
