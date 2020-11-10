// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cert_sign_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CertSignResult _$CertSignResultFromJson(Map<String, dynamic> json) {
  return CertSignResult(
    resultCode: json['resultCode'] as int,
    resultMsg: json['resultMsg'] as String,
    signData: json['signData'] as String,
    signCert: json['signCert'] as String,
    token: json['token'] as String,
  );
}

Map<String, dynamic> _$CertSignResultToJson(CertSignResult instance) =>
    <String, dynamic>{
      'resultCode': instance.resultCode,
      'resultMsg': instance.resultMsg,
      'signData': instance.signData,
      'signCert': instance.signCert,
      'token': instance.token,
    };
