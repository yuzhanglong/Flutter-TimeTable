import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zucc_helper/components/drawer/child_cmp/better_drawer.dart';
import 'package:zucc_helper/models/table_model.dart';
import 'package:zucc_helper/store/profile_provider.dart';
import 'package:zucc_helper/utils/snack_bar.dart';
import 'package:zucc_helper/views/login/login.dart';
import 'package:provider/provider.dart';
import 'package:zucc_helper/store/table_provider.dart';


class MainDrawer extends StatefulWidget {


  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {


  @override
  Widget build(BuildContext context) {

    ProfileProvider profileProvider = Provider.of<ProfileProvider>(context);
    TableProvider tableProvider = Provider.of<TableProvider>(context);



    getUserName(){
      return profileProvider.user == null ? Text("请登录") : Text(profileProvider.user);
    }

    List<Widget> getExpansionChildren(){
      List<Widget> tmp = [];
      var t = tableProvider.tables;
      for(int i = 0; i < t.length; i++){
        var singleTable = StuTable.fromMap(t[i]);
        tmp.add(
          ListTile(
            title: Text(singleTable.tableName),
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
        child: ListView(
          padding: EdgeInsets.zero,
          // ListView => 装载抽屉的部件
          children: <Widget>[
            Container(
              height: 170,
              child: DrawerHeader(
                  padding: EdgeInsets.all(0),
                  // DrawerHeader =>抽屉的头部
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                  ),
                  child: Stack(
                    children: <Widget>[

                    ],
                  )
              ),
            ),
            ExpansionTile(
              backgroundColor: Colors.transparent,
              leading: Icon(Icons.library_books),
              title: Text("我的课表"),
              children: getExpansionChildren()
            ),
            ListTile(
              onTap: (){
                print("ks");
              },
              leading: Icon(Icons.wrap_text),
              title: Text("考试信息"),
            ),
            SizedBox(height: 420,),
            ListTile(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>LoginPage())
                ).then((res){
                  Scaffold.of(context).openEndDrawer();
                  Scaffold.of(context).showSnackBar(Snack.success(res));
                  tableProvider.initTables();
                });
              },
              leading: Icon(Icons.perm_identity),
              title: getUserName(),
            ),
          ],
        )
    );

  }

}

