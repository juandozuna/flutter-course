import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

final _injector = GetIt.instance;

Future<List<Provider<Object>>> initInjector() async {
  await _registerAll();

  await _injector.allReady();

  return _registerProviders();
}

List<Provider<Object>> _registerProviders() {
  return [];
}

Future<void> _registerAll() async {}

T get<T>() => _injector<T>();
