import 'dart:convert';

import 'package:zucc_helper/network/user_request.dart';
import 'package:zucc_helper/utils/data_helper.dart';

class User{
  String userName;

}


class UserAuth extends User{
  String token;
  bool isLogin = false;

  initAuth(userName, token){
    this.userName = userName;
    this.token = token;
  }

  Future checkAuth(){
    return UserRequest.checkAuth(this.token);
  }

  setAuth(){
    SharedPreferenceUtil.setString("user", this.userName);
    SharedPreferenceUtil.setString("token", this.token);
  }

  clearAuth(){
    SharedPreferenceUtil.remove("user");
    SharedPreferenceUtil.remove("token");
  }
}


class Profile extends User{
  // 学期开始时间 用来判断当前周次
  DateTime termStartTime;



  fromJson(json){
    var p = DateTime(
      json['termStartYear'],
      json['termStartMonth'],
      json['termStartDay'],
    );
    this.termStartTime = p;
  }


  Map<String, dynamic> toJson(){
    // 不可以直接传入datetime对象 否则报错
    return {
      "termStartYear": this.termStartTime.year,
      "termStartMonth": this.termStartTime.month,
      "termStartDay": this.termStartTime.day,
    };
  }


  void setProfile(){
    if(this.termStartTime != null){
      SharedPreferenceUtil.setString("profile", jsonEncode(this.toJson()));
    }
  }
}