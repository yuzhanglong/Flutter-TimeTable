import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:provider/provider.dart';
import 'package:zucc_helper/models/response_model.dart';
import 'package:zucc_helper/models/table_model.dart';
import 'package:zucc_helper/network/table_request.dart';
import 'package:zucc_helper/store/profile_provider.dart';
import 'package:zucc_helper/store/table_provider.dart';
import 'package:zucc_helper/utils/pick_data.dart';
import 'package:zucc_helper/utils/snack_bar.dart';
import 'package:zucc_helper/utils/table_date.dart';
import 'package:zucc_helper/views/home/child_cmp/classes_map/class_time_item.dart';
import 'package:zucc_helper/views/settings/child_cmp/about.dart';
import 'package:zucc_helper/views/settings/child_cmp/accout_settings.dart';
import 'package:zucc_helper/views/settings/child_cmp/class_settings.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage>  with TickerProviderStateMixin{


  GlobalKey <ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  AnimationController animationController;
  Animation<double> animation;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 1000));
    animation = Tween(begin: 0.0, end: 160.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn)
    )
      ..addListener(() {
        setState(() {});
      });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    ProfileProvider profileProvider = Provider.of<ProfileProvider>(context);
    TableProvider tableProvider = Provider.of<TableProvider>(context);

    return Scaffold(
        key: _scaffoldkey,
        backgroundColor: Color.fromARGB(255, 41, 47, 93),
        appBar: AppBar(
          title: Text("设置", style: TextStyle(
              color: Color.fromARGB(255, 89, 81, 141),
              fontSize: 18
          )),
          elevation: 0,
        ),
        body: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: animation.value,
              decoration: BoxDecoration(
                color: Colors.white,
                //圆角幅度
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                border: Border.all(width:3, color: Colors.transparent),
              ),
              child: Container(
                child: Image.asset(
                    "assets/images/settings.png",
                    fit: BoxFit.none,
                ),
              ),
            ),
            Container(
                padding: EdgeInsets.fromLTRB(15, 30, 20, 0),
                height: MediaQuery.of(context).size.height - 250,
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.timer, color: Colors.white,),
                      title: Text("课程相关", style: TextStyle(color: Colors.white, fontSize: 18)),
                      subtitle: Text("开学时间 当前周次", style: TextStyle(
                          color: Colors.white, fontSize: 14
                      )),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ClassSettings(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 8,),
                    ListTile(
                      leading: Icon(Icons.color_lens, color: Colors.white,),
                      title: Text("个性化", style: TextStyle(color: Colors.white, fontSize: 18)),
                      subtitle: Text("课程表卡片颜色 页面主题颜色", style: TextStyle(
                          color: Colors.white, fontSize: 14
                      )),
                    ),
                    SizedBox(height: 8,),
                    ListTile(
                      leading: Icon(Icons.perm_identity, color: Colors.white,),
                      title: Text("账户设置", style: TextStyle(color: Colors.white, fontSize: 18)),
                      subtitle: Text("密码修改", style: TextStyle(
                          color: Colors.white, fontSize: 14
                      )),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => AccountSettings(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 8,),
                    ListTile(
                      leading: Icon(Icons.announcement, color: Colors.white,),
                      title: Text("关于", style: TextStyle(color: Colors.white, fontSize: 18)),
                      isThreeLine: true,
                      subtitle: Text("app开源地址等其他信息", style: TextStyle(
                          color: Colors.white, fontSize: 14
                      )),
                      onTap: (){
                        showDialog(
                          context: context,
                          builder: (BuildContext context){
                            return About();
                          }
                        );
                      },
                    ),
                  ],
                )
            ),
          ],
        )
    );
  }
}