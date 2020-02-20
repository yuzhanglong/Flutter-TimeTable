import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zucc_helper/config/global_config.dart';


class TopBarItem extends StatefulWidget {
  @override
  _TopBarItemState createState() => _TopBarItemState();
}

class _TopBarItemState extends State<TopBarItem> {


  final int _condition = 1;    //condition表示情形 1表示当前周 0表示不是当前周


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: 30,
                width: 83,
                child: FlatButton(
                  padding: EdgeInsets.all(0.0),//按钮距离里面内容的内边距
                  highlightColor: Colors.white,
                  splashColor: Colors.white,
                  focusColor: Colors.transparent,
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Text(
                        "第1周",
                        style: TextStyle(color: GlobalConfig.fontColor, fontSize: 20, ),
                      ),
                      Icon(Icons.arrow_drop_down, color: GlobalConfig.fontColor,)
                    ],
                  ),
                  onPressed: (){},
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(2, 0, 0, 0),
            child: Text("当前周",
              style: TextStyle(color: GlobalConfig.fontColor, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}



class RightIconButtons extends StatefulWidget {
  @override
  _RightIconButtonsState createState() => _RightIconButtonsState();
}

class _RightIconButtonsState extends State<RightIconButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          child: IconButton(
            highlightColor: Colors.white,
            splashColor: Colors.white,
            focusColor: Colors.transparent,
            color: Colors.white,
            icon:Icon(Icons.add, color: GlobalConfig.fontColor),
            onPressed: (){},
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
          child: IconButton(
            highlightColor: Colors.white,
            splashColor: Colors.white,
            focusColor: Colors.transparent,
            color: Colors.white,
            icon: Icon(Icons.file_download, color: GlobalConfig.fontColor,),
            onPressed: (){},
          ),
        ),
      ],
    );
  }
}
