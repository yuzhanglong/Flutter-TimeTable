import 'package:flutter/material.dart';
import 'package:zucc_helper/components/drawer/main_drawer.dart';
import 'package:zucc_helper/components/topbar/top_bar_item.dart';
import 'package:zucc_helper/config/global_config.dart';
import 'package:zucc_helper/views/home/child_cmp/classes_map/main_classes_map.dart';
import 'package:zucc_helper/views/home/child_cmp/day_bar/day_bar.dart';

//首页

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar,
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          DayBarView(),
          HomeClassView()
        ],
      ),
    );
  }

  get _appbar => AppBar(
    title: TopBarItem(),
    backgroundColor: GlobalConfig.basicColor,
    elevation:0.0,
    actions: <Widget>[
      Container(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Icon(Icons.add, color: GlobalConfig.fontColor),
      ),
      Container(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Icon(Icons.file_download, color: GlobalConfig.fontColor,),
      ),
    ],
  );


}
