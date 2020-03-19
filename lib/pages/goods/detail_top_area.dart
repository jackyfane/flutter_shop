import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/goods_detail.dart';
import 'package:flutter_shop/model/goods_info.dart';
import 'package:flutter_shop/provider/goods_detail_provider.dart';
import 'package:provider/provider.dart';

class DetailTopArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<GoodsDetailProvider>(
      builder: (context, provider, _) {
        GoodsDetail goodsDetail = provider.goodsDetail;
        if (goodsDetail != null) {
          GoodsInfo goodsInfo = goodsDetail.dataObject.goodsInfo;
          return Container(
            child: Column(
              children: <Widget>[
                _goodsBaseInfo(goodsInfo),
                _explainInfo(),
              ],
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _goodsBaseInfo(GoodsInfo goodsInfo) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _goodsImage(goodsInfo),
          _goodsName(goodsInfo),
          _deliverTag(),
          _goodsSerialnumber(goodsInfo),
          _goodsPrice(goodsInfo)
        ],
      ),
    );
  }

  Widget _goodsPrice(GoodsInfo goodsInfo) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      height: ScreenUtil().setHeight(120),
      child: Row(
        children: <Widget>[
          Text(
            '￥${goodsInfo.presentPrice}',
            style: TextStyle(
              color: Colors.red,
              fontSize: 14,
            ),
          ),
          Container(width: 30),
          Text(
            '市场价:',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
          Container(width: 10),
          Text(
            '￥${goodsInfo.oriPrice}',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black26,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ],
      ),
    );
  }

  Widget _goodsSerialnumber(GoodsInfo goodsInfo) {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 10),
      child: Text(
        '编号:${goodsInfo.goodsSerialNumber}',
        style: TextStyle(color: Colors.black38, fontSize: 14),
      ),
    );
  }

  Widget _deliverTag() {
    return Container(
      width: ScreenUtil().setWidth(250),
      height: ScreenUtil().setHeight(50),
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 10, top: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.lightGreenAccent[200],
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(2.0),
      ),
      child: Text(
        '支持配送到家',
        style: TextStyle(
          fontSize: 12,
          color: Colors.lightGreenAccent[700],
        ),
      ),
    );
  }

  Widget _goodsName(GoodsInfo goodsInfo) {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 10),
      alignment: Alignment.centerLeft,
      child: Text(
        goodsInfo.goodsName,
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _goodsImage(GoodsInfo goodsInfo) {
    return Center(
      child: Image.network(
        goodsInfo.image1,
        fit: BoxFit.fill,
        width: ScreenUtil().setWidth(ScreenUtil.screenWidth),
      ),
    );
  }

  Widget _explainInfo() {
    return Container(
      color: Colors.white,
      height: ScreenUtil().setHeight(100),
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(left: 10),
      child: Text(
        '说明 : >极速送达 > 正品保证',
        style: TextStyle(
          color: Colors.red[400],
          fontSize: 14,
        ),
      ),
    );
  }
}
