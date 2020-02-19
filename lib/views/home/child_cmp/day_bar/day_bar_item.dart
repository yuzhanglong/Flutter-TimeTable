import 'package:flutter/material.dart';
import 'package:zucc_helper/config/global_config.dart';

class DayBarItem extends StatefulWidget {
  final String targetDay;
  final String targetWeekDay;

  DayBarItem({
    this.targetDay,
    this.targetWeekDay
  });


  @override
  _DayBarItemState createState() => _DayBarItemState();
}

class _DayBarItemState extends State<DayBarItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      child: Column(
        children: <Widget>[
          Text(widget.targetDay, style: TextStyle(
              color: GlobalConfig.fontColor,
              fontWeight: FontWeight.bold,
              fontSize: 10
          )
          ),
          SizedBox(height: 3),
          Text(widget.targetWeekDay, style: TextStyle(
              color: GlobalConfig.fontColor,
              fontWeight: FontWeight.bold,
              fontSize: 12
          )
          )
        ],
      ),
    );
  }
}
