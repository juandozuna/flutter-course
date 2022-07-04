import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract class BaseNotifierProvider with ChangeNotifier {
  bool isLoading = false;
  dynamic error;

  bool get hasError => error != null;

  void startLoading() {
    isLoading = true;
    error = null;
    notifyListeners();
  }

  void stopLoading() {
    isLoading = false;
    notifyListeners();
  }

  void setError(dynamic error) {
    if (error is DioError) {
      if (error.type == DioErrorType.connectTimeout) {
        error = 'Connection timeout';
      } else if (error.type == DioErrorType.receiveTimeout) {
        error = 'Receive timeout';
      } else if (error.type == DioErrorType.response) {
        error = '${error.response!.statusCode} -- ${error.response!.data}';
      } else if (error.type == DioErrorType.cancel) {
        error = 'Request cancelled';
      } else {
        error = 'Unknown error';
      }
    }
    this.error = error;
    isLoading = false;
    notifyListeners();
  }
}
