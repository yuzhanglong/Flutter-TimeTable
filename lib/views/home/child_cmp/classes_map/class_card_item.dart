import 'package:flutter/material.dart';



//课程卡片

class ClassCard extends StatefulWidget {
  final String className;
  final Color baseColor;

  ClassCard({
    this.className = "null",
    this.baseColor,
  });


  @override
  _ClassCardState createState() => _ClassCardState();
}

class _ClassCardState extends State<ClassCard> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.className != "null"?Colors.blue:Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(6.0)),
        border: new Border.all(width:1, color: Colors.transparent),
      ),
      child: Column(
        children: <Widget>[
          Text(
            widget.className,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            maxLines: 4,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
