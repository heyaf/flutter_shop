import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'home_page.dart';
import 'category_page.dart';
import 'car_page.dart';
import 'member_page.dart';

class tabbarPages extends StatefulWidget {
  @override
  _tabbarPagesState createState() => _tabbarPagesState();
}

class _tabbarPagesState extends State<tabbarPages> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text('首页')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.search), title: Text('分类')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.shopping_cart), title: Text('购物车')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled), title: Text('会员中心')),
  ];

  final List pagesLists = [HomePage(), CategoryPage(), CarPage(), MemberPage()];

  int currentIndex = 0;
  var currentPages;

  @override
  void initState() {
    // TODO: implement initState
    currentPages = pagesLists[currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(244, 244, 244, 0),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: bottomTabs,
        currentIndex: currentIndex,
        onTap: (ind) {
          setState(() {
            currentIndex = ind;
            currentPages = pagesLists[currentIndex];
          });
        },
      ),
      body: currentPages,
    );
  }
}
