import 'package:flutter/material.dart';
import 'package:sts_flutter/model/sts_cert_info.dart';
import 'package:sts_flutter/model/sts_company_info.dart';
import 'package:sts_flutter/model/sts_user_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'apply_cert_result.g.dart';

@JsonSerializable()
class ApplyCertResult {
  int resultCode = 0;
  String resultMsg = "";
  String enCert = "";
  String signCert = "";
  StsCertInfo stsCertInfo;
  StsUserInfo stsUserInfo;
  StsCompanyInfo stsCompanyInfo;

  ApplyCertResult({
    @required this.resultCode,
    @required this.resultMsg,
    @required this.enCert,
    @required this.signCert,
    @required this.stsCertInfo,
    @required this.stsUserInfo,
    @required this.stsCompanyInfo,
  });

  //反序列化
  factory ApplyCertResult.fromJson(Map<String, dynamic> map) => _$ApplyCertResultFromJson(map);

  //序列化
  Map<String, dynamic> toJson() => _$ApplyCertResultToJson(this);
}
