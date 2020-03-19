import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/pages/goods/detail_bottom_buy.dart';
import 'package:flutter_shop/pages/goods/detail_bottom_push.dart';
import 'package:provider/provider.dart';

import 'package:flutter_shop/model/goods_info.dart';
import 'package:flutter_shop/pages/goods/detail_bottom_cart.dart';
import 'package:flutter_shop/provider/goods_detail_provider.dart';

class DetailBottom extends StatelessWidget {
  const DetailBottom({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GoodsDetailProvider>(
      builder: (context, provider, _) {
        if (provider.goodsDetail != null) {
          GoodsInfo goodsInfo = provider.goodsDetail.dataObject.goodsInfo;
          return Container(
            height: ScreenUtil().setHeight(120),
            width: ScreenUtil().setWidth(ScreenUtil.screenWidth),
            child: Row(
              children: <Widget>[
                DetailBottomCart(),
                Expanded(child: DetailBottomPush(goodsInfo)),
                Expanded(child: DetailBottomBuy(goodsInfo))
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
