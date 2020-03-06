import 'package:flutter/material.dart';
/*
*  封装用来展示课表详细信息的textfied
*  不可点击 仅仅用来展示数据
*  三种状态的border全部隐藏 应该比较美观
* */

class TextFieldForShow extends StatefulWidget {
  final String hintText;
  final Icon icon;

  TextFieldForShow({
    this.hintText,
    this.icon,
  });

  @override
  _TextFieldForShowState createState() => _TextFieldForShowState();
}

class _TextFieldForShowState extends State<TextFieldForShow> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      // 仅仅用来展示数据 禁用之
      enabled: false,
      decoration: InputDecoration(
        icon: widget.icon,
        hintText: widget.hintText,
        // 隐藏三种border
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent,),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent,),
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent,),
        ),
      ),
    );
  }
}
