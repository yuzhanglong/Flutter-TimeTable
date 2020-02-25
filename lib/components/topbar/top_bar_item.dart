import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zucc_helper/config/global_config.dart';
import 'package:zucc_helper/store/profile_provider.dart';
import 'package:zucc_helper/utils/snack_bar.dart';
import 'package:zucc_helper/views/connection/connection.dart';


class TopBarItem extends StatefulWidget {
  //当前周次 默认为 1
  final int currentWeek;

  TopBarItem({
    this.currentWeek = 1,
  });


  @override
  _TopBarItemState createState() => _TopBarItemState();
}

class _TopBarItemState extends State<TopBarItem> with SingleTickerProviderStateMixin {
  Animation<double> weekTitleAnimation;
  AnimationController weekTitleController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    weekTitleController = AnimationController(duration: const Duration(milliseconds: 300), vsync: this);
    weekTitleAnimation = Tween(begin: 8.0, end: 20.0).animate(weekTitleController)
      ..addListener(() {
        setState(() {});
      });
    weekTitleController.forward();
  }




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
                width: 90,
                child: FlatButton(
                  padding: EdgeInsets.all(0.0),//按钮距离里面内容的内边距
                  highlightColor: Colors.white,
                  splashColor: Colors.white,
                  focusColor: Colors.transparent,
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Text(
                          "第${widget.currentWeek.toString()}周",
                          style: TextStyle(color: GlobalConfig.fontColor, fontSize: weekTitleAnimation.value, ),
                        ),
                      ),
                      Icon(Icons.arrow_drop_down, color: GlobalConfig.fontColor,)
                    ],
                  ),
                  onPressed: (){
                    weekTitleController.reset();
                    weekTitleController.forward();
                  },
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

    ProfileProvider profileProvider = Provider.of<ProfileProvider>(context);

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
            onPressed: (){
              if(profileProvider.isLogin){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>ConnectionPage())
                );
              }else{
                Scaffold.of(context).showSnackBar(Snack.error("请登录后再执行导入教务处课表功能"));
              }

            },
          ),
        ),
      ],
    );
  }
}
