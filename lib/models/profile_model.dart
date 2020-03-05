import 'dart:convert';
import 'package:zucc_helper/config/storage_manager.dart';

/*
*  个人相关
*
* */

class Profile {
  // 用户名
  String userName;
  // 令牌
  String token;
  // 学期开始时间
  DateTime termStartTime;

  Profile(){
    this.userName = null;
    this.token = null;
    this.termStartTime = null;
  }


  Profile.fromJsonMap(Map<String, dynamic> map) {
    userName = map["userName"];
    if(map["token"] != null){
      token = map["token"];
    }
    if(map['termStartTime'] != null){
      termStartTime = fromDateTimeJson(map['termStartTime']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['userName'] = userName;
    data['token'] = token;
    data['termStartTime'] = this.termStartTime != null ? toDateTimeJson() : null;
    return data;
  }

  Map<String, dynamic> toDateTimeJson() {
    // 不可以直接传入datetime对象 否则报错
    return {
      "termStartYear": this.termStartTime.year,
      "termStartMonth": this.termStartTime.month,
      "termStartDay": this.termStartTime.day,
    };
  }

  DateTime fromDateTimeJson(map){
    var time = DateTime(
      map['termStartYear'],
      map['termStartMonth'],
      map['termStartDay']
    );
    return time;
  }


  void setProfile() {
    // 持久化存储
    StorageManager.sharedPreferences.setString("profile", jsonEncode(this.toJson()));
  }

  void clearProfile(){
    // 持久化存储
    StorageManager.sharedPreferences.remove("profile");
  }


  @override
  String toString() {
    // TODO: implement toString
    return "$userName $token";
  }
}
