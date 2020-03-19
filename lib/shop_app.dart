import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/index.dart';
import 'package:flutter_shop/pages/route/route_app.dart';
import 'package:flutter_shop/pages/route/routes.dart';

class ShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String _title = '百姓生活+';
    final router = Router();
    Routes.configureRoutes(router);
    RouteApp.router = router;

    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: IndexPage(title: _title),
      onGenerateRoute: RouteApp.router.generator,
    );
  }
}
