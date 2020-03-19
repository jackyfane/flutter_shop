import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_shop/model/goods_detail.dart';
import 'package:flutter_shop/model/goods_info.dart';
import 'package:flutter_shop/pages/advertes.dart';
import 'package:flutter_shop/provider/goods_detail_provider.dart';
import 'package:provider/provider.dart';

class GoodsDetailInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<GoodsDetailProvider>(
      builder: (context, provider, _) {
        GoodsDetail goodsDetail = provider.goodsDetail;
        if (goodsDetail != null) {
          GoodsInfo goodsInfo = goodsDetail.dataObject.goodsInfo;

          return Column(
            children: <Widget>[
              Html(data: goodsInfo.goodsDetail),
              Advertisement(advertUrl: provider.adPictureAddress),
            ],
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
