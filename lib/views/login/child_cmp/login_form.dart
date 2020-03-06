import 'package:flutter/material.dart';
import 'package:zucc_helper/components/animations/scale_animation.dart';
import 'package:zucc_helper/models/login_model.dart';
import 'package:zucc_helper/models/response_model.dart';
import 'package:zucc_helper/network/profile_request.dart';
import 'package:zucc_helper/store/profile_provider.dart';
import 'package:zucc_helper/utils/snack_bar.dart';
import 'package:provider/provider.dart';
import 'package:zucc_helper/store/table_provider.dart';



class LoginForm extends StatefulWidget {
  @required final String formType;


  LoginForm({
    this.formType
  });




  @override
  _LoginFormState createState() => _LoginFormState();

}

class _LoginFormState extends State<LoginForm>  with TickerProviderStateMixin{


  //表单上升动画
  AnimationController formRiseController;
  Animation<double> formRiseAnimation;

  Login loginForm = Login();

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
    TableProvider tableProvider = Provider.of<TableProvider>(context);
    ProfileProvider profileProvider = Provider.of<ProfileProvider>(context);


    gobackToHome(info){
      Navigator.of(context).pop(info);
    }

    // 注册表单
    gotoRegister(){
      // 验证
      var v = loginForm.validate(1);
      if(v != "success"){
        Scaffold.of(context).showSnackBar(Snack.error(v));
        return;
      }

      Future r = profileProvider.gotoRegister(loginForm);
      r.then((res){
        if(res.isSuccess){
          tableProvider.getRemoteTables();
          gobackToHome("注册成功啦~");
        }else{
          Scaffold.of(context).showSnackBar(Snack.error("抱歉 注册失败"));
        }
      });
    }


    gotoLogin(){
      // 验证
      var v = loginForm.validate(0);
      if(v != "success"){
        Scaffold.of(context).showSnackBar(Snack.error(v));
        return;
      }


      Future r = profileProvider.gotoLogin(loginForm);
      r.then((res){
        if(res.isSuccess){
          tableProvider.getRemoteTables();
          gobackToHome(res.information);
        }else{
          Scaffold.of(context).showSnackBar(Snack.error(res.information));
        }
      });
    }

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
                child: ListView(
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
                        ),
                        onChanged: (value){
                          setState(() {
                            loginForm.userName = value;
                          });
                        },
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
                        ),
                        onChanged: (value){
                          setState(() {
                            loginForm.password = value;
                          });
                        },
                    ),
                    SizedBox(height: 35,),
                    widget.formType == "login" ? Container() : TextField(
                      autocorrect: true,
                      decoration: InputDecoration(
                        hintText: '请重复一遍密码',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white,),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white , width: 2),
                        ),
                      ),
                      onChanged: (value){
                        setState(() {
                          loginForm.passwordAgain = value;
                        });
                      },
                    ),
                    SizedBox(height: 100,),
                    ScaleAnimation(
                      curveType: Curves.fastOutSlowIn,
                      widget: Container(
                        width: 350,
                        height: 50,
                        child: FlatButton(
                          color: Colors.white,
                          child: Text(
                            widget.formType == "login" ? "登录" : "注册",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black
                            ),),
                          onPressed: (){
                            widget.formType == "login" ? gotoLogin() : gotoRegister();
                          },
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
