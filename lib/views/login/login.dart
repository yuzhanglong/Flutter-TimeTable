import 'package:flutter/material.dart';
import 'package:zucc_helper/components/animations/scale_animation.dart';
import 'package:zucc_helper/views/login/child_cmp/login_form.dart';
import 'package:zucc_helper/views/login/child_cmp/split_line.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin{

  AnimationController logoUpAnimationController;
  Animation<double> logoUpAnimation;


  //按钮组
  List <Widget> buttonGroup = [];

  List <Widget> loginForm = [];


  bool showForm = false;
  String formType;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();



    buttonGroup = [
      SizedBox(height: 80,),
      Container(
        width: 250,
        height: 42,
        child: ScaleAnimation(
          duration: 600,
          delayTime: 500,
          curveType: Curves.fastOutSlowIn,
          widget: MaterialButton(
            onPressed: (){
              logoUpAnimationController.forward();
              buttonGroup.clear();
              setState(() {
                showForm = true;
                formType = "register";
              });
            },
            child: Text("注册一个账号", style: TextStyle(color: Colors.white),),
            color: Colors.grey,
          ),
        ),
      ),
      SizedBox(height: 20),
      Container(
          width: 250,
          child: SplitLine()
      ),
      SizedBox(height: 20),
      Container(
        width: 250,
        height: 42,
        child: ScaleAnimation(
          duration: 600,
          delayTime: 700,
          curveType: Curves.fastOutSlowIn,
          widget: MaterialButton(
            onPressed: (){
              logoUpAnimationController.forward();
              buttonGroup.clear();
              setState(() {
                showForm = true;
                formType = "login";
              });
            },
            child: Text("登录", style: TextStyle(color: Colors.white),),
            color: Colors.blue,
          ),
        ),
      )
    ];

    initLoginPageAnimation();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    disposeLoginPageAnimation();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading:false,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: logoUpAnimation.value,),
                  ScaleAnimation(
                      curveType: Curves.bounceInOut,
                      widget: Icon(Icons.people, size: 120,color: Colors.grey,)
                  ),
                  Column(
                      children: buttonGroup
                  ),
                ],
              ),
            ),
          ),
          showForm ? LoginForm(
            formType: formType,
          ) : Container()
        ],
      )
    );
  }


  initLoginPageAnimation(){
    logoUpAnimationController = AnimationController(vsync: this, duration: Duration(milliseconds: 350));
    logoUpAnimation = Tween(begin: 100.0, end: 2.0).animate(logoUpAnimationController)
      ..addListener(() {
        setState(() {});
      });
  }


  disposeLoginPageAnimation(){
    logoUpAnimationController.dispose();
  }
}

