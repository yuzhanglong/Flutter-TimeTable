import 'dart:convert';
import 'package:flutter/material.dart';
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
class CreateClass extends StatefulWidget {

  @override
  _CreateClassState createState() => _CreateClassState();
}

class _CreateClassState extends State<CreateClass> with TickerProviderStateMixin{

  GlobalKey <ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  AnimationController animationController;
  Animation<double> animation;




  List <Widget> makeClassCard(){
    return [
      Container(
        padding: EdgeInsets.fromLTRB(22, 0, 0, 0),
        width: 340,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 41, 47, 93),
          border: Border(bottom: BorderSide(width: 2,color: Color.fromARGB(255, 48, 63, 102))),
        ),
        height: 400,
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "Detailed Settings",
                style: TextStyle(
                color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.left,
              ),
              padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
            ),
            SizedBox(height: 15,),
            TextField(
              onTap: (){
                Picker(
                    adapter: PickerDataAdapter<String>(pickerdata:[
                      "星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日"
                    ]),
                    title: Text("请选择星期"),
                    changeToFirst: true,
                    hideHeader: true,
                    onConfirm: (Picker picker, List value) {
                      setState(() {
                        singleClass.weekDay = value[0] + 1;
                      });
                    }
                ).showDialog(context);
              },
              readOnly: true,
              decoration: InputDecoration(
                icon: Icon(Icons.wb_sunny, color: Colors.white,),
                hintStyle: TextStyle(
                    color: Colors.white
                ),
                hintText: singleClass.weekDay == null ? '选择星期' : "星期" + TableDate.getWeekDaySimple(singleClass.weekDay - 1),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent,),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent, width: 2),
                ),
              ),
            ),
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                icon: Icon(Icons.access_time, color: Colors.white,),
                hintStyle: TextStyle(
                  color: Colors.white
                ),
                hintText: TableDate.getClassBeginAndEndStr(singleClass.beginTime, singleClass.endTime),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent,),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent, width: 2),
                ),
              ),
              onTap: (){
                Picker(
                    adapter: PickerDataAdapter<String>(
                        pickerdata: JsonDecoder().convert(chooseClassBeginAndEnd),
                        isArray: true
                    ),
                    title: Text("请选择课程起止节次"),
                    hideHeader: true,
                    selectedTextStyle: TextStyle(color: Colors.blue),
                    onConfirm: (Picker picker, List value) {
                      if(value[0] <= value[1]){
                        setState(() {
                          singleClass.beginTime = value[0];
                          singleClass.endTime = value[1];
                        });
                      }else{
                        _scaffoldkey.currentState.showSnackBar(Snack.error("课程起始节次应该小于等于结束节次"));
                      }
                    }
                ).showDialog(context);
              },
            ),
            TextField(
              style: TextStyle(
                color: Colors.white
              ),
              decoration: InputDecoration(
                icon: Icon(Icons.place, color: Colors.white,),
                hintStyle: TextStyle(
                    color: Colors.white
                ),
                hintText: singleClass.place == null ? '输入地点/教室(选填)' : singleClass.place,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent,),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent, width: 2),
                ),
              ),
              onChanged:(value){
                setState(() {
                  singleClass.place = value;
                });
              },
            ),
            TextField(
              readOnly: true,
              onTap: (){
                Picker(
                    adapter: PickerDataAdapter<String>(
                        pickerdata: JsonDecoder().convert(chooseWeekDuring),
                        isArray: true
                    ),
                    title: Text("请选择课程周次"),
                    hideHeader: true,
                    selectedTextStyle: TextStyle(color: Colors.blue),
                    onConfirm: (Picker picker, List value) {
                      if(value[0] <= value[1]){
                        setState(() {
                          singleClass.weekDuringStart = value[0];
                          singleClass.weekDuringEnd = value[1];
                          singleClass.isGapWeek = value[2];
                        });
                      }else{
                        _scaffoldkey.currentState.showSnackBar(Snack.error("起始周次应该小于等于结束周次"));
                      }
                    }
                ).showDialog(context);
              },
              style: TextStyle(
                  color: Colors.white
              ),
              decoration: InputDecoration(
                icon: Icon(Icons.date_range, color: Colors.white,),
                hintStyle: TextStyle(
                    color: Colors.white
                ),
                hintText: TableDate.getWeekDuringStr(singleClass.weekDuringStart, singleClass.weekDuringEnd, singleClass.isGapWeek),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent,),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent, width: 2),
                ),
              ),
              onSubmitted:(value){
                setState(() {
                  singleClass.place = value;
                });
              },
            ),
          ],
        ),
      )
    ];
  }
  var singleClass = StuClass();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 1000));
    animation = Tween(begin: 0.0, end: 220.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn)
    )
      ..addListener(() {
        setState(() {});
      });
    animationController.forward().orCancel;
  }

  @override
  Widget build(BuildContext context) {
    ProfileProvider profileProvider = Provider.of<ProfileProvider>(context);
    TableProvider tableProvider = Provider.of<TableProvider>(context);

    gobackToHome(info){
      Navigator.of(context).pop(info);
    }


    submitdata(data){
//      TableRequest.createOneClass(profileProvider.userAuth.userName, profileProvider.userAuth.token, tableProvider.activeTableId, data)
//          .then((res){
//            // 创建成功 返回上一页
//            var r = ResponseCondition.fromMap(res);
//            gobackToHome(r.information);
//          });

    }
    

    return Scaffold(
      key: _scaffoldkey,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          var p = singleClass.checkIsLegal();
          if(p == "pass"){
            submitdata(singleClass.toJson());
          }else{
            _scaffoldkey.currentState.showSnackBar(Snack.error(p));
          }
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Color.fromARGB(255, 41, 47, 93),
      appBar: AppBar(
        title: Text("添加一节课", style: TextStyle(
          color: Color.fromARGB(255, 89, 81, 141),
          fontSize: 18
        )),
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Container(
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
              padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
              child: ListView(
                children: <Widget>[
                  //课程基本设置  课程的名称 教师的姓名 课程对应格子的颜色
                  TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.class_, color: Color.fromARGB(255, 233, 141, 212),),
                      hintText: '请输入课程名称',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent,),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent, width: 2),
                      ),
                    ),
                    onChanged:(value){
                      setState(() {
                        singleClass.className = value;
                      });
                    },
                  ),
                  SizedBox(height: 15,),
                  TextField(
                    autocorrect: true,
                    decoration: InputDecoration(
                      icon: Icon(Icons.person_outline, color: Color.fromARGB(255, 233, 141, 212),),
                      hintText: '请输入教师的姓名(选填)',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent,),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent, width: 2),
                      ),
                    ),
                    onChanged: (value){
                      setState(() {
                        singleClass.teacher = value;
                      });
                    },
                  ),
                  SizedBox(height: 15,),
                  TextField(
                    autocorrect: true,
                    decoration: InputDecoration(
                      icon: Icon(Icons.color_lens, color: Color.fromARGB(255, 233, 141, 212),),
                      hintText: '选择课程格子颜色',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent,),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent, width: 2),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 302,
            child: ListView(
              children: makeClassCard(),
            )
          ),
        ],
      )
    );
  }
}