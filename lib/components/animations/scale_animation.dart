// 进入动画
import 'package:flutter/material.dart';


class ScaleAnimation extends StatefulWidget {
  //播放动画的子组件
  final Widget widget;
  // 延迟时间
  final int delayTime;
  //播放时间
  final int duration;

  final Curve curveType;

  ScaleAnimation({
    @required this.widget,
    @required this.curveType,
    this.delayTime = 0,
    this.duration = 1000,
  });

  @override
  _ScaleAnimationState createState() => _ScaleAnimationState();
}

class _ScaleAnimationState extends State<ScaleAnimation> with TickerProviderStateMixin {

  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initAnimation();
    runAnimation();
  }


  initAnimation(){
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: widget.duration));
    animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: animationController, curve: widget.curveType));

  }

  disPoseAnimation(){
    animationController.dispose();
  }


  runAnimation(){
    Future.delayed(Duration(milliseconds: widget.delayTime), () {
      animationController.forward();
    });
  }



  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: animation,
      child: widget.widget,
    );
  }



  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    disPoseAnimation();
  }
}
