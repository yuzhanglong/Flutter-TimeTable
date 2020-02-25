import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zucc_helper/components/drawer/child_cmp/better_drawer.dart';
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

    getUserName(){
      return profileProvider.user == null ? Text("请登录") : Text(profileProvider.user);
    }

    return BetterDrawer(
        widthPercent: 0.8,
        child: ListView(
          padding: EdgeInsets.zero,
          // ListView => 装载抽屉的部件
          children: <Widget>[
            Container(
              height: 180,
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
            ListTile(
              onTap: (){
                print("kcb");
              },
              leading: Icon(Icons.library_books),
              title: Text("课程表"),
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

