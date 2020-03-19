import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/pages/route/route_app.dart';
import 'package:provider/provider.dart';

import 'package:flutter_shop/provider/child_category_provider.dart';
import 'package:flutter_shop/model/goods.dart';

// ignore: must_be_immutable
class GoodsList extends StatelessWidget {
  GlobalKey<ClassicsFooterState> _footerKey = GlobalKey<ClassicsFooterState>();
  final _scrollController = new ScrollController(initialScrollOffset: 0.0);

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (context, provider, _) {
        try {
          if (provider.page == 1) {
            _scrollController.jumpTo(0.0);
          }
        } catch (e) {}
        provider.addPage();
        return EasyRefresh(
          refreshFooter: ClassicsFooter(
            key: _footerKey,
            bgColor: Colors.white,
            textColor: Colors.pink,
            noMoreText: provider.noMoreText,
            showMore: true,
            loadingText: '加载中...',
            loadReadyText: '准备加载',
            loadedText: '加载完成',
          ),
          loadMore: provider.getGoodsList,
          onRefresh: provider.getGoodsList,
          child: ListView.builder(
            controller: _scrollController,
            itemCount: provider.goodsList.length,
            itemBuilder: (context, index) {
              return _goodsInkWell(provider.goodsList[index], context);
            },
          ),
        );
      },
    );
  }

  Widget _goodsInkWell(Goods goods, context) {
    return InkWell(
      onTap: () {
        RouteApp.router.navigateTo(context, '/goodsDetail/${goods.goodsId}');
      },
      child: Container(
        padding: EdgeInsets.only(top: 3.0, bottom: 3.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Colors.black12,
            ),
          ),
        ),
        child: Row(
          children: <Widget>[
            _goodsImage(goods),
            Column(
              children: <Widget>[
                _goodsName(goods),
                _goodsPrice(goods),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _goodsImage(Goods goodsInfo) {
    return Container(
      padding: EdgeInsets.only(left: 4.0),
      width: ScreenUtil().setWidth(300),
      child: Image.network(goodsInfo.image),
    );
  }

  Widget _goodsName(Goods goodsInfo) {
    return Container(
      padding: EdgeInsets.all(5.0),
      width: ScreenUtil().setWidth(400),
      child: Text(
        goodsInfo.goodsName,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(36),
        ),
      ),
    );
  }

  Widget _goodsPrice(Goods goodsInfo) {
    return Container(
      margin: EdgeInsets.all(20),
      width: ScreenUtil().setWidth(370),
      child: Row(
        children: <Widget>[
          Text(
            '¥${goodsInfo.presentPrice}',
            style: TextStyle(
              color: Colors.pink,
              fontSize: ScreenUtil().setSp(50),
            ),
          ),
          Container(width: ScreenUtil().setWidth(10)),
          Text(
            '¥${goodsInfo.oriPrice}',
            style: TextStyle(
              color: Colors.black12,
              decoration: TextDecoration.lineThrough,
              fontSize: ScreenUtil().setSp(30),
            ),
          ),
        ],
      ),
    );
  }
}
