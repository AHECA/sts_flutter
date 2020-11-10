import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cert_login_result.g.dart';

@JsonSerializable()
class CertLoginResult {
  int resultCode = 0;
  String resultMsg = "";
  String signData = "";
  String signCert = "";
  String token = "";

  CertLoginResult({
    @required this.resultCode,
    @required this.resultMsg,
    @required this.signData,
    @required this.signCert,
    @required this.token,
  });

  //反序列化
  factory CertLoginResult.fromJson(Map<String, dynamic> map) => _$CertLoginResultFromJson(map);

  //序列化
  Map<String, dynamic> toJson() => _$CertLoginResultToJson(this);
}
