import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/goods/detail_comment.dart';
import 'package:flutter_shop/pages/goods/detail_info.dart';
import 'package:flutter_shop/provider/goods_detail_tabbar_provider.dart';
import 'package:provider/provider.dart';

class GoodsInfoCommentGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<GoodsDetailTabBarProvider>(
      builder: (context, provider, _) {
        if (provider.isDetail) {
          return GoodsDetailInfo();
        } else {
          return GoodsComment();
        }
      },
    );
  }
}
