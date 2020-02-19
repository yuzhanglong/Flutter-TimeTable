import 'package:flutter/material.dart';
import 'package:zucc_helper/config/global_config.dart';
import 'package:zucc_helper/views/home/child_cmp/day_bar/day_bar_item.dart';



class DayBarView extends StatefulWidget {
  @override
  _DayBarViewState createState() => _DayBarViewState();
}


List<Widget> getDayBarItems(){
  var currentTime = DateTime.now();


  String getWeekDaySimple(index){
    List weekdays = ["一", "二", "三", "四", "五", "六", "日"];
    return weekdays[index];
  }

  String getMonthSimple(index){
    List monthdays = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sept", "Oct", "Nov", "Dec"];
    return monthdays[index];
  }


  List<Widget> totalItems = List<Widget> ();
  var currentDay = currentTime.day;
  var currentMonth = currentTime.month;
  //创建表头 上面月份 下面今天日期
  totalItems.add(DayBarItem(
    targetDay: getMonthSimple(currentMonth),
    targetWeekDay: currentDay.toString(),
  ));

  for(int i = 0; i < 7; i++){
    currentDay++;
    totalItems.add(DayBarItem(
      targetDay: currentDay.toString(),
      targetWeekDay: getWeekDaySimple(i),
    ));
  }

  return totalItems;
}




class _DayBarViewState extends State<DayBarView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      color: GlobalConfig.basicColor,
      height: 52,
      child: ListView(
          scrollDirection: Axis.horizontal,
          children: getDayBarItems()
      ),
    );
  }
}
