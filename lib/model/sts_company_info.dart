import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sts_company_info.g.dart';

@JsonSerializable()
class StsCompanyInfo {
  String departmentNo = "";
  String companyName = "";
  String companyNo = "";
  String userName = "";
  String cardNum = "";
  String phoneNum = "";
  String userEmail = "";
  String certExt2 = "";
  String certExt3 = "";
  String certExt4 = "";

  StsCompanyInfo({
    @required this.departmentNo,
    @required this.companyName,
    @required this.companyNo,
    @required this.userName,
    @required this.cardNum,
    @required this.phoneNum,
    @required this.userEmail,
    @required this.certExt2,
    @required this.certExt3,
    @required this.certExt4,
  });

  //反序列化
  factory StsCompanyInfo.fromJson(Map<String, dynamic> map) => _$StsCompanyInfoFromJson(map);

  //序列化
  Map<String, dynamic> toJson() => _$StsCompanyInfoToJson(this);
}
