import 'package:flutter/material.dart';
import './pages/hyf_tabbar_index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main(List<String> args) {
  runApp(myapp1());
}

class myapp extends StatelessWidget {
  const myapp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        // title: '百姓生活家1',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.pink,
        ),
        home: tabbarPages(),
      ),
    );
  }
}

// ignore: camel_case_types
class myapp1 extends StatefulWidget {
  @override
  _myapp1State createState() => _myapp1State();
}

// ignore: camel_case_types
class _myapp1State extends State<myapp1> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(750, 1334), allowFontScaling: false);
    return Container(
      child: MaterialApp(
        // title: '百姓生活家1',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.black,
        ),
        home: tabbarPages(),
      ),
    );
  }
}
