import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/pages/goods/detail_bottom.dart';
import 'package:flutter_shop/pages/goods/detail_info_comment.dart';
import 'package:flutter_shop/pages/goods/detail_top_area.dart';
import 'package:flutter_shop/provider/goods_detail_provider.dart';
import 'package:provider/provider.dart';

import 'detail_tabbar.dart';

// ignore: must_be_immutable
class GoodsDetailScreen extends StatelessWidget {
  GoodsDetailScreen({this.goodsId});

  String goodsId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: _queryGoodsInfo(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                title:
                    Text(Provider.of<GoodsDetailProvider>(context).goodsName),
                centerTitle: false,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              body: Container(
                width: ScreenUtil().setWidth(ScreenUtil.screenWidth),
                color: Color.fromRGBO(234, 234, 234, 1),
                child: Stack(
                  children: <Widget>[
                    ListView(
                      children: <Widget>[
                        DetailTopArea(),
                        DetailTabBarView(),
                        GoodsInfoCommentGroup(),
                      ],
                    ),
                    Positioned(
                      bottom: 0.0,
                      child: SafeArea(child: DetailBottom()),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Container(
              child: Center(
                child: CircularProgressIndicator(value: 10.0),
              ),
            );
          }
        },
      ),
    );
  }

  // ignore: missing_return
  Future _queryGoodsInfo(context) async {
    Provider.of<GoodsDetailProvider>(context, listen: false)
        .queryGoodsDetailInfo(goodsId);

    return 'OK';
  }
}
