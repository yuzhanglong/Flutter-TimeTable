import 'package:flutter/material.dart';
import 'package:zucc_helper/components/drawer/main_drawer.dart';
import 'package:zucc_helper/components/topbar/top_bar_item.dart';
import 'package:zucc_helper/config/global_config.dart';
import 'package:zucc_helper/network/requests.dart';
import 'package:zucc_helper/views/home/child_cmp/classes_map/main_classes_map.dart';
import 'package:zucc_helper/views/home/child_cmp/day_bar/day_bar.dart';

//首页

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List stuClasses = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    HttpRequest.request("/utils/get_classes").then((res){
      this.stuClasses = res['classes'];
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar,
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          DayBarView(),
          HomeClassView(stuClasses: stuClasses,)
        ],
      ),
    );
  }

  get _appbar => AppBar(
    title: TopBarItem(),
    backgroundColor: GlobalConfig.basicColor,
    elevation:0.0,
    actions: <Widget>[
      RightIconButtons()
    ],
  );


}
