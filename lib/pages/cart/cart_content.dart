import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/cart_info.dart';
import 'package:flutter_shop/provider/cart_info_provider.dart';
import 'package:provider/provider.dart';

class CartContent extends StatelessWidget {
  CartInfo cartInfo;

  CartContent(this.cartInfo);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(260),
      width: ScreenUtil.screenWidth,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Color.fromRGBO(234, 234, 234, 1),
          ),
        ),
      ),
      child: Row(
        children: <Widget>[
          Checkbox(
            value: cartInfo.isChecked,
            onChanged: (checked) {
              Provider.of<CartInfoProvider>(context, listen: false)
                  .checked(cartInfo.goodsId, checked);
            },
          ),
          _goodsImage(),
          Expanded(
            child: Column(
              children: <Widget>[
                _titleAndPrice(),
                _actionRow(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _goodsImage() {
    return Container(
      width: ScreenUtil().setWidth(260),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.black12,
        ),
      ),
      child: Image.network(
        this.cartInfo.imageAddress,
      ),
    );
  }

  Widget _titleAndPrice() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 8, top: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Text(
                cartInfo.goodsName,
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(40),
                ),
              ),
            ),
            _priceView(),
          ],
        ),
      ),
    );
  }

  Widget _priceView() {
    List<String> matches = cartInfo.price.toString().split(r'.');
    return Container(
      alignment: Alignment.topRight,
      margin: EdgeInsets.only(right: 10),
      width: ScreenUtil().setWidth(260),
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

  Widget _actionRow(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Row(
        children: <Widget>[
          _actionGroup(context),
          _removeAction(context),
        ],
      ),
    );
  }

  Widget _removeAction(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(260),
      child: InkWell(
        onTap: () {
          Provider.of<CartInfoProvider>(context, listen: false)
              .remove(targets: [cartInfo.goodsId]);
        },
        child: Icon(
          Icons.delete_forever,
          size: 30,
          color: Colors.black26,
        ),
      ),
    );
  }

  Widget _actionGroup(BuildContext context) {
    return Expanded(
      child: Container(
        child: Row(
          children: <Widget>[
            _inkWell('-', onTap: () {
              _reduceOrAddCount(context, '-');
            }),
            _inkWell(cartInfo.count.toString()),
            _inkWell('+', onTap: () {
              _reduceOrAddCount(context, '+');
            }),
          ],
        ),
      ),
    );
  }

  InkWell _inkWell(String display, {void onTap()}) {
    return InkWell(
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
    );
  }

  void _reduceOrAddCount(BuildContext context, String type) {
    if (type == '+') {
      cartInfo.count += 1;
    } else {
      if (cartInfo.count > 1) cartInfo.count -= 1;
    }
    Provider.of<CartInfoProvider>(context, listen: false)
        .addGoodsInfo(cartInfo);
  }
}
