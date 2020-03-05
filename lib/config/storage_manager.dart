import 'package:shared_preferences/shared_preferences.dart';
class StorageManager{
  //临时数据
  static SharedPreferences sharedPreferences;


  //开始初始化
  static Future init() async {
    // async 异步操作
    // sync 同步操作
    sharedPreferences = await SharedPreferences.getInstance();
  }
}