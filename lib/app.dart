import 'package:flutter/material.dart';
import 'package:zucc_helper/views/home/home.dart';



class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Home();
  }
}