import 'package:flutter/material.dart';

class GoodsDetailTabBarProvider with ChangeNotifier {
  bool isDetail = true;
  bool isComment = false;

  void selectedTabBar(index){
    if (index == 0) {
      isDetail = true;
      isComment = false;
    } else {
      isDetail = false;
      isComment = true;
    }

    notifyListeners();
  }
}
