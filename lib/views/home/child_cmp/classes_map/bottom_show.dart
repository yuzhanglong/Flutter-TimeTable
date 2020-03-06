import 'package:flutter/material.dart';
import 'package:zucc_helper/config/global_config.dart';
import 'package:zucc_helper/models/table_model.dart';
import 'package:zucc_helper/utils/table_date.dart';
import 'package:zucc_helper/components/mini_widgets/text_field_for_show.dart';


class BottomShow extends StatefulWidget {
  final StuClass stuClass;

  BottomShow({
    this.stuClass
  });

  @override
  _BottomShowState createState() => _BottomShowState();
}

class _BottomShowState extends State<BottomShow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      height: 400,
      child: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Text(
            widget.stuClass.className,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: GlobalConfig.fontColor
            ),
          ),
          SizedBox(height: 18),
          TextFieldForShow(
            hintText: widget.stuClass.place != "" ? widget.stuClass.place: '当前课程地点未设置',
            icon: Icon(Icons.place, color: Color.fromARGB(255, 233, 141, 212)),
          ),

          TextFieldForShow(
            hintText: widget.stuClass.weekDay != null
                ? "星期" + TableDate.getWeekDaySimple(widget.stuClass.weekDay - 1)
                : '当前课程星期未设置',
            icon: Icon(Icons.wb_sunny, color: Color.fromARGB(255, 233, 141, 212)),
          ),

          TextFieldForShow(
            hintText: TableDate.getClassBeginAndEndStr(widget.stuClass.beginTime, widget.stuClass.endTime),
            icon: Icon(Icons.access_time, color: Color.fromARGB(255, 233, 141, 212),),
          ),

          TextFieldForShow(
            hintText: TableDate.getWeekDuringStr(
                widget.stuClass.weekDuringStart,
                widget.stuClass.weekDuringEnd,
                widget.stuClass.isGapWeek
            ),
            icon: Icon(Icons.date_range, color: Color.fromARGB(255, 233, 141, 212)),
          ),
          TextFieldForShow(
            icon: Icon(Icons.person_outline, color: Color.fromARGB(255, 233, 141, 212),),
            hintText: widget.stuClass.teacher != "" ? widget.stuClass.teacher: '当前课程教师未设置',
          ),
        ],
      ),
    );
  }
}
