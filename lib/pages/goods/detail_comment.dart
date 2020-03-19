import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/goods_comments.dart';
import 'package:flutter_shop/model/goods_detail.dart';
import 'package:flutter_shop/pages/advertes.dart';
import 'package:flutter_shop/pages/comment.dart';
import 'package:flutter_shop/provider/goods_detail_provider.dart';
import 'package:provider/provider.dart';

class GoodsComment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<GoodsDetailProvider>(
      builder: (context, provider, _) {
        if (provider.goodsDetail != null) {
          List<GoodsComments> comments =
              provider.goodsDetail.dataObject.goodComments;
          if (comments.length > 0) {
            return Column(
              children: <Widget>[
                Comment(comments),
                Advertisement(advertUrl: provider.adPictureAddress),
              ],
            );
          } else {
            return _noComment(adPictureAddress: provider.adPictureAddress);
          }
        } else {
          return _noComment();
        }
      },
    );
  }

  Widget _noComment({adPictureAddress}) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 15),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            height: ScreenUtil().setHeight(200),
            child: Text('没有更多评论'),
          ),
          Advertisement(advertUrl: adPictureAddress),
        ],
      ),
    );
  }
}
