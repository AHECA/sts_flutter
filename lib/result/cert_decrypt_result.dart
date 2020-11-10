import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cert_decrypt_result.g.dart';

@JsonSerializable()
class CertDecryptResult {
  int resultCode = 0;
  String resultMsg = "";
  String decryptData = "";

  CertDecryptResult({
    @required this.resultCode,
    @required this.resultMsg,
    @required this.decryptData,
  });

  //反序列化
  factory CertDecryptResult.fromJson(Map<String, dynamic> map) => _$CertDecryptResultFromJson(map);

  //序列化
  Map<String, dynamic> toJson() => _$CertDecryptResultToJson(this);
}
