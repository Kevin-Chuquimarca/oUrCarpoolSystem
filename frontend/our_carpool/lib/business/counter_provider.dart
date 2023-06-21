import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  int value = 0;
  int value2 = 0;

  void increment() {
    value += 1;
    notifyListeners();
  }
}
