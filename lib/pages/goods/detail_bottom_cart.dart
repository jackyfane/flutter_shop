import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/pages/route/route_app.dart';
import 'package:flutter_shop/provider/cart_info_provider.dart';
import 'package:flutter_shop/provider/index_page_provider.dart';
import 'package:provider/provider.dart';

class DetailBottomCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        InkWell(
          onTap: () {
            RouteApp.router.pop(context);
            Provider.of<IndexPageProvider>(context, listen: false)
                .setCurrentIndex(2);
          },
          child: Container(
            alignment: Alignment.center,
            color: Colors.white,
            width: ScreenUtil().setWidth(200),
            child: Icon(
              Icons.shopping_cart,
              color: Colors.pink[300],
              size: 26,
            ),
          ),
        ),
        Provider.of<CartInfoProvider>(context).totalCount == 0
            ? Text('')
            : _countDiagram(context),
      ],
    );
  }

  Widget _countDiagram(context) {
    return Positioned(
      right: ScreenUtil().setSp(45),
      top: ScreenUtil().setSp(4),
      child: Container(
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(45),
        height: ScreenUtil().setHeight(45),
        decoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
        child: Text(
          '${Provider.of<CartInfoProvider>(context).totalCount}',
          style: TextStyle(
            fontSize: 9,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
