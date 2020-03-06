import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zucc_helper/config/global_config.dart';
import 'package:zucc_helper/config/school_data.dart';
import 'package:zucc_helper/models/school_model.dart';
import 'package:zucc_helper/models/table_model.dart';
import 'package:zucc_helper/store/table_provider.dart';
import 'package:zucc_helper/utils/table_maker.dart';

class HomeClassView extends StatefulWidget {
  final List<StuClass> stuClasses;

  HomeClassView({
    this.stuClasses
  });



  @override
  _HomeClassViewState createState() => _HomeClassViewState();
}

class _HomeClassViewState extends State<HomeClassView> {

  @override
  Widget build(BuildContext context) {

    TableProvider tableProvider = Provider.of<TableProvider>(context);

    // 开始构造课程表
    List<Widget> makeList(){
      var schoolData = School.fromMap(SchoolData.zucc);
      var t = TableMaker.initData(schoolData);
      t.getClassTables(widget.stuClasses, tableProvider.weekNumber);
      return t.allItems;
    }



    return Container(
      // 52 topbar的高度  80 顶部appbar的高度
      height: MediaQuery.of(context).size.height - 52 - 81,
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