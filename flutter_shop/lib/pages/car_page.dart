import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../provide/counter.dart';

class CarPage extends StatelessWidget {
  const CarPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Provide<Counter>(
          builder: (context, child, value) {
            return Text('${value.value}');
          },
        ),
      ),
      backgroundColor: Colors.green,
    );
  }
}
