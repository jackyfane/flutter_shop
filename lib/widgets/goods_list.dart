import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoodsListWidget extends StatelessWidget {
  final List goodsList;
  GoodsListWidget(this.goodsList, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _wrapList();
  }

  Widget _wrapList() {
    if (goodsList.length > 0) {
      List<Widget> goodsListWidget = goodsList.map((val) {
        return InkWell(
          onTap: () {},
          child: Container(
            width: ScreenUtil().setWidth(524),
            color: Colors.white,
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.only(bottom: 3.0),
            child: Column(
              children: <Widget>[
                Image.network(
                  val['image'],
                  width: ScreenUtil().setWidth(520),
                ),
                Text(
                  val['goodsName'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.pink,
                    fontSize: ScreenUtil().setSp(26),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Text('¥${val['oriPrice']}'),
                    Text(
                      '¥${val['presentPrice']}',
                      style: TextStyle(
                        color: Colors.black26,
                        decoration: TextDecoration.lineThrough,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      }).toList();
      return Wrap(
        spacing: 2,
        children: goodsListWidget,
      );
    } else {
      return Text('');
    }
  }
}
