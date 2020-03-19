import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/provider/cart_info_provider.dart';
import 'package:provider/provider.dart';

class CartBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(150),
      width: ScreenUtil().setHeight(ScreenUtil.screenWidth),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.white12,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          _checkAll(context),
          _aggregateCharge(context),
          _settleAccountsButton(context),
        ],
      ),
    );
  }

  Container _checkAll(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(280),
      child: Row(
        children: <Widget>[
          Checkbox(
            value: Provider.of<CartInfoProvider>(context).checkedAll,
            onChanged: (checked) {
              Provider.of<CartInfoProvider>(context, listen: false)
                  .checkAll(checked);
            },
            activeColor: Colors.red,
          ),
          Text(
            '全选',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(40),
            ),
          ),
        ],
      ),
    );
  }

  Column _aggregateCharge(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          child: Row(
            children: <Widget>[
              Text(
                '合计 : ',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(45),
                ),
              ),
              Text(
                '￥ ${Provider.of<CartInfoProvider>(context).totalCharge.toStringAsFixed(2)}',
                style: TextStyle(
                  color: Colors.pink,
                  fontSize: ScreenUtil().setSp(45),
                ),
              ),
            ],
          ),
        ),
        Text(
          '满99元免配送费，预购免配送费',
          style: TextStyle(
            fontSize: ScreenUtil().setSp(26),
          ),
        ),
      ],
    );
  }

  Widget _settleAccountsButton(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 20, right: 0.0),
        width: ScreenUtil().setWidth(360),
        height: ScreenUtil().setHeight(100),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: RichText(
          text: TextSpan(
            text: '去结算',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(45),
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            children: [
              TextSpan(
                text: '(${Provider.of<CartInfoProvider>(context).totalCount}件)',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(30),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
