import 'package:flutter_shop/model/goods_comments.dart';
import 'package:flutter_shop/model/advertes_picture.dart';
import 'package:flutter_shop/model/goods_info.dart';

class GoodsDetail {
  String code;
  String message;
  DataObject dataObject;

  GoodsDetail({this.code, this.message, this.dataObject});

  GoodsDetail.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    dataObject =
        json['data'] != null ? new DataObject.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.dataObject != null) {
      data['data'] = this.dataObject.toJson();
    }
    return data;
  }
}

class DataObject {
  GoodsInfo goodsInfo;
  List<GoodsComments> goodComments;
  AdvertesPicture advertesPicture;

  DataObject({this.goodsInfo, this.goodComments, this.advertesPicture});

  DataObject.fromJson(Map<String, dynamic> json) {
    goodsInfo = json['goodInfo'] != null
        ? new GoodsInfo.fromJson(json['goodInfo'])
        : null;
    if (json['goodComments'] != null) {
      goodComments = new List<GoodsComments>();
      json['goodComments'].forEach((v) {
        goodComments.add(new GoodsComments.fromJson(v));
      });
    }
    advertesPicture = json['advertesPicture'] != null
        ? new AdvertesPicture.fromJson(json['advertesPicture'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.goodsInfo != null) {
      data['goodInfo'] = this.goodsInfo.toJson();
    }
    if (this.goodComments != null) {
      data['goodComments'] = this.goodComments.map((v) => v.toJson()).toList();
    }
    if (this.advertesPicture != null) {
      data['advertesPicture'] = this.advertesPicture.toJson();
    }
    return data;
  }
}