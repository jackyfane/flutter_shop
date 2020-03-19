import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/provider/index_page_provider.dart';
import 'package:provider/provider.dart';

class CartEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: ScreenUtil().setHeight(260),
            width: ScreenUtil().setWidth(260),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black12,
            ),
            child: Icon(
              Icons.shopping_cart,
              size: ScreenUtil().setSp(160),
              color: Colors.white,
            ),
          ),
          Container(
            child: Text('购物车还空着，快去选购吧。'),
            margin: EdgeInsets.only(top: 20),
          ),
          InkWell(
            onTap: () {
              Provider.of<IndexPageProvider>(context, listen: false)
                  .setCurrentIndex(0);
            },
            child: Container(
              margin: EdgeInsets.only(top: 20),
              alignment: Alignment.center,
              height: ScreenUtil().setHeight(70),
              width: ScreenUtil().setWidth(360),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                '随便逛逛',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
