import 'package:flutter/material.dart';


class CustomRoute extends PageRouteBuilder{
  final Widget widget;

  CustomRoute(this.widget)
      :super(
      transitionDuration:Duration(seconds: 1),
      pageBuilder:(
          // 上下文和动画
          BuildContext context,
          Animation<double> animaton1,
          Animation<double> animaton2,
          ){
        return widget;
      },

      transitionsBuilder:(
          BuildContext context,
          Animation<double> animaton1,
          Animation<double> animaton2,
          Widget child,
          ){
         return ScaleTransition(
           scale: Tween(begin: 0.0,end: 1.0).animate(CurvedAnimation(
             parent: animaton1,
             curve: Curves.fastOutSlowIn
           )),
           child: child,
         );

      }
  );
}
