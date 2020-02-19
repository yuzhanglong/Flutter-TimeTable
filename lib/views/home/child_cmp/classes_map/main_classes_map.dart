import 'package:flutter/material.dart';
import 'package:zucc_helper/config/global_config.dart';
import 'package:zucc_helper/config/school_data.dart';
import 'package:zucc_helper/views/home/child_cmp/classes_map/class_card_item.dart';
import 'package:zucc_helper/views/home/child_cmp/classes_map/class_time_item.dart';


class HomeClassView extends StatefulWidget {
  @override
  _HomeClassViewState createState() => _HomeClassViewState();
}

class _HomeClassViewState extends State<HomeClassView> {
  @override
  Widget build(BuildContext context) {
    List tempItem = List<Widget>.filled(96, Container(child: Text("aa4aaaa"),));


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
      return allItems;
    }



    return Container(
      height: 647,
      color: GlobalConfig.basicColor,
      child: ScrollConfiguration(
        behavior: RefuseBlueActivation(),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.7,
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