import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:section_8/data/repositories/auth_data_repository.dart';
import 'package:section_8/domain/repositories/auth_repository.dart';
import 'package:section_8/firebase_options.dart';
import 'package:section_8/presentation/providers/auth_provider.dart';
import 'package:section_8/presentation/providers/init_provider.dart';

final _injector = GetIt.instance;

Future<List<SingleChildWidget>> initInjector() async {
  await _registerAll();

  await _injector.allReady();

  return _getProviders();
}

List<SingleChildWidget> _getProviders() {
  return [
    Provider.value(value: get<InitProvider>()),
    ChangeNotifierProvider.value(value: get<AuthProvider>()),
  ];
}

Future<void> _registerAll() async {
  await _initFirebase();

  _registerRepositories();

  /// Run this function last to ensure dependencies are initialized correcttly
  _registerProviders();
}

Future<void> _initFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  _injector.registerLazySingleton<FirebaseAuth>(
    () => FirebaseAuth.instance,
  );
}

void _registerRepositories() {
  _injector.registerSingleton<AuthRepository>(
    AuthDataRepository(get<FirebaseAuth>()),
  );
}

void _registerProviders() {
  _injector.registerSingleton<InitProvider>(
    InitProvider(
      get<AuthRepository>(),
    ),
  );

  _injector.registerSingleton<AuthProvider>(
    AuthProvider(
      get<AuthRepository>(),
    ),
  );
}

T get<T extends Object>() => _injector<T>();
