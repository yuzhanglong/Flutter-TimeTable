import 'package:flutter/material.dart';
import 'package:zucc_helper/config/network_config.dart';
import 'package:zucc_helper/views/connection/child_cmp/data_form.dart';
// 连接教务系统的界面


class ConnectionPage extends StatefulWidget {
  @override
  _ConnectionPageState createState() => _ConnectionPageState();
}

class _ConnectionPageState extends State<ConnectionPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        color: Colors.lightBlueAccent,
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
