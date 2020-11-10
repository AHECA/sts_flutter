// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cert_seal_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CertSealResult _$CertSealResultFromJson(Map<String, dynamic> json) {
  return CertSealResult(
    resultCode: json['resultCode'] as int,
    resultMsg: json['resultMsg'] as String,
    token: json['token'] as String,
  );
}

Map<String, dynamic> _$CertSealResultToJson(CertSealResult instance) =>
    <String, dynamic>{
      'resultCode': instance.resultCode,
      'resultMsg': instance.resultMsg,
      'token': instance.token,
    };
