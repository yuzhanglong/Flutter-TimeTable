import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zucc_helper/models/profile_model.dart';
import 'package:zucc_helper/store/profile_provider.dart';
import 'package:zucc_helper/store/table_provider.dart';
import 'package:zucc_helper/utils/snack_bar.dart';

class ClassSettings extends StatefulWidget {
  @override
  _ClassSettingsState createState() => _ClassSettingsState();
}

class _ClassSettingsState extends State<ClassSettings> {

  GlobalKey <ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  String getDateTimeString(dateTime){
    return dateTime != null ? "${dateTime.year}年${dateTime.month}月${dateTime.day}日" : "未设置";
  }




  @override
  Widget build(BuildContext context) {


    TableProvider tableProvider = Provider.of<TableProvider>(context);
    ProfileProvider profileProvider = Provider.of<ProfileProvider>(context);


    String showDateTime = getDateTimeString(profileProvider.profile.termStartTime);

    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 41, 47, 93),
        elevation: 0,
      ),
      backgroundColor: Color.fromARGB(255, 41, 47, 93),
      body: Container(
       child: Center(
         child: Column(
           children: <Widget>[
             Icon(Icons.timer, color: Colors.white, size: 75,),
             SizedBox(height: 10,),
             Container(
               padding: EdgeInsets.fromLTRB(15, 30, 0, 0),
               height: MediaQuery.of(context).size.height - 172,
               child: ListView(
                 children: <Widget>[
                   ListTile(
                     leading: Icon(Icons.calendar_today, color: Colors.white,),
                     title: Row(
                       children: <Widget>[
                         Text("开学日期", style: TextStyle(color: Colors.white, fontSize: 18)),
                         SizedBox(width: 40,),
                         Text(showDateTime, style: TextStyle(color: Colors.white70, fontSize: 18)),
                       ],
                     ),
                     onTap: (){
                       showDatePicker(
                           context: context,
                           //默认选择日期
                           initialDate: DateTime.now(),
                           //最早日期
                           firstDate: DateTime(DateTime.now().year, 1),
                           //最晚日期
                           lastDate: DateTime.now(),
                       ).then((DateTime val) {
                         if(val != null){
                           var p = Profile();
                           p.termStartTime = val;
                           Future f = profileProvider.resetProfileInfo(p);
                           f.then((res){
                             if(res){
                               _scaffoldkey.currentState.showSnackBar(Snack.success("开学日期修改成功"));
                               tableProvider.renewTime(p.termStartTime);
                               tableProvider.initTables();
                             }else{
                               _scaffoldkey.currentState.showSnackBar(Snack.success("开学日期修改失败"));
                             }
                           });
                         }
                       });
                     },
                   ),
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