import 'package:zucc_helper/models/table_model.dart';
import 'package:zucc_helper/network/table_request.dart';
import 'package:zucc_helper/store/base.dart';


class TableProvider extends BaseProvder{


  //初始化当前日期
  static DateTime nowDate = DateTime.now();
  DateTime beginDate = nowDate.subtract(Duration(days: nowDate.weekday - 1));

  //课表数组
  List stuClasses = [];

  //topbar的当前周次
  int weekNumber = 1;

  // 用户拥有的所有课表
  List tables = [];

    //屏幕左划
  addOneWeek(){
      //不超过二十周次
    if(weekNumber < 20){
      beginDate = beginDate.add(Duration(days: 7));
      weekNumber++;
    }
    notifyListeners();
  }

    //屏幕右划
  minusOneWeek(){
    if(weekNumber <= 20 && weekNumber > 1){
      beginDate = beginDate.subtract(Duration(days: 7));
      weekNumber--;
    }
    notifyListeners();
  }


  // 获取用户课表数据
  getTablesData(user, token){
    TableRequest.getUserTables(user, token).then((res){
      var t = res['tables'][0]['classes'];
      stuClasses = t;
      print(stuClasses);

    });
    notifyListeners();
  }

}