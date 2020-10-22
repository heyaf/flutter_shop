// import 'dart:js';

import 'package:flutter/material.dart';
// import 'package:flutter_shop/provide/counter.dart';
// import 'package:provide/provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品分类'),
      ),
      body: Row(
        children: [leftView(), rightRowTopView()],
      ),
    );
  }
}

//左侧视图
class leftView extends StatefulWidget {
  @override
  _leftViewState createState() => _leftViewState();
}

class _leftViewState extends State<leftView> {
  List<String> leftList = [
    '白酒',
    '啤酒',
    '葡萄酒',
    '清酒',
    '保健酒',
    '预调酒',
    '饮料',
    '洋酒',
    '乳制品',
    '粮油'
  ];
  var clickIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(180),
      decoration: BoxDecoration(
          border: Border(right: BorderSide(width: 1, color: Colors.black12))),
      child: ListView.builder(
        itemCount: leftList.length,
        itemBuilder: (context, index) {
          return _leftInkWel(index);
        },
      ),
    );
  }

  Widget _leftInkWel(int index) {
    bool iscliecked = false;
    iscliecked = (index == clickIndex) ? true : false;
    return InkWell(
      onTap: () {
        setState(() {
          clickIndex = index;
        });
        clickIndex = index;
        print('点击了${leftList[index]}');
      },
      child: Container(
        height: ScreenUtil().setHeight(100),
        padding: EdgeInsets.only(left: 10, top: 20),
        decoration: BoxDecoration(
            color: iscliecked ? Colors.black38 : Colors.white,
            border:
                Border(bottom: BorderSide(width: 1, color: Colors.black12))),
        child: Text(
          leftList[index],
          style: TextStyle(fontSize: ScreenUtil().setSp(28)),
        ),
      ),
    );
  }
}

class rightRowTopView extends StatelessWidget {
  List<String> itemList = ['全部', '二锅头', '彩陶坊', '清酒'];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          toplistView(),
        ],
      ),
    );
  }

  Widget topItemView(int index) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
      child: InkWell(
        onTap: () {
          print('点击${index}');
        },
        child: Text(itemList[index]),
      ),
    );
  }

  Widget toplistView() {
    return Container(
      width: ScreenUtil().setWidth(750 - 180),
      height: ScreenUtil().setHeight(80),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          return topItemView(index);
        },
      ),
    );
  }
}
