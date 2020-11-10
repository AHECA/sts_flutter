import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sts_user_info.g.dart';

@JsonSerializable()
class StsUserInfo {
  String departmentNo = "";
  String userName = "";
  String cardType = "";
  String cardNum = "";
  String phoneNum = "";
  String userCity = "";
  String userEmail = "";
  String certExt2 = "";
  String certExt3 = "";
  String certExt4 = "";

  StsUserInfo({
    @required this.departmentNo,
    @required this.userName,
    @required this.cardType,
    @required this.cardNum,
    @required this.phoneNum,
    @required this.userCity,
    @required this.userEmail,
    @required this.certExt2,
    @required this.certExt3,
    @required this.certExt4,
  });

  //反序列化
  factory StsUserInfo.fromJson(Map<String, dynamic> map) => _$StsUserInfoFromJson(map);

  //序列化
  Map<String, dynamic> toJson() => _$StsUserInfoToJson(this);
}
