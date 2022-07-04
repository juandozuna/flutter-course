import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';

/// Here all the things that have to do with networking.

Dio createClient() {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://reqres.in/api/',
    connectTimeout: 5000,
    receiveTimeout: 3000,
    contentType: 'application/json',
  ));

  dio.interceptors.add(
    DioLoggingInterceptor(
      compact: false,
      level: Level.body,
    ),
  );

  return dio;
}
