// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cert_encrypt_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CertEncryptResult _$CertEncryptResultFromJson(Map<String, dynamic> json) {
  return CertEncryptResult(
    resultCode: json['resultCode'] as int,
    resultMsg: json['resultMsg'] as String,
    encryptData: json['encryptData'] as String,
  );
}

Map<String, dynamic> _$CertEncryptResultToJson(CertEncryptResult instance) =>
    <String, dynamic>{
      'resultCode': instance.resultCode,
      'resultMsg': instance.resultMsg,
      'encryptData': instance.encryptData,
    };
