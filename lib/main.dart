import 'package:flutter/material.dart';
import 'package:zucc_helper/app.dart';
import 'package:zucc_helper/config/global_config.dart';

void main(){
  runApp(ZuccHelperApp());
}


class ZuccHelperApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "zucc-helper",
      home: App(),
      theme: ThemeData(
          primaryColor: GlobalConfig.basicColor
      ),
    );
  }
}
