import 'package:flutter/material.dart';
import 'package:zucc_helper/config/network_config.dart';
import 'package:zucc_helper/views/connection/child_cmp/data_form.dart';
// 连接教务系统的界面


class ConnectionPage extends StatefulWidget {
  @override
  _ConnectionPageState createState() => _ConnectionPageState();
}

class _ConnectionPageState extends State<ConnectionPage> with TickerProviderStateMixin {
  Animation<num> appearAnimation1;
  Animation<num> appearAnimation2;
  AnimationController appearController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    appearController = AnimationController(duration: const Duration(milliseconds: 800), vsync: this);
    appearAnimation1 = Tween(begin: 120.0, end: 0.0).animate(appearController)
        ..addListener(() {
          setState(() {});
        });
    appearAnimation2 = Tween(begin: 350.0, end: 0.0).animate(appearController)
        ..addListener(() {
        setState(() {});
        });
    appearController.forward().orCancel;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        color: Colors.lightBlueAccent,
        //设置四周圆角 角度
        borderRadius: BorderRadius.all(Radius.circular(appearAnimation2.value)),
        //设置四周边框
        border: Border.all(width: appearAnimation1.value, color: Colors.lightBlueAccent),
      ),
      child: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        appBar: AppBar(
          title: Text("正方教务系统登录"),
          elevation: 0,
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: Column(
          children: <Widget>[
            DataForm(),
          ],
        ),
      ),
    );
  }
}
