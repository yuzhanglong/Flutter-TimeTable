import 'dart:convert';

import 'package:zucc_helper/network/requests.dart';


class UtilsRequest{
  // 获取教务系统课表
  static Future getDataFromEducationSystem(userName, password, code, token) {
    return HttpRequest.request(
        url: "/utils/get_edu_system_data",
        method: "post",
        data: {
          "userName": userName,
          "password": password,
          "checkCode": code,
        },
        headers: {
          "Authorization": 'Basic ' + base64Encode(utf8.encode('$token:'))
        }
    );
  }

}