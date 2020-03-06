import 'dart:convert';

import 'package:zucc_helper/models/table_model.dart';
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
  static Future createOneClass(StuClass stuClass, token, tableId) {
    return HttpRequest.request(
        url: "/tables/create_one_class",
        method: "post",
        data: {
          "className": stuClass.className,
          "beginTime": stuClass.beginTime,
          "endTime": stuClass.endTime,
          "teacher": stuClass.teacher,
          "place": stuClass.place,
          "weekDay": stuClass.weekDay,
          "weekDuringStart": stuClass.weekDuringStart,
          "weekDuringEnd": stuClass.weekDuringEnd,
          "isGapWeek": stuClass.isGapWeek,
          "tableId": tableId
        },
        headers: {
          "Authorization": 'Basic ' + base64Encode(utf8.encode('$token:'))
        }
    );
  }
}