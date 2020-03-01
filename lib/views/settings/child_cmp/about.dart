import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("关于"),
      content: Container(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        alignment: Alignment.topLeft,
        height: 120,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(Icons.person_outline),
                SizedBox(width: 20,),
                Text("author:   yzl", style: TextStyle(fontSize: 14)),
              ],
            ),
            SizedBox(height: 15,),
            Row(
              children: <Widget>[
                Icon(Icons.email),
                SizedBox(width: 20,),
                Text("email:    yuzl1123@163.com", style: TextStyle(fontSize: 14)),
              ],
            ),
            SizedBox(height: 15,),
            Row(
              children: <Widget>[
                Icon(Icons.code),
                SizedBox(width: 20,),
                Text("github:   codeyzl", style: TextStyle(fontSize: 14)),
              ],
            ),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('我知道了'),
          onPressed: (){
            print('yes...');
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
