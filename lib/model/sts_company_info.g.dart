// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sts_company_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StsCompanyInfo _$StsCompanyInfoFromJson(Map<String, dynamic> json) {
  return StsCompanyInfo(
    departmentNo: json['departmentNo'] as String,
    companyName: json['companyName'] as String,
    companyNo: json['companyNo'] as String,
    userName: json['userName'] as String,
    cardNum: json['cardNum'] as String,
    phoneNum: json['phoneNum'] as String,
    userEmail: json['userEmail'] as String,
    certExt2: json['certExt2'] as String,
    certExt3: json['certExt3'] as String,
    certExt4: json['certExt4'] as String,
  );
}

Map<String, dynamic> _$StsCompanyInfoToJson(StsCompanyInfo instance) =>
    <String, dynamic>{
      'departmentNo': instance.departmentNo,
      'companyName': instance.companyName,
      'companyNo': instance.companyNo,
      'userName': instance.userName,
      'cardNum': instance.cardNum,
      'phoneNum': instance.phoneNum,
      'userEmail': instance.userEmail,
      'certExt2': instance.certExt2,
      'certExt3': instance.certExt3,
      'certExt4': instance.certExt4,
    };
