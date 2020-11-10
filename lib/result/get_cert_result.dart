import 'package:flutter/material.dart';
import 'package:sts_flutter/model/sts_cert_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_cert_result.g.dart';

@JsonSerializable()
class GetCertResult {
  int resultCode = 0;
  String resultMsg = "";
  String enCert = "";
  String signCert = "";
  StsCertInfo stsCertInfo;

  GetCertResult({
    @required this.resultCode,
    @required this.resultMsg,
    @required this.enCert,
    @required this.signCert,
    @required this.stsCertInfo,
  });

  //反序列化
  factory GetCertResult.fromJson(Map<String, dynamic> map) => _$GetCertResultFromJson(map);

  //序列化
  Map<String, dynamic> toJson() => _$GetCertResultToJson(this);
}
