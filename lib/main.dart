import 'package:flutter/material.dart';
import 'package:flutter_shop/provider/cart_counter.dart';
import 'package:provider/provider.dart';

import 'package:flutter_shop/provider/child_category_provider.dart';
import 'package:flutter_shop/provider/goods_detail_provider.dart';
import 'package:flutter_shop/provider/goods_detail_tabbar_provider.dart';
import 'package:flutter_shop/provider/index_page_provider.dart';
import 'package:flutter_shop/shop_app.dart';
import 'package:flutter_shop/provider/cart_info_provider.dart';

void main() {
  final providers = [
    ChangeNotifierProvider(create: (context) => CategoryProvider()),
    ChangeNotifierProvider(create: (context) => GoodsDetailProvider()),
    ChangeNotifierProvider(create: (context) => GoodsDetailTabBarProvider()),
    ChangeNotifierProvider(create: (context) => IndexPageProvider()),
    ChangeNotifierProvider(create: (context) => CartInfoProvider()),
    ChangeNotifierProvider(create: (context) => CounterProvider()),
  ];

  return runApp(
    MultiProvider(
      providers: providers,
      child: ShopApp(),
    ),
  );
}
