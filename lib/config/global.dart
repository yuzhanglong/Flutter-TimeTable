import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zucc_helper/network/user_request.dart';

class Global{
  static SharedPreferences prefs;


  // auth
  static String user;
  static String token;
  static bool isLogin;



  // 初始化全局信息
  static Future init() async {
    prefs = await SharedPreferences.getInstance();
    user = prefs.getString("user");
    token = prefs.getString("token");
    UserRequest.checkAuth(token).then((res){
      isLogin = true;
    }).catchError((err){
      isLogin = false;
      clearInfo();
    });
  }


  // 数据持久化
  static setInfo(){
    prefs.setString("user", user);
    prefs.setString("token", token);
  }

  static clearInfo(){
    prefs.clear();
  }
}