import 'dart:convert';

import 'package:flutter/material.dart';
import '../config/services_method.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var lunboDataStr = '数据还没开始请求';
  @override
  void initState() {
    // TODO: implement initState
  }

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
            return Column(
              children: [
                swiperDiy(swiperDataList: swiper),
                centerNavView(
                  navCenterList: centerList,
                ),
                addBanner(),
              ],
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
