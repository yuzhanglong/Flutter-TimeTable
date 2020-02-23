import 'package:flutter/material.dart';
import 'package:zucc_helper/components/drawer/main_drawer.dart';
import 'package:zucc_helper/components/topbar/top_bar_item.dart';
import 'package:zucc_helper/config/global_config.dart';
import 'package:zucc_helper/store/home_provider.dart';
import 'package:zucc_helper/utils/data_helper.dart';
import 'package:zucc_helper/utils/snack_bar.dart';
import 'package:zucc_helper/views/home/child_cmp/classes_map/main_classes_map.dart';
import 'package:zucc_helper/views/home/child_cmp/day_bar/day_bar.dart';
import 'package:provider/provider.dart';
//首页

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

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



  renewHomeData(condition, HomePrivider provider){
    if(condition == 1){
      provider.addOneWeek();
    }
    else if(condition == 0){
      provider.minusOneWeek();
    }
  }



  @override
  Widget build(BuildContext context) {

    HomePrivider provider = Provider.of<HomePrivider>(context);


    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: TopBarItem(
          currentWeek: provider.weekNumber ,
        ),
        backgroundColor: GlobalConfig.basicColor,
        elevation:0.0,
        actions: <Widget>[
          RightIconButtons()
        ],
      ),
      drawer: MainDrawer(),
      body: GestureDetector(
        onHorizontalDragEnd:(startDetails){
          //从源代码得知，startDetails.primaryVelocity 为移动的距离差 向左滑为负数 向右滑为正数
          //绝对值越大 滑动幅度越大
          var p = startDetails.primaryVelocity;

          if(p.abs() > 1000){
            if(p > 0){
              renewHomeData(0, provider);
            }
            else{
              renewHomeData(1, provider);
            }
          }
          provider.appendstuClasses();
        },
        child: Column(
          children: <Widget>[
            DayBarView(beginDay: provider.beginDate,),
            HomeClassView(stuClasses: provider.stuClasses)
          ],
        ),
      ),
    );
  }
}
