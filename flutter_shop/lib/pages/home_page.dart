import 'package:flutter/material.dart';
import '../config/services_method.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var lunboDataStr = '数据还没开始请求';
  @override
  void initState() {
    // TODO: implement initState

    getHomeLunboContent().then((value) {
      print('initStates');
      lunboDataStr = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('百姓生活家'),
      ),
      body: SingleChildScrollView(
        child: Text(lunboDataStr),
      ),
    );
  }
}
