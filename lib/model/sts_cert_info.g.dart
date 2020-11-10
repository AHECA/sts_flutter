// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sts_cert_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StsCertInfo _$StsCertInfoFromJson(Map<String, dynamic> json) {
  return StsCertInfo(
    publicKey: json['publicKey'] as String,
    notBefore: json['notBefore'] as String,
    certAlgorithm: json['certAlgorithm'] as String,
    certSN: json['certSN'] as String,
    notAfter: json['notAfter'] as String,
    keyUsage: json['keyUsage'] as String,
    version: json['version'] as String,
    subjectDN: json['subjectDN'] == null
        ? null
        : SubjectDNBean.fromJson(json['subjectDN'] as Map<String, dynamic>),
    issuerDN: json['issuerDN'] == null
        ? null
        : IssuerDNBean.fromJson(json['issuerDN'] as Map<String, dynamic>),
    subjectEXT: json['subjectEXT'] == null
        ? null
        : SubjectEXTBean.fromJson(json['subjectEXT'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$StsCertInfoToJson(StsCertInfo instance) =>
    <String, dynamic>{
      'publicKey': instance.publicKey,
      'notBefore': instance.notBefore,
      'certAlgorithm': instance.certAlgorithm,
      'certSN': instance.certSN,
      'notAfter': instance.notAfter,
      'keyUsage': instance.keyUsage,
      'version': instance.version,
      'subjectDN': instance.subjectDN,
      'issuerDN': instance.issuerDN,
      'subjectEXT': instance.subjectEXT,
    };

SubjectDNBean _$SubjectDNBeanFromJson(Map<String, dynamic> json) {
  return SubjectDNBean(
    E: json['E'] as String,
    ST: json['ST'] as String,
    GIVENNAME: json['GIVENNAME'] as String,
    C: json['C'] as String,
    L: json['L'] as String,
    OU: json['OU'] as String,
    O: json['O'] as String,
    CN: json['CN'] as String,
  );
}

Map<String, dynamic> _$SubjectDNBeanToJson(SubjectDNBean instance) =>
    <String, dynamic>{
      'E': instance.E,
      'ST': instance.ST,
      'GIVENNAME': instance.GIVENNAME,
      'C': instance.C,
      'L': instance.L,
      'OU': instance.OU,
      'O': instance.O,
      'CN': instance.CN,
    };

IssuerDNBean _$IssuerDNBeanFromJson(Map<String, dynamic> json) {
  return IssuerDNBean(
    ST: json['ST'] as String,
    C: json['C'] as String,
    L: json['L'] as String,
    OU: json['OU'] as String,
    O: json['O'] as String,
    CN: json['CN'] as String,
  );
}

Map<String, dynamic> _$IssuerDNBeanToJson(IssuerDNBean instance) =>
    <String, dynamic>{
      'ST': instance.ST,
      'C': instance.C,
      'L': instance.L,
      'OU': instance.OU,
      'O': instance.O,
      'CN': instance.CN,
    };

SubjectEXTBean _$SubjectEXTBeanFromJson(Map<String, dynamic> json) {
  return SubjectEXTBean(
    certExt2: json['certExt2'] as String,
    certExt4: json['certExt4'] as String,
    certExt3: json['certExt3'] as String,
    certExt9: json['certExt9'] as String,
  );
}

Map<String, dynamic> _$SubjectEXTBeanToJson(SubjectEXTBean instance) =>
    <String, dynamic>{
      'certExt2': instance.certExt2,
      'certExt4': instance.certExt4,
      'certExt3': instance.certExt3,
      'certExt9': instance.certExt9,
    };
