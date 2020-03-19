import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/category.dart';
import 'package:flutter_shop/model/mall_sub_dto.dart';
import 'package:flutter_shop/provider/child_category_provider.dart';
import 'package:flutter_shop/services/service_method.dart';
import 'package:provider/provider.dart';

/// 左侧大类导航
class LeftNavigator extends StatefulWidget {
  @override
  _LeftNavigatorState createState() => _LeftNavigatorState();
}

class _LeftNavigatorState extends State<LeftNavigator> {
  List _categoryList = [];
  int _currentIndex = 0;

  @override
  void initState() {
    _getCategories();
    super.initState();
  }

  void _getCategories() async {
    await request('getCategory').then((val) {
      CategoryModel model = CategoryModel.fromJson(json.decode(val));
      setState(() {
        _categoryList = model.categoryList;
      });
      _setProviderData(_categoryList[0].bxMallSubDto);
    });
  }

  void _setProviderData(List<BxMallSubDto> categoryList) {
    Provider.of<CategoryProvider>(context, listen: false)
        .setCategoryList(categoryList);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(243, 243, 243, 1),
        border: Border(
          right: BorderSide(width: 1, color: Color.fromRGBO(243, 243, 243, 1)),
        ),
      ),
      child: ListView.builder(
        itemCount: _categoryList.length,
        itemBuilder: (BuildContext context, int index) => _leftInkWell(index),
      ),
    );
  }

  Widget _leftInkWell(int index) {
    bool _isClicked = false;
    _isClicked = _currentIndex == index;

    return InkWell(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
        _setProviderData(_categoryList[index].bxMallSubDto);
      },
      child: Container(
        padding: EdgeInsets.only(left: 10),
        height: ScreenUtil().setHeight(120),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: _isClicked ? Color.fromRGBO(243, 243, 243, 1) : Colors.white,
          border: Border(
            top: BorderSide(width: 1, color: Colors.black12),
          ),
        ),
        child: Text(
          _categoryList[index].mallCategoryName,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(38),
            color: _isClicked ? Colors.pink : Colors.black,
          ),
        ),
      ),
    );
  }
}
