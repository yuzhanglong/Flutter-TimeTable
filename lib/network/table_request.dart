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

}