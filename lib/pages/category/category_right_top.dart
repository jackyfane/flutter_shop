import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/provider/child_category_provider.dart';
import 'package:provider/provider.dart';

class RightTopNavigator extends StatefulWidget {
  @override
  _RightTopNavigatorState createState() => _RightTopNavigatorState();
}

class _RightTopNavigatorState extends State<RightTopNavigator> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (context, childCategory, _) {
        return Container(
          height: ScreenUtil().setHeight(110),
          padding: EdgeInsets.only(left: 4.0),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1.0,
                color: Colors.black12,
              ),
            ),
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: childCategory.categoryList.length,
            itemBuilder: (BuildContext context, int index) {
              return _item(childCategory.categoryList[index], index);
            },
          ),
        );
      },
    );
  }

  Widget _item(bxMallSubDto, index) {
    bool isClicked = index == Provider.of<CategoryProvider>(context).childIndex;
    return InkWell(
      onTap: () {
        Provider.of<CategoryProvider>(context, listen: false).setChildIndex(
          index: index,
          categoryId: bxMallSubDto.mallCategoryId,
          subId: bxMallSubDto.mallSubId,
        );
      },
      child: Container(
        height: ScreenUtil().setHeight(90),
        width: ScreenUtil().setWidth(bxMallSubDto.mallSubName.length * 50),
        alignment: Alignment.center,
        color: Colors.white,
        child: Text(
          bxMallSubDto.mallSubName,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(38),
            color: isClicked ? Colors.pink : Colors.black,
          ),
        ),
      ),
    );
  }
}
