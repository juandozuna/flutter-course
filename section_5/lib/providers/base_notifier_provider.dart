import 'package:flutter/foundation.dart';

abstract class BaseNotifierProvider with ChangeNotifier {
  bool isLoading = false;
  Exception? error;

  bool get hasError => error != null;

  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void stopLoading() {
    isLoading = false;
    notifyListeners();
  }

  void setError(Exception error) {
    this.error = error;
    notifyListeners();
  }
}
