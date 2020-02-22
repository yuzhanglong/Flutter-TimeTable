import 'package:flutter/material.dart';
import 'package:zucc_helper/config/network_config.dart';
import 'package:zucc_helper/views/connection/child_cmp/check_code.dart';



class DataForm extends StatefulWidget {


  @override
  _DataFormState createState() => _DataFormState();
}

class _DataFormState extends State<DataForm> {
  String checkCodeSrc = BASE_URL + "/utils/get_login_data";

  @override
  Widget build(BuildContext context) {
    return Theme(
      data:  ThemeData(
        primaryColor: Colors.blue,
    ),
      child: Container(
        padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                    icon: Icon(Icons.people),
                    labelText: "用户名/学号",
                ),
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    icon: Icon(Icons.lock),
                    labelText: "密码"
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                    icon: Icon(
                        Icons.check_circle,
                    ),
                    labelText: "验证码"
                ),
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
                          onPressed: (){},
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
