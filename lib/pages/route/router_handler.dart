import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/cart/cart_main.dart';
import 'package:flutter_shop/pages/goods/detail_main.dart';

Handler goodsDetailHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return GoodsDetailScreen(goodsId: params['id'].first);
  },
);

Handler shopcartHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return CartPage();
  },
);
