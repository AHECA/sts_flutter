import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cert_sign_result.g.dart';

@JsonSerializable()
class CertSignResult {
  int resultCode = 0;
  String resultMsg = "";
  String signData = "";
  String signCert = "";
  String token = "";

  CertSignResult({
    @required this.resultCode,
    @required this.resultMsg,
    @required this.signData,
    @required this.signCert,
    @required this.token,
  });

  //反序列化
  factory CertSignResult.fromJson(Map<String, dynamic> map) => _$CertSignResultFromJson(map);

  //序列化
  Map<String, dynamic> toJson() => _$CertSignResultToJson(this);
}
