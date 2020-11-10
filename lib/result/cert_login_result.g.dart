// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cert_login_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CertLoginResult _$CertLoginResultFromJson(Map<String, dynamic> json) {
  return CertLoginResult(
    resultCode: json['resultCode'] as int,
    resultMsg: json['resultMsg'] as String,
    signData: json['signData'] as String,
    signCert: json['signCert'] as String,
    token: json['token'] as String,
  );
}

Map<String, dynamic> _$CertLoginResultToJson(CertLoginResult instance) =>
    <String, dynamic>{
      'resultCode': instance.resultCode,
      'resultMsg': instance.resultMsg,
      'signData': instance.signData,
      'signCert': instance.signCert,
      'token': instance.token,
    };
