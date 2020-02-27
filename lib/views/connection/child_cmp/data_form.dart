import 'package:flutter/material.dart';
import 'package:zucc_helper/config/network_config.dart';
import 'package:zucc_helper/models/response_model.dart';
import 'package:zucc_helper/models/table_model.dart';
import 'package:zucc_helper/network/requests.dart';
import 'package:zucc_helper/network/user_request.dart';
import 'package:zucc_helper/network/utils_request.dart';
import 'package:zucc_helper/store/profile_provider.dart';
import 'package:zucc_helper/store/table_provider.dart';
import 'package:zucc_helper/utils/snack_bar.dart';
import 'package:zucc_helper/views/connection/child_cmp/check_code.dart';
import 'package:provider/provider.dart';



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



  @override
  Widget build(BuildContext context) {

    ProfileProvider profileProvider = Provider.of<ProfileProvider>(context);
    TableProvider tableProvider = Provider.of<TableProvider>(context);

    gobackToHome(info){
      Navigator.of(context).pop(info);
    }


    sendDataForm(userName, password, code, token, owner){
      UtilsRequest.getDataFromEducationSystem(userName, password, code, token, owner)
          .then((res){
            var respose = ResponseCondition.fromMap(res);
            gobackToHome(respose.information);
//            tableProvider.getTablesData(profileProvider.user, profileProvider.token);
          })
          .catchError((error){
            var respose = ResponseCondition.fromMap(error);
            Scaffold.of(context).showSnackBar(Snack.error(respose.information));
          });
    }


    return Theme(
      data:  ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.blue
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
                            sendDataForm(userName, password, checkCode, profileProvider.token, profileProvider.user);
                          },
                          child: Text("导入课表", style: TextStyle(
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
