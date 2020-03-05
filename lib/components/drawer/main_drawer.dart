import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zucc_helper/components/drawer/child_cmp/better_drawer.dart';
import 'package:zucc_helper/components/expansion/better_expansion.dart';
import 'package:zucc_helper/models/table_model.dart';
import 'package:zucc_helper/store/profile_provider.dart';
import 'package:zucc_helper/utils/snack_bar.dart';
import 'package:zucc_helper/views/login/login.dart';
import 'package:provider/provider.dart';
import 'package:zucc_helper/store/table_provider.dart';
import 'package:zucc_helper/views/settings/settings.dart';


// 左侧抽屉
class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {


  @override
  Widget build(BuildContext context) {

    ProfileProvider profileProvider = Provider.of<ProfileProvider>(context);
    TableProvider tableProvider = Provider.of<TableProvider>(context);



    String getUserName(){
      return profileProvider.profile == null ? "请登录" : profileProvider.profile.userName;
    }

    List<Widget> getExpansionChildren(){
      List<Widget> tmp = [];
      var t = tableProvider.tables;
      for(int i = 0; i < t.length; i++){
        var singleTable = StuTable.fromMap(t[i]);
        tmp.add(
          ListTile(
            title: Text(singleTable.tableName, style: TextStyle(color: Colors.white70),),
            onTap: (){
              tableProvider.changeHomeClasses(i);
              //抽屉关闭
              Scaffold.of(context).openEndDrawer();
            },
          ),
        );
      }
      return tmp;
    }

    return BetterDrawer(
        widthPercent: 0.8,
        child: Container(
          color: Color.fromARGB(255, 131, 137, 184),
          child: Column(
            children: <Widget>[
              Container(
                color: Color.fromARGB(255, 131, 137, 184),
                height: 200,
                child: DrawerHeader(
                    padding: EdgeInsets.all(0),
                    // DrawerHeader =>抽屉的头部
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 131, 137, 184),
                    ),
                    child: GestureDetector(
                      onTap: (){
                        if(profileProvider.isLogin){
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>SettingPage()));
                        }
                        else{
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>LoginPage()))
                              .then((res){
                            Scaffold.of(context).openEndDrawer();
                            Scaffold.of(context).showSnackBar(Snack.success(res));
//                            tableProvider.initTables();
                          });
                        }
                      },
                      child: Center(
                          child: Container(
                              padding: EdgeInsets.fromLTRB(0, 22, 0, 0),
                              child: Column(
                                children: <Widget>[
                                  Icon(Icons.account_circle, size: 70, color: Colors.white,),
                                  SizedBox(height: 15,),
                                  Text(
                                    getUserName(),
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
                                  ),
                                ],
                              )
                          )
                      ),
                    )
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height - 200,
                child: ListView(
                  padding: EdgeInsets.zero,
                  // ListView => 装载抽屉的部件
                  children: <Widget>[
                    BetterExpansion(
                      backgroundColor: Colors.transparent,
                      leading: Icon(Icons.library_books, color: Colors.white,),
                      title: Text("我的课表", style: TextStyle(color: Colors.white),),
                      children: getExpansionChildren()
                    ),
                    ListTile(
                      onTap: (){
                        if(profileProvider.isLogin){
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>SettingPage()))
                              .then((res){
                                Scaffold.of(context).openEndDrawer();
                                if(res != null){
                                  Scaffold.of(context).showSnackBar(Snack.success(res));
                                }
                              });
                        }
                        else{
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>LoginPage()))
                              .then((res){
                            Scaffold.of(context).openEndDrawer();
                            if(res != null){
                              Scaffold.of(context).showSnackBar(Snack.success(res));
                            }
//                            tableProvider.initTables();
                          });
                        }
                      },
                      leading: Icon(Icons.settings, color: Colors.white,),
                      title: Text("设置", style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}