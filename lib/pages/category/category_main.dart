import 'dart:convert';

import 'package:flutter/material.dart';
import 'category_goods_list.dart';
import 'category_left_nav.dart';
import 'category_right_top.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品分类'),
        centerTitle: false,
      ),
      body: Row(
        children: <Widget>[
          Expanded(flex: 2, child: LeftNavigator()),
          Expanded(
            flex: 7,
            child: Column(
              children: <Widget>[
                RightTopNavigator(),
                Expanded(child: GoodsList()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
