// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_img_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignImgResult _$SignImgResultFromJson(Map<String, dynamic> json) {
  return SignImgResult(
    resultCode: json['resultCode'] as int,
    resultMsg: json['resultMsg'] as String,
    signImg: json['signImg'] as String,
  );
}

Map<String, dynamic> _$SignImgResultToJson(SignImgResult instance) =>
    <String, dynamic>{
      'resultCode': instance.resultCode,
      'resultMsg': instance.resultMsg,
      'signImg': instance.signImg,
    };
