import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:zucc_helper/config/network_config.dart';

/*
*  dart -> 面向对象语言 最好封装成类 不要受JavaScript的影响
*  {String method = "get"} 表示可选值 默认为get
*  static 静态方法 每次就不需要创建一个实例
*/

class HttpRequest {
  // 设置基本信息
  static BaseOptions baseOptions = BaseOptions(
      baseUrl: BASE_URL,
      connectTimeout: TIME_OUT,
  );

  static Future request({
    @required String url,
    @required String method,
    Map<String, dynamic> params,
    data
  }) async {
    // 创建一个dio实例
    final dio = Dio(baseOptions);

    // 发送网络请求
    Options options = Options(method: method);

    try {
      final res = await dio.request(url, queryParameters: params, options: options, data: data);

      return res.data;

    } on DioError catch (error) {
      throw error.response.data;
    }
  }
}