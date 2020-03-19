import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/provider/index_page_provider.dart';
import 'package:provider/provider.dart';
import 'home.dart';
import 'cart/cart_main.dart';
import 'category/category_main.dart';
import 'member/member_main.dart';

class IndexPage extends StatelessWidget {
  final String title;

  IndexPage({Key key, this.title}) : super(key: key);

  final List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      title: Text("首页"),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.search),
      title: Text("分类"),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.shopping_cart),
      title: Text("购物车"),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.profile_circled),
      title: Text("会员中心"),
    ),
  ];

  final List<Widget> tabBodies = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    MemberPage(),
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context); //不可在initState()中初始化

    return Scaffold(
      body: IndexedStack(
        index: Provider.of<IndexPageProvider>(context).currentIndex,
        children: tabBodies,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: items,
        currentIndex: Provider.of<IndexPageProvider>(context).currentIndex,
        onTap: (index) {
          Provider.of<IndexPageProvider>(context, listen: false)
              .setCurrentIndex(index);
        },
      ),
    );
  }
}
