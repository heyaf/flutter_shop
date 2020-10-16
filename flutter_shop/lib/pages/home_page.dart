import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController typeController = TextEditingController();
  String inputstr = "您选择的城市名称为空";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('这是一个测试'),
        backgroundColor: Colors.red,
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: typeController,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  labelText: '城市名称',
                  helperText: '请输入城市名称'),
              autofocus: false,
            ),
            RaisedButton(
              onPressed: () {
                _btnCLicked();
              },
              child: Text('选择完毕'),
            ),
            Text(
              inputstr,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            )
          ],
        ),
      ),
    );
  }

  void _btnCLicked() {
    print('开始');
    if (typeController.text.toString() == '') {
    } else {
      getHttp(typeController.text.toString()).then((value) {
        setState(() {
          inputstr = typeController.text.toString();
        });
      });
    }
  }

  Future getHttp(String urlparam) async {
    try {
      Response response;
      var param = {'bannerCityName': urlparam};
      response = await Dio().get(
          "http://114.115.167.217:8181/yayuser/api/homePageBanner/phone/getBannerInfo",
          queryParameters: param);
      return response.data;
    } catch (e) {
      return print('首页请求报错' + e);
    }
  }
}
