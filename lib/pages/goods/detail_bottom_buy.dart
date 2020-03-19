import 'package:flutter/material.dart';
import 'package:flutter_shop/model/goods_info.dart';

class DetailBottomBuy extends StatelessWidget {
  GoodsInfo goodsInfo;

  DetailBottomBuy(this.goodsInfo);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.red,
        ),
        child: Text(
          '加入购物车',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
