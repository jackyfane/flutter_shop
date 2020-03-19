import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/route/router_handler.dart';

class Routes {
  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        return Container(
          child: Text('Error'),
        );
      },
    );

    router.define('/goodsDetail/:id', handler: goodsDetailHandler);
    router.define('/shopcart', handler: shopcartHandler);
  }
}
