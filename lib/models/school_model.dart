class School{
  int classNumOneDay;
  List time;

  School.fromMap(map) {
    this.classNumOneDay = map["timeTable"]['classNumOneDay'];
    this.time = map["timeTable"]["time"];
  }
}