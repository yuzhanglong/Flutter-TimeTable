/*
*  登录表单模型
*
* */

class Login{
  String userName;
  String password;
  String passwordAgain;


  Login(){
    this.userName = "";
    this.password = "";
    this.passwordAgain = "";
  }



  String validate(type){
    if(userName == "") return "用户名不得为空";

    if(password == "") return "密码不得为空";

    if(type == 1){
      if(passwordAgain != password) return "两次密码输入不相同 请重试";
    }
    return "success";
  }
}