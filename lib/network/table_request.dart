import 'dart:convert';

import 'package:zucc_helper/network/requests.dart';


class TableRequest{

  static Future getUserTables(token) {
    return HttpRequest.request(
      url: "/tables/get_user_tables",
      method: "get",
      headers: {
        "Authorization": 'Basic ' + base64Encode(utf8.encode('$token:'))
      }
    );
  }

  // 创建一节课
  static Future createOneClass(userName, token, tableId, classData) {
    return HttpRequest.request(
        url: "/utils/create_one_class",
        method: "post",
        data: {
          "userName": userName,
          "token": token,
          "classData": classData,
          "tableId": tableId,
        }
    );
  }
}