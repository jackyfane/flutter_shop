import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_shop/model/cart_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartInfoProvider with ChangeNotifier {
  final String _cartInfoKey = 'cartInfo';
  double totalCharge = 0.0;
  int totalCount = 0;
  List<CartInfo> cartInfoList = [];
  bool checkedAll = false;

  void addGoodsInfo(CartInfo cartInfo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> cartList = prefs.getStringList(_cartInfoKey);
    if (cartList == null || cartList.length <= 0) {
      prefs.setStringList(_cartInfoKey, [json.encode(cartInfo)]);
    } else {
      List<dynamic> mapList = cartList.map((v) => json.decode(v)).toList();
      bool isHave = false;
      for (var map in mapList) {
        if (map['goodsId'] == cartInfo.goodsId) {
          map['count'] = cartInfo.count;
          isHave = true;
        }
        if (isHave) break;
      }

      if (!isHave) mapList.add(cartInfo);
      prefs.setStringList(
          _cartInfoKey, mapList.map((e) => json.encode(e)).toList());
    }

    getCartInfo();
  }

  /**
   * single checked
   */
  void checked(String goodsId, bool checked) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<dynamic> cartList =
        prefs.getStringList(_cartInfoKey).map((v) => json.decode(v)).toList();
    cartList.forEach((cartInfo) {
      if (cartInfo['goodsId'] == goodsId) {
        cartInfo['isChecked'] = checked;
        return;
      }
    });

    prefs.setStringList(
        _cartInfoKey, cartList.map((e) => json.encode(e)).toList());

    getCartInfo();
  }

  /**
   * check all action
   */
  void checkAll(bool checked) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<dynamic> cartList =
        prefs.getStringList(_cartInfoKey).map((v) => json.decode(v)).toList();
    cartList.forEach((cartInfo) {
      cartInfo['isChecked'] = checked;
    });

    prefs.setStringList(
        _cartInfoKey, cartList.map((e) => json.encode(e)).toList());

    getCartInfo();
  }

  void remove({List<String> targets}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (targets == null || targets.length <= 0) {
      prefs.remove(_cartInfoKey);
    } else {
      int index;
      List<dynamic> goodsList =
          prefs.getStringList(_cartInfoKey).map((v) => json.decode(v)).toList();

      targets.forEach((goodsId) {
        index = 0;
        for (var goods in goodsList) {
          if (goodsId == goods['goodsId']) {
            goodsList.removeAt(index);
            break;
          }
          index++;
        }
      });
      prefs.setStringList(
          _cartInfoKey, goodsList.map((e) => json.encode(e)).toList());
    }

    getCartInfo();
  }

  void getCartInfo() async {
    totalCharge = 0;
    totalCount = 0;
    int checkedCount = 0;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> strList = prefs.getStringList(_cartInfoKey);
    if (strList == null || strList.length <= 0) {
      cartInfoList = [];
    } else {
      cartInfoList = strList.map((str) {
        var cartMap = json.decode(str);
        totalCharge +=
            (cartMap['isChecked']) ? cartMap['price'] * cartMap['count'] : 0;
        totalCount += (cartMap['isChecked']) ? cartMap['count'] : 0;
        if (cartMap['isChecked']) checkedCount++;

        return CartInfo.fromJson(cartMap);
      }).toList();

      if (checkedCount == cartInfoList.length) {
        checkedAll = true;
      } else {
        checkedAll = false;
      }
    }

    notifyListeners();
  }
}
