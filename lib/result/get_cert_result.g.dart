// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_cert_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCertResult _$GetCertResultFromJson(Map<String, dynamic> json) {
  return GetCertResult(
    resultCode: json['resultCode'] as int,
    resultMsg: json['resultMsg'] as String,
    enCert: json['enCert'] as String,
    signCert: json['signCert'] as String,
    stsCertInfo: json['stsCertInfo'] == null
        ? null
        : StsCertInfo.fromJson(json['stsCertInfo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GetCertResultToJson(GetCertResult instance) =>
    <String, dynamic>{
      'resultCode': instance.resultCode,
      'resultMsg': instance.resultMsg,
      'enCert': instance.enCert,
      'signCert': instance.signCert,
      'stsCertInfo': instance.stsCertInfo,
    };
