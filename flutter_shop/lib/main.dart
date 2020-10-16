import 'package:flutter/material.dart';
import './pages/hyf_tabbar_index.dart';

void main(List<String> args) {
  runApp(myapp());
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
