import 'package:zucc_helper/network/requests.dart';


class TableRequest{

  static Future getUserTables(userName, token) {
    return HttpRequest.request(
        url: "/utils/get_user_tables",
        method: "post",
        data: {
          "userName": userName,
          "token": token,
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