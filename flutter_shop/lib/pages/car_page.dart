import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../provide/counter.dart';

class CarPage extends StatelessWidget {
  const CarPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [Text('111'), Text('22222')],
      ),
      backgroundColor: Colors.green,
    );
  }
}
