import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:zucc_helper/views/common/not_found.dart';
import 'package:zucc_helper/views/connection/connection.dart';
import 'package:zucc_helper/views/create_class/create_class.dart';
import 'package:zucc_helper/views/home/home.dart';
import 'package:zucc_helper/views/login/login.dart';


class RouteName{
  // 首页
  static const String home = 'home';

  //连接教务系统页面
  static const String connection = 'connection';

  //添加课程页面
  static const String createClass = 'create_class';

  //登录界面(包含注册)
  static const String login = 'login';


}

class Router{
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.home:
        return MaterialPageRoute(builder: (_) => Home());

      case RouteName.connection:
        return CupertinoPageRoute(builder: (_) => ConnectionPage());

      case RouteName.createClass:
        return MaterialPageRoute(builder: (_) => CreateClass());

      case RouteName.login:
        return MaterialPageRoute(builder: (_) => LoginPage());

      default:
        return CupertinoPageRoute(builder: (_) => NotFoundPage());
    }
  }
}