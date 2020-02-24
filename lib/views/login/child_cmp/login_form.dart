import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:zucc_helper/components/animations/scale_animation.dart';




class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();




}

class _LoginFormState extends State<LoginForm>  with TickerProviderStateMixin{

  //表单上升动画
  AnimationController formRiseController;
  Animation<double> formRiseAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initLoginFormAnimation();
    formRiseController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    disposeLoginFormAnimation();
  }



  @override
  Widget build(BuildContext context) {
    return Theme(
      data:  ThemeData(
        primaryColor: Colors.white,
        hintColor: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: formRiseAnimation.value,),
          Expanded(
            child: Container(
              height: 519,
              color: Colors.blue,
              child: Container(
                padding: EdgeInsets.fromLTRB(40, 90, 40, 0),
                child: Column(
                  children: <Widget>[
                    TextField(
                        autocorrect: true,
                        decoration: InputDecoration(
                          hintText: '请输入用户名',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white,),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white , width: 2),
                          ),
                        )
                    ),
                    SizedBox(height: 35,),
                    TextField(
                        autocorrect: true,
                        decoration: InputDecoration(
                          hintText: '请输入密码',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white,),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white , width: 2),
                          ),
                        )
                    ),
                    SizedBox(height: 100,),
                    ScaleAnimation(
                      curveType: Curves.fastOutSlowIn,
                      widget: Container(
                        width: 350,
                        height: 50,
                        child: FlatButton(
                          color: Colors.white,
                          child: Text("登录", style: TextStyle(
                            fontSize: 16,
                            color: Colors.black
                          ),),
                          onPressed: (){},
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }




  initLoginFormAnimation(){
    formRiseController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    formRiseAnimation = Tween(begin: 479.0, end: 180.0).animate(CurvedAnimation(parent: formRiseController, curve: Curves.fastOutSlowIn))
      ..addListener(() {
        setState(() {});
      });
  }


  disposeLoginFormAnimation(){
    formRiseController.dispose();
  }



}
