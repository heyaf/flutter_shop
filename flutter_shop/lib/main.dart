import 'package:flutter/material.dart';
import './pages/hyf_tabbar_index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import './provide/counter.dart';

void main(List<String> args) {
  var counter = Counter();
  var providers = Providers();
  providers..provide(Provider<Counter>.value(counter));
  runApp(ProviderNode(
    child: myapp(),
    providers: providers,
  ));
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
