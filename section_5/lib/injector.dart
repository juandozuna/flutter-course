import 'package:get_it/get_it.dart';

final _injetor = GetIt.instance;

T get<T>() => _injetor<T>();
