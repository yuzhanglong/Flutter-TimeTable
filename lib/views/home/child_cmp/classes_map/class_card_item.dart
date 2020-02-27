import 'package:flutter/material.dart';



//课程卡片

class ClassCard extends StatefulWidget {
  //课程名称
  final String className;

  //底色
  final Color baseColor;

  //卡片类型  默认为0   1代表下方无圆角  2代表下方无圆角  3代表中间 用于连续的课程处理
  final int cardType;

  ClassCard({
    this.className = "",
    this.baseColor = Colors.white,
    this.cardType = 0
  });


  @override
  _ClassCardState createState() => _ClassCardState();
}

class _ClassCardState extends State<ClassCard> with TickerProviderStateMixin{
  Animation<double> cardAnimation;
  AnimationController cardController;


  @override
  void didUpdateWidget(ClassCard oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    cardController.reset();
    cardController.forward();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    cardController.dispose();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cardController = AnimationController(duration: const Duration(milliseconds: 800), vsync: this);
    cardAnimation = Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
      parent: cardController,
      curve: Curves.fastOutSlowIn,
    ));
    cardController.forward();
  }





  getBorderRadius(type){
    //默认卡片 适用于单节课的情况
    if(type == 0){
      return BorderRadius.all(Radius.circular(6.0));
    }
    //适用于两节课的顶部
    else if(type == 1){
      return BorderRadius.only(topLeft: Radius.circular(6.0), topRight: Radius.circular(6.0));
    }
    //适用于两节课的底部
    else if(type == 2){
      return BorderRadius.only(bottomLeft: Radius.circular(6.0), bottomRight: Radius.circular(6.0));
    }
    //适用于例如3节课的中间部分
    else if(type == 3){
      return BorderRadius.all(Radius.circular(0.0));
    }
  }


  getCardBorder(type){
    //默认卡片 适用于单节课的情况
    if(type == 0){
      return BorderRadius.all(Radius.circular(6.0));
    }
    //适用于两节课的顶部
    else if(type == 1){
      return BorderRadius.only(topLeft: Radius.circular(6.0), topRight: Radius.circular(6.0));
    }
    //适用于两节课的底部
    else if(type == 2){
      return BorderRadius.only(bottomLeft: Radius.circular(6.0), bottomRight: Radius.circular(6.0));
    }
    //适用于例如3节课的中间部分
    else if(type == 3){
      return BorderRadius.all(Radius.circular(0));
    }
  }


  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: cardAnimation,
      child: Container(
        decoration: BoxDecoration(
          color: widget.baseColor,
          //圆角幅度
          borderRadius: getBorderRadius(widget.cardType),
          border: Border.all(width:3, color: Colors.transparent),
        ),
        child: Column(
          children: <Widget>[
            Text(
              widget.className,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              maxLines: 4,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
