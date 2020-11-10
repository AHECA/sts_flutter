// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sts_user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StsUserInfo _$StsUserInfoFromJson(Map<String, dynamic> json) {
  return StsUserInfo(
    departmentNo: json['departmentNo'] as String,
    userName: json['userName'] as String,
    cardType: json['cardType'] as String,
    cardNum: json['cardNum'] as String,
    phoneNum: json['phoneNum'] as String,
    userCity: json['userCity'] as String,
    userEmail: json['userEmail'] as String,
    certExt2: json['certExt2'] as String,
    certExt3: json['certExt3'] as String,
    certExt4: json['certExt4'] as String,
  );
}

Map<String, dynamic> _$StsUserInfoToJson(StsUserInfo instance) =>
    <String, dynamic>{
      'departmentNo': instance.departmentNo,
      'userName': instance.userName,
      'cardType': instance.cardType,
      'cardNum': instance.cardNum,
      'phoneNum': instance.phoneNum,
      'userCity': instance.userCity,
      'userEmail': instance.userEmail,
      'certExt2': instance.certExt2,
      'certExt3': instance.certExt3,
      'certExt4': instance.certExt4,
    };
