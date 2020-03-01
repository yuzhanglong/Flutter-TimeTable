import 'package:flutter/material.dart';
import 'package:zucc_helper/utils/snack_bar.dart';

class SetPassword extends StatefulWidget {

  @override
  _SetPasswordState createState() => _SetPasswordState();
}

class _SetPasswordState extends State<SetPassword> {
  String oldPassword = "";
  String newPassword = "";


  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text("修改你的密码"),
      children: <Widget>[
        Container(
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: '请输入旧密码',
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white,),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white , width: 2),
              ),
            ),
            onChanged: (value){
              setState(() {
                oldPassword = value;
              });
            },
          ),
          padding: EdgeInsets.fromLTRB(24, 10, 0, 0),
        ),
        Container(
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: '请输入新密码',
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white,),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white , width: 2),
              ),
            ),
            onChanged: (value){
              setState(() {
                newPassword = value;
              });
            },
          ),
          padding: EdgeInsets.fromLTRB(24, 10, 0, 0),
        ),
        SizedBox(height: 20,),
        FlatButton(
          onPressed: (){

          },
          child: Text("确定"),
        )
      ],
    );
  }
}
