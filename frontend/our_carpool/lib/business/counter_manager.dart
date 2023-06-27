import 'package:flutter/material.dart';

class CounterManager with ChangeNotifier {
  int value = 0;
  int value2 = 0;

  void increment() {
    value += 1;
    notifyListeners();
  }
}
