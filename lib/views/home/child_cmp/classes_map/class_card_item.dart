import 'package:flutter/material.dart';
import 'package:zucc_helper/models/table_model.dart';

import 'bottom_show.dart';



//课程卡片

class ClassCard extends StatefulWidget {

  final StuClass stuClass;


  final int cardType;


  ClassCard({
    this.stuClass,
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
      child: GestureDetector(
        onTap: (){
          if(widget.stuClass != null){
            showModalBottomSheet(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(20)
                ), //加圆角
                context: context,
                builder: (_){
                  return BottomShow(
                    stuClass: widget.stuClass,
                  );
                }
            );
          }
        },
        child: Container(
          decoration: BoxDecoration(
            color: widget.stuClass != null ? widget.stuClass.baseColor: Colors.white,
            //圆角幅度
            borderRadius: getBorderRadius(widget.cardType),
            border: Border.all(width:3, color: Colors.transparent),
          ),
          child: Column(
            children: <Widget>[
              Text(
                widget.stuClass != null ? widget.stuClass.className : "",
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                maxLines: 3,
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
      ),
    );
  }
}
