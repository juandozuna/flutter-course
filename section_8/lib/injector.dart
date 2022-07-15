import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:section_8/data/repositories/auth_data_repository.dart';
import 'package:section_8/data/repositories/device_data_repository.dart';
import 'package:section_8/data/repositories/file_data_repository.dart';
import 'package:section_8/data/services/geocoding_data_service.dart';
import 'package:section_8/data/services/image_data_service.dart';
import 'package:section_8/data/services/location_data_service.dart';
import 'package:section_8/domain/repositories/auth_repository.dart';
import 'package:section_8/domain/repositories/chat_repository.dart';
import 'package:section_8/domain/repositories/device_repository.dart';
import 'package:section_8/domain/repositories/file_repository.dart';
import 'package:section_8/domain/service/geocoding_service.dart';
import 'package:section_8/domain/service/image_service.dart';
import 'package:section_8/domain/service/location_service.dart';
import 'package:section_8/firebase_options.dart';
import 'package:section_8/presentation/constants/routes.dart';
import 'package:section_8/presentation/providers/auth_provider.dart';
import 'package:section_8/presentation/providers/chat_provider.dart';
import 'package:section_8/presentation/providers/init_provider.dart';
import 'package:section_8/presentation/providers/map_provider.dart';

import 'data/repositories/chat_data_repository.dart';

final _injector = GetIt.instance;

Future<List<SingleChildWidget>> initInjector() async {
  await _registerAll();

  await _injector.allReady();

  return _getProviders();
}

List<SingleChildWidget> _getProviders() {
  return [
    Provider.value(value: get<InitProvider>()),
    Provider.value(value: get<MapProvider>()),
    ChangeNotifierProvider.value(value: get<AuthProvider>()),
    ChangeNotifierProvider.value(value: get<ChatProvider>()),
  ];
}

Future<void> _registerAll() async {
  await _initFirebase();

  _registerPackages();
  _registerServices();
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

  _injector.registerLazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );

  _injector.registerLazySingleton<FirebaseStorage>(
    () => FirebaseStorage.instance,
  );
}

void _registerPackages() {
  _injector.registerLazySingleton<ImagePicker>(() => ImagePicker());
}

void _registerServices() {
  _injector.registerSingleton<LocationService>(LocationDataService());
  _injector.registerSingleton<GeocodingService>(GeocodingDataService());
  _injector.registerSingleton<ImageService>(
    ImageDataService(get<ImagePicker>()),
  );
}

void _registerRepositories() {
  _injector.registerSingleton<AuthRepository>(
    AuthDataRepository(get<FirebaseAuth>()),
  );

  _injector.registerSingleton<FileRepository>(
    FileDataRepository(get<FirebaseStorage>()),
  );

  _injector.registerSingleton<ChatRepository>(
    ChatDataRepository(
      get<AuthRepository>(),
      get<FirebaseFirestore>(),
      get<LocationService>(),
      get<GeocodingService>(),
      get<ImageService>(),
    ),
  );

  _injector.registerSingleton<DeviceRepository>(
    DeviceDataRepository(get<LocationService>()),
  );
}

void _registerProviders() {
  _injector.registerSingleton<InitProvider>(
    InitProvider(
      get<AuthRepository>(),
      get<DeviceRepository>(),
      AppRoute.navKey,
    ),
  );

  _injector.registerSingleton<AuthProvider>(
    AuthProvider(
      get<AuthRepository>(),
    ),
  );

  _injector.registerSingleton<ChatProvider>(
    ChatProvider(
      get<AuthRepository>(),
      get<ChatRepository>(),
      get<ImageService>(),
      get<FileRepository>(),
    ),
  );

  _injector.registerSingleton<MapProvider>(
    MapProvider(
      get<DeviceRepository>(),
      get<FileRepository>(),
    ),
  );
}

T get<T extends Object>() => _injector<T>();
