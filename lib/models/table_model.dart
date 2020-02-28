class StuTable{
  String tableName;
  String tableId;



  StuTable.fromMap(Map<String, dynamic> json) {
    this.tableId = json['tableId'];
    this.tableName = json['tableName'];
  }
}





class StuClass{
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

  StuClass({
  this.beginTime,
    this.endTime,
    this.teacher,
    this.place,
    this.className,
    this.weekDuringEnd,
    this.isGapWeek,
    this.weekDuringStart,
    this.weekDay
  });


  StuClass.fromMap(Map<String, dynamic> json) {
    this.beginTime = json['beginTime'];
    this.endTime = json['endTime'];
    this.teacher = json["teacher"];
    this.className = json["className"];
    this.place = json["place"];
    this.weekDay = json['weekDay'];
    this.weekDuringStart = json['weekDuringStart'];
    this.weekDuringEnd = json['weekDuringEnd'];
    this.isGapWeek = json['isGapWeek'];
  }

  checkIsLegal(){
    if(this.className == null || this.className == "") return "请填写课程名称";
    if(this.weekDay == null) return "请选择星期";
    if(this.beginTime == null) return "请填写起止时间";
    if(this.weekDuringStart == null || this.weekDuringStart == 0 || this.weekDuringEnd == 0) return "请填写周次";

    return "pass";
  }

  checkBeginAndEndLegal(){
    return this.beginTime <= this.endTime;
  }

  checkWeekDuringLegal(){
    return this.weekDuringStart <= this.weekDuringEnd;
  }

  @override
  String toString() {
    // TODO: implement toString
    return "${this.beginTime}, ${this.endTime}, ${this.teacher}, ${this.place}, "
        "${this.className}, ${this.weekDuringStart}, ${this.weekDuringEnd},"
        " ${this.isGapWeek}, ${this.weekDay}";
  }

  toJson(){
    return {
      'className': this.className,
      'beginTime': this.beginTime,
      'endTime': this.endTime,
      'teacher': this.teacher,
      'place': this.place,
      'weekDay': this.weekDay,
      'weekDuringStart': this.weekDuringStart,
      'weekDuringEnd': this.weekDuringEnd,
      'isGapWeek': this.isGapWeek
    };
  }
}