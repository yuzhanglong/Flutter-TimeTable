import 'package:flutter/material.dart';


class HomePrivider extends ChangeNotifier{


  //初始化当前日期
  static DateTime nowDate = DateTime.now();
  DateTime beginDate = nowDate.subtract(Duration(days: nowDate.weekday - 1));

  //课表数组
  List stuClasses = [];

  //topbar的当前周次
  int weekNumber = 1;



  // 添加一节课
  appendstuClasses(){
    stuClasses.add(
      {
        "classTime": {
          "begin": 0,
          "end": 4
        },
        "name": "微积分Ⅱ(甲)",
        "place": "教三301",
        "teacher": "童雯雯",
        "weekDay": 1,
        "weekDuring": "1-16"
      }
    );
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


}