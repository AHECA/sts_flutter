// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apply_cert_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplyCertResult _$ApplyCertResultFromJson(Map<String, dynamic> json) {
  return ApplyCertResult(
    resultCode: json['resultCode'] as int,
    resultMsg: json['resultMsg'] as String,
    enCert: json['enCert'] as String,
    signCert: json['signCert'] as String,
    stsCertInfo: json['stsCertInfo'] == null
        ? null
        : StsCertInfo.fromJson(json['stsCertInfo'] as Map<String, dynamic>),
    stsUserInfo: json['stsUserInfo'] == null
        ? null
        : StsUserInfo.fromJson(json['stsUserInfo'] as Map<String, dynamic>),
    stsCompanyInfo: json['stsCompanyInfo'] == null
        ? null
        : StsCompanyInfo.fromJson(
            json['stsCompanyInfo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ApplyCertResultToJson(ApplyCertResult instance) =>
    <String, dynamic>{
      'resultCode': instance.resultCode,
      'resultMsg': instance.resultMsg,
      'enCert': instance.enCert,
      'signCert': instance.signCert,
      'stsCertInfo': instance.stsCertInfo,
      'stsUserInfo': instance.stsUserInfo,
      'stsCompanyInfo': instance.stsCompanyInfo,
    };
