import 'package:flutter/material.dart';
class SplitLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 107,
          height: 0,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
        ),
        Container(
          child: Text("Or"),
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        ),
        Container(
          width: 107,
          height: 0,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
