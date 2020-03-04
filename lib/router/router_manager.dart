import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zucc_helper/views/home/home.dart';


class RouteName {
  static const String home = 'home';
}


class Router {
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch (settings.name){
      case RouteName.home:
        return CupertinoPageRoute(fullscreenDialog: true, builder: (_)=> Home());
      default:
        return CupertinoPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            )
        );
    }
  }
}