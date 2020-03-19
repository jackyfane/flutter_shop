import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/provider/goods_detail_tabbar_provider.dart';
import 'package:provider/provider.dart';

class DetailTabBarView extends StatelessWidget {
  const DetailTabBarView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(top: 10),
      height: ScreenUtil().setHeight(100),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          _leftTabBarItem(context, '详情', 0),
          _rightTabBarItem(context, '评价', 1),
        ],
      ),
    );
  }

  Widget _leftTabBarItem(context, title, index) {
    Color itemColor = Provider.of<GoodsDetailTabBarProvider>(context).isDetail
        ? Colors.pink
        : Colors.white;

    Color fontColor = Provider.of<GoodsDetailTabBarProvider>(context).isDetail
        ? Colors.pink
        : Colors.black;

    return _tabBarItem(
      context,
      title,
      index: index,
      itemColor: itemColor,
      fontColor: fontColor,
    );
  }

  Widget _rightTabBarItem(context, title, index) {
    Color itemColor = Provider.of<GoodsDetailTabBarProvider>(context).isComment
        ? Colors.pink
        : Colors.white;
    Color fontColor = Provider.of<GoodsDetailTabBarProvider>(context).isComment
        ? Colors.pink
        : Colors.black;

    return _tabBarItem(
      context,
      title,
      index: index,
      itemColor: itemColor,
      fontColor: fontColor,
    );
  }

  Widget _tabBarItem(context, title, {index, itemColor, fontColor}) {
    return InkWell(
      onTap: () {
        Provider.of<GoodsDetailTabBarProvider>(context, listen: false)
            .selectedTabBar(index);
      },
      child: Container(
        width: ScreenUtil().setWidth(530),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: itemColor,
            ),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: fontColor,
          ),
        ),
      ),
    );
  }
}
