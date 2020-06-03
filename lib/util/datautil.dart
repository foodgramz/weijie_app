import 'package:weijie/common/locator.dart';
import 'package:weijie/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class DataUtil {
  static final String SP_ID = 'id';
  static final String SP_TOKEN = 'token';
  static final String SP_ACCOUNT = 'account';
  static final String SP_ISLOGIN="false";

  static SharedPreferences _sharedPreferences = locator<SharedPreferences>();

  static saveLoginInfo(Map data)  {
    if (data != null) {
      SharedPreferences sp = _sharedPreferences;
      int id = data[SP_ID];
       sp.setInt(SP_ID, id);
      String email = data[SP_ACCOUNT];
       sp.setString(SP_ACCOUNT, email);
    }
  }

  static clearLoginInfo() {
    SharedPreferences sp = _sharedPreferences;
    sp.setString(SP_ID, '');
    sp.setString(SP_TOKEN, '');
    sp.setString(SP_ACCOUNT, '');
  }


  static User getLoginInfo() {
    SharedPreferences sp = _sharedPreferences;
    bool islogin = sp.getBool(SP_ISLOGIN);
    if (islogin == null || islogin == false) {
      return null;
    }
    User user = User();
    user.id=sp.getInt(SP_ID);
    user.email=sp.getString(SP_ACCOUNT);
    return user;
  }

  static bool isLogin() {
    SharedPreferences sp = _sharedPreferences;
    bool isLogin = sp.getBool(SP_ISLOGIN);
    return isLogin != null && isLogin;
  }

  static String getToken() {
    SharedPreferences sp =_sharedPreferences;
    return sp.getString(SP_TOKEN);
  }

  static clearToken()  {
    SharedPreferences sp = _sharedPreferences;
    sp.setString(SP_TOKEN, '');
  }

  static void saveToken(String token) {
    SharedPreferences sp = _sharedPreferences;
    sp.setString(SP_TOKEN, token);
  }


}



