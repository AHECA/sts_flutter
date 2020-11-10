import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cert_seal_result.g.dart';

@JsonSerializable()
class CertSealResult {
  int resultCode = 0;
  String resultMsg = "";
  String token = "";

  CertSealResult({
    @required this.resultCode,
    @required this.resultMsg,
    @required this.token,
  });

  //反序列化
  factory CertSealResult.fromJson(Map<String, dynamic> map) => _$CertSealResultFromJson(map);

  //序列化
  Map<String, dynamic> toJson() => _$CertSealResultToJson(this);
}
