import 'dart:convert';
import 'package:zucc_helper/config/storage_manager.dart';
import 'package:zucc_helper/models/table_model.dart';
import 'package:zucc_helper/network/table_request.dart';
import 'package:zucc_helper/network/utils_request.dart';
import 'package:zucc_helper/store/profile_provider.dart';
import 'package:zucc_helper/utils/table_date.dart';


/*
*  课程表相关
*
* */

class TableProvider extends ProfileProvider{

  //初始化课表相关配置
  static DateTime nowDate = DateTime.now();

  DateTime beginDate = nowDate.subtract(Duration(days: nowDate.weekday - 1));

  //topbar的当前周次
  int weekNumber = 1;

  // 用户拥有的所有课表 包涵所有信息
  List _tables = [];

  List get tables => _tables;


  //当前显示的课表
  StuTable currentTable;

  List get stuClasses => currentTable != null ? currentTable.classes : [];



  //当前活跃的课表名称
  String get activeTableName => currentTable != null ? currentTable.tableName : "";

  String get activeTableId => currentTable != null ? currentTable.tableId : "";


  TableProvider(){
    initTimes();
    initTables();
  }

  initTimes(){
    DateTime termStartTime = profile != null ? profile.termStartTime : DateTime.now();
    weekNumber = TableDate.getWeeksGap(termStartTime, nowDate).toInt();
  }

  initTables(){
    var raw = StorageManager.sharedPreferences.getStringList("tables");
    if(raw == null && profile != null){
      getRemoteTables();
    }else if(raw != null){
      getLocalTables(raw);
    }
  }


  getRemoteTables(){
    // 联网请求用户课表数据
    TableRequest.getUserTables(profile.token)
        .then((res){
          _tables = res['tables'];
          currentTable = StuTable.fromMap(_tables[0]);
          notifyListeners();
        })
        .catchError((res){
          // 暂时省略
        });
  }


  void getLocalTables(List raw){
    for(int i = 0; i < raw.length; i++){
      _tables.add(StuTable.fromMap(jsonDecode(raw[i])));
    }
    notifyListeners();
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
    currentTable = StuTable.fromMap(_tables[index]);
    notifyListeners();
  }

  clearTables(){
    _tables = [];
    weekNumber = 1;
    currentTable = null;
    notifyListeners();
  }


  createOneClass(StuClass stuclass) async {
    var res = await TableRequest.createOneClass(stuclass, profile.token, activeTableId)
        .then((res){
          return true;
        }).catchError((res){
          print(res);
          return false;
        });
    return res;
  }

  getEduSystemData(userName, password, code) async {
    var res = await UtilsRequest.getDataFromEducationSystem(userName, password, code, profile.token)
        .then((res){
          return "s";
        })
        .catchError((res){
          return res['information'];
        });
    return res;
  }
}