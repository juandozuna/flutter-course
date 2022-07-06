import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';
import 'package:section_5/packges/user_preferences_package.dart';

/// Here all the things that have to do with networking.

Dio createClient(UserPreferencesPackage userPreferencesPackage) {
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
  // dio.interceptors.add(
  //   TokenInterceptor(userPreferencesPackage),
  // );

  return dio;
}

class TokenInterceptor extends Interceptor {
  final UserPreferencesPackage userPreferencesPackage;

  TokenInterceptor(this.userPreferencesPackage);

  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final hasToken = await userPreferencesPackage.hasToken();
    if (!hasToken) return options;

    final token = await userPreferencesPackage.getToken();
    options.headers['Authorization'] = 'Bearer $token';
    return options;
  }
}
