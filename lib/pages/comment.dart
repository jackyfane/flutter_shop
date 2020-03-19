import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/goods_comments.dart';

class Comment extends StatelessWidget {
  Comment(this.comments);

  final List<GoodsComments> comments;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 6),
      color: Colors.white,
//      height: ScreenUtil().setHeight(comments.length * 260),
      child: Column(
        children: comments.map((m) => _userComment(context, m)).toList(),
      ),
    );
  }

  Widget _userComment(context, comment) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      width: ScreenUtil.screenWidth,
      height: ScreenUtil().setHeight(260),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _commentHeader(context, comment),
          _commentContent(comment.comments),
        ],
      ),
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(
          width: 1,
          color: Colors.black12,
        ),
      )),
    );
  }

  Widget _commentContent(content) {
    return Container(
      child: Text(
        content,
        style: TextStyle(
          fontSize: 16,
        ),
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _commentHeader(context, comment) {
    return Container(
      width: ScreenUtil.screenWidth,
      height: ScreenUtil().setHeight(100),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                _avatar(),
                Container(
                  margin: EdgeInsets.only(left: 6),
                  child: Text(
                    '${comment.userName}',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                _scoreStart(context, comment.sCORE),
              ],
            ),
          ),
          _commentTime(comment.discussTime),
        ],
      ),
    );
  }

  Widget _avatar({url}) {
    return Container(
      width: ScreenUtil().setWidth(80),
      child: CircleAvatar(
        child: url != null ? Image.network(url) : Icon(Icons.account_circle),
      ),
    );
  }

  Widget _scoreStart(context, scores) {
    return Container(
      margin: EdgeInsets.only(left: 6),
      width: ScreenUtil().setWidth(200),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: scores,
        itemBuilder: (context, index) {
          return Icon(
            Icons.star,
            color: Colors.red,
            size: 16,
          );
        },
      ),
    );
  }

  Widget _commentTime(time) {
    var commentTime = DateTime.fromMillisecondsSinceEpoch(time);
    return Container(
      margin: EdgeInsets.only(right: 0),
      child: Text(
        formatDate(commentTime, [yyyy, '-', mm, '-', dd]),
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey,
        ),
      ),
    );
  }
}
