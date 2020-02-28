import 'package:flutter/material.dart';

class DayBarItem extends StatefulWidget {
  final String targetDay;
  final String targetWeekDay;
  final Color baseColor;

  DayBarItem({
    this.targetDay,
    this.targetWeekDay,
    this.baseColor,
  });


  @override
  _DayBarItemState createState() => _DayBarItemState();
}

class _DayBarItemState extends State<DayBarItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 8,
      child: Column(
        children: <Widget>[
          Text(widget.targetDay, style: TextStyle(
              color: widget.baseColor,
              fontWeight: FontWeight.bold,
              fontSize: 10
            )
          ),
          SizedBox(height: 5),
          Text(widget.targetWeekDay, style: TextStyle(
              color: widget.baseColor,
              fontWeight: FontWeight.bold,
              fontSize: 12
            )
          )
        ],
      ),
    );
  }
}
