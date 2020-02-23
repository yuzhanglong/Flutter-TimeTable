import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zucc_helper/store/home_provider.dart';
import 'package:zucc_helper/views/home/home.dart';



class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        child: Home(),
        providers: [
          ChangeNotifierProvider(
            create: (context) => HomePrivider(),
          )
        ],
    );
  }
}
