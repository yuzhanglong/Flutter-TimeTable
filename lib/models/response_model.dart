class ResponseCondition{
  String status;
  String information;
  bool isSuccess;


  ResponseCondition.fromMap(Map<String, dynamic> json, {bool isSuccess}) {
    this.status = json["status"];
    this.information = json["information"];
    if(isSuccess != null) this.isSuccess = isSuccess;
  }
}



class ResponseData extends ResponseCondition{
  dynamic data;

  ResponseData.fromMap(Map<String, dynamic> json) :super.fromMap(json){
      this.data = json['data'];
  }
}


class ResponseToken extends ResponseCondition{
  dynamic token;

  ResponseToken.fromMap(Map<String, dynamic> json) :super.fromMap(json){
    this.token = json['token'];
  }
}