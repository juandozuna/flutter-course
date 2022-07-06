import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:section_8/firebase_options.dart';

final _injector = GetIt.instance;

Future<List<Provider<Object>>> initInjector() async {
  await _registerAll();

  await _injector.allReady();

  return _registerProviders();
}

Future<void> _registerAll() async {
  await _initFirebase();
}

Future<void> _initFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

List<Provider<Object>> _registerProviders() {
  return [];
}

T get<T>() => _injector<T>();
