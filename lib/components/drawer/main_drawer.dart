import 'package:flutter/material.dart';
import 'package:zucc_helper/components/drawer/better_drawer.dart';



class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BetterDrawer(
        widthPercent: 0.8,
        child: ListView(
          padding: EdgeInsets.zero,
          // ListView => 装载抽屉的部件
          children: <Widget>[
            DrawerHeader(
              // DrawerHeader =>抽屉的头部
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
              ),
              child: Center(
                child: SizedBox(
                  //SizeBox => 限制大小
                  width: 60.0,
                  height: 60.0,
                  child: CircleAvatar(
                    child: Text("user"),
                  ),
                ),
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
            )
          ],
        )
    );
  }
}
