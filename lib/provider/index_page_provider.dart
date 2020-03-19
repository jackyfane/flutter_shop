import 'package:flutter/material.dart';

class IndexPageProvider with ChangeNotifier {
  int _currentIndex = 0;

  get currentIndex => _currentIndex;

  void setCurrentIndex(index) {
    _currentIndex = index;
    notifyListeners();
  }
}
