import 'package:flutter/material.dart';
import 'package:zucc_helper/config/global_config.dart';
import 'package:zucc_helper/utils/table_date.dart';
import 'package:zucc_helper/views/home/child_cmp/day_bar/day_bar_item.dart';



class DayBarView extends StatefulWidget {
  final DateTime beginDay;

  DayBarView({
   this.beginDay
  });


  @override
  _DayBarViewState createState() => _DayBarViewState();
}


List<Widget> getDayBarItems(List <DateTime> daysData){

  DateTime currentTime = DateTime.now();
  var currentDay = currentTime.day;
  var currentMonth = currentTime.month - 1;


  List<Widget> totalItems = List<Widget>();


  //创建表头 上面月份 下面今天日期
  totalItems.add(DayBarItem(
    targetDay: TableDate.getMonthSimple(daysData[0].month - 1),
    targetWeekDay: " ",
  ));



  for(int i = 0; i < 7; i++){
    totalItems.add(DayBarItem(
      targetDay: daysData[i].day.toString(),
      targetWeekDay: TableDate.getWeekDaySimple(i),
    ));
  }
  return totalItems;
}




class _DayBarViewState extends State<DayBarView> {
  List <DateTime> daysData = [];



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      color: GlobalConfig.basicColor,
      height: 52,
      child: ListView(
          scrollDirection: Axis.horizontal,
          children: getDayBarItems(TableDate.refreshDate(widget.beginDay))
      ),
    );
  }
}
