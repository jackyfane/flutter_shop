import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/pages/route/route_app.dart';

class _FloorTitle extends StatelessWidget {
  final String pictureAddress;

  _FloorTitle({Key key, this.pictureAddress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Image.network(pictureAddress),
    );
  }
}

class _FloorContent extends StatelessWidget {
  final List floorGoodsList;

  _FloorContent({Key key, this.floorGoodsList}) : super(key: key);

  Widget _goodsItem(context, floorMap) {
    return Container(
      margin: EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        onTap: () {
          RouteApp.router
              .navigateTo(context, '/goodsDetail/${floorMap['goodsId']}');
        },
        child: Image.network(floorMap['image']),
      ),
      width: ScreenUtil().setWidth(520),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              _goodsItem(context, floorGoodsList[0]),
              Column(
                children: <Widget>[
                  _goodsItem(context, floorGoodsList[1]),
                  _goodsItem(context, floorGoodsList[2]),
                ],
              )
            ],
          ),
          Row(
            children: <Widget>[
              _goodsItem(context, floorGoodsList[3]),
              _goodsItem(context, floorGoodsList[4]),
            ],
          )
        ],
      ),
    );
  }
}

class FloorWidget extends StatelessWidget {
  final String pictureAddress;
  final List goodsList;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _FloorTitle(pictureAddress: pictureAddress),
          _FloorContent(floorGoodsList: goodsList),
        ],
      ),
    );
  }

  FloorWidget({Key key, this.pictureAddress, this.goodsList}) : super(key: key);
}
