import 'package:flutter/material.dart';
import 'package:zucc_helper/config/global.dart';


class BaseProvder extends ChangeNotifier {

  //重写 notifyListeners 方便同步保存GLOBAL数据
  @override
  void notifyListeners() {
    Global.setInfo(); //保存Profile变更
    super.notifyListeners(); //通知依赖的Widget更新
  }

}