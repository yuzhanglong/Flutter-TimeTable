import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:zucc_helper/models/user_model.dart';
import 'package:zucc_helper/network/table_request.dart';

class Global{
  static SharedPreferences prefs;


  // 权限相关
  static UserAuth userAuth = UserAuth();


  // 个人信息相关
  static Profile profile = Profile();


  // 初始化全局信息
  static Future init() async {
    // 权限相关
    prefs = await SharedPreferences.getInstance();
    userAuth.initAuth(prefs.getString("user"), prefs.getString("token"));
    // 存在用户信息
    if(userAuth.token != null){
      userAuth.checkAuth()
          .then((res){
            userAuth.isLogin = true;
          })
          .catchError((err){
            clearInfo();
          });
    }

    // 获取profile json 字符串
    var p = prefs.getString("profile");
    print(p);
    if (p != null) {
      try {
        profile.fromJson(jsonDecode(p));
      } catch (error) {
        print(error);
      }
    }
  }


  // 数据持久化
  static setInfo(){
    userAuth.setAuth();
    profile.setProfile();
  }


  static clearInfo(){
    prefs.clear();
  }

  static Future initHomeTable(){
    return TableRequest.getUserTables(userAuth.userName, userAuth.token);
  }
}