// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cert_decrypt_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CertDecryptResult _$CertDecryptResultFromJson(Map<String, dynamic> json) {
  return CertDecryptResult(
    resultCode: json['resultCode'] as int,
    resultMsg: json['resultMsg'] as String,
    decryptData: json['decryptData'] as String,
  );
}

Map<String, dynamic> _$CertDecryptResultToJson(CertDecryptResult instance) =>
    <String, dynamic>{
      'resultCode': instance.resultCode,
      'resultMsg': instance.resultMsg,
      'decryptData': instance.decryptData,
    };
