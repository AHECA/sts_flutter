import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sts_flutter/model/sts_user_info.dart';

class CacheUtil {
  static const String _spKeyUserInfo = "UserInfo";

  static void saveUserInfo(StsUserInfo userInfo) async {
    var sharedPreferences = await SharedPreferences.getInstance();
    if (userInfo == null)
      sharedPreferences.setString(_spKeyUserInfo, "");
    else
      sharedPreferences.setString(_spKeyUserInfo, json.encode(userInfo));
  }

  static Future<StsUserInfo> get userInfo async {
    var sharedPreferences = await SharedPreferences.getInstance();
    var userInfoJson = sharedPreferences.getString(_spKeyUserInfo);
    if (userInfoJson == null || userInfoJson.isEmpty) {
      return null;
    } else {
      return StsUserInfo.fromJson(json.decode(userInfoJson));
    }
  }
}
