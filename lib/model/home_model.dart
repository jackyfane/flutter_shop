import 'package:flutter_shop/model/advertes_picture.dart';
import 'package:flutter_shop/model/category.dart';
import 'package:flutter_shop/model/recommend.dart';
import 'package:flutter_shop/model/shop_info.dart';
import 'package:flutter_shop/model/slides.dart';

import 'floor.dart';
import 'floor_name.dart';
import 'mall_sub_dto.dart';

class HomeInfo {
  String code;
  DataObject data;
  String message;

  HomeInfo({this.code, this.data, this.message});

  HomeInfo.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? new DataObject.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class DataObject {
  AdvertesPicture advertesPicture;
  List<Category> category;
  List<Floor> floor1;
  AdvertesPicture floor1Pic;
  List<Floor> floor2;
  AdvertesPicture floor2Pic;
  List<Floor> floor3;
  AdvertesPicture floor3Pic;
  FloorName floorName;
  AdvertesPicture integralMallPic;
  AdvertesPicture newUser;
  List<Recommend> recommend;
  List<Null> reservationGoods;
  AdvertesPicture saoma;
  ShopInfo shopInfo;
  List<Slides> slides;
  AdvertesPicture toShareCode;

  DataObject(
      {this.advertesPicture,
      this.category,
      this.floor1,
      this.floor1Pic,
      this.floor2,
      this.floor2Pic,
      this.floor3,
      this.floor3Pic,
      this.floorName,
      this.integralMallPic,
      this.newUser,
      this.recommend,
      this.reservationGoods,
      this.saoma,
      this.shopInfo,
      this.slides,
      this.toShareCode});

  DataObject.fromJson(Map<String, dynamic> json) {
    advertesPicture = json['advertesPicture'] != null
        ? new AdvertesPicture.fromJson(json['advertesPicture'])
        : null;
    if (json['category'] != null) {
      category = new List<Category>();
      json['category'].forEach((v) {
        category.add(new Category.fromJson(v));
      });
    }
    if (json['floor1'] != null) {
      floor1 = new List<Floor>();
      json['floor1'].forEach((v) {
        floor1.add(new Floor.fromJson(v));
      });
    }
    floor1Pic = json['floor1Pic'] != null
        ? new AdvertesPicture.fromJson(json['floor1Pic'])
        : null;
    if (json['floor2'] != null) {
      floor2 = new List<Floor>();
      json['floor2'].forEach((v) {
        floor2.add(new Floor.fromJson(v));
      });
    }
    floor2Pic = json['floor2Pic'] != null
        ? new AdvertesPicture.fromJson(json['floor2Pic'])
        : null;
    if (json['floor3'] != null) {
      floor3 = new List<Floor>();
      json['floor3'].forEach((v) {
        floor3.add(new Floor.fromJson(v));
      });
    }
    floor3Pic = json['floor3Pic'] != null
        ? new AdvertesPicture.fromJson(json['floor3Pic'])
        : null;
    floorName = json['floorName'] != null
        ? new FloorName.fromJson(json['floorName'])
        : null;
    integralMallPic = json['integralMallPic'] != null
        ? new AdvertesPicture.fromJson(json['integralMallPic'])
        : null;
    newUser = json['newUser'] != null
        ? new AdvertesPicture.fromJson(json['newUser'])
        : null;
    if (json['recommend'] != null) {
      recommend = new List<Recommend>();
      json['recommend'].forEach((v) {
        recommend.add(new Recommend.fromJson(v));
      });
    }
    if (json['reservationGoods'] != null) {
      reservationGoods = new List<Null>();
      json['reservationGoods'].forEach((v) {
        reservationGoods.add(null);
      });
    }
    saoma = json['saoma'] != null
        ? new AdvertesPicture.fromJson(json['saoma'])
        : null;
    shopInfo = json['shopInfo'] != null
        ? new ShopInfo.fromJson(json['shopInfo'])
        : null;
    if (json['slides'] != null) {
      slides = new List<Slides>();
      json['slides'].forEach((v) {
        slides.add(new Slides.fromJson(v));
      });
    }
    toShareCode = json['toShareCode'] != null
        ? new AdvertesPicture.fromJson(json['toShareCode'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.advertesPicture != null) {
      data['advertesPicture'] = this.advertesPicture.toJson();
    }
    if (this.category != null) {
      data['category'] = this.category.map((v) => v.toJson()).toList();
    }
    if (this.floor1 != null) {
      data['floor1'] = this.floor1.map((v) => v.toJson()).toList();
    }
    if (this.floor1Pic != null) {
      data['floor1Pic'] = this.floor1Pic.toJson();
    }
    if (this.floor2 != null) {
      data['floor2'] = this.floor2.map((v) => v.toJson()).toList();
    }
    if (this.floor2Pic != null) {
      data['floor2Pic'] = this.floor2Pic.toJson();
    }
    if (this.floor3 != null) {
      data['floor3'] = this.floor3.map((v) => v.toJson()).toList();
    }
    if (this.floor3Pic != null) {
      data['floor3Pic'] = this.floor3Pic.toJson();
    }
    if (this.floorName != null) {
      data['floorName'] = this.floorName.toJson();
    }
    if (this.integralMallPic != null) {
      data['integralMallPic'] = this.integralMallPic.toJson();
    }
    if (this.newUser != null) {
      data['newUser'] = this.newUser.toJson();
    }
    if (this.recommend != null) {
      data['recommend'] = this.recommend.map((v) => v.toJson()).toList();
    }
    if (this.reservationGoods != null) {
      data['reservationGoods'] = this.reservationGoods.map((v) => v).toList();
    }
    if (this.saoma != null) {
      data['saoma'] = this.saoma.toJson();
    }
    if (this.shopInfo != null) {
      data['shopInfo'] = this.shopInfo.toJson();
    }
    if (this.slides != null) {
      data['slides'] = this.slides.map((v) => v.toJson()).toList();
    }
    if (this.toShareCode != null) {
      data['toShareCode'] = this.toShareCode.toJson();
    }
    return data;
  }
}







