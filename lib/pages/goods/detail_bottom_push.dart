import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/cart_info.dart';
import 'package:flutter_shop/model/goods_info.dart';
import 'package:flutter_shop/provider/cart_counter.dart';
import 'package:flutter_shop/provider/cart_info_provider.dart';
import 'package:provider/provider.dart';

class DetailBottomPush extends StatelessWidget {
  DetailBottomPush(this.goodsInfo);

  GoodsInfo goodsInfo;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.green,
        ),
        child: Text(
          '加入购物车',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
      onTap: () {
        Provider.of<CounterProvider>(context, listen: false).init();
        showDialog(
          context: context,
          builder: (context) {
            return Stack(
              children: <Widget>[
                _goodsInfo(context),
                _goodsPicture(context),
                _submitWidget(context)
              ],
            );
          },
        );
      },
    );
  }

  Widget _goodsInfo(BuildContext context) {
    return Positioned(
      bottom: 0.0,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2 - 100,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          color: Colors.white,
        ),
        child: Container(
          margin: EdgeInsets.only(left: 160, top: 10),
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _priceView(),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  goodsInfo.goodsName,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 50, 0, 0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '数量',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.normal,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    _actionGroup(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _goodsPicture(BuildContext context) {
    return Positioned(
      left: 20,
      top: MediaQuery.of(context).size.height / 2,
      child: Container(
        height: ScreenUtil().setHeight(240),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
          ),
          border: Border.all(
            width: 1,
            color: Colors.black12,
          ),
          color: Colors.white,
        ),
        child: Image.network(goodsInfo.image1),
      ),
    );
  }

  Widget _submitWidget(BuildContext context) {
    return Positioned(
      bottom: 0,
      height: ScreenUtil().setHeight(120),
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
        body: InkWell(
          onTap: () {
            Provider.of<CartInfoProvider>(context, listen: false).addGoodsInfo(
              CartInfo(
                goodsId: goodsInfo.goodsId,
                goodsName: goodsInfo.goodsName,
                imageAddress: goodsInfo.image1,
                price: goodsInfo.presentPrice,
                count:
                    Provider.of<CounterProvider>(context, listen: false).count,
                isChecked: true,
              ),
            );
            Navigator.of(context).pop(false);
          },
          child: Container(
            color: Colors.red,
            alignment: Alignment.center,
            child: Text(
              '确定',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }

  Widget _priceView() {
    List<String> matches = goodsInfo.oriPrice.toString().split(r'.');
    return Container(
      child: RichText(
        text: TextSpan(
          text: '￥',
          style: TextStyle(
            color: Colors.red,
            fontSize: ScreenUtil().setSp(30),
          ),
          children: [
            TextSpan(
              text: '${matches[0]}',
              style: TextStyle(
                color: Colors.red,
                fontSize: ScreenUtil().setSp(50),
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  '.${matches[1].length == 1 ? matches[1] + '0' : matches[1]}',
              style: TextStyle(
                color: Colors.red,
                fontSize: ScreenUtil().setSp(30),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _actionGroup(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(300),
      child: Row(
        children: <Widget>[
          _inkWell('-',
              onTap: () => Provider.of<CounterProvider>(context, listen: false)
                  .reduce()),
          _inkWell('${Provider.of<CounterProvider>(context).count}'),
          _inkWell('+',
              onTap: () => Provider.of<CounterProvider>(context, listen: false)
                  .increment()),
        ],
      ),
    );
  }

  Widget _inkWell(String display, {void onTap()}) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 2),
          color: Color.fromRGBO(234, 234, 234, 1),
          width: ScreenUtil().setWidth(80),
          height: ScreenUtil().setHeight(60),
          child: Text(
            display,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(40),
            ),
          ),
        ),
      ),
    );
  }
}
