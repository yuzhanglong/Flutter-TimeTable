import 'package:flutter/material.dart';
import 'package:zucc_helper/components/animations/scale_animation.dart';
import 'package:zucc_helper/views/login/child_cmp/split_line.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin{

  AnimationController loginButtonController;
  Animation<double> loginButtonAnimation;

  AnimationController registButtonController;
  Animation<double> registButtonAnimation;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
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
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 80,),
              ScaleAnimation(
                curveType: Curves.bounceInOut,
                widget: Icon(Icons.people, size: 120,color: Colors.grey,)
              ),
              SizedBox(height: 80,),
              Container(
                width: 250,
                height: 42,
                child: ScaleAnimation(
                  duration: 600,
                  delayTime: 500,
                  curveType: Curves.fastOutSlowIn,
                  widget: MaterialButton(
                    onPressed: (){},
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
                    onPressed: (){},
                    child: Text("登录", style: TextStyle(color: Colors.white),),
                    color: Colors.blue,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

