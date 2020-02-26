import 'package:flutter/material.dart';
import 'package:zucc_helper/config/global_config.dart';
import 'package:zucc_helper/config/school_data.dart';
import 'package:zucc_helper/models/table_model.dart';
import 'package:zucc_helper/views/home/child_cmp/classes_map/class_card_item.dart';
import 'package:zucc_helper/views/home/child_cmp/classes_map/class_time_item.dart';


class HomeClassView extends StatefulWidget {
  final List stuClasses;

  HomeClassView({
    this.stuClasses
  });



  @override
  _HomeClassViewState createState() => _HomeClassViewState();
}

class _HomeClassViewState extends State<HomeClassView> {
  @override
  Widget build(BuildContext context) {

    List<Widget> makeList(){
      Map schoolData = SchoolData.zucc;
      List<Widget> allItems = List();

      for(int i = 0; i < schoolData['timeTable']['classNumOneDay']; i++){
        allItems.add(ClassTime(
          classNum: (i + 1).toString(),
          startTime: schoolData['timeTable']['time'][i][0],
          endTime: schoolData['timeTable']['time'][i][1],
        ));
        for(int j = 0; j <= 6; j++){
          allItems.add(ClassCard());
        }
      }

      for(int k = 0; k < widget.stuClasses.length; k++){
        var singleClass = Class.fromMap(widget.stuClasses[k]);

        int classWeekDay;
        int classTime;
        int classTime2;
        //只有一节课的情况
        if(singleClass.beginTime == singleClass.endTime){
          classWeekDay = singleClass.weekDay;
          classTime = singleClass.beginTime;
          var pos = 8 * classTime + classWeekDay;
          allItems[pos] = ClassCard(
            baseColor: Colors.lightBlueAccent,
            className: singleClass.className,
          );
        }
        //多节课程连续
        else{
          classWeekDay = singleClass.weekDay;
          classTime = singleClass.beginTime;
          classTime2 = singleClass.endTime;
          for(int t = classTime; t <= classTime2; t++){
            allItems[8 * t + classWeekDay] = ClassCard(
              baseColor: Colors.lightBlueAccent,
              className: singleClass.className
            );
          }
        }
      }
      return allItems;
    }



    return Container(
      height: 647,
      color: GlobalConfig.basicColor,
      child: ScrollConfiguration(
        behavior: RefuseBlueActivation(),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
            childAspectRatio: 0.6,
            crossAxisCount: 8,
          ),
          children: makeList(),
        ),
      ),
    );
  }
}



class RefuseBlueActivation extends ScrollBehavior{
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return super.buildViewportChrome(context,child,axisDirection);
  }
}