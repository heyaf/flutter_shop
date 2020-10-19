import 'package:dio/dio.dart';
import 'dart:io';
import 'service_url.dart';
import 'dart:async';

Future getHomeLunboContent() async {
  print('开始请求首页数据');
  try {
    Response response;
    Dio dio = Dio();

    // dio.options.contentType =
    // ContentType.parse("application/x-www-form-urlencoded") as String;
    var param = {"bannerCityName": "开封市"};
    response =
        await dio.get(servicePath['homepageContent'] + '?bannerCityName=开封市');
    if (response.statusCode == 200) {
      print('数据请求200成功');
      return response.data;
    } else {
      throw Exception('轮播图接口出现异常情况');
    }
  } catch (e) {
    return print('网络报错---------${e}');
  }
}
