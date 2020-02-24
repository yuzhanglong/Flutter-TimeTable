import 'package:zucc_helper/network/requests.dart';

class UserRequest {

  static Future submitLoginData(userName, password) {
    return HttpRequest.request(
        url: "/user/login",
        method: "get",
        data: {
          "userName": "userName",
          "password": "password"
        }
    );
  }
}




