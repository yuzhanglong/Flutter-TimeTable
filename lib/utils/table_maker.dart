import 'package:flutter/material.dart';
import 'package:zucc_helper/models/table_model.dart';
import 'package:zucc_helper/views/home/child_cmp/classes_map/class_card_item.dart';
import 'package:zucc_helper/views/home/child_cmp/classes_map/class_time_item.dart';
class TableMaker{
  List<Widget> allItems = [];

  // 课表初始化 传入每天课程的节次
  TableMaker.initData(schoolData){
    getClassTimeCard(schoolData);
  }

  // 课程表左侧的时间表
  getClassTimeCard(schoolData){
    for(int i = 0; i < schoolData.classNumOneDay; i++){
      allItems.add(ClassTime(
        classNum: (i + 1).toString(),
        startTime: schoolData.time[i][0],
        endTime: schoolData.time[i][1],
      ));
      // 用空白的ClassCard预先填补
      for(int j = 0; j <= 6; j++){
        allItems.add(ClassCard());
      }
    }
  }

  getClassTables(stuClasses, weekNumber){
    for(int k = 0; k < stuClasses.length; k++){
      var singleClass = StuClass.fromMap(stuClasses[k]);
      var w = weekNumber;

      if(!checkSpecialCondition(w, singleClass)) continue;
      int classWeekDay;
      int classTime;
      int classTime2;
      //只有一节课的情况
      if(singleClass.beginTime == singleClass.endTime){
        classWeekDay = singleClass.weekDay;
        classTime = singleClass.beginTime;
        var pos = 8 * classTime + classWeekDay;
        allItems[pos] = ClassCard(
          baseColor: Colors.lightBlueAccent,
          className: singleClass.className,
        );
      }
      //多节课程连续
      else{
        classWeekDay = singleClass.weekDay;
        classTime = singleClass.beginTime;
        classTime2 = singleClass.endTime;
        for(int t = classTime; t <= classTime2; t++){
          allItems[8 * t + classWeekDay] = ClassCard(
              baseColor: Colors.lightBlueAccent,
              className: singleClass.className
          );
        }
      }
    }
  }

  // 一些特殊情况 必须单双周 不在周次范围里面
  checkSpecialCondition(weekNumber, StuClass singleClass){
    if(weekNumber > singleClass.weekDuringEnd || weekNumber < singleClass.weekDuringStart)
      return false;

    // 判断单双周
    if(singleClass.isGapWeek != 0){
      if(singleClass.isGapWeek == 1 && weekNumber % 2 == 0) return false;  //逢单周
      if(singleClass.isGapWeek == 2 && weekNumber % 2 != 0) return false;  //逢双周
    }
    return true;
  }


}