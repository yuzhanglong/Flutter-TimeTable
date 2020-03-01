import 'package:zucc_helper/config/global.dart';
import 'package:zucc_helper/models/user_model.dart';
import 'package:zucc_helper/store/base.dart';


class ProfileProvider extends BaseProvder{
  // 用户相关
  UserAuth get userAuth => Global.userAuth;

  Profile get profile => Global.profile;





  setUserInfo(user, token){
    Global.userAuth.userName = user;
    Global.userAuth.token = token;
    Global.userAuth.isLogin = true;
    notifyListeners();
  }

  setProfile(Profile profile){
    Global.profile = profile;
    notifyListeners();
  }
}