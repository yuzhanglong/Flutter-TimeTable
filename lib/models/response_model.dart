class ResponseCondition{
  String status;
  String information;


  ResponseCondition.fromMap(Map<String, dynamic> json) {
    this.status = json["status"];
    this.information = json["information"];
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