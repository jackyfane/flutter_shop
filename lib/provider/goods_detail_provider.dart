import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_shop/model/goods_detail.dart';
import 'package:flutter_shop/services/service_method.dart';

class GoodsDetailProvider with ChangeNotifier {
  GoodsDetail _goodsDetail;
  String _goodsName = '商品详情';
  String _adPictureAddress;

  void queryGoodsDetailInfo(String goodsId) async {
    await request('getGoodDetailById', formData: {'goodId': goodsId})
        .then((value) {
      _goodsDetail = GoodsDetail.fromJson(json.decode(value));
      _goodsName = _goodsDetail.dataObject.goodsInfo.goodsName;
      _adPictureAddress = _goodsDetail.dataObject.advertesPicture.pICTUREADDRESS;

      notifyListeners();
    });
  }

  get goodsDetail => _goodsDetail;

  get goodsName => _goodsName;

  get adPictureAddress => _adPictureAddress;
}
