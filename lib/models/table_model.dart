class StuTable{
  String tableName;
  String tableId;



  StuTable.fromMap(Map<String, dynamic> json) {
    this.tableId = json['tableId'];
    this.tableName = json['tableName'];
  }
}





class Class{
  // 课程开始时间
  int beginTime;
  // 课程结束时间
  int endTime;
  //老师姓名
  String teacher;
  //上课地点
  String place;
  //周次
  int weekDay;
  //周次开始
  int weekDuringStart;
  //周次结束
  int weekDuringEnd;
  // 是否逢单双周 0 周周上 1 逢单 2逢双
  int isGapWeek;
  //课程名称
  String className;


  Class.fromMap(Map<String, dynamic> json) {
    this.beginTime = json['beginTime'];
    this.endTime = json['endTime'];
    this.teacher = json["teacher"];
    this.className = json["className"];
    this.place = json["place"];
    this.weekDay = json['weekDay'];
    this.weekDuringStart = json['weekDuringStart'];
    this.weekDuringStart = json['weekDuringEnd'];
  }
}