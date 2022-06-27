

import 'package:flutter/material.dart';

class SomeState with ChangeNotifier {
  void someFunc() {
    notifyListeners(); //Esta función viene desde el Mixin ChangeNotifier
  }
}

