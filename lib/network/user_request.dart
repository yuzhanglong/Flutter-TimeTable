import 'package:zucc_helper/network/requests.dart';

class UserRequest {

  static Future submitLoginData(userName, userPassword) {
    return HttpRequest.request(
        url: "/users/login",
        method: "post",
        data: {
          "userName": userName,
          "userPassword": userPassword
        }
    );
  }

  static Future submitRegisterData(userName, userPassword) {
    return HttpRequest.request(
        url: "/users/register",
        method: "post",
        data: {
          "userName": userName,
          "userPassword": userPassword
        }
    );
  }

  // 鉴权
  static Future checkAuth(token) {
    return HttpRequest.request(
        url: "/users/token",
        method: "post",
        data: {
          "token": token,
        }
    );
  }

}




