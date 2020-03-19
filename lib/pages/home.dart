import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/route/route_app.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import '../services/service_method.dart';
import '../widgets/floor_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  GlobalKey<RefreshFooterState<RefreshFooter>> footerKey;
  List _hotGoodsList = [];
  int page = 1;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    footerKey = GlobalKey<RefreshFooterState<RefreshFooter>>();
  }

  @override
  Widget build(BuildContext context) {
    var formData = {'lon': '115.02932', 'lat': '35.76189'};
    return Scaffold(
      appBar: AppBar(
        title: Text('百姓生活+'),
        centerTitle: false,
      ),
      body: FutureBuilder(
        future: request('homePageContent', formData: formData),
        builder: (context, builder) {
          if (builder.hasData) {
            var data = json.decode(builder.data);

            List<Map> swiperDataList = (data['data']['slides'] as List).cast();
            List<Map> navigatorList = (data['data']['category'] as List).cast();
            String url = data['data']['advertesPicture']['PICTURE_ADDRESS'];
            String leaderImage = data['data']['shopInfo']['leaderImage'];
            String leaderPhone = data['data']['shopInfo']['leaderPhone'];
            List<Map> recmdList = (data['data']['recommend'] as List).cast();

            String floor1Title = data['data']['floor1Pic']['PICTURE_ADDRESS'];
            List<Map> floor1 = (data['data']['floor1'] as List).cast();
            String floor2Title = data['data']['floor2Pic']['PICTURE_ADDRESS'];
            List<Map> floor2 = (data['data']['floor2'] as List).cast();
            String floor3Title = data['data']['floor3Pic']['PICTURE_ADDRESS'];
            List<Map> floor3 = (data['data']['floor3'] as List).cast();

            return EasyRefresh(
              refreshFooter: ClassicsFooter(
                key: footerKey,
                bgColor: Colors.white,
                textColor: Colors.green,
                noMoreText: '',
                loadingText: '数据加载中...',
                showMore: true,
                loadReadyText: '准备加载',
                loadedText: '没有更多数据了',
              ),
              child: ListView(
                children: <Widget>[
                  SwiperDiy(swiperDataList: swiperDataList),
                  TopNavigator(navigatorList: navigatorList),
                  ADBanner(imageUrl: url),
                  LeaderPhone(
                    leaderImage: leaderImage,
                    leaderPhone: leaderPhone,
                  ),
                  ProductRecommend(recommendList: recmdList),
                  FloorWidget(pictureAddress: floor1Title, goodsList: floor1),
                  FloorWidget(pictureAddress: floor2Title, goodsList: floor2),
                  FloorWidget(pictureAddress: floor3Title, goodsList: floor3),
                  hostWidgetComponent(),
                ],
              ),
              loadMore: _loadHotGoods,
              onRefresh: _loadHotGoods,
            );
          }
          return Center(
            child: Text('Loading......'),
          );
        },
      ),
    );
  }

  Future<void> _loadHotGoods() async {
    await request('homePageBelowContent', formData: {'page': page})
        .then((value) {
      var jsonData = json.decode(value.toString());
      if (jsonData != null && jsonData['data'] != null) {
        List<Map> newGoodsList = (jsonData['data'] as List).cast();
        setState(() {
          _hotGoodsList.addAll(newGoodsList);
          page++;
        });
      }
    });
  }

  /**
   * 热销商品标题
   */
  Widget hostTitle = Container(
    margin: EdgeInsets.only(top: 10.0),
    alignment: Alignment.center,
    color: Colors.transparent,
    padding: EdgeInsets.all(6.0),
    child: Text('火爆专区'),
  );

  /**
   * 流式布局
   */
  Widget _wrapList() {
    if (_hotGoodsList.length > 0) {
      List<Widget> hotWidgets = _hotGoodsList.map((val) {
        return InkWell(
          onTap: () {
            RouteApp.router
                .navigateTo(context, '/goodsDetail/${val['goodsId']}');
          },
          child: Container(
            width: ScreenUtil().setWidth(524),
            color: Colors.white,
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.only(bottom: 3.0),
            child: Column(
              children: <Widget>[
                Image.network(
                  val['image'],
                  width: ScreenUtil().setWidth(520),
                ),
                Text(
                  val['name'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.pink,
                    fontSize: ScreenUtil().setSp(26),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Text('¥${val['mallPrice']}'),
                    Text(
                      '¥${val['price']}',
                      style: TextStyle(
                        color: Colors.black26,
                        decoration: TextDecoration.lineThrough,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      }).toList();

      return Wrap(
        spacing: 2,
        children: hotWidgets,
      );
    } else {
      return Text('');
    }
  }

  Widget hostWidgetComponent() {
    return Container(
      child: Column(
        children: <Widget>[
          hostTitle,
          _wrapList(),
        ],
      ),
    );
  }
}

/**
 *
 */
class SwiperDiy extends StatelessWidget {
  final List swiperDataList;

  SwiperDiy({Key key, this.swiperDataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(400),
      width: ScreenUtil.screenWidth,
      child: Swiper(
        itemCount: swiperDataList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              RouteApp.router.navigateTo(
                  context, '/goodsDetail/${swiperDataList[index]['goodsId']}');
            },
            child: Image.network('${swiperDataList[index]['image']}'),
          );
        },
        pagination: SwiperPagination(),
        autoplay: true,
        autoplayDelay: 5000,
      ),
    );
  }
}

/**
 * 顶部导航
 */
class TopNavigator extends StatelessWidget {
  TopNavigator({Key key, this.navigatorList}) : super(key: key);
  final List navigatorList;

  Widget _gridViewItemUI(BuildContext context, item) {
    return InkWell(
      onTap: () {
        print("我被点击了。。。");
      },
      child: Column(
        children: <Widget>[
          Image.network(
            item['image'],
            width: ScreenUtil().setWidth(95),
          ),
          Text(item['mallCategoryName']),
        ],
      ),
    );
  }

  List<Widget> _topNavs(BuildContext context) {
    if (navigatorList.length % 2 != 0) {
      navigatorList.removeRange(navigatorList.length - 1, navigatorList.length);
    }
    return navigatorList.map((item) => _gridViewItemUI(context, item)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(420),
      padding: EdgeInsets.all(3.0),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: navigatorList.length ~/ 2,
        padding: EdgeInsets.all(4.0),
        children: _topNavs(context),
      ),
    );
  }
}

/**
 * 广告
 */
class ADBanner extends StatelessWidget {
  final String imageUrl;

  ADBanner({Key key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(imageUrl),
    );
  }
}

/**
 * 联系信息
 */
class LeaderPhone extends StatelessWidget {
  final String leaderImage;
  final String leaderPhone;

  LeaderPhone({Key key, this.leaderImage, this.leaderPhone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: _urlLauncher,
        child: Image.network(leaderImage),
      ),
    );
  }

  void _urlLauncher() async {
    final String url = 'tel:' + leaderPhone;
    if (await canLaunch(url)) {
      launch(url);
    } else {
      throw 'Could not lauche $url';
    }
  }
}

/**
 *  商品推荐
 */
class ProductRecommend extends StatelessWidget {
  final List recommendList;

  const ProductRecommend({Key key, this.recommendList}) : super(key: key);

  Widget _titleWidget() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10, 2.0, 0, 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.black12,
            width: 0.5,
          ),
        ),
      ),
      child: Text(
        '商品推介',
        style: TextStyle(
          color: Colors.pink,
          fontSize: 16.0,
        ),
      ),
    );
  }

  Widget _item(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        RouteApp.router.navigateTo(
            context, '/goodsDetail/${recommendList[index]['goodsId']}');
      },
      child: Container(
        height: ScreenUtil().setHeight(360),
        width: ScreenUtil().setWidth(300),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(width: 1.0, color: Colors.black12),
          ),
        ),
        child: Column(
          children: <Widget>[
            Image.network(recommendList[index]['image']),
            Text('¥${recommendList[index]['mallPrice']}'),
            Text(
              '¥${recommendList[index]['price']}',
              style: TextStyle(
                color: Colors.grey,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _recommendList() {
    return Container(
      height: ScreenUtil().setHeight(360),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: this.recommendList.length,
        itemBuilder: (context, index) => _item(context, index),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(450),
      margin: EdgeInsets.only(top: 10.0),
      child: Column(
        children: [
          _titleWidget(),
          _recommendList(),
        ],
      ),
    );
  }
}
