import 'package:zucc_helper/config/global.dart';
import 'package:zucc_helper/models/table_model.dart';
import 'package:zucc_helper/store/base.dart';


class TableProvider extends BaseProvder{

  //初始化当前日期
  static DateTime nowDate = DateTime.now();
  DateTime beginDate = nowDate.subtract(Duration(days: nowDate.weekday - 1));

  //topbar的当前周次
  int weekNumber = 1;

  // 用户拥有的所有课表
  List tables = Global.tables;

  //当前显示的课表数组
  List stuClasses = [];

  //当前活跃的课表名称
  String activeTableName = "";

  //构造函数
  TableProvider(){
    initTables();
  }


  //用户所拥有的课程表的初始化
  void initTables() async {
    Global.initHomeTable().then((res){
      tables = res['tables'];
      if(res['tables'].length != 0){
        stuClasses = res['tables'][0]['classes'];
        var t = StuTable.fromMap(res['tables'][0]);
        activeTableName = t.tableName;
      }
      notifyListeners();
    });

  }



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

  // 改变home页展示的课程(用户切换了课程表)
  changeHomeClasses(index){
    print(index);
    stuClasses = tables[index]['classes'];
    activeTableName = tables[index]['tableName'];
    notifyListeners();
  }
}