// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommonResult _$CommonResultFromJson(Map<String, dynamic> json) {
  return CommonResult(
    resultCode: json['resultCode'] as int,
    resultMsg: json['resultMsg'] as String,
  );
}

Map<String, dynamic> _$CommonResultToJson(CommonResult instance) =>
    <String, dynamic>{
      'resultCode': instance.resultCode,
      'resultMsg': instance.resultMsg,
    };
