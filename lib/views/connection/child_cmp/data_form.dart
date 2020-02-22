import 'package:flutter/material.dart';
import 'package:zucc_helper/config/network_config.dart';
import 'package:zucc_helper/network/requests.dart';
import 'package:zucc_helper/views/connection/child_cmp/check_code.dart';



class DataForm extends StatefulWidget {


  @override
  _DataFormState createState() => _DataFormState();
}

class _DataFormState extends State<DataForm> {
  String checkCodeSrc = BASE_URL + "/utils/get_login_data";
  String userName;
  String password;
  String checkCode;



  GlobalKey <FormState> formKey = GlobalKey();

  sendDataForm(userName, password, code){
    HttpRequest.request("/utils/goto_login", method: "post", data: {
      "userName":userName,
      "password":password,
      "checkCode":code,
    }).then((res){
      print(res);
      print("object1");
    }).catchError((error){
      print("object2");
      print(error);
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(error["information"]),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 1),
      ));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Theme(
      data:  ThemeData(
        primaryColor: Colors.blue,
    ),
      child: Container(
        padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                    icon: Icon(Icons.people),
                    labelText: "用户名/学号",
                ),
                onSaved: (value){
                  userName = value;
                },
                validator: (value){
                  if(value == null || value.length == 0){
                    return "用户名不能为空";
                  }
                  return null;
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    icon: Icon(Icons.lock),
                    labelText: "密码"
                ),
                onSaved: (value){
                  password = value;
                },
                validator: (value){
                  if(value == null || value.length == 0){
                    return "密码不能为空";
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                    icon: Icon(
                        Icons.check_circle,
                    ),
                    labelText: "验证码"
                ),
                onSaved: (value){
                  checkCode = value;
                },
                validator: (value){
                  if(value == null || value.length == 0){
                    return "验证码不能为空";
                  }
                  return null;
                },
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: CheckCode(
                  imgSrc: checkCodeSrc,
                )
              ),
              Container(
                margin: EdgeInsets.fromLTRB(40, 10, 0, 0),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 100,
                      child: MaterialButton (
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)
                          ),
                          color: Colors.green,
                          onPressed: (){
                            formKey.currentState.save();
                            formKey.currentState.validate();
                            sendDataForm(userName, password, checkCode);
                          },
                          child: Text("登录", style: TextStyle(
                            color: Colors.white,
                          ),)
                      ),
                    ),
                    SizedBox(width: 12,),
                    Container(
                      width: 110,
                      child: MaterialButton (
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)
                          ),
                          color: Colors.grey,
                          onPressed: (){
                            setState(() {
                              checkCodeSrc = checkCodeSrc + "?";
                              Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text("验证码刷新成功"),
                                duration: Duration(seconds: 1),
                                backgroundColor: Colors.green,
                              ));
                            });
                          },
                          child: Text("刷新验证码", style: TextStyle(
                            color: Colors.white,
                          ),)
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}
