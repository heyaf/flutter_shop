import 'dart:convert';

import 'package:flutter/material.dart';
import '../config/services_method.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  var lunboDataStr = '数据还没开始请求';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('百姓生活家'),
      ),
      body: FutureBuilder(
        future: getHomeLunboContent(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = json.decode(snapshot.data.toString());
            List<Map> swiper = (data['response']['data'] as List).cast();
            List<int> centerList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
            print(swiper);
            return SingleChildScrollView(
              child: Column(
                children: [
                  swiperDiy(swiperDataList: swiper),
                  centerNavView(
                    navCenterList: centerList,
                  ),
                  addBanner(),
                  callPhone(),
                  reCommentView(),
                ],
              ),
            );
          } else {}
        },
      ),
    );
  }
}

// 轮播组件
// ignore: camel_case_types
class swiperDiy extends StatelessWidget {
  final List swiperDataList;
  const swiperDiy({Key key, this.swiperDataList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(250),
      child: Swiper(
        itemBuilder: (context, index) {
          return Image.network(
            '${swiperDataList[index]['bannerImg']}',
            fit: BoxFit.fill,
          );
        },
        itemCount: swiperDataList.length,
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}

//中间分类
// ignore: camel_case_types
class centerNavView extends StatelessWidget {
  final List navCenterList;

  const centerNavView({Key key, this.navCenterList}) : super(key: key);

  Widget _gridViewItemUI(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        // ignore: unnecessary_brace_in_string_interps
        print('点击了第${index}个');
      },
      child: Column(
        children: [
          Image.asset(
            'asset/images/home_the_tour_guide.png',
            width: ScreenUtil().setWidth(95),
          ),
          Text('第$index个')
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(320),
      padding: EdgeInsets.all(5.0),
      child: GridView.count(
        crossAxisCount: 5,
        padding: EdgeInsets.all(5.0),
        children: navCenterList.map((index) {
          return _gridViewItemUI(context, index);
        }).toList(),
      ),
    );
  }
}

//广告部件
class addBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(140),
      padding: EdgeInsets.all(5.0),
      child: Image.asset(
        'asset/images/tkdd_bg.png',
        fit: BoxFit.fill,
      ),
    );
  }
}

//拨打电话
class callPhone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(80),
      child: InkWell(
        onTap: () {
          _callPhonenum('tel:13939038564');
        },
        child: Row(
          children: [
            Image.asset(
              'asset/images/tkdd_bg.png',
              fit: BoxFit.cover,
            ),
            Text(
              '拨打电话',
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
    );
  }

  void _callPhonenum(String phonenum) async {
    if (await canLaunch(phonenum)) {
      await launch(phonenum);
    } else {
      print('拨打电话失败');
    }
  }
}

//商品推荐
class reCommentView extends StatefulWidget {
  @override
  _reCommentViewState createState() => _reCommentViewState();
}

class _reCommentViewState extends State<reCommentView> {
  //头部title
  Widget titleView() {
    return Container(
      child: Column(
        children: [
          Container(
            color: Colors.black12,
            height: ScreenUtil().setHeight(10),
          ),
          Container(
            height: ScreenUtil().setHeight(40),
            margin: EdgeInsets.fromLTRB(10, 2, 0, 2),
            alignment: Alignment.centerLeft,
            child: Text(
              '商品推荐',
              style: TextStyle(color: Colors.pinkAccent),
            ),
          )
        ],
      ),
    );
  }

  //内部商品item
  Widget itemView() {
    return InkWell(
      onTap: () {
        print('item点击事件');
      },
      child: Container(
        height: ScreenUtil().setHeight(330),
        width: ScreenUtil().setWidth(250),
        decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border(left: BorderSide(width: 0.5, color: Colors.black12))),
        child: Column(
          children: [
            Image.asset('asset/images/home_the_tour_guide.png'),
            Text('￥320.00'),
            Text(
              '￥480.00',
              style: TextStyle(
                  color: Colors.blueGrey,
                  decoration: TextDecoration.lineThrough),
            )
          ],
        ),
      ),
    );
  }

  Widget recommentListView() {
    return Container(
      height: ScreenUtil().setHeight(330),
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return itemView();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          titleView(),
          recommentListView(),
        ],
      ),
    );
  }
}
