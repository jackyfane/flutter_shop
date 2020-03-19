import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  int _count = 1;

  void increment() {
    _count++;
    notifyListeners();
  }

  void reduce() {
    if (_count > 1) {
      _count--;
      notifyListeners();
    }
  }

  void init(){
    _count = 1;
  }

  int get count => _count;
}
