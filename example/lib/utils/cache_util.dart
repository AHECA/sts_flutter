import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sts_flutter/model/sts_company_info.dart';
import 'package:sts_flutter/model/sts_user_info.dart';

class CacheUtil {
  static const String _spKeyUserInfo = "UserInfo";
  static const String _spKeyCompanyInfo = "CompanyInfo";

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

  static void saveCompanyInfo(StsCompanyInfo companyInfo) async {
    var sharedPreferences = await SharedPreferences.getInstance();
    if (companyInfo == null)
      sharedPreferences.setString(_spKeyCompanyInfo, "");
    else
      sharedPreferences.setString(_spKeyCompanyInfo, json.encode(companyInfo));
  }

  static Future<StsCompanyInfo> get companyInfo async {
    var sharedPreferences = await SharedPreferences.getInstance();
    var companyInfoJson = sharedPreferences.getString(_spKeyCompanyInfo);
    if (companyInfoJson == null || companyInfoJson.isEmpty) {
      return null;
    } else {
      return StsCompanyInfo.fromJson(json.decode(companyInfoJson));
    }
  }
}
