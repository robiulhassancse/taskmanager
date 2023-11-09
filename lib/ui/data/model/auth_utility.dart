import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskmanager/ui/data/model/login_model.dart';

class AuthUtility{
  AuthUtility._();
  static Future<void>saveUserInfo(LoginModel model) async{
    SharedPreferences _sharedPrefs = await SharedPreferences.getInstance();
    _sharedPrefs.setString('user-data', model.toJson().toString());

  }
  static Future<LoginModel>getUserInfo()async{
    SharedPreferences _sharedPrefs = await SharedPreferences.getInstance();
    String value = _sharedPrefs.getString('user-data')!;
    return LoginModel.fromJson(jsonDecode(value));
  }
  static Future<void>clearUserInfo() async{
    SharedPreferences _sharedPrefs = await SharedPreferences.getInstance();
    _sharedPrefs.clear();

  }
  static Future<bool>checkIfUserLogin() async{
    SharedPreferences _sharedPrefs = await SharedPreferences.getInstance();
    return _sharedPrefs.containsKey('user-data');

  }
}