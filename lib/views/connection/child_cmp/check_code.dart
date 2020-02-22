import 'package:flutter/material.dart';


class CheckCode extends StatefulWidget {
  final String imgSrc;


  CheckCode({
    this.imgSrc
  });





  @override
  _CheckCodeState createState() => _CheckCodeState();
}

class _CheckCodeState extends State<CheckCode> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: Image.network(
        widget.imgSrc,
      ),
    );
  }
}
