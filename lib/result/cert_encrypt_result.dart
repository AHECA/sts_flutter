import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cert_encrypt_result.g.dart';

@JsonSerializable()
class CertEncryptResult {
  int resultCode = 0;
  String resultMsg = "";
  String encryptData = "";

  CertEncryptResult({
    @required this.resultCode,
    @required this.resultMsg,
    @required this.encryptData,
  });

  //反序列化
  factory CertEncryptResult.fromJson(Map<String, dynamic> map) => _$CertEncryptResultFromJson(map);

  //序列化
  Map<String, dynamic> toJson() => _$CertEncryptResultToJson(this);
}
