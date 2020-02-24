import 'package:zucc_helper/network/requests.dart';


class UtilsRequest{

  static Future getDataFromEducationSystem(userName, password, code) {
    return HttpRequest.request(
        url: "/utils/get_edu_system_data",
        method: "post",
        data: {
          "userName": userName,
          "password": password,
          "checkCode": code
        }
    );
  }

}