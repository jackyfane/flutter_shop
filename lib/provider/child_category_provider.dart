import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_shop/model/goods.dart';
import 'package:flutter_shop/model/mall_sub_dto.dart';
import 'package:flutter_shop/services/service_method.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CategoryProvider with ChangeNotifier {
  List<BxMallSubDto> _categoryList = [];
  List<Goods> _goodsList = [];

  String _categoryId = '';
  String _subId = '';
  String _noMoreText = '';

  int _childIndex = 0;
  int _page = 1;

  List<BxMallSubDto> get categoryList => _categoryList;

  int get childIndex => _childIndex;

  int get page => _page;

  String get categoryId => _categoryId;

  String get subId => _subId;

  String get noMoreText => _noMoreText;

  List<Goods> get goodsList => _goodsList;

  void addPage() {
    _page += 1;
  }

  void setCategoryList(List<BxMallSubDto> categoryList) {
    BxMallSubDto all = BxMallSubDto();
    all.mallSubId = '';
    all.mallCategoryId = categoryList[0].mallCategoryId;
    all.comments = 'null';
    all.mallSubName = '全部';
    _categoryList = [all];
    _categoryList.addAll(categoryList);

    _childIndex = 0;
    _page = 1;
    _categoryId = all.mallCategoryId;
    _subId = all.mallSubId;
    _goodsList.clear();

    getGoodsList();
  }

  void setChildIndex({int index, String categoryId, String subId}) {
    if (_subId != subId) {
      _goodsList.clear();
      _page = 1;
    }
    _noMoreText = '';
    _childIndex = index;
    _categoryId = categoryId;
    _subId = subId;

    getGoodsList();
  }

  // ignore: missing_return
  Future<Void> getGoodsList() async {
    var formData = {
      'categoryId': categoryId,
      'categorySubId': subId,
      'page': page
    };
    await request('getMallGoods', formData: formData).then((value) {
      GoodsModel model = GoodsModel.fromJson(json.decode(value));
      if (model.goodsList == null || model.goodsList.length <= 0) {
        _noMoreText = '没有更多数据';
        Fluttertoast.showToast(
          msg: _noMoreText,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.pink,
          textColor: Colors.white,
          fontSize: 14.0,
        );
      } else {
        _noMoreText = '';
        _goodsList.addAll(model.goodsList);
      }
    });

    notifyListeners();
  }
}
