import 'package:flutter/material.dart';
import 'package:zucc_helper/components/drawer/main_drawer.dart';
import 'package:zucc_helper/components/topbar/top_bar_item.dart';
import 'package:zucc_helper/config/global_config.dart';
import 'package:zucc_helper/utils/data_helper.dart';
import 'package:zucc_helper/utils/snack_bar.dart';
import 'package:zucc_helper/views/home/child_cmp/classes_map/main_classes_map.dart';
import 'package:zucc_helper/views/home/child_cmp/day_bar/day_bar.dart';

//首页

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  int weekNumber = 1;
  //学生课表list 根据情况可以自动更新
  List stuClasses = [];


  //初始化当前日期
  static DateTime nowDate = DateTime.now();
  DateTime beginDate = nowDate.subtract(Duration(days: nowDate.weekday - 1));


  GlobalKey <ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharedPreferenceUtil.getString("user").then((value){
      if(value == null){
        _scaffoldkey.currentState.showSnackBar(Snack.info("请登录以获取课表"));
      }
    });
  }



  renewHomeData(condition){
    if(condition == 1 && weekNumber < 20){
      setState(() {
        beginDate = beginDate.add(Duration(days: 7));
        weekNumber++;
      });
    }
    else if(condition == 0 && weekNumber <= 20 && weekNumber > 1){
      setState(() {
        beginDate = beginDate.subtract(Duration(days: 7));
        weekNumber--;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: _appbar,
      drawer: MainDrawer(),
      body: GestureDetector(
        onHorizontalDragEnd:(startDetails){
          //从源代码得知，startDetails.primaryVelocity 为移动的距离差 向左滑为负数 向右滑为正数
          //绝对值越大 滑动幅度越大
          var p = startDetails.primaryVelocity;

          if(p.abs() > 1000){
            if(p > 0){
              renewHomeData(0);
            }
            else{
              renewHomeData(1);
            }
          }
        },

        child: Column(
          children: <Widget>[
            DayBarView(beginDay: beginDate,),
            HomeClassView(stuClasses: stuClasses,)
          ],
        ),
      ),
    );
  }

  get _appbar => AppBar(
    title: TopBarItem(
      currentWeek: weekNumber,
    ),
    backgroundColor: GlobalConfig.basicColor,
    elevation:0.0,
    actions: <Widget>[
      RightIconButtons()
    ],
  );
}
