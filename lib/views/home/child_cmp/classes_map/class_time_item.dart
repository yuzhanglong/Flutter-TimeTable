import 'package:flutter/material.dart';
import 'package:zucc_helper/config/global_config.dart';


//纵向课程时间和节次展示


class ClassTime extends StatefulWidget {
  final String classNum;   //序号
  final String startTime;   //开始时间
  final String endTime;   //结束时间


  ClassTime({
    this.classNum,
    this.startTime,
    this.endTime
  });


  @override
  _ClassTimeState createState() => _ClassTimeState();
}



class _ClassTimeState extends State<ClassTime> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            widget.classNum,
            style: TextStyle(color: GlobalConfig.fontColor, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 4,),
          Text(
            widget.startTime,
            style: TextStyle(color: GlobalConfig.fontColor , fontWeight: FontWeight.bold,fontSize: 10),
          ),
          Text(
            widget.endTime,
            style: TextStyle(color: GlobalConfig.fontColor, fontWeight: FontWeight.bold,  fontSize: 10),
          ),
        ],
      ),
    );
  }
}
