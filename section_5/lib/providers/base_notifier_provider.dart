import 'package:flutter/foundation.dart';

abstract class BaseNotifierProvider with ChangeNotifier {
  bool isLoading = false;
  dynamic error;

  bool get hasError => error != null;

  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void stopLoading() {
    isLoading = false;
    notifyListeners();
  }

  void setError(dynamic error) {
    this.error = error;
    notifyListeners();
  }
}
