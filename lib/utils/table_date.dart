class TableDate{


  //日期刷新 传入一个datetime
  static refreshDate(DateTime currentTime){
    DateTime begin = currentTime;
    List <DateTime> dates = [];
    for(int i = 0; i < 7; i++){
      var afterDay = begin.add(Duration(days: i));
      dates.add(afterDay);
    }
    return dates;
  }


  static String getWeekDaySimple(index){
    List weekdays = ["一", "二", "三", "四", "五", "六", "日"];
    return weekdays[index];
  }


  static String getMonthSimple(index){
    List monthdays = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sept", "Oct", "Nov", "Dec"];
    return monthdays[index];
  }

  static String getWeekDuringStr(begin, end, setting){
    List w = ["请选择周次", "第一周", "第二周", "第三周", "第四周", "第五周", "第六周", "第七周", "第八周", "第九周",
      "第十周", "第十一周", "第十二周", "第十三周", "第十四周", "第十五周", "第十六周",
      "第十七周", "第十八周", "第十九周", "第二十周"];
    var x;
    // 初始化
    if(begin == null || end == null) return "请选择周次";
    // 单双周处理
    if(setting == 0) x = " ";
    if(setting == 1) x = "单周";
    if(setting == 2) x = "双周";
    return begin != end ? "${w[begin]} --- ${w[end]}  $x" : "${w[begin]}  $x";
  }


  static String getClassBeginAndEndStr(begin, end){
    List w = ["第一节", "第二节", "第三节", "第四节", "第五节", "第六节", "第七节", "第八节",
      "第九节", "第十节", "第十一节", "第十二节"];
    if(begin == null || end == null) return "请选择课程起止节次";
    return begin != end ? "${w[begin]} --- ${w[end]}" : "${w[begin]}";
  }


  //取两天之间的周数
  static getWeeksGap(DateTime begin, DateTime now){
    // 星期数的相差
    var gapWeekDay = now.weekday - begin.weekday;
    //相差天数
    var diffDay = now.difference(begin).inDays;
    if(diffDay < 7 && gapWeekDay < 0) return 2;
    else return diffDay / 7 + 1;
  }
}