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

}